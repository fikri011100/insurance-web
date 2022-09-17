@extends('finance/home')

@section('title', 'Harga Template - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb breadcrumb-style1">
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Legalisir</a>
        </li>
        <li class="breadcrumb-item active">Form</li>
      </ol>
    </nav>
</h4>

<div class="row">
<div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" action="{{ route('createPrice') }}" enctype="multipart/form-data">
        @csrf
          <div class="mb-3"> 
            <label class="form-label" for="basic-icon-default-fullname">Harga baru Legalisir</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="legalisir_price" name="legalisir_price" placeholder="Harga baru Legalisir" aria-label="Harga baru Legalisir" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">          
            <label for="html5-da  te-input" class="col-md-2 col-form-label">Tanggal diubah</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="date_started" name="date_started" value="{{$todayDate->format('Y-m-d')}}" />
            </div>
          </div>
          <button type="submit" class="btn btn-primary mt-2">Send</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection