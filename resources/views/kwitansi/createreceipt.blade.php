@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
@livewireStyles
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

@livewireScripts
<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb breadcrumb-style1">
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Kwitansi</a>
        </li>
        <li class="breadcrumb-item active">Form</li>
      </ol>
    </nav>
</h4>

<div class="row">
<div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
        <form method="POST" action="{{ route('createReceipt') }}" enctype="multipart/form-data">
        @csrf
          <div class="mb-3"> 
            <label class="form-label" for="basic-icon-default-fullname">Nomor Kwitansi</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="no_kwitansi" name="no_kwitansi" placeholder="Nomor Kwitansi" value="{{$no_receipt}}" aria-label="Nomor MR" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">          
            <label class="form-label" for="basic-icon-default-fullname">Tanggal Kwitansi</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="date_kwitansi" name="date_kwitansi" value="{{$todayDate->format('Y-m-d')}}" />
            </div>
          </div>
          <div class="mb-3"> 
            <label class="form-label" for="basic-icon-default-fullname">Nomor MR</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="medical_record" name="medical_record" placeholder="Nomor MR" aria-label="Nomor MR" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Episode</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="episode" name="episode" placeholder="Episode" aria-label="Episode" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Nama Pasien</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="nama_pasien" name="nama_pasien" placeholder="Nama Pasien" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Discount</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="discount" name="discount" placeholder="Discount" aria-label="Discount" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Penjamin</label>
            <select id="penjamin" name="penjamin" class="form-select">
              @foreach ($insurance as $items)
                <option value="{{$items->name}}" >{{$items->name}}</option>
              @endforeach
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Biaya</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="price" name="price" placeholder="Biaya" aria-label="Biaya" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>  
          <div class="mb-3">          
          <label class="form-label" for="basic-icon-default-fullname">Tanggal Masuk Berobat</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="date_pengobatan" name="date_pengobatan" value="{{$todayDate->format('Y-m-d')}}" />
            </div>
          </div>
          <div class="mb-3">          
          <label class="form-label" for="basic-icon-default-fullname">Tanggal Keluar</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="date_keluar_pengobatan" name="date_keluar_pengobatan" value="{{$todayDate->format('Y-m-d')}}"/>
            </div>
          </div>
          <label class="form-label mt-3" for="basic-icon-default-fullname">Pilih Template Surat</label>
          <div class="form-check mt-2">
            <input class="form-check-input" type="checkbox" value="kuitansi-netto" id="checkboxKuitansiNetto" name="checkboxKuitansiNetto" />
            <label class="form-check-label" for="checkboxKuitansiNetto">
              Kuitansi / Receipt (Netto)
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="kuitansi" id="checkboxKuitansi" name="checkboxKuitansi" />
            <label class="form-check-label" for="checkboxKuitansi">
              Kuitansi / Receipt (Brutto)
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="kredit" id="checkboxKredit" name="checkboxKredit" />
            <label class="form-check-label" for="checkboxKredit">
              Nota Kredit
            </label>
          </div>
          <div class="form-check mt-2">
            <input class="form-check-input" type="checkbox" value="summary" id="checkboxSummary" name="checkboxSummary" />
            <label class="form-check-label" for="checkboxSummary">
              Summary
            </label>
          </div>
          <button type="submit" class="btn btn-primary mt-2">Send</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  var harga = document.getElementById('price');
  harga.addEventListener('keyup', function(e)
  {
      harga.value = formatRupiah(this.value, 'Rp. ');
  });

  var diskon = document.getElementById('discount');
  diskon.addEventListener('keyup', function(e)
  {
      diskon.value = formatRupiah(this.value, 'Rp. ');
  });

  function formatRupiah(angka, prefix)
  {
      var number_string = angka.replace(/[^,\d]/g, '').toString(),
          split    = number_string.split(','),
          sisa     = split[0].length % 3,
          rupiah     = split[0].substr(0, sisa),
          ribuan     = split[0].substr(sisa).match(/\d{3}/gi);
          
      if (ribuan) {
          separator = sisa ? '.' : '';
          rupiah += separator + ribuan.join('.');
      }
      
      rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
      return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
  }
</script>
@endsection