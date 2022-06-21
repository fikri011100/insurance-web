<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Requests;
use App\Models\RequestProgress;

class RequestController extends Controller
{
    //
    public function index() {
        $requests = Requests::latest()->paginate(10);

        return view('finance\requestlist', compact('requests'));
    }

    public function createRequest(Request $request) {
        $data = $request->all();
        $price = 250000 * $request->get('insurance_set');
        Requests::create([
            'request_name' => $request->get('request_name'),
            'request_email' => $request->get('request_email'),
            'request_patient' => $request->get('request_patient'),
            'request_phone' => $request->get('request_phone'),
            'date_birth' => $request->get('date_birth'),
            'date_medicine' => $request->get('date_medicine'),
            'insurance' => $request->get('insurance'),
            'episode' => $request->get('episode'),
            'insurance_set' => $request->get('insurance_set'),
            'total_price' => $price,
            'status' => $request->get('status'),
        ]);
        return redirect()->route('requestlist')->with('message', 'Post Created Successfully');
    }

    public function addRequest() {
        
        return view('finance\createrequest');
    }   

    public function editRequest($id) {
        $data['data']  = Requests::findOrFail($id);
        $data['form']  = 'edit';
        
        return view('finance\createrequest', $data);
    }

    public function listProgress($id) {
        $data['data']  = RequestProgress::select("*")
                            ->where("id_request", $id)
                            ->get();
        
        return view('finance\requestprogress', $data);
    }

    public function updateDataRequest(Request $request, $id) {
        $data = $request->all();
        $req = Requests::findOrFail($id);

        try {
            $req->update($data);
            return redirect()->route('requestlist')->withSuccess('Request Updated');
        } catch (Exception $th) {
            return redirect()->route('editrequest')->withError($th);
        }
    }
}
