@extends('finance/home')

@section('title', 'Tables - Basic Tables')

@section('content')


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
          <th>Nama Pasien</th>
          <th>Nomor Handphone</th>
          <th>Asuransi</th>
          <th>Status Pembayaran</th>
          <th>Status</th>
          <th>Tanggal</th>
          <th>Actions</th>
        </tr>
      </thead>
      @if(empty($requests))
        <h1 >No Data</h1>
      @else
        <tbody class="table-border-bottom-0">
          @foreach ($requests as $item)
            <tr class="text-nowrap">
              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->request_patient}}</strong></td>
              <td>{{$item->request_phone}}</td>
              <td>{{$item->insurance}}</td>
              @if ($item->status_payment == '0')
                <td><span class="badge bg-label-warning me-1">Belum Dibayar</span></td>
              @elseif ($item->status_payment == '1')
                <td><a href="" data-bs-toggle="modal" data-bs-target="#modalT" target="_blank"><span class="badge bg-label-primary me-1 ">Sudah Dibayar</span></a></td>
              @endif
              <!-- Modal -->
            <div class="modal modal-top fade" id="modalT" tabindex="-1">
              <div class="modal-dialog">
                <form class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <img src="{{ asset('/storage/payment/'.$item->photo_payment) }}" alt="">
                  </div>
                </form>
              </div>
            </div>

              @if ($item->status == '0')
                <td><span class="badge bg-label-info me-1">Belum Dibayar</span></td>
              @elseif ($item->status == '1')
                <td><span class="badge bg-label-primary me-1">Harus Diproses</span></td>
              @elseif ($item->status == '2')
                <td><span class="badge bg-label-warning me-1">Urgent</span></td>
              @elseif ($item->status == '3')
                <td><span class="badge bg-label-success me-1">Selesai</span></td>
              @endif
              <td>{{date('d-m-Y', strtotime($item->created_at))}}</td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="{{route('editRequest', $item->id)}}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                    <a class="dropdown-item" href="{{route('listProgress', $item->id)}}"><i class="bx bx-card me-1"></i>Tambah Keterangan</a>
                    <a class="dropdown-item" href="{{route('convertRequestToPDF', $item->id)}}"><i class="bx bx-card me-1"></i>Print</a>
                  </div>
                </div>
              </td>
            </tr>
          @endforeach
        </tbody>
      @endif
    </table>
    <div class="d-flex justify-content-center mt-5">
      {!! $requests->links('pagination::bootstrap-4') !!}
    </div>
  </div>
</div>
@endsection