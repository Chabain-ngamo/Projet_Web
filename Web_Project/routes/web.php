<?php

use App\Http\Controllers\ideasController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\CesiController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use Illuminate\Support\Facades\Route;

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

//WELCOME PAGE
Route::get('/', function () {
    return view('accueil');
});
Route::get('/accueil', function () {
    return view('accueil');
});

//IDEA BOX
Route::get('/boiteidée', function () {
    return view('boiteidée');
});
Route::get('/boiteidée', [ideasController::class, 'create']);
Route::post('/boiteidée', [ideasController::class, 'store']);


//SHOP
Route::get('/Boutique', function () {
    return view('Boutique');
});


//STUDENT
Route::get('/student/add', function () {
    return view('studentSignUp');
});
Route::get('/student/add', [StudentController::class, 'create']);
Route::post('/student/add', [StudentController::class, 'store']);

Route::get('/student/{id}', [StudentController::class, 'show']);

Route::get('/student/delete/{id}', [StudentController::class, 'remove']);

Route::get('/student/edit/{id}', [StudentController::class, 'edit']);
Route::post('/student/edit/{id}', [StudentController::class, 'update']);

Route::get('/student/sign', [StudentController::class, 'signIn']);
Route::post('/student/sign', [StudentController::class, 'check']);



//CESI
Route::get('/cesi/add', [CesiController::class, 'create']);
Route::post('/cesi/add', [CesiController::class, 'store']);

Route::get('/cesi/{id}', [CesiController::class, 'show']);

Route::get('/cesi/delete/{id}', [CesiController::class, 'remove']);

Route::get('/cesi/edit/{id}', [CesiController::class, 'edit']);
Route::post('/cesi/edit/{id}', [CesiController::class, 'update']);

Route::get('/cesi/sign', [CesiController::class, 'signIn']);
Route::post('/cesi/sign', [CesiController::class, 'check']);


//ACTIVITY
Route::get('/activity/add', [ActivityController::class, 'create']);
Route::post('/activity/add', [ActivityController::class, 'store']);

Route::get('/activity/{id}', [ActivityController::class, 'show']);

Route::get('/activity/delete/{id}', [ActivityController::class, 'remove']);

Route::get('/activity/edit/{id}', [ActivityController::class, 'edit']);
Route::post('/activity/edit/{id}', [ActivityController::class, 'update']);


Route::get('/product/add', [ProductController::class, 'create']);
Route::post('/product/add', [ProductController::class, 'store']);
Route::get('/boutique','ProductController@index')->name('products.index');

Route::get('/product/{id}', [ProductController::class, 'show']);

Route::get('/product/delete/{id}', [ProductController::class, 'remove']);

Route::get('/product/edit/{id}', [ProductController::class, 'edit']);
Route::post('/product/edit/{id}', [ProductController::class, 'update']);


Route::get('/category/add', [CategoryController::class, 'create']);
Route::post('/category/add', [CategoryController::class, 'store']);

Route::get('/category/{id}', [CategoryController::class, 'show']);

Route::get('/category/delete/{id}', [CategoryController::class, 'remove']);

Route::get('/category/edit/{id}', [CategoryController::class, 'edit']);
Route::post('/category/edit/{id}', [ProductController::class, 'update']);

Route::get('/cart', 'CartController@index')->name('cart.index');
Route::post('/cart/{product}', 'CartController@store')->name('cart.store');
Route::patch('/cart/{product}', 'CartController@update')->name('cart.update');
Route::delete('/cart/{product}', 'CartController@destroy')->name('cart.destroy');
Route::post('/cart/switchToSaveForLater/{product}', 'CartController@switchToSaveForLater')->name('cart.switchToSaveForLater');

Route::get('/checkout', 'CheckoutController@index')->name('checkout.index')->middleware('auth');
Route::post('/checkout', 'CheckoutController@store')->name('checkout.store');
Route::post('/paypal-checkout', 'CheckoutController@paypalCheckout')->name('checkout.paypal');