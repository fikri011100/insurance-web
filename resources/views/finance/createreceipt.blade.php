@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

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
        <form method="POST" action="{{ route('createReceipt') }}">
        @csrf
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
            <label class="form-label" for="basic-icon-default-fullname">Harga</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="price" name="price" placeholder="Harga" aria-label="Harga" aria-describedby="basic-icon-default-fullname2" />
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
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="penjamin" name="penjamin" placeholder="Penjamin" aria-label="Penjamin" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">          
          <label for="html5-date-input" class="col-md-2 col-form-label">Tanggal Berobat</label>
            <div class="col-md-5">
                <input class="form-control" type="date" id="date_pengobatan" name="date_pengobatan" />
            </div>
          </div>
          <label class="form-label mt-3" for="basic-icon-default-fullname">Pilih Template Surat</label>
            <div class="form-check mt-2">
              <input class="form-check-input" type="checkbox" value="rekapbiaya" id="checkboxRekapBiaya" name="checkboxRekapBiaya" />
              <label class="form-check-label" for="checkboxRekapBiaya">
                Rekap Biaya Pelayanan
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="kredit" id="checkboxKredit" name="checkboxKredit" />
              <label class="form-check-label" for="checkboxKredit">
                Nota Kredit
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="kuitansi" id="checkboxKuitansi" name="checkboxKuitansi" />
              <label class="form-check-label" for="checkboxKuitansi">
                Kuitansi / Receipt
              </label>
            </div>
          <button type="submit" class="btn btn-primary mt-2">Send</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection