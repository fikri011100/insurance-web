@extends('finance/home')

@section('title', 'Tables - Basic Tables')

@section('content')


<h4 class="fw-bold py-3 mb-4">
  <span class="text-muted fw-light">Request /</span>
</h4>

<!-- Basic Bootstrap Table -->
<div class="card">
  <h5 class="card-header">Progress Request Asuransi</h5>
  <div class="table-responsive text-nowrap">
    <table class="table">
      <thead>
        <tr>
          <th>Judul</th>
          <th>Detail</th>
          <th>Pembuat Laporan</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
      @foreach ($data as $item)
        <tr>
          <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>{{$item->title}}</strong></td>
          <td>{{$item->detail_progress}}</td>
          <td>{{$item->name_user}}</td>
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
<div class="absolute bottom-0 right-0 mr-8 mb-8">
    <button
            class="text-white px-4 w-auto h-12 bg-red-600 rounded-full hover:bg-red-700 active:shadow-lg mouse shadow transition ease-in duration-200 focus:outline-none">
        <svg viewBox="0 0 20 20" enable-background="new 0 0 20 20" class="w-6 h-6 inline-block mr-1">
        <path fill="#FFFFFF" d="M16,10c0,0.553-0.048,1-0.601,1H11v4.399C11,15.951,10.553,16,10,16c-0.553,0-1-0.049-1-0.601V11H4.601
                                    C4.049,11,4,10.553,4,10c0-0.553,0.049-1,0.601-1H9V4.601C9,4.048,9.447,4,10,4c0.553,0,1,0.048,1,0.601V9h4.399
                                    C15.952,9,16,9.447,16,10z"/>
        </svg>
    </button>
</div>
@endsection