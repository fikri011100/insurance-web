@extends('finance/home')

@section('title', 'Discount - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-style1">
      <li class="breadcrumb-item fw-light text-muted">
        <a href="javascript:void(0);">Discount</a>
      </li>
      <li class="breadcrumb-item active">Create</li>  
    </ol>
  </nav>
</h4>

<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-body">
      <form action="{{ route('createDiscount') }}"
        method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
          <label class="form-label" for="basic-icon-default-fullname">Penjamin</label>
          <select id="penjamin" name="penjamin" class="form-select">
            @foreach ($insurance as $items)
              <option value="{{$items->name}}" >{{$items->name}}</option>
            @endforeach
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label" for="basic-icon-default-fullname">Episode</label>
          <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="episode" name="episode"  placeholder="episode" aria-label="episode" aria-describedby="basic-icon-default-fullname2" />
          </div>
        </div>
        <div class="mb-3">
          <label class="form-label" for="basic-icon-default-fullname">Total Bill yang Dijamin</label>
          <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="total_bill" name="total_bill"  placeholder="Total Bill" aria-label="total_bill" aria-describedby="basic-icon-default-fullname2" />
          </div>
        </div>
        <label class="form-label mt-3" for="basic-icon-default-fullname">Pilih Pengecualian</label>
            <div class="form-check mt-2">
              <input class="form-check-input" type="checkbox" value="doctor" id="checkboxDoctor" name="checkboxDoctor" />
              <label class="form-check-label" for="checkboxDoctor">
                Jasa Dokter
              </label>
            </div>
            <div class="form-check mt-2">
              <input class="form-check-input" type="checkbox" value="medicine" id="checkboxMedicine" name="checkboxMedicine" />
              <label class="form-check-label" for="checkboxMedicine">
                Obat
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="implant" id="checkboxImplant" name="checkboxImplant" />
              <label class="form-check-label" for="checkboxImplant">
                Implant
              </label>
            </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Dasar Discount</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="base_discount" name="base_discount"  placeholder="Dasar Discount" aria-label="base_discount" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-icon-default-fullname">Total Discount</label>
            <div class="input-group input-group-merge">
              <input type="text" class="form-control" id="discount" name="discount"  placeholder="Discount" aria-label="discount" aria-describedby="basic-icon-default-fullname2" />
            </div>
          </div>
        <button type="submit" class="btn btn-primary">Kirim</button>
      </form>
      </div>
    </div>
  </div>
</div>
@endsection