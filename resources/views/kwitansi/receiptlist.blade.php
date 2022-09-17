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
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Kwitansi</a>
        </li>
        <li class="breadcrumb-item active">Data</li>
      </ol>
    </nav>
</h4>

<!-- Basic Bootstrap Table -->
<div class="card">
  <div class="card-header flex justify-between">
    <h5 >List Daftar Kwitansi</h5>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalFilter">Sort</button>
  </div>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead> 
        <tr class="text-nowrap">
          <th>No</th>
          <th>Nomor MR</th>
          <th>Episode</th>
          <th>Asuransi</th>
          <th>Nama Pasien</th>
          <th>Biaya</th>
          <th>
            @sortablelink('created_at','Tanggal')
          </th>
          <th>Actions</th>
        </tr>
      </thead>
      @if(empty($receipt))
        <h1 >No Data</h1>
      @else
        <tbody class="table-border-bottom-0">
          @php
            $nomor = 1 + (($receipt->currentPage() -1) * $receipt->perPage());
          @endphp

          @foreach ($receipt as $item)
            <tr class="text-nowrap">
              <td>{{ $nomor++ }}</td>
              <td>{{$item->medical_record}}</td>
              <td>{{$item->episode}}</td>
              <td>{{$item->penjamin}}</td>
              <td>{{$item->nama_pasien}}</td>
              <td>{{number_format($item->price)}}</td>
              <td>{{date('d F Y', strtotime($item->created_at))}}</td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="{{route('editReceipt', $item->id)}}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                  </div>
                </div>
              </td>
            </tr>
          @endforeach
        </tbody>
      @endif
    </table>
    <div class="demo-inline-spacing mt-5">
      <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
          {!! $receipt->links('pagination::bootstrap-4') !!}
        </ul>
      </nav>
    </div>
    <div class="modal fade" id="modalFilter" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <form action="{{ route('receiptslist.index') }}" class="row g-3" method="get">
            <div class="modal-header">
              <h5 class="modal-title" id="modalCenterTitle">Modal title</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="mb-3">
                  <label class="form-label" for="basic-icon-default-fullname">Penjamin</label>
                  <select id="penjamin" name="penjamin" class="form-select">
                    <option value="">Semua</option>
                    @foreach ($insurance as $items)
                      <option value="{{$items->name}}" >{{$items->name}}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="row g-2">
                <div class="col mb-0">
                  <label for="from_date" class="form-label">Date Start</label>
                  <input type="date" id="from_date" name="from_date" class="form-control" placeholder="xxxx@xxx.xx">
                </div>
                <div class="col mb-0">
                  <label for="to_date" class="form-label">Date End</label>
                  <input type="date" id="to_date" name="to_date" class="form-control" placeholder="DD / MM / YY">
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>
@endsection