@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Forms/</span>Request Insurance</h4>

<div class="row">
<div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" action="{{ isset($form)?route('update-requestlist', $data->id):route('create-requestlist') }}">
        @csrf
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Request</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="request_name" name="request_name" value="{{old('request_name', $data->request_name)}}" placeholder="Nama Request" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-email">Email Request</label>
            <div class="input-group input-group-merge">
              <span class="input-group-text"><i class="bx bx-envelope"></i></span>
              <input type="text" id="request_email" name="request_email" class="form-control" value="{{old('request_email', $data->request_email)}}" placeholder="john.doe" aria-label="john.doe" aria-describedby="basic-icon-default-email2" />
              <span id="basic-icon-default-email2" class="input-group-text">@example.com</span>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Pasien</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="request_patient" name="request_patient" value="{{old('request_patient', $data->request_patient)}}" placeholder="Nama Pasien" aria-label="Nama Pasien" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-phone">Phone No</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-phone2" class="input-group-text"><i class="bx bx-phone"></i></span>
              <input type="text" id="request_phone" name="request_phone" class="form-control phone-mask" value="{{old('request_phone', $data->request_phone)}}" placeholder="628 6799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" />
            </div>
          </div>
          <div class="mb-3">          
          <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Lahir</label>
            <div class="col-md-5">
                <input class="form-control" type="date" value="{{old('date_birth', $data->date_birth)}}" id="date_birth" name="date_birth" />
            </div>
          </div>
          <div class="mb-3">
            <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Berobat</label>
            <div class="col-md-5">
                <input class="form-control" type="date" value="{{old('date_medicine', $data->date_medicine)}}" id="date_medicine" name="date_medicine" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Asuransi</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="insurance" name="insurance" value="{{old('insurance', $data->insurance)}}" placeholder="Nama Asuransi" aria-label="Nama Asuransi" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Episodes</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="episode" name="episode" value="{{old('episode', $data->episode)}}" placeholder="Episodes" aria-label="Episodes" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Total Set</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="insurance_set" name="insurance_set" value="{{old('insurance_set', $data->insurance_set)}}" placeholder="Total Set" aria-label="Total Set" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <div class="mb-3">
                <label for="defaultSelect" class="form-label">Status Legalisir</label>
                <select id="status" name="status" class="form-select">
                    <option value="0" {{(isset($data->status))?($data->status == 0)?'selected':'':''}} >Belum Dibayar</option>
                    <option value="1" {{(isset($data->status))?($data->status == 1)?'selected':'':''}} >Harus Diproses</option>
                    <option value="2" {{(isset($data->status))?($data->status == 2)?'selected':'':''}} >Urgent</option>
                    <option value="3" {{(isset($data->status))?($data->status == 3)?'selected':'':''}} >Selesai</option>
                </select>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Send</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection