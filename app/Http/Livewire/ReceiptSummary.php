<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Receipt;
use App\Models\Insurances;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use PhpOffice\PhpWord\Element\Table;
use PhpOffice\PhpWord\Element\TableRow;
use PhpOffice\PhpWord\Element\TableCell;
use PhpOffice\PhpWord\SimpleType\TblWidth;
use PhpOffice\PhpWord\Style\Table as TableStyle;
use PhpOffice\PhpWord\Style\Cell as CellStyle;
require "../vendor/autoload.php";
require "../app/Http/Livewire/CustomPdfGenerator.php";

class ReceiptSummary extends Component
{

    public $accounts, $keterangan, $prices, $account_id;
    public $updateMode = false;
    public $inputs = [];
    public $i = 1;
    public $dataDesc = array();
    public $no_kwitansi;
    public $date_kwitansi;
    public $medical_record; 
    public $episode; 
    public $nama_pasien;
    public $discount;
    public $penjamin;
    public $price;
    public $date_pengobatan;
    public $date_keluar_pengobatan;

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
        $n1 = "";
        $n2 = "";
        $n3 = "";
        $n4 = "";
        $n5 = "";
        $ket1 = "";
        $ket2 = "";
        $ket3 = "";
        $ket4 = "";
        $ket5 = "";
        $jum1 = "";
        $jum2 = "";
        $jum3 = "";
        $jum4 = "";
        $jum5 = "";
        $totalPrice = 0;
        $user = auth()->user()->username;
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
        $dataDesc['data'] = [];
   
        foreach ($this->keterangan as $key => $value) {
            // Receipt::create(['keterangan' => $this->keterangan[$key], 'prices' => $this->prices[$key]]);
            $newData = array(
                'key' => $key,
                'keterangan' => $this->keterangan[$key],
                'prices' => $this->prices[$key]
            );
            $dataDesc['data'][] = $newData;
            $price = intval(preg_replace('/\D/', '', $this->prices[$key]));
            $totalPrice = $totalPrice + $price;
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

        $discount = str_replace('Rp. ', '', $request->get('discount'));
        $discount = str_replace('.', '', $discount);
        $firstRowStyle = array('bgColor' => 'FFFFFF');
        $template = new \PhpOffice\PhpWord\TemplateProcessor(public_path('/templates/RekamBiaya.docx'));
        $section = $phpWord->addSection();
        $table = $section->addTable();

        $table->setWidth(TblWidth::AUTO);
        
        foreach ($dataDesc as $row) {
            $tableRow = $table->addRow();
            foreach ($row as $key => $value) {
                $tableCell = $tableRow->addCell();
                $textRun = $tableCell->addTextRun();
                $textRun->addText($value['keterangan']);
                // $template->setValue("ket1", $value['keterangan']);
                $ky = 0;
                $ky = strval(intval($value['key']));
                if ($ky == 0) {;
                    $template->setValue("n0" , 1);
                } else {
                    $template->setValue("n$ky" , $ky);
                }
                $template->setValue("ket$ky" , $value['keterangan']);
                $template->setValue("jum$ky" , number_format(intval(preg_replace('/\D/', '', $value['prices']))));
                // error_log($key);
            }
        }
        $template->setValue('date_mmm', date('d F Y', strtotime($data->created_at)) );
        // $template->setValue('price', number_format(intval($price)));
        $template->setValue('price_ful',  number_format($totalPrice));
        $template->setValue('discount', number_format(intval($discount)));
        $template->setValue('no_va', $penjamin->no_va);
        $template->setValue('no_receipt', $data->no_receipt);
        $template->setValue('medical_record', $data->medical_record);
        $template->setValue('episode', $data->episode);
        $template->setValue('nama_pasien', $data->nama_pasien);
        $template->setValue('date_pengobatan',$data->date_pengobatan);
        $template->setValue('penjamin',$data->penjamin);
        $template->setValue('created_at', date('d-m-Y', strtotime($data->created_at)) );
        $template->setValue('user_name',$data->user_name);
        $template->setValue('n0',$n1);
        $template->setValue('ket0',$ket1);
        $template->setValue('jum0',$jum1);
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


        $template->setComplexBlock('TABLE', $table);
        $saveDocPath = public_path($data->nama_pasien."-biaya.docx");
        $template->saveAs($saveDocPath);

        $content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath, 'Word2007');
 
        $savePdfPath = public_path($data->nama_pasien."-biaya.pdf");

        if (file_exists($savePdfPath)) {
            unlink($savePdfPath);
        }
 
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($content,'PDF');
        $PDFWriter->save($savePdfPath);
 
        if ( file_exists($saveDocPath) ) {
            unlink($saveDocPath);
        }
        Receipt::create([
            'no_receipt' => $this->no_kwitansi,
            'medical_record' => $this->medical_record,
            'episode' => $this->episode,
            'nama_pasien' => $this->nama_pasien,
            'price' => intval(preg_replace('/\D/', '', $this->price)),
            'discount' => intval(preg_replace('/\D/', '', $this->discount)),
            'user_name' => $user,
            'penjamin' => $this->penjamin,
            'date_pengobatan' => $this->date_pengobatan
        ]);
   
        return response()->download($savePdfPath);
    }

    public function convertToInteger($idrAmount)
    {
        return intval(str_replace(['Rp ', '.', ','], ['', '', ''], $idrAmount));
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
        $this->no_kwitansi = "MH-". $ids . "/" . $newDate;
        $this->date_kwitansi =  Carbon::now();
        $this->date_pengobatan = Carbon::now();
        $this->date_keluar_pengobatan = Carbon::now();

        return view('livewire.receipt-summary', $data);
    }
}
