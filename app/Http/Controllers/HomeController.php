<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use App\Models\Requests;
use App\Models\Receipt;
use App\Models\Insurances;
use App\Models\User;
use App\Charts\MonthlyRequestChart;
use Illuminate\Support\Facades\Hash;
use DB;
use Illuminate\Support\Facades\File;
use Image;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\InsurancesImport;
use App\Exports\InsurancesExport;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public $public_path = "/public/signature/";
    public $storage_path = "/storage/signature/";

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index() {
        return view('finance\home');
    }

    public function showDashboard(MonthlyRequestChart $chart) {
        $data = Requests::select(DB::raw("(SUM(total_price)) as total_price"), DB::raw("MONTHNAME(created_at) as name"))
            ->whereYear('created_at', date('Y'))->orderBy('created_at', 'ASC')->groupBy('name')->get();
        $totalPrice = 0;
        $user = auth()->user()->user_type;
        $total = 0;
        for ($i = 0; $i < sizeof($data); $i++) {
            $totalPrice = $totalPrice + $data[$i]->total_price;
            $total = $total + 1;
        }
        $dats['total'] = $totalPrice;
        $dats['totalRequest'] = $total;
        $dats['request'] = Requests::orderBy('created_at', 'desc')->get();
        $dats['receipt'] = Receipt::orderBy('created_at', 'desc')->get();
        $dats['insurances'] = Insurances::orderBy('name', 'ASC')->get();
        $dats['type'] = $user;
        $dats['chart']   = $chart->build();

        return view('finance\dashboard', $dats);
    }

    public function addInsurance() {

        return view('legalisir\createinsurance');
    }

    public function editInsurance($id) {
        $data = Insurances::findOrFail($id);

        return view('legalisir\updateinsurance', compact('data'));
    }

    public function updateInsurance(Request $request, $id) {
        $data = $request->all();
        $insurance = Insurances::findOrFail($id);

        $data['name'] = $request->get('name');
        $data['status'] = $request->get('status');

        $insurance->update($data);

        return redirect()->route('showDashboard')->with('message', 'Berhasil mengupdate data Asuransi!');
    }

    public function createInsurance(Request $request) {
        $data = $request->all();

        Insurances::create([
            'name' => $request->name,
            'status' => $request->status
        ]);

        return redirect()->route('showDashboard')->with('message', 'Berhasil menambah list Asuransi!');
    }

    public function editProfile($id) {
        $data['data'] = User::findOrFail($id);

        return view('auth.editprofile', $data);
    }

    public function updateProfile(Request $request, $id) {
        $user = User::findOrFail($id);
        $signature = null;

        if ($request->hasfile('signature')) {
            foreach (explode('|', $user->signature) as $value) {
                echo $value;
                $this->deleteImage($value);
            }
            $files = $request->file('signature');
            $path = "signature/";
            $urls = $this->file($files, $path, 100, 100);

            // $path = $files->storeAs('signature', $signature, 'public');
            $user->update([
                'signature' => $urls
            ]);
        }
        if ($request->get('password') != null) {
            if ($request->get('password') == $request->get('password_confirmation')) {
                $user->update([
                    'password' => Hash::make($request->get('password'))
                ]);
            }
        }

        return redirect()->route('showDashboard')->with('message', 'Berhasil update Profile!');
    }

    public function logout() {
        Session::flush();

        Auth::logout();

        return redirect()->route('login');
    }

    public function csHome() {
        return view('legalisir\createrequest');
    }

    public function deleteInsurance($id)
    {
        try{
            Insurances::findOrfail($id)->delete();
            return redirect()->route('showDashboard')->with('message' , 'Event Deleted');
        }catch(Exception $e) {
            return redirect()->route('showDashboard')->with('message' , $e);
        }
    }

    private function deleteImage($image) {
        $image_path = "/signature/" . $image;

        if(File::exists($image_path)){
            File::delete($image_path);
        }
    }

    public function file( $file, $path, $width, $height ) : string
    {
       if ( $file ) {

           $extension       = $file->getClientOriginalName();
           $url             = $file->storeAs($this->public_path,$extension);
           $public_path     = public_path($this->storage_path.$extension);
           $img             = Image::make($public_path)->resize($width, $height);
           $url             = preg_replace( "/public/", "", $url );
           $img->save($public_path);
           return $extension;
       }
    }

    public function fileImportExport()
    {
       return view('finance/file-import');
    }
   
    /**
    * @return \Illuminate\Support\Collection
    */
    public function fileImport(Request $request) 
    {
        Excel::import(new InsurancesImport, $request->file('file')->store('temp'));
        return back();
    }
    /**
    * @return \Illuminate\Support\Collection
    */
    public function fileExport() 
    {
        return Excel::download(new InsurancesExport, 'DAFTAR VA.xls');
    }    

}
