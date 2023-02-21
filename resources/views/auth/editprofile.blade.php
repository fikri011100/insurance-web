@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item fw-light text-muted">
        <a href="javascript:void(0);">Profile</a>
      </li>
      <li class="breadcrumb-item active" >Edit</li>
    </ol>
  </nav>
</h4>

<div class="row">
  <div class="col-xl">
      <div class="card mb-4">
        <div class="card-body">
          <form method="POST" enctype="multipart/form-data" action="{{ route('updateProfile', $data->id) }}">
          @csrf
              <div class="mb-3">
                  <label class="form-label" for="basic-icon-default-fullname">Username</label>
                  <div class="input-group input-group-merge">
                      <input type="text" class="form-control" id="username" name="username" value="{{$data->username}}" placeholder="Username" aria-label="Username" aria-describedby="basic-icon-default-fullname2" disabled/>
                  </div>
              </div>
              <div class="mb-3">
                  <label class="form-label" for="basic-icon-default-fullname">Email</label>
                  <div class="input-group input-group-merge">
                      <input type="text" class="form-control" id="email" name="email" value="{{$data->email}}" placeholder="Email" aria-label="Email" aria-describedby="basic-icon-default-fullname2" disabled/>
                  </div>
              </div>
              <div class="mb-3">
                  <label class="form-label" for="basic-icon-default-fullname">Ganti Password</label>
                  <div class="input-group input-group-merge">
                      <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
                      <input type="password" class="form-control" id="password" name="password" placeholder="Ganti Password" aria-label="Ganti Password" aria-describedby="basic-icon-default-fullname2" />
                  </div>
              </div>
              <div class="mb-3">
                  <label class="form-label" for="basic-icon-default-fullname">Konfirmasi Password</label>
                  <div class="input-group input-group-merge">
                      <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
                      <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="Konfirmasi Password" aria-label="Konfirmasi Password" aria-describedby="basic-icon-default-fullname2" />
                  </div>
              </div>
            <button type="submit" class="btn btn-primary px-px">Update</button>
          </form>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal modal-top fade" id="modalSignature" tabindex="-1">
      <div class="modal-dialog">
        <form class="modal-content">
          <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <img src="{{ asset('/storage/signature/'.$data->signature) }}" alt="">
          </div>
        </form>
      </div>
    </div>

</div>
@endsection