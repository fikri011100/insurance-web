@extends('finance/home')

@section('title', 'Tables - Basic Tables')

@section('content')


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
  <h5 class="card-header">List Daftar Kwitansi</h5>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead> 
        <tr class="text-nowrap">
          <th>No Receipt</th>
          <th>Nomor MR</th>
          <th>Episode</th>
          <th>Nama Pasien</th>
          <th>Price</th>
          <th>Date</th>
          <th>Actions</th>
        </tr>
      </thead>
      @if(empty($receipt))
        <h1 >No Data</h1>
      @else
        <tbody class="table-border-bottom-0">
          @foreach ($receipt as $item)
            <tr class="text-nowrap">
              <td>{{$item->no_receipt}}</td>
              <td>{{$item->medical_record}}</td>
              <td>{{$item->episode}}</td>
              <td>{{$item->nama_pasien}}</td>
              <td>{{number_format($item->price)}}</td>
              <td>{{date('d-m-Y', strtotime($item->created_at))}}</td>
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
  </div>
</div>
@endsection