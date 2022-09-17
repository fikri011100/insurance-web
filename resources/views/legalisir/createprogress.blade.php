@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb breadcrumb-style1">
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Kwitansi</a>
        </li>
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Data</a>
        </li>
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Form</a>
        </li>
        <li class="breadcrumb-item active">Progress</li>  
      </ol>
  </nav>
</h4>

<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" enctype="multipart/form-data" action="{{ route('createProgress', $data) }}">
          @csrf
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Title</label>
            <div class="input-group input-group-merge">
              <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
              <input type="text" class="form-control" id="title" name="title" placeholder="Title" aria-label="Title" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Keterangan</label>
            <div class="input-group input-group-merge">
              <textarea type="text" class="form-control" id="detail_progress" name="detail_progress" placeholder="Keterangan" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2"></textarea>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Send</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection