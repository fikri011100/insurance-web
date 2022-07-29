<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\ReceiptController;

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
Route::middleware(['auth'])->group(function () {
  
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/dashboard', [HomeController::class, 'showDashboard'])->name('showDashboard');    

    //requests
    Route::get('/requestlist', [RequestController::class, 'index'])->name('requestlist');
    Route::post('/create', [RequestController::class, 'createRequest'])->name('create-requestlist');
    Route::post('/update/{id}', [RequestController::class, 'updateDataRequest'])->name('update-requestlist');
    Route::get('/addrequest', [RequestController::class, 'addRequest'])->name('addrequest');
    Route::get('/storage/payment/{id}', [RequestController::class, 'imageRequestPayment'])->name('imageRequestPayment');
    Route::get('/editrequest/{id}', [RequestController::class, 'editRequest'])->name('editRequest');
    Route::get('/convertrequest/{id}', [RequestController::class, 'convertRequestToPDF'])->name('convertRequestToPDF');

    Route::get('/listprogress/{id}', [RequestController::class, 'listProgress'])->name('listProgress');
    Route::get('/addprogress/{id}', [RequestController::class, 'addProgress'])->name('addProgress');
    Route::post('/createprogress/{id}', [RequestController::class, 'createProgress'])->name('createProgress');

    Route::get('/addreceipt', [ReceiptController::class, 'addReceipt'])->name('addReceipt');
    Route::post('/createreceipt', [ReceiptController::class, 'createReceipt'])->name('createReceipt');
    Route::get('/receiptlist', [ReceiptController::class, 'index'])->name('receiptList');
    Route::get('/editreceipt/{id}', [ReceiptController::class, 'editReceipt'])->name('editReceipt');
    Route::post('/updatereceipt/{id}', [ReceiptController::class, 'updateReceipt'])->name('updateReceipt');
    Route::get('/costrecap/{id}', [ReceiptController::class, 'costRecap'])->name('costRecap');

    Route::get('/addinsurance', [HomeController::class, 'addInsurance'])->name('addInsurance');
    Route::post('/createinsurance', [HomeController::class, 'createInsurance'])->name('createInsurance');
    Route::get('/editinsurance/{id}', [HomeController::class, 'editInsurance'])->name('editInsurance');
    Route::post('/updateinsurance/{id}', [HomeController::class, 'updateInsurance'])->name('updateInsurance');
    Route::get('/deleteinsurance/{id}', [HomeController::class, 'deleteInsurance'])->name('deleteInsurance');

    //logout
    Route::get('/logout', [HomeController::class, 'logout'])->name('logoutHome');
});

require __DIR__.'/auth.php';
