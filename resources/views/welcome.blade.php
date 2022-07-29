@extends('layouts.app')
 
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>
 
                <div class="card-body">
                    @if(auth()->user()->user_type == 0)
                    <a href="{{route('showDashboard')}}">Finance</a>
                    @else
                    <a href="{{route('cshome')}}">CS</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection