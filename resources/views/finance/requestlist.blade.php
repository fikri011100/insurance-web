@extends('finance/home')

@section('title', 'Tables - Basic Tables')

@section('content')


<h4 class="fw-bold py-3 mb-4">
  <span class="text-muted fw-light">Request /</span>
</h4>

<!-- Basic Bootstrap Table -->
<div class="card">
  <h5 class="card-header">List Request Asuransi</h5>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead>
        <tr>
          <th>Nama Pasien</th>
          <th>Nomor Handphone</th>
          <th>Asuransi</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
      @foreach ($requests as $item)
        <tr>
          <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->request_patient}}</strong></td>
          <td>{{$item->request_phone}}</td>
          <td>{{$item->insurance}}</td>
          @if ($item->status == '0')
            <td><span class="badge bg-label-info me-1">Belum Dibayar</span></td>
          @elseif ($item->status == '1')
            <td><span class="badge bg-label-primary me-1">Harus Diproses</span></td>
          @elseif ($item->status == '2')
            <td><span class="badge bg-label-warning me-1">Urgent</span></td>
          @elseif ($item->status == '3')
            <td><span class="badge bg-label-success me-1">Selesai</span></td>
          @endif
          <td>
            <div class="dropdown">
              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="{{route('editRequest', $item->id)}}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                <a class="dropdown-item" href="{{route('listProgress', $item->id)}}"><i class="bx bx-card me-1"></i>Tambah Keterangan</a>
              </div>
            </div>
          </td>
        </tr>
      @endforeach
      </tbody>
    </table>
  </div>
</div>
@endsection