<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Receipt;
use Carbon\Carbon;
use Storage;
use PDF;
use Terbilang;
use Dompdf\Dompdf;
use Illuminate\Support\Facades\Blade;

class ReceiptController extends Controller
{
    //
    public function index() {
        $receipt = Receipt::orderBy('created_at', 'desc')->paginate(10);

        return view('finance\receiptlist', compact('receipt'));
    }

    public function addReceipt() {

        return view('finance\createreceipt');
    }

    public function createReceipt(Request $request) {
        $receipt = Receipt::orderBy('created_at', 'desc')->first();
        if ($receipt == null) {
            $receipt = 1;
        } else {
            $receipt = $receipt->id + 1;
        }

        $data = $request->all();
        $user = auth()->user()->username;
        $date = date('Y-m-d H:i:s');
        $newDate = Carbon::createFromFormat('Y-m-d H:i:s', $date)
                                    ->format('m/Y');
        $ids = "";
        if ($receipt > 0 && $receipt < 10) {
            $ids = "00" . $receipt;
        } else if ($receipt > 10 && $receipt < 100) {
            $ids = "0" . $receipt;
        } else {
            $ids = "" . $receipt;
        }
        $noReceipt = "MH-". $ids . "/" . $newDate;

        Receipt::create([
            'no_receipt' => $noReceipt,
            'medical_record' => $request->get('medical_record'),
            'episode' => $request->get('episode'),
            'nama_pasien' => $request->get('nama_pasien'),
            'price' => $request->get('price'),
            'discount' => $request->get('discount'),
            'user_name' => $user,
            'penjamin' => $request->get('penjamin'),
            'date_pengobatan' => $request->get('date_pengobatan')
        ]);
        if ($request->get('checkboxRekapBiaya') != null) {
            $this->convertWordToPDF($receipt, "biaya");
        }
        if ($request->get('checkboxKredit') != null) {
            $this->convertWordToPDF($receipt, "kredit");
        }
        if ($request->has('checkboxKuitansi') != null ) {
            $this->convertWordToPDF($receipt, "kuitansi");
        }

        return redirect()->route('receiptList')->with('message', 'Post Created Successfully');
    }

    public function costRecap($id) {
        $data['data']  = Receipt::findOrFail($id);
        
        return view('finance\costrecap', $data);
    }

    public function convertWordToPDF($id, $category) {
        $data = Receipt::findOrFail($id);

        $domPdfPath = base_path('vendor/dompdf/dompdf');
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        \PhpOffice\PhpWord\Settings::setPdfRendererPath($domPdfPath);
        \PhpOffice\PhpWord\Settings::setPdfRendererName('DomPDF');
        $tableStyle = array(
            'borderColor' => 'FFFFFF',
            'borderSize'  => 6,
            'cellMargin'  => 50
        );
        $firstRowStyle = array('bgColor' => 'FFFFFF');

         
        if ($category == "biaya") {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/RekamBiaya.docx'));
            $template->setValue('date_mmm', date('d F Y', strtotime($data->created_at)) );
            $discount = $data->discount / 100 * $data->price;
            $priceful = $data->price - $discount;
            $template->setValue('price_ful',  number_format($priceful));
            $template->setValue('discount', number_format($discount));
        } else if ($category == "kredit") {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/Kredit.docx'));
            $discount = $data->discount / 100 * $data->price;
            $template->setValue('disc', $discount);
            $template->setValue('discount',$discount);
            $template->setValue('discount_percent', $data->discount);
        } else {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/Kuitansi.docx'));
            $number = (int)$data->price;
            // $template->addTableStyle('table', $tableStyle, $firstRowStyle);
            $bilangan = strtoupper(Terbilang::make($number) . " rupiah");
            $template->setValue('bilangan', $bilangan);
            $template->setValue('no', substr($data->no_receipt, 3, 3));
            $template->setValue('mr', $data->medical_record);
            $template->setValue('datedd', date('d-m-Y', strtotime($data->created_at)) );
        }
        $template->setValue('no_receipt', $data->no_receipt);
        $template->setValue('medical_record', $data->medical_record);
        $template->setValue('episode', $data->episode);
        $template->setValue('price', number_format($data->price));
        $template->setValue('nama_pasien', $data->nama_pasien);
        $template->setValue('date_pengobatan',$data->date_pengobatan);
        $template->setValue('penjamin',$data->penjamin);
        $template->setValue('created_at', date('d-m-Y', strtotime($data->created_at)) );
        $template->setValue('user_name',$data->user_name);

        $saveDocPath = public_path($data->nama_pasien."-". $category . '.docx');
        $template->saveAs($saveDocPath);

        $content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath, 'Word2007');
 
        $savePdfPath = public_path($data->nama_pasien ."-". $category .'.pdf');

        if ( file_exists($savePdfPath) ) {
            unlink($savePdfPath);
        }
 
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($content,'PDF');
        $PDFWriter->save($savePdfPath);
 
        if ( file_exists($saveDocPath) ) {
            unlink($saveDocPath);
        }
    }
}
