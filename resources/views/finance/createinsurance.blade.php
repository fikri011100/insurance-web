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
      @if($form == "edit")
        <li class="breadcrumb-item active">{{$data->name}}</li>
      @endif
    </ol>
  </nav>
</h4>

<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" action="{{ isset($form)?route('createInsurance'):route('editInsurance', $data->id) }}">
        @csrf
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Asuransi</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="name" name="name" value="{{(isset($data->name))?$data->name:old('name')}}" placeholder="name" aria-label="name" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <div class="mb-3">
                <label for="defaultSelect" class="form-label">Status ()</label>
                <select id="status" name="status" class="form-select">
                    <option value="0" {{(isset($data->status))?($data->status == 0)?'selected':'':''}} >Langsung diproses</option>
                    <option value="1" {{(isset($data->status))?($data->status == 1)?'selected':'':''}} >Perlu dikonfirmasi</option>
                </select>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Kirim</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection