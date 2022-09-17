@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item fw-light text-muted">
        <a href="javascript:void(0);">Request</a>
      </li>
      <li class="breadcrumb-item fw-light text-muted">
        <a href="javascript:void(0);">Data</a>
      </li>
      <li class="breadcrumb-item active" >Create</li>
    </ol>
  </nav>
</h4>

<div class="row">
<div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" enctype="multipart/form-data" action="{{ route('create-requestlist') }}">
        @csrf
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Request</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="request_name" name="request_name" placeholder="Nama Request" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-email">Email Request</label>
            <div class="input-group input-group-merge">
              <span class="input-group-text"><i class="bx bx-envelope"></i></span>
              <input type="text" id="request_email" name="request_email" class="form-control" placeholder="john.doe" aria-label="john.doe" aria-describedby="basic-icon-default-email2" />
              <span id="basic-icon-default-email2" class="input-group-text">@example.com</span>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Pasien</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="request_patient" name="request_patient" placeholder="Nama Pasien" aria-label="Nama Pasien" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-phone">Phone No</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-phone2" class="input-group-text"><i class="bx bx-phone"></i></span>
              <input type="text" id="request_phone" name="request_phone" class="form-control phone-mask" placeholder="628 6799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" />
            </div>
          </div>
          <div class="mb-3">          
          <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Lahir</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="birthday" name="birthday" />
            </div>
          </div>
          <div class="mb-3">
            <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Berobat</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="date_medicine" name="date_medicine" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Asuransi</label>
            <select id="insurance" name="insurance" class="form-select">
              @foreach ($insurance as $items)
                <option value="{{$items->name}}" >{{$items->name}}</option>
              @endforeach
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Episodes</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="episode" name="episode" placeholder="Episodes" aria-label="Episodes" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Total Set</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="insurance_set" name="insurance_set" placeholder="Total Set" aria-label="Total Set" aria-describedby="basic-icon-default-fullname2" />
              <span class="input-group-text">{{number_format($price->legalisir_price)}} per set</span>
            </div>
          </div>
          <div class="mb-3">
            <div class="mb-3">
                <label for="defaultSelect" class="form-label">Status Legalisir</label>
                <select id="status" name="status" class="form-select">
                    <option value="0" >Request</option>
                    <option value="1" >AR Call</option>
                    <option value="2" >Selesai</option>
                    <option value="3" >Diambil</option>
                </select>
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto Bukti Pembayaran</label> 
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_payment" name="photo_payment" aria-describedby="buttonView">
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto Pengambil Legalisir</label>
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_taker" name="photo_taker">
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto KTP</label>
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_ktp" name="photo_ktp" aria-describedby="buttonView">
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto KK</label>
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_kk" name="photo_kk">
            </div>
          </div>
          <button type="submit" class="btn btn-primary px-px">Send</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection