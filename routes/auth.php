<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\VerifyEmailController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function () {
    Route::get('/copylegalisir/register', [RegisteredUserController::class, 'create'])
                ->name('register');

    Route::post('/copylegalisir/register', [RegisteredUserController::class, 'store']);

    Route::get('/copylegalisir/login', [AuthenticatedSessionController::class, 'create'])
                ->name('login');

    Route::get('/copylegalisir/loginkwitansi', [AuthenticatedSessionController::class, 'createKwitansi'])
                ->name('loginkwitansi');

    Route::post('/copylegalisir/login', [AuthenticatedSessionController::class, 'store']);

    Route::get('/copylegalisir/forgot-password', [PasswordResetLinkController::class, 'create'])
                ->name('password.request');

    Route::post('/copylegalisir/forgot-password', [PasswordResetLinkController::class, 'store'])
                ->name('password.email');

    Route::get('/copylegalisir/reset-password/{token}', [NewPasswordController::class, 'create'])
                ->name('password.reset');

    Route::post('/copylegalisir/reset-password', [NewPasswordController::class, 'store'])
                ->name('password.update');
});

Route::middleware('auth')->group(function () {
    Route::get('copylegalisir/verify-email', [EmailVerificationPromptController::class, '__invoke'])
                ->name('verification.notice');

    Route::get('copylegalisir/verify-email/{id}/{hash}', [VerifyEmailController::class, '__invoke'])
                ->middleware(['signed', 'throttle:6,1'])
                ->name('verification.verify');

    Route::post('copylegalisir/email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
                ->middleware('throttle:6,1')
                ->name('verification.send');

    Route::get('copylegalisir/confirm-password', [ConfirmablePasswordController::class, 'show'])
                ->name('password.confirm');

    Route::post('copylegalisir/confirm-password', [ConfirmablePasswordController::class, 'store']);

    Route::post('copylegalisir/logout', [AuthenticatedSessionController::class, 'destroy'])
                ->name('logout');
});
