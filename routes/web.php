<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\ReceiptController;
use App\Http\Controllers\InsuranceController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\PriceController;

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
  
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/', [HomeController::class, 'showDashboard'])->name('showDashboard');
    Route::get('/profile/{id}', [HomeController::class, 'editProfile'])->name('editProfile');
    Route::post('updateprofile/{id}', [HomeController::class, 'updateProfile'])->name('updateProfile');

    //requests
    Route::resource('requestslist', 'App\Http\Controllers\RequestController');
    Route::get('/requestlist', [RequestController::class, 'index'])->name('requestlist');
    Route::post('/create', [RequestController::class, 'createRequest'])->name('create-requestlist');
    Route::post('/update/{id}', [RequestController::class, 'updateDataRequest'])->name('update-requestlist');
    Route::get('/addrequest', [RequestController::class, 'addRequest'])->name('addrequest');
    Route::get('/editrequest/{id}', [RequestController::class, 'editRequest'])->name('editRequest');
    Route::get('/convertrequest/{id}', [RequestController::class, 'convertRequestToPDF'])->name('convertRequestToPDF');

    Route::get('/listprogress/{id}', [RequestController::class, 'listProgress'])->name('listProgress');
    Route::get('/addprogress/{id}', [RequestController::class, 'addProgress'])->name('addProgress');
    Route::post('/createprogress/{id}', [RequestController::class, 'createProgress'])->name('createProgress');
    Route::get('/deleteprogress/{id}', [RequestController::class, 'deleteProgress'])->name('deleteProgress');

    Route::resource('receiptslist', 'App\Http\Controllers\ReceiptController');
    Route::get('/addreceipt', [ReceiptController::class, 'addReceipt'])->name('addReceipt');
    Route::post('/inputreceipt', [ReceiptController::class, 'createReceipt'])->name('createReceipt');
    Route::get('/receiptlist', [ReceiptController::class, 'index'])->name('receiptList');
    Route::get('/editreceipt/{id}', [ReceiptController::class, 'editReceipt'])->name('editReceipt');
    Route::post('/updateReceipt/{id}', [ReceiptController::class, 'updateReceipt'])->name('updateReceipt');
    Route::get('/costrecap/{id}', [ReceiptController::class, 'costRecap'])->name('costRecap');

    Route::get('/addinsurance', [InsuranceController::class, 'addInsurance'])->name('addInsurance');
    Route::post('/createinsurance', [InsuranceController::class, 'createInsurance'])->name('createInsurance');
    Route::get('/editinsurance/{id}', [InsuranceController::class, 'editInsurance'])->name('editInsurance');
    Route::post('/updateinsurance/{id}', [InsuranceController::class, 'updateInsurance'])->name('updateInsurance');
    Route::get('/deleteinsurance/{id}', [InsuranceController::class, 'deleteInsurance'])->name('deleteInsurance');
    Route::get('/listinsurances', [InsuranceController::class, 'index'])->name('listinsurances');

    //discount
    Route::get('/adddiscount', [DiscountController::class, 'addDiscount'])->name('addDiscount');
    Route::post('/creatediscount', [DiscountController::class, 'createDiscount'])->name('createDiscount');

    Route::post('/import', [HomeController::class, 'fileImport'])->name('file-import');
    Route::post('/importss', [HomeController::class, 'fileExport'])->name('file-export');
    Route::get('/importfile', [HomeController::class, 'fileImportExport'])->name('fileImportExport');
    //logout

    //prices
    Route::post('/createprice', [PriceController::class, 'createPrice'])->name('createPrice');
    Route::get('/addprice', [PriceController::class, 'addPrice'])->name('addprice');
    Route::get('/listprices', [PriceController::class, 'index'])->name('listprices');

    //kirim
    Route::get('/listresi', [RequestController::class, 'listResi'])->name('listresi');
    Route::post('/sendresi', [RequestController::class, 'createResi'])->name('sendResi');

    Route::get('/logout', [HomeController::class, 'logout'])->name('logoutHome');
});

require __DIR__.'/auth.php';
