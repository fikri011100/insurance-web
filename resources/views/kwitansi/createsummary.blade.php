@extends('finance/home')

@section('title', 'Insurance - Forms')

@section('content')
<script src="../path/to/flowbite/dist/datepicker.js"></script>
<script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
@livewireStyles
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<h4 class="py-3 mb-1">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb breadcrumb-style1">
        <li class="breadcrumb-item fw-light text-muted">
          <a href="javascript:void(0);">Summary</a>
        </li>
        <li class="breadcrumb-item active">Form</li>
      </ol>
    </nav>
</h4>
<div class="row">
 <div class="col-xl">
  <div class="card mb-4">
   <div class="card-body">
    @livewire('receipt-summary')
   </div>
  </div>
 </div>
 @livewireScripts
</div>
@endsection