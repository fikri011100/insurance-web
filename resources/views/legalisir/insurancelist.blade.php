@extends('finance/home')

@section('title', 'Tables - Basic Tables')

@section('content')

@if (session('message'))
    <div x-data="{show: true}" x-init="setTimeout(() => show = false, 3000)" x-show="show" class="alert alert-success">
        {{ session('message') }}
    </div>
@elseif(session('error'))
    <div x-data="{show: true}" x-init="setTimeout(() => show = false, 3000)" x-show="show" class="alert alert-danger">
        {{ session('error') }}
    </div>
@endif

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb breadcrumb-style1">
        <li class="breadcrumb-item">
          <a href="javascript:void(0);">Asuransi</a>
        </li>
        <li class="breadcrumb-item active">Data</li>
      </ol>
    </nav>
</h4>


<!-- Basic Bootstrap Table -->
<div class="card">
  <h5 class="card-header">List Request Asuransi</h5>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead>
        <tr class="text-nowrap">
          <th>No</th>
          <th>@sortablelink('name','Nama Asuransi')</th>
          <th>@sortablelink('no_va','Nomor VA')</th>
          <th>Alamat</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      @if(empty($insurances))
        <h1 >No Data</h1>
      @else
        <tbody class="table-border-bottom-0">
          @php
            $nomor = 1 + (($insurances->currentPage() -1) * $insurances->perPage());
          @endphp
          @foreach ($insurances as $i => $item)
            <tr class="text-nowrap">
              <td>{{ $nomor++ }}</td>
              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->name}}</strong></td>
              <td>{{$item->no_va}}</td>
              <td>{{$item->no_va}}</td>
              @if ($item->status == '1')
                <td><span class="badge bg-label-warning me-1">Tidak Aktif</span></td>
              @elseif ($item->status == '0')
                <td><span class="badge bg-label-primary me-1 ">Aktif</span></td>
              @endif
              <td>
                <div class="dropdown">
                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="{{route('editInsurance', $item->id)}}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                    <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#delete{{ $item->id }}"><i class="bx bx-card me-1"></i>Nonaktifkan</a>
                  </div>
                </div>
              </td>
            </tr>
          @endforeach
        </tbody>
      @endif
    </table>
    <!-- Modal -->
    @foreach ($insurances as $i => $item)
    <div class="modal modal-top fade" id="delete{{ $item->id }}" role="dialog" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <form class="modal-content">
          <div class="modal-header">
            <h3>Peringatan</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="{{route('deleteInsurance', $item->id)}}" method="POST", enctype="multipart/form-data">
              @csrf
              <text>Apakah anda yakin ingin me-nonaktifkan asuransi {{$item->name}}?</text>

                <div class="row mt-3">
                  <div class="col mb-3">
                    <label for="nameLarge" class="form-label">Keterangan</label>
                    <textarea class="form-control" id="description" name="description" placeholder="Keterangan" rows="3"></textarea>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" >Hapus</button>
          </div>
        </form>
      </div>
    </div>
    @endforeach
    <div class="modal modal-top fade" id="modalPrint" tabindex="-1">
      <div class="modal-dialog">
        <form class="modal-content">
          <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h5>Berhasil print!</h5>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" >Selesai</button>
          </div>
        </form>
      </div>
    </div>
    <div class="d-flex justify-content-center mt-5">
      {!! $insurances->links('pagination::bootstrap-4') !!}
    </div>
  </div>
</div>
<div class="buy-now">
    <a href="{{route('addInsurance')}}" class="btn btn-danger btn-buy-now">Tambah Data Asuransi</a>
  </div>
@endsection