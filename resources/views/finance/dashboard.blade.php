@extends('finance/home')

@section('title', 'Dashboard - Analytics')

@section('vendor-style')
<link rel="stylesheet" href="{{asset('assets/vendor/libs/apex-charts/apex-charts.css')}}">
@endsection

@section('vendor-script')
<script src="{{asset('assets/vendor/libs/apex-charts/apexcharts.js')}}"></script>
@endsection

@section('page-script')
<script src="{{asset('assets/js/dashboards-analytics.js')}}"></script>
@endsection

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

<div class="row">
  <!-- Total Revenue -->
  <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
    <div class="card">
      <div class="row row-bordered g-0">
        <div class="col-md-8">
          <h5 class="card-header m-0 me-2 pb-3">Total Request Asuransi</h5>
            {!! $chart->container() !!}

          <script src="{{ $chart->cdn() }}"></script>

          {{ $chart->script() }}
        </div>
        <div class="col-md-4">
          <h5 class="text-center mt-4">Total Pendapatan</h5>
          <div id="profileReportChart" class="ml-2 mr-2 mt-2"></div>
          <div class="text-center fw-semibold pt-3 mb-2">2021-2022</div>
          <div class="d-flex mt-3 ml-3">
            <div class="me-2">
              <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
            </div>
            <div class="d-flex flex-column">
              <small>Total Pendapatan Asuransi</small>
              <h6 class="mb-0">Rp.{{number_format($total)}}</h6>
            </div>
          </div>
          <div class="d-flex mt-3 ml-3">
            <div class="me-2">
              <span class="badge bg-label-info p-2"><i class="bx bx-check text-info"></i></span>
            </div>
            <div class="d-flex flex-column">
              <small>Total Request Asuransi</small>
              <h6 class="mb-0">{{number_format($totalRequest)}}</h6>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal modal-top fade" id="modalTop" tabindex="-1">
    <div class="modal-dialog">
      <form class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="modalTopTitle">Peringatan</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Apakah anda yakin ingin menghapus produk asuransi ini?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Batal</button>
          <a href="">
            <button type="button" class="btn btn-danger">Hapus</button>
          </a>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection
