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
    @foreach ($menuData[0]->cs as $cs)

    {{-- adding active and open class if child is active --}}

    {{-- menu headers --}}
    @if (isset($cs->menuHeader))
    <li class="menu-header small text-uppercase">
      <span class="menu-header-text">{{ $cs->menuHeader }}</span>
    </li>

    @else

    {{-- active menu method --}}
    @php
    $activeClass = null;
    $currentRouteName = Route::currentRouteName();

    if ($currentRouteName === $cs->slug) {
    $activeClass = 'active';
    }
    elseif (isset($cs->submenu)) {
    if (gettype($cs->slug) === 'array') {
    foreach($cs->slug as $slug){
    if (str_contains($currentRouteName,$slug) and strpos($currentRouteName,$slug) === 0) {
    $activeClass = 'active open';
    }
    }
    }
    else{
    if (str_contains($currentRouteName,$cs->slug) and strpos($currentRouteName,$cs->slug) === 0) {
    $activeClass = 'active open';
    }
    }

    }
    @endphp

    {{-- main menu --}}
    <li class="menu-item {{$activeClass}}">
      <a href="{{ isset($cs->url) ? url($cs->url) : 'javascript:void(0);' }}" class="{{ isset($cs->submenu) ? 'menu-link menu-toggle' : 'menu-link' }}" @if (isset($menu->target) and !empty($cs->target)) target="_blank" @endif>
        @isset($cs->icon)
        <i class="{{ $cs->icon }}"></i>
        @endisset
        <div>{{ isset($cs->name) ? __($cs->name) : '' }}</div>
      </a>

      {{-- submenu --}}
      @isset($cs->submenu)
      @include('layouts.selection.menu.submenu',['cs' => $cs->submenu])
      @endisset
    </li>
    @endif
    @endforeach
  </ul>

</aside>
