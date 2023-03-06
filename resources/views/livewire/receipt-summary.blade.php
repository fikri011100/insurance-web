
<form class="row g-3 justify-content-center" wire:submit.prevent="store" method="POST">
    <div class="mb-3"> 
        <label class="form-label" for="basic-icon-default-fullname">Nomor Kwitansi</label>
        <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="no_kwitansi" wire:model="no_kwitansi" name="no_kwitansi" placeholder="Nomor Kwitansi" value="{{$no_receipt}}" aria-label="Nomor MR" aria-describedby="basic-icon-default-fullname2" />
        </div>
    </div>
    <div class="mb-3">          
        <label class="form-label" for="basic-icon-default-fullname">Tanggal Kwitansi</label>
        <div class="col-md-5">
            <input class="form-control" type="date" id="date_kwitansi" wire:model="date_kwitansi" name="date_kwitansi" value="{{$todayDate->format('Y-m-d')}}" />
        </div>
    </div>
    <div class="mb-3"> 
        <label class="form-label" for="basic-icon-default-fullname">Nomor MR</label>
        <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="medical_record" wire:model="medical_record" name="medical_record" placeholder="Nomor MR" aria-label="Nomor MR" aria-describedby="basic-icon-default-fullname2" />
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label" for="basic-icon-default-fullname">Episode</label>
        <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="episode" wire:model="episode" name="episode" placeholder="Episode" aria-label="Episode" aria-describedby="basic-icon-default-fullname2" />
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label" for="basic-icon-default-fullname">Nama Pasien</label>
        <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="nama_pasien" wire:model="nama_pasien" name="nama_pasien" placeholder="Nama Pasien" aria-label="Nama Request" aria-describedby="basic-icon-default-fullname2" />
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label" for="basic-icon-default-fullname">Discount</label>
        <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="discount" wire:model="discount" name="discount" type-currency="IDR" placeholder="Discount" aria-label="Discount" aria-describedby="basic-icon-default-fullname2" />
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label" for="basic-icon-default-fullname">Penjamin</label>
        <select id="penjamin" wire:model="penjamin" name="penjamin"  class="form-select">
            @foreach ($insurance as $items)
            <option value="{{$items->name}}" >{{$items->name}}</option>
            @endforeach
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label" for="basic-icon-default-fullname">Biaya</label>
        <div class="input-group input-group-merge">
            <input type="text" class="form-control" id="price" wire:model="price" name="price" type-currency="IDR" placeholder="Biaya" aria-label="Biaya" aria-describedby="basic-icon-default-fullname2" />
        </div>
    </div>  
    <div class="mb-3">          
        <label class="form-label" for="basic-icon-default-fullname">Tanggal Masuk Berobat</label>
        <div class="col-md-5">
            <input class="form-control" type="date" id="date_pengobatan" wire:model="date_pengobatan" name="date_pengobatan" value="{{$todayDate->format('Y-m-d')}}" />
        </div>
    </div>
    <div class="mb-3">          
        <label class="form-label" for="basic-icon-default-fullname">Tanggal Keluar</label>
        <div class="col-md-5">
            <input class="form-control" type="date" id="date_keluar_pengobatan" wire:model="date_keluar_pengobatan" name="date_keluar_pengobatan" value="{{$todayDate->format('Y-m-d')}}"/>
        </div>
    </div>
    <div class="col-7">
        <label class="form-label" for="basic-icon-default-fullname">Keterangan</label>
        <input type="text" class="form-control" wire:model="keterangan.0" placeholder="Keterangan">
        @error('keterangan.0') <span class="text-danger error">{{ $message }}</span>@enderror
    </div>
    <div class="col-3">
        <label class="form-label" for="basic-icon-default-fullname">Harga</label>
        <input type="text" class="form-control" wire:model="prices.0" type-currency="IDR" placeholder="Harga">
        @error('prices.0') <span class="text-danger error">{{ $message }}</span>@enderror
    </div>
    <div class="col-2">
        <button class="btn btn-primary mt-4" wire:click.prevent="add({{$i}})"><i class="bi bi-plus"></i></button>
    </div>
    @foreach ($inputs as $key => $value)
    <div class="col-7">
        <label class="visually-hidden">Keterangan</label>
        <input type="text" class="form-control" wire:model="keterangan.{{$value}}" placeholder="Keterangan">
        @error('keterangan.{{$value}}') <span class="text-danger error">{{ $message }}</span>@enderror
    </div>
    <div class="col-3">
        <label class="visually-hidden">Harga</label>
        <input type="text" class="form-control" wire:model="prices.{{$value}}" type-currency="IDR" placeholder="Harga">
        @error('prices.{{$value}}') <span class="text-danger error">{{ $message }}</span>@enderror
    </div>
    <div class="col-2">
        <button class="btn btn-light mb-3" wire:click.prevent="remove({{$key}})"><i class="bi bi-x"></i></button>
    </div>
    @endforeach
    <div class="row mt-3">
        <div class="col-12 ps-0">
            <button type="button" class="btn btn-primary" wire:click.prevent="store()">Save</button>
        </div>
    </div>
</form>
<script>

  document.querySelectorAll('input[type-currency="IDR"]').forEach((element) => {
  element.addEventListener('keyup', function(e) {
  let cursorPostion = this.selectionStart;
    let value = parseInt(this.value.replace(/[^,\d]/g, ''));
    let originalLenght = this.value.length;
    if (isNaN(value)) {
      this.value = "";
    } else {
      this.value = value.toLocaleString('id-ID', {
        currency: 'IDR',
        style: 'currency',
        minimumFractionDigits: 0
      });
      cursorPostion = this.value.length - originalLenght + cursorPostion;
      this.setSelectionRange(cursorPostion, cursorPostion);
    }
  });
});
</script>