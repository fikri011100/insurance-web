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
      <li class="breadcrumb-item fw-light text-muted">
        <a href="javascript:void(0);">Form</a>
      </li>
        <li class="breadcrumb-item active">{{$data->request_patient}}</li>
    </ol>
  </nav>
</h4>

<div class="row">
<div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" enctype="multipart/form-data" action="{{ route('update-requestlist', $data->id) }}">
        @csrf
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Request</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="request_name" name="request_name" value="{{(isset($data->request_name))?$data->request_name:old('request_name')}}" placeholder="Nama Request" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-email">Email Request</label>
            <div class="input-group input-group-merge">
              <span class="input-group-text"><i class="bx bx-envelope"></i></span>
              <input type="text" id="request_email" name="request_email" class="form-control" value="{{(isset($data->request_email))?$data->request_email:old('request_email')}}" placeholder="john.doe" aria-label="john.doe" aria-describedby="basic-icon-default-email2" />
              <span id="basic-icon-default-email2" class="input-group-text">@example.com</span>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Pasien</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="request_patient" name="request_patient" value="{{(isset($data->request_patient))?$data->request_patient:old('request_patient')}}" placeholder="Nama Pasien" aria-label="Nama Pasien" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-phone">Phone No</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-phone2" class="input-group-text"><i class="bx bx-phone"></i></span>
              <input type="text" id="request_phone" name="request_phone" class="form-control phone-mask" value="{{(isset($data->request_phone))?$data->request_phone:old('request_phone')}}" placeholder="628 6799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" />
            </div>
          </div>
          <div class="mb-3">          
          <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Lahir</label>
            <div class="col-md-5">
                <input class="form-control" type="date" value="{{(isset($data->date_birth))?$data->date_birth:old('date_birth')}}" id="date_birth" name="date_birth" />
            </div>
          </div>
          <div class="mb-3">
            <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Berobat</label>
            <div class="col-md-5">
                <input class="form-control" type="date" value="{{(isset($data->date_medicine))?$data->date_medicine:old('date_medicine')}}" id="date_medicine" name="date_medicine" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Asuransi</label>
            <select id="insurance" name="insurance" class="form-select">
              @foreach ($insurance as $items)
                @if($items->name == $data->insurance)
                <option value="{{$items->name}}" selected="selected">{{$items->name}}</option>
                @else
                <option value="{{$items->name}}" >{{$items->name}}</option>
                @endif
              @endforeach
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Episodes</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="episode" name="episode" value="{{(isset($data->episode))?$data->episode:old('episode')}}" placeholder="Episodes" aria-label="Episodes" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Total Set</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="insurance_set" name="insurance_set" value="{{(isset($data->insurance_set))?$data->insurance_set:old('insurance_set')}}" placeholder="Total Set" aria-label="Total Set" aria-describedby="basic-icon-default-fullname2" />
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
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto Bukti Pembayaran</label> 
            <div class="input-group input-group-merge">
            <input class="form-control" type="file" id="photo_payment" name="photo_payment" aria-describedby="buttonView">
                @if ($data->photo_payment != null)
                    <button class="btn btn-outline-primary" type="button" id="buttonView" data-bs-toggle="modal" data-bs-target="#modalBuktiPembayaran">Lihat Foto</button>
                @endif
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto Pengambil Legalisir</label>
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_taker" name="photo_taker">
                @if ($data->photo_taker != null)
                  <button class="btn btn-outline-primary" type="button" id="buttonView" data-bs-toggle="modal" data-bs-target="#modalBukti">Lihat Foto</button>
                @endif
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto KTP</label>
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_ktp" name="photo_ktp" aria-describedby="buttonView">
                @if ($data->photo_ktp != null)
                  <button class="btn btn-outline-primary" type="button" id="buttonView" data-bs-toggle="modal" data-bs-target="#modalKTP">Lihat Foto</button>
                @endif
            </div>
          </div>
          <div class="mb-3">
            <label for="formFile" class="form-label">Pilih File Foto KK</label>
            <div class="input-group input-group-merge">
              <input class="form-control" type="file" id="photo_kk" name="photo_kk">
                @if ($data->photo_kk != null)
                  <button class="btn btn-outline-primary" type="button" id="buttonView" data-bs-toggle="modal" data-bs-target="#modalKK">Lihat Foto</button>
                @endif
            </div>
          </div>
          <button type="submit" class="btn btn-primary px-px">Send</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal modal-top fade" id="modalBuktiPembayaran" tabindex="-1">
    <div class="modal-dialog">
      <form class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <img src="{{ asset('/storage/payment/'.$data->photo_payment) }}" alt="">
        </div>
      </form>
    </div>
  </div>

  <div class="modal modal-top fade" id="modalBukti" tabindex="-1">
    <div class="modal-dialog">
      <form class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <img src="{{ asset('/storage/bukti/'.$data->photo_taker) }}" alt="">
        </div>
      </form>
    </div>
  </div>

  <div class="modal modal-top fade" id="modalKTP" tabindex="-1">
    <div class="modal-dialog">
      <form class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss=" modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <img src="{{ asset('/storage/ktp/'.$data->photo_ktp) }}" alt="">
        </div>
      </form>
    </div>
  </div>

  <div class="modal modal-top fade" id="modalKK" tabindex="-1">
    <div class="modal-dialog">
      <form class="modal-content">
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <img src="{{ asset('/storage/kk/'.$data->photo_kk) }}" alt="">
        </div>
      </form>
    </div>
  </div>
</div>
@endsection