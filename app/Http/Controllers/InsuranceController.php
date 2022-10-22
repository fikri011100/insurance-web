<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Insurances;

class InsuranceController extends Controller
{
    //
    public function index() {
        $insurances = Insurances::sortable()->orderBy('name', 'asc')->paginate(15)->onEachSide(2)->fragment('insurance');

        return view('legalisir.insurancelist', compact('insurances'));
    }

    public function editInsurance($id) {
        $data = Insurances::findOrFail($id);

        return view('legalisir.updateinsurance', compact('data'));
    }

    public function updateInsurance(Request $request, $id) {
        $data = $request->all();
        $insurance = Insurances::findOrFail($id);

        $data['name'] = $request->get('name');
        $data['no_va'] = $request->get('no_va');
        $data['alamat'] = $request->get('alamat');
        $data['status'] = $request->get('status');
        $data['description'] = $request->get('description');

        $insurance->update($data);

        return redirect()->route('listinsurances')->with('message', 'Berhasil mengupdate data Asuransi!');
    }

    public function createInsurance(Request $request) {
        $data = $request->all();

        Insurances::create([
            'name' => $request->name,
            'no_va' => $request->no_va,
            'alamat' => $request->alamat,
            'status' => "0",
            'description' => ""
        ]);

        return redirect()->route('listinsurances')->with('message', 'Berhasil menambah list Asuransi!');
    }

    public function addInsurance() {

        return view('legalisir.createinsurance');
    }

    public function deleteInsurance ($id) {
        $insurance = Insurances::findOrFail($id);

        $data['status'] = "1";
        $insurance->update($data);

        return redirect()->route('listinsurances')->with('error', 'Berhasil menghapus Asuransi!');
    }
}
