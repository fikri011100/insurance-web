<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Discount;
use App\Models\Insurances;

class DiscountController extends Controller
{
    //
    public function addDiscount() {
        $data['insurance'] = Insurances::orderBy("name", "asc")->get();

        return view('kwitansi.creatediscount', $data);
    }

    public function getDiscount($insurance) {
        
        if ($insurance != "") {
            $data = Discount::select('insurance', 'base_discount')->where('insurance', $insurance)->first();
        }
        $dataDiscount['data'] = $data;

        return response()->json($dataDiscount);
    }

    public function createDiscount(Request $request) {
        $data = $request->all();

        Discount::create([
            'insurance' => $request->penjamin,
            'episode' => "",
            'total_bill' => $request->total_bill,
            'doctor' => $request->has('checkboxDoctor'),
            'medicine' => $request->has('checkboxMedicine'),
            'implant' => $request->has('checkboxImplant'),
            'base_discount' => $request->base_discount,
            'discount' => ""
        ]);

        return redirect()->route('addDiscount')->with('message', "Berhasil membuat Diskon!");
    }
}
