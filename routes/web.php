<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\BookFrontController;
use App\Http\Controllers\CategoryFrontController;
use App\Http\Controllers\ProfileController;
use App\Models\Category;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::controller(DashboardController::class)->middleware('auth')->group(function () {
    Route::get('dashboard', 'index')->name('dashboard');
});

Route::controller(BookFrontController::class)->middleware(['web','auth','role:member'])->group(function () {
    Route::get('books', 'index')->name('front.books.index');
    Route::get('books/{book:slug}', 'show')->name('front.books.show');
});

Route::controller(CategoryFrontController::class)->middleware(['web','auth','role:member'])->group(function () {
    Route::get('categories', 'index')->name('front.categories.index');
    Route::get('categories/{category:slug}', 'show')->name('front.categories.show');
});

Route::get('testing', fn () => inertia('Testing'));

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

require __DIR__.'/admin.php';
