<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RequestController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth'])->name('dashboard');

//finance
Route::middleware(['auth', 'user-access:0'])->group(function () {
  
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/dashboard', [HomeController::class, 'showDashboard'])->name('showDashboard');    

    //requests
    Route::get('/requestlist', [RequestController::class, 'index'])->name('requestlist');
    Route::post('/create', [RequestController::class, 'createRequest'])->name('create-requestlist');
    Route::post('/update/{id}', [RequestController::class, 'updateDataRequest'])->name('update-requestlist');
    Route::get('/addrequest', [RequestController::class, 'addRequest'])->name('addrequest');
    Route::get('/editrequest/{id}', [RequestController::class, 'editRequest'])->name('editRequest');
    Route::get('/listprogress/{id}', [RequestController::class, 'listProgress'])->name('listProgress');

});

//cs
Route::middleware(['auth', 'user-access:1'])->group(function () {
    Route::get('/cs/home', [HomeController::class, 'csHome'])->name('home');
});

require __DIR__.'/auth.php';
