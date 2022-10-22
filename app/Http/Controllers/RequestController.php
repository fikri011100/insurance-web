<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Requests;
use App\Models\Insurances;
use App\Models\User;
use App\Models\Price;
use App\Models\Resi;
use Carbon\Carbon;
use Str;
use Storage;
use PDF;
use App\Models\RequestProgress;
use App\Models\Discount;
use Dompdf\Dompdf;
use SortAndFilter;

use Illuminate\Support\Facades\File;

class RequestController extends Controller
{
    //
    public function index(Request $request) {
        $requests['requests'] = Requests::sortable()->orderBy('created_at', 'desc')->paginate(10)->onEachSide(2)->fragment('requests');
        $requests['insurance'] = Insurances::orderBy('name', 'ASC')->get();
        $requests['todayDate'] = Carbon::now();

        if ($request->status != null) {
            $requests['requests'] = Requests::where("status", $request->status)
                                    ->orWhere("insurance", $request->insurance)
                                    ->sortable()
                                    ->orderBy('created_at', 'desc')
                                    ->paginate(10)
                                    ->onEachSide(2)->fragment('requests');
        }

        return view('legalisir.requestlist', $requests);
    }

    public function createRequest(Request $request) {
        $data = $request->all();
        $prices = Price::where("status", 0)->first();
        $price = $prices->legalisir_price * $request->get('insurance_set');
        $statusPayment = "0";
        $discount = Discount::where('insurance', $request->get('insurance')->first();
        $priceDiscount = ($discount->base_discount / 100) * $price;


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
            'birthday' => $request->get('birthday'),
            'date_medicine' => $request->get('date_medicine'),
            'insurance' => $request->get('insurance'),
            'episode' => $request->get('episode'),
            'insurance_set' => $request->get('insurance_set'),
            'total_price' => $priceDiscount,
            'status' => $request->get('status'),
            'status_payment' => $statusPayment,
            'photo_payment' => $namePayment,
            'photo_taker' => $nameTaker
        ]);
        return redirect()->route('requestlist')->with('message', 'Berhasil menambah Data!');
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

