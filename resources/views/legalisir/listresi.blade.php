@extends('finance/home')

@section('title', 'List Resi')

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
          <a href="{{route('listresi')}}">Resi</a>
        </li>
        <li class="breadcrumb-item active">
          <a href="{{route('listresi')}}">Data</a>
        </li>
      </ol>
    </nav>
</h4>


<!-- Basic Bootstrap Table -->
<div class="card">
  <div class="card-header flex justify-between">
    <h5 >List Resi</h5>
    
  </div>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead>
        <tr class="text-nowrap">
          <th>No</th>
          <th>Nomor Resi</th>
          <th>Alamat</th>
          <th>Asuransi</th>
          <th>Progress</th>
          <th>Actions</th>
        </tr>
      </thead>
      @if(empty($data))
        <h1 >No Data</h1>
      @else
        <tbody class="table-border-bottom-0">
          @php
            $nomor = 1 + (($data->currentPage() -1 ) * $data->perPage());
          @endphp

          @foreach ($data as $i => $item)
            <tr class="text-nowrap">
              <td>{{ $nomor++ }}</td>
              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->no_resi}}</strong></td>
              <td>{{$item->alamat}}</td>
              <td>{{ App\Models\Insurances::find($item->id_asuransi)->name }}</td>
              @php $status = App\Models\Requests::find($item->id_legalisir)->status @endphp
              @if ($status == '0')
                <td><span class="badge bg-label-warning me-1">Request</span></td>
              @elseif ($status == '1')
                <td><span class="badge bg-label-info me-1">AR Call</span></td>
              @elseif ($status == '2')
                <td><span class="badge bg-label-primary me-1">Selesai</span></td>
              @elseif ($status == '3')
                <td><span class="badge bg-label-success me-1">Diambil</span></td>
              @endif
              <td>
                <div class="dropdown">
                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="{{route('editRequest', $item->id)}}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                  </div>
                </div>
              </td>
            </tr>
          @endforeach
        </tbody>
      @endif
    </table>
    <div class="d-flex justify-content-center mt-5">
      {!! $data->links('pagination::bootstrap-4') !!}
    </div>
  </div>
</div>
@endsection