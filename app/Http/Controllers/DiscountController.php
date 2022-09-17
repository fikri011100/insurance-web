<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Discount;
use App\Models\Insurances;

class DiscountController extends Controller
{
    //
    public function addDiscount() {
        $insurance = Insurances::orderBy("name", "asc")->get();

        return view('kwitansi\creatediscount', compact('insurance'));
    }

    public function createDiscount(Request $request) {
        $data = $request->all();

        Discount::create([
            'insurance' => $request->insurance,
            'episode' => $request->episode,
            'total_bill' => $request->total_bill,
            'doctor' => $request->doctor,
            'medicine' => $request->medicine,
            'implant' => $request->implant,
            'base_discount' => $request->base_discount,
            'discount' => $request->discount
        ]);

        return route('addDiscount')->with('message', 'Berhasil membuat Diskon!');
    }
}