        return redirect()->route('listProgress', $id)->with('message', 'Progress telah diupdate!');
    }

    public function createResi(Request $request) {
        $insurance = Insurances::where('name', $request->get('id_asuransi'))->first();

        Resi::create([
            "no_resi" => $request->get('no_resi'),
            "alamat" => $request->get('alamat'),
            "id_legalisir" => $request->get('id_legalisir'),
            "id_asuransi" => $insurance->id
        ]);

        return redirect()->route('listresi')->with('message', 'Berhasil menambahkan resi!');
    }

    public function deleteProgress($id) {
        try {
            $data = RequestProgress::findOrFail($id);
            return redirect()->route('listProgress', $data->id_request)->with('message', 'Progress telah dihapus');
        } catch(Exception $e) {
            return redirect()->route('showDashboard')->with('message', $e);
        }
    }

    public function addRequest() {
        $data['insurance'] = Insurances::orderBy('name', 'ASC')->get();
        $data['price'] = Price::where('status', '0')->first();
        
        return view('legalisir.createrequest', $data);
    }

    public function addProgress($id) {
        $data['data'] = $id;
        
        return view('legalisir.createprogress', $data);
    }

    public function editRequest($id) {
        $data['data']  = Requests::findOrFail($id);
        $data['insurance'] = Insurances::orderBy('name', 'ASC')->get();
        
        return view('legalisir.updaterequest', $data);
    }

    public function listProgress($id) {
        $data['data'] = RequestProgress::select("*")
                            ->where("id_request", $id)
                            ->get();
        $data['id'] = $id;
        $data['request'] = Requests::findOrFail($id);
        
        return view('legalisir.requestprogress', $data);
    }

    public function listResi() {
        $data = Resi::orderBy('created_at', 'desc')->paginate();

        return view('legalisir.listresi', compact('data'));
    }

    public function updateDataRequest(Request $request, $id) {
        $data = $request->all();
        $req = Requests::findOrFail($id);
        $prices = Price::where("status", 0)->first();
        $statusPayment = "0";
        $price = $prices->legalisir_price * $request->get('insurance_set');
        $nameTaker = null;
        $namePayment = null;
        $nameKTP = null;
        $nameKK = null;

        if($request->hasfile('photo_payment')){
            foreach (explode('|', $req->photo_payment) as $value) {
                echo $value;
                $this->delete_image($value);
            }
            $files = $request->file('photo_payment');
            $namePayment = $files->getClientOriginalName();
            $path = $files->storeAs('payment', $namePayment, 'public');
            $statusPayment = "1";
        } else if ($req->photo_payment != null) {
            $namePayment = $req->photo_payment;
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
        } else if($req->photo_taker != null) {
            $nameTaker = $req->photo_taker;
        }
        if($request->hasfile('photo_ktp')){
            foreach (explode('|', $req->photo_ktp) as $value) {
                echo $value;
                $this->delete_image($value);
            }
            $files = $request->file('photo_ktp');
            $nameKTP = $files->getClientOriginalName();
            $path = $files->storeAs('ktp', $nameKTP, 'public');
        } else if($req->photo_ktp != null) {
            $nameKTP = $req->photo_ktp;
        }
        if($request->hasfile('photo_kk')){
            foreach (explode('|', $req->photo_kk) as $value) {
                echo $value;
                $this->delete_image($value);
            }
            $files = $request->file('photo_kk');
            $nameKK = $files->getClientOriginalName();
            $path = $files->storeAs('kk', $nameKK, 'public');
        } else if ($req->photo_kk != null) {
            $nameKk = $req->photo_kk;
        }

        try {
            $req->update([
                    'request_name' => $request->get('request_name'),
                    'request_email' => $request->get('request_email'),
                    'request_patient' => $request->get('request_patient'),
                    'request_phone' => $request->get('request_phone'),
                    'birthday' => $request->get('birthday'),
                    'date_medicine' => $request->get('date_medicine'),
                    'insurance' => $request->get('insurance'),
                    'episode' => $request->get('episode'),
                    'insurance_set' => $request->get('insurance_set'),
                    'total_price' => $price,
                    'status' => $request->get('status'),
                    'status_payment' => $statusPayment,
                    'photo_payment' => $namePayment,
                    'photo_taker' => $nameTaker,
                    'photo_ktp' => $nameKTP,
                    'photo_kk' => $nameKK
            ]);
            return redirect()->route('requestlist')->with('message' , 'Request telah diupdate');
        } catch (Exception $th) {
            return redirect()->route('editrequest')->with('error' , $th);
        }
    }

    public function convertRequestToPDF($id) {
        $data = Requests::findOrFail($id);
        $user = User::findOrFail(auth()->user()->id);

        $domPdfPath = base_path('vendor/dompdf/dompdf');
        \PhpOffice\PhpWord\Settings::setPdfRendererPath($domPdfPath);
        \PhpOffice\PhpWord\Settings::setPdfRendererName('DomPDF');
        $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/formrequest.docx'));

        $template->setValue('episode', $data->episode);
        $template->setValue('penjamin', $data->insurance);
        $template->setValue('nama_pasien', $data->request_patient);
        $template->setValue('handphone', $data->request_phone);
        $template->setValue('total_price', number_format($data->total_price));
        $template->setValue('tanggal_berobat', date('d F Y', strtotime($data->date_medicine)));
        $template->setValue('total_set', $data->insurance_set);
        $template->setImageValue('ttd', array('path' => public_path('/storage/signature/' . $user->signature), 'width' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'height' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'ratio' => true));
        // $template->setImageValue('ttd', public_path('/storage/signature/' . $user->signature));
        // $template->setImageValue('ttd', function() {
        //     return array('path' => public_path('/storage/signature/' . $user->signature), 'width' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'height'=> \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'ratio'=> false);
        // });

        $saveDocPath = public_path($data->request_patient . '.docx');
        $template->saveAs($saveDocPath);

        $content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath);
 
        $savePdfPath = public_path('/requests/' . $data->request_patient . '-requests' .'.pdf');

        if ( file_exists($savePdfPath) ) {
            unlink($savePdfPath);
        }
 
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($content,'PDF');
        $PDFWriter->save($savePdfPath);
 
        if ( file_exists($saveDocPath)) {
            unlink($saveDocPath);
        }

        // return redirect()->route('requestlist')->with('message', 'Print Berhasil!');
        return response()->download($savePdfPath);
    }

    private function delete_image($image){
        $image_path = "/img/".$image;
        
        if(File::exists($image_path)){
            File::delete($image_path);
        }
    }
}
