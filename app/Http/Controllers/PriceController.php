<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Price;
use Carbon\Carbon;

class PriceController extends Controller
{
    //
    public function index() {
        $price = Price::orderBy('created_at', 'desc')->paginate(10);

        return view('legalisir\pricelist', compact('price'));
    }

    public function addPrice() {
        $data['todayDate'] = Carbon::now();

        return view('legalisir\createprice', $data);
    }

    public function createPrice(Request $request) {
        $data = $request->all();
        $user = auth()->user();

        if ($user->user_type == 0) {
            Price::query()->update(['status' => 1]);
            Price::create([
                'legalisir_price' => $request->get('legalisir_price'),
                'user_id' => $user->id,
                'date_started' => $request->get('date_started'),
                'status' => '0'
            ]);
    
            return redirect()->route('listprices')->with('message', 'Berhasil mengganti harga!');
        } else {
            return redirect()->route('listprices')->with('error', 'Anda tidak memiliki akses untuk mengubah harga!');
        }
    }
}
