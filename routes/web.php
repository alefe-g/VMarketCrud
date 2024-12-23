<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\SupplierController;
use Illuminate\Support\Facades\Route;

Route::resource('supplier', SupplierController::class);
Route::delete('/supplier', [SupplierController::class, 'destroy']);
Route::get('/supplier/remove/confirmation', [SupplierController::class, 'confirmDelete']);

Route::resource('product', ProductController::class);
Route::delete('/product', [ProductController::class, 'destroy']);
Route::get('/product/remove/confirmation', [ProductController::class, 'confirmDelete']);