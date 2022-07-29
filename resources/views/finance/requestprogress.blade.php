@extends('finance/home')

@section('title', 'Tables - Basic Tables')

@section('content')


<h4 class="fw-bold py-3 mb-4">
  <span class="text-muted fw-light">Request /</span>
</h4>

<!-- Basic Bootstrap Table -->
<div class="card">
  <h5 class="card-header">Detail Request Surat</h5>
  <div class="p-3">
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-fullname">Nama Request</label>
      <div class="input-group input-group-merge">
        <input type="text" class="form-control" id="request_name" name="request_name" value="{{$request->request_name}}" placeholder="Nama Request" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2" disabled/>
      </div>
    </div>
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-email">Email Request</label>
      <div class="input-group input-group-merge">
        <input type="text" id="request_email" name="request_email" class="form-control" disabled value="{{$request->request_email}}" placeholder="john.doe" aria-label="john.doe" aria-describedby="basic-icon-default-email2" />
      </div>
    </div>
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-fullname">Nama Pasien</label>
      <div class="input-group input-group-merge">
        <input type="text" class="form-control" id="request_patient" name="request_patient" disabled value="{{$request->request_patient}}" placeholder="Nama Pasien" aria-label="Nama Pasien" aria-describedby="basic-icon-default-fullname2" />
      </div>
    </div>
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-phone">Phone No</label>
      <div class="input-group input-group-merge">
        <input type="text" id="request_phone" name="request_phone" class="form-control phone-mask" disabled value="{{$request->request_phone}}" placeholder="628 6799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" />
      </div>
    </div>
    <div class="mb-3">          
    <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Lahir</label>
      <div class="col-md-5">
          <input class="form-control" type="date" value="{{$request->date_birth}}" id="date_birth" disabled name="date_birth" />
      </div>
    </div>
    <div class="mb-3">
      <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Berobat</label>
      <div class="col-md-5">
          <input class="form-control" type="date" value="{{$request->date_medicine}}" id="date_medicine" disabled name="date_medicine" />
      </div>
    </div>
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-fullname">Nama Asuransi</label>
      <div class="input-group input-group-merge">
        <input type="text" class="form-control" id="insurance" name="insurance" value="{{$request->insurance}}" disabled placeholder="Nama Asuransi" aria-label="Nama Asuransi" aria-describedby="basic-icon-default-fullname2" />
      </div>
    </div>
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-fullname">Episodes</label>
      <div class="input-group input-group-merge">
        <input type="text" class="form-control" id="episode" name="episode" value="{{$request->episode}}" disabled placeholder="Episodes" aria-label="Episodes" aria-describedby="basic-icon-default-fullname2" />
      </div>
    </div>
    <div class="mb-3">
      <label class="form-label" for="basic-icon-default-fullname">Total Set</label>
      <div class="input-group input-group-merge">
        <input type="text" class="form-control" id="insurance_set" name="insurance_set" value="{{$request->insurance_set}}" disabled placeholder="Total Set" aria-label="Total Set" aria-describedby="basic-icon-default-fullname2" />
      </div>
    </div>
    <div class="mb-3">
      <div class="mb-3">
          <label for="defaultSelect" class="form-label">Status Legalisir</label>
          <select id="status" name="status" class="form-select" disabled>
              <option value="0" {{(isset($request->status))?($request->status == 0)?'selected':'':''}} >Belum Dibayar</option>
              <option value="1" {{(isset($request->status))?($request->status == 1)?'selected':'':''}} >Harus Diproses</option>
              <option value="2" {{(isset($request->status))?($request->status == 2)?'selected':'':''}} >Urgent</option>
              <option value="3" {{(isset($request->status))?($request->status == 3)?'selected':'':''}} >Selesai</option>
          </select>
      </div>
    </div>
  </div>
</div>

<hr class="my-5">
  <div class="card">
    <h5 class="card-header">Detail Request Surat</h5>   
    @if($data->count() > 0)
      <div class="table-responsive text-nowrap">
        <table class="table">
          <thead>
            <tr>
              <th>Judul</th>
              <th>Detail</th>
              <th>Pembuat Laporan</th>
              <th>Tanggal</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            @foreach ($data as $item)
              <tr>
                <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->title}}</strong></td>
                <td>{{$item->detail_progress}}</td>
                <td>{{$item->name_user}}</td>
                <td>{{date('d-m-Y', strtotime($item->created_at))}}</td>
              </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    @else
      <div class="self-center text-black text-xl">Tidak ada Progress</div>
    @endif
</div>
<div class="fixed bottom-0 right-0 mr-8 mb-8">
    <a href="{{route('addProgress', $id)}}">
      <button
              class="text-white px-4 w-auto h-12 bg-red-600 rounded-full hover:bg-red-700 active:shadow-lg mouse shadow transition ease-in duration-200 focus:outline-none">
          <svg viewBox="0 0 20 20" enable-background="new 0 0 20 20" class="w-6 h-6 inline-block mr-1">
          <path fill="#FFFFFF" d="M16,10c0,0.553-0.048,1-0.601,1H11v4.399C11,15.951,10.553,16,10,16c-0.553,0-1-0.049-1-0.601V11H4.601
                                      C4.049,11,4,10.553,4,10c0-0.553,0.049-1,0.601-1H9V4.601C9,4.048,9.447,4,10,4c0.553,0,1,0.048,1,0.601V9h4.399
                                      C15.952,9,16,9.447,16,10z"/>
          </svg>
      </button>
    </a>
</div>
@endsection