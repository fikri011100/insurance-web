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
  <div class="card-header flex justify-between">
    <h5 >List Request Asuransi</h5>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalFilter">Filter</button>
  </div>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead>
        <tr class="text-nowrap">
          <th>No</th>
          <th>Nama Pasien</th>
          <th>Asuransi</th>
          <th>Status Pembayaran</th>
          <th>Progress</th>
          <th>Biaya</th>
          <th>
            @sortablelink('birthday','Tanggal Lahir')
          </th>
          <th>
            @sortablelink('date_medicine','Tanggal Berobat')
          </th>
          <th>Actions</th>
        </tr>
      </thead>
      @if(empty($requests))
        <h1 >No Data</h1>
      @else
        <tbody class="table-border-bottom-0">
          @php
            $nomor = 1 + (($requests->currentPage() -1 ) * $requests->perPage());
          @endphp

          @foreach ($requests as $i => $item)
            <tr class="text-nowrap">
              <td>{{ $nomor++ }}</td>
              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->request_patient}}</strong></td>
              <td>{{$item->insurance}}</td>
              @if ($item->status_payment == '0')
                <td><span class="badge bg-label-warning me-1">Belum Dibayar</span></td>
              @elseif ($item->status_payment == '1')
                <td><a href="{{asset('/storage/payment/'.$item->photo_payment)}}" target="_blank" ><span class="badge bg-label-primary me-1 ">Sudah Dibayar</span></a></td>
              @elseif ($item->status_payment == '2')
              <td><a href="{{asset('/storage/payment/'.$item->photo_payment)}}" target="_blank" ><span class="badge bg-label-success me-1 ">Lunas</span></a></td>
              @endif

              @if ($item->status == '0')
                <td><span class="badge bg-label-info me-1">Request</span></td>
              @elseif ($item->status == '1')
                <td><span class="badge bg-label-primary me-1">AR Call</span></td>
              @elseif ($item->status == '2')
                <td><span class="badge bg-label-warning me-1">Selesai</span></td>
              @elseif ($item->status == '3')
                <td><span class="badge bg-label-success me-1">Diambil</span></td>
              @endif
              <td>Rp. {{number_format($item->total_price)}}</td>
              <td>{{date('d F Y', strtotime($item->created_at))}}</td>
              <td>{{date('d F Y', strtotime($item->date_medicine))}}</td>
              <td>
                <div class="dropdown">
                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="{{route('editRequest', $item->id)}}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                    <a class="dropdown-item" href="{{route('listProgress', $item->id)}}"><i class="bx bx-card me-1"></i>Tambah Keterangan</a>
                    <a class="dropdown-item" href="{{route('convertRequestToPDF', $item->id)}}"><i class="bx bx-card me-1"></i>Print</a>
                    <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modalSend{{ $item->id }}" ><i class="bx bx-card me-1"></i>Kirim Legalisir</a>
                  </div>
                </div>
              </td>
            </tr>
          @endforeach
        </tbody>
      @endif
    </table>
    <!-- Modal -->
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
    <div class="modal fade" id="modalFilter" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <form action="{{ route('requestslist.index') }}" class="row g-3" method="get">
          <div class="modal-header">
            <h5 class="modal-title" id="modalCenterTitle">Filter Data</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="mb-3">
                <label class="form-label" for="basic-icon-default-fullname">Status</label>
                <select id="status" name="status" class="form-select">
                    <option value=""  >Semua</option>
                    <option value="0" >Request</option>
                    <option value="1" >AR Call</option>
                    <option value="2" >Selesai</option>
                    <option value="3" >Diambil</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="mb-3">
                <label class="form-label" for="basic-icon-default-fullname">Penjamin</label>
                <select id="insurance" name="insurance" class="form-select">
                    <option value=""  >Semua</option>
                    @foreach ($insurance as $items)
                      <option value="{{$items->name}}" >{{$items->name}}</option>
                    @endforeach
                </select>
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
    @foreach ($requests as $i => $item)
    <div class="modal modal-top fade" id="modalSend{{ $item->id }}" tabindex="-1">
      <div class="modal-dialog">
        <form class="modal-content" action="{{ route('sendResi') }}" method="POST" enctype="multipart/form-data">
          @csrf
          <div class="modal-header">
            <h5 class="modal-title" id="modalCenterTitle">Kirim Legalisir<h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <div class="row">
                <input type="hidden" id="id_legalisir" name="id_legalisir" value="{{$item->id}}">
                <input type="hidden" id="id_asuransi" name="id_asuransi" value="{{$item->insurance}}">
                <div class="mb-3">
                  <label class="form-label" for="basic-icon-default-phone">Nomor Resi</label>
                  <div class="input-group input-group-merge">
                    <input type="text" id="no_resi" name="no_resi" class="form-control phone-mask" placeholder="Nomor Resi" aria-label="Nomor Resi" aria-describedby="basic-icon-default-phone2" />
                  </div>
                </div>
                <div class="mb-3">
                  <label class="form-label" for="nameLarge">Alamat</label>
                    <textarea type="text" id="alamat" name="alamat" class="form-control phone-mask" placeholder="Alamat" aria-label="Alamat" aria-describedby="basic-icon-default-phone2">{{App\Models\Insurances::where('name', $item->insurance)->first()->alamat}}</textarea>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary" >Kirim</button>
          </div>
        </form>
      </div>
    </div>
    @endforeach
    <div class="d-flex justify-content-center mt-5">
      {!! $requests->links('pagination::bootstrap-4') !!}
    </div>
  </div>
</div>
@endsection