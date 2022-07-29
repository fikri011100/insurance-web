<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Models\Requests;
use App\Models\Receipt;
use App\Models\Insurances;
use App\Charts\MonthlyRequestChart;
use DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
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
        $data['form'] = 'add';

        return view('finance\createinsurance', $data);
    }

    public function editInsurance($id) {
        $data['data'] = Insurances::findOrFail($id);
        $data['form'] = 'edit';

        return view('finance\createinsurance', $data);
    }

    public function updateInsurance(Request $request, $id) {
        $data = $request->all();
        $insurance = Insurance::findOrFail($id);

        $insurance->update([
            'name' => $request->get('name'),
            'status' => $request->get('status')
        ]);

        return rediret()->route('showDashboard');
    }

    public function createInsurance(Request $request) {
        $data = $request->all();

        Insurances::create([
            'name' => $request->name,
            'status' => $request->status
        ]);

        return redirect()->route('showDashboard');
    }

    public function logout() {
        Session::flush();

        Auth::logout();

        return view('auth\login');
    }

    public function csHome() {
        return view('cs\createrequest');
    }

    public function deleteInsurance($id)
    {
        try{
            Insurances::findOrfail($id)->delete();
            return redirect()->route('showDashboard')->withSuccess('Event Deleted');
        }catch(Exception $e) {
            return redirect()->route('showDashboard')->withError($e);
        }
    }

}
