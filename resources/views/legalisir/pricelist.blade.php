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
          <a href="javascript:void(0);">Harga</a>
        </li>
        <li class="breadcrumb-item active">Data</li>
      </ol>
    </nav>
</h4>


<!-- Basic Bootstrap Table -->
<div class="card">
  <div class="card-header flex justify-between">
    <h5 >List Request Asuransi</h5>
  </div>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead>
        <tr class="text-nowrap">
          <th>No</th>
          <th>Harga Legalisir</th>
          <th>Pengubah Harga</th>
          <th>Tanggal diubah</th>
          <th>Status</th>
        </tr>
      </thead>
      @if(empty($price))
        <h3 >No Data</h3>
      @else
        <tbody class="table-border-bottom-0">
          @php
            $nomor = 1 + (($price->currentPage() -1 ) * $price->perPage());
          @endphp

          @foreach ($price as $i => $item)
            @if ($item->status == 0) 
              <tr class="table-dark">
                <td>{{ $nomor++ }}</td>
                  <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>Rp. {{number_format($item->legalisir_price)}}</strong></td>
                  <td>{{ App\Models\User::find($item->user_id)->username }}</td>
                  <td>{{date('d F Y', strtotime($item->created_at))}}</td>
                  @if ($item->status == '0')
                    <td><span class="badge bg-label-primary me-1">Aktif</span></td>
                  @elseif ($item->status == '1')
                    <td><span class="badge bg-label-warning me-1 ">Nonaktif</span></a></td>
                  @endif
              </tr>
            @else
              <tr class="table-active">
                <td>{{ $nomor++ }}</td>
                <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>Rp. {{number_format($item->legalisir_price)}}</strong></td>
                <td>{{ App\Models\User::find($item->user_id)->username }}</td>
                <td>{{date('d F Y', strtotime($item->created_at))}}</td>
                @if ($item->status == '0')
                  <td><span class="badge bg-label-primary me-1">Aktif</span></td>
                @elseif ($item->status == '1')
                  <td><span class="badge bg-label-warning me-1 ">Nonaktif</span></a></td>
                @endif
              </tr>
            @endif
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
  </div>
</div>
<div class="buy-now">
    <a href="{{route('addprice')}}" class="btn btn-danger btn-buy-now">Ubah Harga Legalisir</a>
  </div>
@endsection