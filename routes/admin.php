<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\PublisherController;
use App\Http\Controllers\Admin\BookController;
use Illuminate\Support\Facades\Route;

Route::middleware([ 'auth'])->prefix('admin')->group(function (){

    Route::controller(CategoryController::class)->group(function (){
        Route::get('categories', 'index')->name('admin.categories.index');
        Route::get('categories/create', 'create')->name('admin.categories.create');
        Route::post('categories/create', 'store')->name('admin.categories.store');
        Route::get('categories/edit/{category}', 'edit')->name('admin.categories.edit');
        Route::put('categories/edit/{category}', 'update')->name('admin.categories.update');
        Route::delete('categories/destroy/{category}','destroy')->name('admin.categories.destroy');


    });
    Route::controller(PublisherController::class)->group(function (){
        Route::get('publishers', 'index')->name('admin.publishers.index');
        Route::get('publishers/create', 'create')->name('admin.publishers.create');
        Route::post('publishers/create', 'store')->name('admin.publishers.store');
        Route::get('publishers/edit/{publisher}', 'edit')->name('admin.publishers.edit');
        Route::put('publishers/edit/{publisher}', 'update')->name('admin.publishers.update');
        Route::delete('publishers/destroy/{publisher}','destroy')->name('admin.publishers.destroy');


    });

     Route::controller(BookController::class)->group(function (){
        Route::get('books', 'index')->name('admin.books.index');
        Route::get('books/create', 'create')->name('admin.books.create');
        Route::post('books/create', 'store')->name('admin.books.store');
        Route::get('books/edit/{book}', 'edit')->name('admin.books.edit');
        Route::put('books/edit/{book}', 'update')->name('admin.books.update');
        Route::delete('books/destroy/{book}','destroy')->name('admin.books.destroy');


    });
    

});