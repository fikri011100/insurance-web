@php
$containerNav = $containerNav ?? 'container-fluid';
$navbarDetached = ($navbarDetached ?? '');

@endphp

<!-- Navbar -->
@if(isset($navbarDetached) && $navbarDetached == 'navbar-detached')
<nav class="layout-navbar {{$containerNav}} navbar navbar-expand-xl {{$navbarDetached}} align-items-center bg-navbar-theme" id="layout-navbar">
  @endif
  @if(isset($navbarDetached) && $navbarDetached == '')
  <nav class="layout-navbar navbar navbar-expand-xl align-items-center bg-navbar-theme" id="layout-navbar">
    <div class="{{$containerNav}}">
      @endif

      <!--  Brand demo (display only for navbar-full and hide on below xl) -->
      @if(isset($navbarFull))
      <div class="navbar-brand app-brand demo d-none d-xl-flex py-0 me-4">
        <a href="{{url('/')}}" class="app-brand-link gap-2">
           <img class="w-22 h-22" src="{{ url('logo-rs-premier-surabaya.png') }}" />
        </a>
      </div>
      @endif

      <!-- ! Not required for layout-without-menu -->
      @if(!isset($navbarHideToggle))
      <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0{{ isset($menuHorizontal) ? ' d-xl-none ' : '' }} {{ isset($contentNavbar) ?' d-xl-none ' : '' }}">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
          <i class="bx bx-menu bx-sm"></i>
        </a>
      </div>
      @endif

      <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <!-- Search -->
        @if(Route::is('listinsurances'))
          <form action="{{route('listinsurances')}}" method="GET">
            <div class="navbar-nav align-items-center">
              <div class="nav-item d-flex align-items-center">
                <i class="bx bx-search fs-4 lh-0"></i>
                <input type="text" name="search" class="form-control border-0 shadow-none" placeholder="Search (Nama atau Nomor VA)" aria-label="Search (Nama atau Nomor VA)">
              </div>
            </div>
          </form>
        @elseif(Route::is('requestlist'))
          <form action="{{route('requestlist')}}" method="GET">
            <div class="navbar-nav align-items-center">
              <div class="nav-item d-flex align-items-center">
                <i class="bx bx-search fs-4 lh-0"></i>
                <input type="text" name="search" class="form-control border-0 shadow-none" placeholder="Search Name" aria-label="Search...">
              </div>
            </div>
          </form>
        @elseif(Route::is('listresi'))
          <form action="{{route('listresi')}}" method="GET">
            <div class="navbar-nav align-items-center">
              <div class="nav-item d-flex align-items-center">
                <i class="bx bx-search fs-4 lh-0"></i>
                <input type="text" name="search" class="form-control border-0 shadow-none" placeholder="Search Resi" aria-label="Search...">
              </div>
            </div>
          </form>
        @elseif(Route::is('receiptList'))
          <form action="{{route('receiptList')}}" method="GET">
            <div class="navbar-nav align-items-center">
              <div class="nav-item d-flex align-items-center">
                <i class="bx bx-search fs-4 lh-0"></i>
                <input type="text" name="search" class="form-control border-0 shadow-none" placeholder="Search Kwitansi" aria-label="Search...">
              </div>
            </div>
          </form>
        @endif
        <!-- /Search -->
        <ul class="navbar-nav flex-row  ms-auto">

          <!-- User -->
          <li class="nav-item navbar-dropdown dropdown-user dropdown">
            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
              <div class="avatar avatar-online">
                <img src="{{ asset('assets/img/avatars/1.png') }}" alt class="w-px-40 h-auto rounded-circle">
              </div>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <a class="dropdown-item" href="javascript:void(0);">
                  <div class="d-flex">
                    <div class="flex-shrink-0 me-3">
                      <div class="avatar avatar-online">
                        <img src="{{ asset('assets/img/avatars/1.png') }}" alt class="w-px-40 h-auto rounded-circle">
                      </div>
                    </div>
                    <div class="flex-grow-1">
                      <span class="fw-semibold d-block">{{auth()->user()->username}}</span>
                      @php $type = ""; @endphp
                      @if (auth()->user()->user_type == "0")
                        @php $type = "Admin"; @endphp
                        <small class="text-muted">{{$type}}</small>
                      @elseif (auth()->user()->user_type == "1")
                        @php $type = "Kwitansi"; @endphp
                        <small class="text-muted">{{$type}}</small>
                      @elseif (auth()->user()->user_type == "2")
                        @php $type = "User"; @endphp
                        <small class="text-muted">{{$type}}</small>
                      @elseif (auth()->user()->user_type == "3")
                        @php $type = "CS"; @endphp
                        <small class="text-muted">{{$type}}</small>
                      @endif
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <div class="dropdown-divider"></div>
              </li>
              <li>
                <a class="dropdown-item" href="{{route('editProfile', auth()->user()->id)}}">
                  <i class="bx bx-user me-2"></i>
                  <span class="align-middle">My Profile</span>
                </a>
              </li>
              <li>
                <div class="dropdown-divider"></div>
              </li>
              <li>
                <a class="dropdown-item" href="{{ route('logoutHome') }}">
                  <i class='bx bx-power-off me-2'></i>
                  <span class="align-middle">Log Out</span>
                </a>
              </li>
            </ul>
          </li>
      </div>

      @if(!isset($navbarDetached))
    </div>
    @endif
  </nav>
  <!-- / Navbar -->
