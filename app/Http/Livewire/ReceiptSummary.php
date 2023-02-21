<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Receipt;
use App\Models\Insurances;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ReceiptSummary extends Component
{

    public $accounts, $keterangan, $prices, $account_id;
    public $updateMode = false;
    public $inputs = [];
    public $i = 1;
    public $dataDesc = array();

    public function add($i)
    {
        $i = $i + 1;
        $this->i = $i;
        array_push($this->inputs ,$i);
    }

    public function remove($i)
    {
        unset($this->inputs[$i]);
    }

    private function resetInputFields(){
        $this->keterangan = '';
        $this->prices = '';
    }

    public function store(Request $request)
    {
        $n1 = " ";
        $n2 = " ";
        $n3 = " ";
        $n4 = " ";
        $n5 = " ";
        $ket1 = " ";
        $ket2 = " ";
        $ket3 = " ";
        $ket4 = " ";
        $ket5 = " ";
        $jum1 = " ";
        $jum2 = " ";
        $jum3 = " ";
        $jum4 = " ";
        $jum5 = " ";
        $totalPrice = 0;
        $validatedDate = $this->validate([
                'keterangan.0' => 'required',
                'prices.0' => 'required',
                'keterangan.*' => 'required',
                'prices.*' => 'required',
            ],
            [
                'keterangan.0.required' => 'Account field is required',
                'prices.0.required' => 'Username field is required',
                'keterangan.*.required' => 'Account field is required',
                'prices.*.required' => 'Username field is required',
            ]
        );
   
        foreach ($this->keterangan as $key => $value) {
            // Receipt::create(['keterangan' => $this->keterangan[$key], 'prices' => $this->prices[$key]]);
            $dataDesc = array(
                'keterangan' => $this->keterangan[$key],
                'prices' => $this->prices[$key]
            );
            $price = str_replace('Rp. ', '', $this->prices[$key]);
            $price = str_replace('.', '', $price);
            switch ($key) {
                case 0:
                    $n1 = "1";
                    $ket1 = $this->keterangan[$key];
                    $jum1 = intval($price);
                    break;
                case 1:
                    $n2 = "2";
                    $ket2 = $this->keterangan[$key];
                    $jum2 = intval($price);
                    break;
                case 2:
                    $n3 = "3";
                    $ket3 = $this->keterangan[$key];
                    $jum3 = intval($price);
                    break;
                case 3:
                    $n4 = "4";
                    $ket4 = $this->keterangan[$key];
                    $jum4 = intval($price);
                    break;
                case 4:
                    $n5 = "5";
                    $ket5 = $this->keterangan[$key];
                    $jum5 = intval($price);
                    break;
            }
            $totalPrice = $totalPrice + intval($price);
        }
        $data = Receipt::orderBy('created_at', 'desc')->first();
        $dataSpv = User::select("*")
        ->where("user_type", '0')
        ->first();
        $penjamin = Insurances::select("*")
        ->where('name', $data->penjamin)
        ->first();

        $domPdfPath = base_path('vendor/dompdf/dompdf');
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        \PhpOffice\PhpWord\Settings::setPdfRendererPath($domPdfPath);
        \PhpOffice\PhpWord\Settings::setPdfRendererName('DomPDF');
        $tableStyle = array(
            'borderColor' => 'FFFFFF',
            'borderSize'  => 6,
            'cellMargin'  => 50
        );
        $discount = str_replace('Rp. ', '', $request->get('discount'));
        $discount = str_replace('.', '', $discount);
        $firstRowStyle = array('bgColor' => 'FFFFFF');
        $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/RekamBiaya.docx'));
        $template->setValue('date_mmm', date('d F Y', strtotime($data->created_at)) );
        $template->setValue('price', number_format(floatval($price)));
        $template->setValue('price_ful',  number_format($totalPrice));
        $template->setValue('discount', number_format($discount));
        $template->setValue('no_va', $penjamin->no_va);
        $template->setValue('no_receipt', $data->no_receipt);
        $template->setValue('medical_record', $data->medical_record);
        $template->setValue('episode', $data->episode);
        $template->setValue('nama_pasien', $data->nama_pasien);
        $template->setValue('date_pengobatan',$data->date_pengobatan);
        $template->setValue('penjamin',$data->penjamin);
        $template->setValue('created_at', date('d-m-Y', strtotime($data->created_at)) );
        $template->setValue('user_name',$data->user_name);
        $template->setValue('n1',$n1);
        $template->setValue('ket1',$ket1);
        $template->setValue('jum1',$jum1);
        $template->setValue('n2',$n2);
        $template->setValue('ket2',$ket2);
        $template->setValue('jum2',$jum2);
        $template->setValue('n3',$n3);
        $template->setValue('ket3',$ket3);
        $template->setValue('jum3',$jum3);
        $template->setValue('n4',$n4);
        $template->setValue('ket4',$ket4);
        $template->setValue('jum4',$jum4);
        $template->setValue('n5',$n5);
        $template->setValue('ket5',$ket5);
        $template->setValue('jum5',$jum5);


        $saveDocPath = public_path($data->nama_pasien."-". $category . '.docx');
        $template->saveAs($saveDocPath);

        $content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath, 'Word2007');
 
        $savePdfPath = public_path($data->nama_pasien."-".$category.'.pdf');

        if (file_exists($savePdfPath)) {
            unlink($savePdfPath);
        }
 
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($content,'PDF');
        $PDFWriter->save($savePdfPath);
 
        if ( file_exists($saveDocPath) ) {
            unlink($saveDocPath);
        }
   
        return redirect()->route('receiptList')->with('message', 'Post Created Successfully');
    }

    public function render()
    {
        $data['insurance'] = Insurances::orderBy('name', 'ASC')->get();
        $data['todayDate'] = Carbon::now();
        $receipt = Receipt::orderBy('created_at', 'desc')->first();
        if ($receipt == null) {
            $receipt = 1;
        } else {
            $receipt = $receipt->id + 1;
        }
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
        $data['no_receipt'] = "MH-". $ids . "/" . $newDate;

        return view('livewire.receipt-summary', $data);
    }

    public function convertWordToPDF($id, $category) {
        $data = Receipt::findOrFail($id);
        $dataSpv = User::select("*")
        ->where("user_type", '0')
        ->first();
        $penjamin = Insurances::select("*")
        ->where('name', $data->penjamin)
        ->first();

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


        if (request()->query('sort')) {

        }
         
        if ($category == "biaya") {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/RekamBiaya.docx'));
            $template->setValue('date_mmm', date('d F Y', strtotime($data->created_at)) );
            $discount = $data->discount / 100 * $data->price;
            $priceful = $data->price - $discount;
            $template->setValue('price', number_format($data->price));
            $template->setValue('price_ful',  number_format($priceful));
            $template->setValue('discount', number_format($discount));
            $template->setValue('no_va', $penjamin->no_va);
        } else if ($category == "kuitansi-netto") {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/Kuitansi.docx'));
            $number = (int)$data->price;
            // $template->addTableStyle('table', $tableStyle, $firstRowStyle);
            $bilangan = strtoupper(Terbilang::make($number) . " rupiah");
            $template->setValue('bilangan', $bilangan);
            $template->setValue('no', substr($data->no_receipt, 3, 3));
            $template->setValue('price', number_format($data->price));
            $template->setValue('mr', $data->medical_record);
            $template->setValue('no_va', $penjamin->no_va);
            $template->setValue('datedd', date('d-m-Y', strtotime($data->created_at)) );
        }else if ($category == "kredit") {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/Kredit.docx'));
            $discount = $data->discount / 100 * $data->price;
            $template->setValue('disc', number_format($data->discount));
            $template->setValue('discount', number_format($data->discount));
            $template->setValue('price', number_format($data->price));
            $template->setValue('discount_percent', $data->discount);
        } else {
            $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/Kuitansi.docx'));
            $number = (int)$data->price;
            // $template->addTableStyle('table', $tableStyle, $firstRowStyle);
            $bilangan = strtoupper(Terbilang::make($number) . " rupiah");
            $template->setValue('bilangan', $bilangan);
            $template->setValue('no', substr($data->no_receipt, 3, 3));
            $template->setValue('mr', $data->medical_record);
            $template->setValue('price', number_format($data->priceful));
            $template->setValue('datedd', date('d-m-Y', strtotime($data->created_at)) );
            $template->setValue('no_va', $penjamin->no_va);
        }
        if ($data->signature != null) {
            $template->setImageValue('ttd', array('path' => public_path('/storage/signature/' . $data->signature), 'width' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'height' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'ratio' => true));
            $template->setImageValue('ttdSPV', array('path' => public_path('/storage/signature/' . $dataSpv->signature), 'width' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'height' => \PhpOffice\PhpWord\Shared\Converter::cmToPixel(3), 'ratio' => true));
        }
        $template->setValue('no_receipt', $data->no_receipt);
        $template->setValue('medical_record', $data->medical_record);
        $template->setValue('episode', $data->episode);
        $template->setValue('nama_pasien', $data->nama_pasien);
        $template->setValue('date_pengobatan',$data->date_pengobatan);
        $template->setValue('penjamin',$data->penjamin);
        $template->setValue('created_at', date('d-m-Y', strtotime($data->created_at)) );
        $template->setValue('user_name',$data->user_name);

        $saveDocPath = public_path($data->nama_pasien."-". $category . '.docx');
        $template->saveAs($saveDocPath);

        $content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath, 'Word2007');
 
        $savePdfPath = public_path($data->nama_pasien."-".$category.'.pdf');

        if (file_exists($savePdfPath)) {
            unlink($savePdfPath);
        }
 
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($content,'PDF');
        $PDFWriter->save($savePdfPath);
 
        if ( file_exists($saveDocPath) ) {
            unlink($saveDocPath);
        }
        // $this->response()->download($savePdfPath);
    }
}
