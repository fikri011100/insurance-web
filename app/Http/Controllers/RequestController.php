<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Requests;
use App\Models\Insurances;
use Str;
use Storage;
use PDF;
use App\Models\RequestProgress;
use Dompdf\Dompdf;

use Illuminate\Support\Facades\File;

class RequestController extends Controller
{
    //
    public function index() {
        $requests = Requests::orderBy('created_at', 'desc')->paginate(10);

        return view('finance\requestlist', compact('requests'));
    }

    public function createRequest(Request $request) {
        $data = $request->all();
        $price = 250000 * $request->get('insurance_set');
        $statusPayment = "0";

        if($request->hasfile('photo_payment')){
            $files = $request->file('photo_payment');
            $namePayment = $files->getClientOriginalName();
            $path = $files->storeAs('payment', $namePayment, 'public');
            $statusPayment = "1";
        }
        if($request->hasfile('photo_taker')){
            $files = $request->file('photo_taker');
            $nameTaker = $files->getClientOriginalName();
            $path = $files->storeAs('bukti', $nameTaker, 'public');
        }

        Requests::create([
            'request_name' => $request->get('request_name'),
            'request_email' => $request->get('request_email'),
            'request_patient' => $request->get('request_patient'),
            'request_phone' => $request->get('request_phone'),
            'date_birth' => $request->get('date_birth'),
            'date_medicine' => $request->get('date_medicine'),
            'insurance' => $request->get('insurance'),
            'episode' => $request->get('episode'),
            'insurance_set' => $request->get('insurance_set'),
            'total_price' => $price,
            'status' => $request->get('status'),
            'status_payment' => $statusPayment,
            'photo_payment' => $namePayment,
            'photo_taker' => $nameTaker
        ]);
        return redirect()->route('requestlist')->with('message', 'Post Created Successfully');
    }

    public function createProgress(Request $request, $id) {
        $data = $request->all();
        $user = auth()->user()->username;

        RequestProgress::create([
            'title' => $request->get('title'),
            'detail_progress' => $request->get('detail_progress'),
            'id_request' => $id,
            'name_user' => $user
        ]);

        return redirect()->route('listProgress', $id)->with('message', 'Progress Updated');
    }

    public function addRequest() {
        $data['form'] = 'add';
        $data['insurance'] = Insurances::orderBy('name', 'ASC')->get();
        
        return view('cs\createrequest', $data);
    }

    public function addProgress($id) {
        $data['data'] = $id;
        $data['form'] = 'add';
        
        return view('finance\createprogress', $data);
    }


    public function editRequest($id) {
        $data['data']  = Requests::findOrFail($id);
        $data['form']  = 'edit';
        $data['insurance'] = Insurances::orderBy('name', 'ASC')->get();
        
        return view('cs\createrequest', $data);
    }

    public function listProgress($id) {
        $data['data'] = RequestProgress::select("*")
                            ->where("id_request", $id)
                            ->get();
        $data['id'] = $id;
        $data['request'] = Requests::findOrFail($id);
        
        return view('finance\requestprogress', $data);
    }

    public function updateDataRequest(Request $request, $id) {
        $data = $request->all();
        $req = Requests::findOrFail($id);
        $statusPayment = "0";
        $price = 250000 * $request->get('insurance_set');
        $nameTaker = null;
        $namePayment = null;

        if($request->hasfile('photo_payment')){
            foreach (explode('|', $req->photo_payment) as $value) {
                echo $value;
                $this->delete_image($value);
            }
            $files = $request->file('photo_payment');
            $namePayment = $files->getClientOriginalName();
            $path = $files->storeAs('payment', $namePayment, 'public');
            $statusPayment = "1";
        }
        if($request->hasfile('photo_taker')){
            foreach (explode('|', $req->photo_taker) as $value) {
                echo $value;
                $this->delete_image($value);
            }
            $files = $request->file('photo_taker');
            $nameTaker = $files->getClientOriginalName();
            $path = $files->storeAs('bukti', $nameTaker, 'public');
        }

        try {
            $req->update([
                    'request_name' => $request->get('request_name'),
                    'request_email' => $request->get('request_email'),
                    'request_patient' => $request->get('request_patient'),
                    'request_phone' => $request->get('request_phone'),
                    'date_birth' => $request->get('date_birth'),
                    'date_medicine' => $request->get('date_medicine'),
                    'insurance' => $request->get('insurance'),
                    'episode' => $request->get('episode'),
                    'insurance_set' => $request->get('insurance_set'),
                    'total_price' => $price,
                    'status' => $request->get('status'),
                    'status_payment' => $statusPayment,
                    'photo_payment' => $namePayment,
                    'photo_taker' => $nameTaker
            ]);
            return redirect()->route('requestlist')->withSuccess('Request Updated');
        } catch (Exception $th) {
            return redirect()->route('editrequest')->withError($th);
        }
    } 

    public function imageRequestPayment($id) {

        return redirect()->url('/storage/payment/' . $id);
    }

    public function convertRequestToPDF($id) {
        $data = Requests::findOrFail($id);

        $domPdfPath = base_path('vendor/dompdf/dompdf');
        \PhpOffice\PhpWord\Settings::setPdfRendererPath($domPdfPath);
        \PhpOffice\PhpWord\Settings::setPdfRendererName('DomPDF');
        $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/formrequest.docx'));

        $template->setValue('date', $data->created_at);
        $template->setValue('title', $data->request_name);
        $template->setValue('firstname', $data->request_patient);

        $saveDocPath = public_path($data->request_patient . '.docx');
        $template->saveAs($saveDocPath);

        $content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath);
 
        $savePdfPath = public_path($data->request_patient .'.pdf');

        if ( file_exists($savePdfPath) ) {
            unlink($savePdfPath);
        }
 
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($content,'PDF');
        $PDFWriter->save($savePdfPath);
        echo 'File has been successfully converted';
 
        if ( file_exists($saveDocPath) ) {
            unlink($saveDocPath);
        }
    }

    private function delete_image($image){
        $image_path = "/img/".$image;
        
        if(File::exists($image_path)){
            File::delete($image_path);
        }
    }


}
