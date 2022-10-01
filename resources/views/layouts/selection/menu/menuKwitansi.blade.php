<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">

  <!-- ! Hide app brand if navbar-full -->
  <div class="app-brand demo mt-4">
    <a href="{{url('/')}}" class="app-brand-link">
      <img class="w-22 h-22" src="{{ url('logo-rs-premier-surabaya.png') }}" />
    </a>

    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-autod-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1 mt-5">
    @foreach ($menuData[0]->kwitansi as $kwitansi)

    {{-- adding active and open class if child is active --}}

    {{-- kwitansi headers --}}
    @if (isset($kwitansi->menuHeader))
    <li class="menu-header small text-uppercase">
      <span class="menu-header-text">{{ $kwitansi->menuHeader }}</span>
    </li>

    @else

    {{-- active menu method --}}
    @php
    $activeClass = null;
    $currentRouteName = Route::currentRouteName();

    if ($currentRouteName === $kwitansi->slug) {
    $activeClass = 'active';
    }
    elseif (isset($kwitansi->submenu)) {
    if (gettype($kwitansi->slug) === 'array') {
    foreach($kwitansi->slug as $slug){
    if (str_contains($currentRouteName,$slug) and strpos($currentRouteName,$slug) === 0) {
    $activeClass = 'active open';
    }
    }
    }
    else{
    if (str_contains($currentRouteName,$kwitansi->slug) and strpos($currentRouteName,$kwitansi->slug) === 0) {
    $activeClass = 'active open';
    }
    }

    }
    @endphp

    {{-- main kwitansi --}}
    <li class="menu-item {{$activeClass}}">
      <a href="{{ isset($kwitansi->url) ? url($kwitansi->url) : 'javascript:void(0);' }}" class="{{ isset($kwitansi->submenu) ? 'menu-link menu-toggle' : 'menu-link' }}" @if (isset($menu->target) and !empty($menu->target)) target="_blank" @endif>
        @isset($kwitansi->icon)
        <i class="{{ $kwitansi->icon }}"></i>
        @endisset
        <div>{{ isset($kwitansi->name) ? __($kwitansi->name) : '' }}</div>
      </a>

      {{-- submenu --}}
      @isset($kwitansi->submenu)
      @include('layouts.selection.menu.submenu',['kwitansi' => $kwitansi->submenu])
      @endisset
    </li>
    @endif
    @endforeach
  </ul>

</aside>
