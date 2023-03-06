<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\ReceiptController;
use App\Http\Controllers\InsuranceController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\PriceController;
use App\Http\Livewire\ReceiptSummary;

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

Auth::routes();

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth'])->name('dashboard');

//finance
Route::middleware(['auth'])->group(function () {
  
    Route::get('/copylegalisir/home', [HomeController::class, 'index'])->name('home');
    Route::get('copylegalisir/', [HomeController::class, 'showDashboard'])->name('showDashboard');
    Route::get('/copylegalisir/profile/{id}', [HomeController::class, 'editProfile'])->name('editProfile');
    Route::post('/copylegalisir/updateprofile/{id}', [HomeController::class, 'updateProfile'])->name('updateProfile');

    //requests
    Route::resource('requestslist', 'App\Http\Controllers\RequestController');
    Route::get('/copylegalisir/requestlist', [RequestController::class, 'index'])->name('requestlist');
    Route::post('/copylegalisir/create', [RequestController::class, 'createRequest'])->name('create-requestlist');
    Route::post('/copylegalisir/update/{id}', [RequestController::class, 'updateDataRequest'])->name('update-requestlist');
    Route::get('/copylegalisir/addrequest', [RequestController::class, 'addRequest'])->name('addrequest');
    Route::get('/copylegalisir/editrequest/{id}', [RequestController::class, 'editRequest'])->name('editRequest');
    Route::get('/copylegalisir/convertrequest/{id}', [RequestController::class, 'convertRequestToPDF'])->name('convertRequestToPDF');

    //progress
    Route::get('/copylegalisir/listprogress/{id}', [RequestController::class, 'listProgress'])->name('listProgress');
    Route::get('/copylegalisir/addprogress/{id}', [RequestController::class, 'addProgress'])->name('addProgress');
    Route::post('/copylegalisir/createprogress/{id}', [RequestController::class, 'createProgress'])->name('createProgress');
    Route::get('/copylegalisir/deleteprogress/{id}', [RequestController::class, 'deleteProgress'])->name('deleteProgress');

    //kwitansi
    Route::resource('receiptslist', 'App\Http\Controllers\ReceiptController');
    Route::get('/copylegalisir/addreceipt', [ReceiptController::class, 'addReceipt'])->name('addReceipt');
    Route::post('/copylegalisir/inputreceipt', [ReceiptController::class, 'createReceipt'])->name('createReceipt');
    Route::get('/copylegalisir/receiptlist', [ReceiptController::class, 'index'])->name('receiptList');
    Route::get('/copylegalisir/editreceipt/{id}', [ReceiptController::class, 'editReceipt'])->name('editReceipt');
    Route::post('/copylegalisir/updatereceipt/{id}', [ReceiptController::class, 'updateReceipt'])->name('updateReceipt');
    Route::get('/copylegalisir/costrecap/{id}', [ReceiptController::class, 'costRecap'])->name('costRecap');
    Route::get('/copylegalisir/addsummary', function() { return view('kwitansi/createsummary'); });

    //insurance
    Route::get('/copylegalisir/addinsurance', [InsuranceController::class, 'addInsurance'])->name('addInsurance');
    Route::post('/copylegalisir/createinsurance', [InsuranceController::class, 'createInsurance'])->name('createInsurance');
    Route::get('/copylegalisir/editinsurance/{id}', [InsuranceController::class, 'editInsurance'])->name('editInsurance');
    Route::post('/copylegalisir/updateinsurance/{id}', [InsuranceController::class, 'updateInsurance'])->name('updateInsurance');
    Route::get('/copylegalisir/deleteinsurance/{id}', [InsuranceController::class, 'deleteInsurance'])->name('deleteInsurance');
    Route::get('/copylegalisir/listinsurances', [InsuranceController::class, 'index'])->name('listinsurances');

    //discount
    Route::get('/copylegalisir/adddiscount', [DiscountController::class, 'addDiscount'])->name('addDiscount');
    Route::post('/copylegalisir/creatediscount', [DiscountController::class, 'createDiscount'])->name('createDiscount');
    Route::get('/copylegalisir/getDiscount/{insurance}',[DiscountController::class, 'getDiscount'])->name('getDiscount');

    //import insurance
    Route::post('/copylegalisir/import', [HomeController::class, 'fileImport'])->name('file-import');
    Route::post('/copylegalisir/importss', [HomeController::class, 'fileExport'])->name('file-export');
    Route::get('/copylegalisir/importfile', [HomeController::class, 'fileImportExport'])->name('fileImportExport');
    //logout

    //prices
    Route::post('/copylegalisir/createprice', [PriceController::class, 'createPrice'])->name('createPrice');
    Route::get('/copylegalisir/addprice', [PriceController::class, 'addPrice'])->name('addprice');
    Route::get('/copylegalisir/listprices', [PriceController::class, 'index'])->name('listprices');

    //kirim
    Route::get('/copylegalisir/listresi', [RequestController::class, 'listResi'])->name('listresi');
    Route::post('/copylegalisir/sendresi', [RequestController::class, 'createResi'])->name('sendResi');

    Route::get('/copylegalisir/logout', [HomeController::class, 'logout'])->name('logoutHome');
});

require __DIR__.'/auth.php';
