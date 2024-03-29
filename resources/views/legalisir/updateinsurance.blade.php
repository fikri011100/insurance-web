@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-style1">
        <li class="breadcrumb-item fw-light text-muted">
            <a href="javascript:void(0);">Insurance</a>
        </li>
        <li class="breadcrumb-item fw-light text-muted">
            <a href="javascript:void(0);">Form</a>
        </li>
        <li class="breadcrumb-item active">{{$data->name}}</li>
    </ol>
  </nav>
</h4>

<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form action="{{ route('updateInsurance', $data->id) }}"
        method="POST" enctype="multipart/form-data">
          @csrf
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Asuransi</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="name" name="name" value="{{(isset($data->name))?$data->name:old('name')}}" placeholder="name" aria-label="name" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nomor Virtual Account</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="no_va" name="no_va" value="{{(isset($data->no_va))?$data->no_va:old('no_va')}}"  placeholder="no_va" aria-label="no_va" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Alamat</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="alamat" name="alamat" value="{{(isset($data->alamat))?$data->alamat:old('alamat')}}"  placeholder="alamat" aria-label="alamat" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Ubah</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection