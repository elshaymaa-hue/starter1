<?php

define('PAGINATION_COUNT',3);
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
//    $data=['name'=>'Elshaymaa', 'age'=>47, 'gender'=> 'female'];
////        $data['age']=47;
////        $data['name']='Elshaymaa Nassar';
//
//
//    $obj= new \stdClass();
//    $obj->name='Elshaymaa';
//    $obj->age=47;
//    $obj->gender='female';

    return view('welcome');//
    //(['string'=>'Elshaymaa Nassar','age'=>'47']);
    //return view ('welcome',compact('obj'));

});
Route::get('/contact', function () {

    return view('contact');//

});

Route::get('/text', function () {

    return view('text');//

});
Route::get('/landing', function () {
    return view('landing');
});
Route::get('/about', function () {
    return view('about');
});

Route::get('/show-number/{id}', function ($id) {
    return $id;
})->name('a');
Route::get('/show-string/{id?}', function () {
    return'welcome';
})->name ('b');

Route::get('index','Front\UserController@getIndex');

Auth::routes(['verify' => true]);

Route::get('/home', 'HomeController@index')->name('home')->middleware('verified');
Route::get('report', function () {

    return view('report');//

});
Route::get('excel', function () {

    return view('check/page');//

});
Route::get('fillable','CrudController@getOffers');
Route::group(['prefix'=>LaravelLocalization::setLocale(),'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]],function() {
    Route::group(['prefix' => 'offers'], function () {
        Route::post('store', 'CrudController@store')->name('offers.store');
        Route::get('create', 'CrudController@create');
        Route::get('all', 'CrudController@getAllOffers');
        Route::get('filter', 'CrudController@complexFilter')->name('offers.filter');
        Route::get('edit/{offer_id}','CrudController@editOffer');
        Route::post('update/{offer_id}','CrudController@UpdateOffer')->name('offers.update');
        Route::get('export', 'CrudController@export')->name('offers.export');
        Route::get('importExportView', 'CrudController@importExportView');
        Route::post('import', 'CrudController@import')->name('offers.import');
        Route::get('exportpdf', 'CrudController@exportPDF')->name('offers.exportpdf');

    });
});


Route::get('fillable','RadarController@getRadars');
Route::group(['prefix'=>LaravelLocalization::setLocale(),'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]],function() {
    Route::group(['prefix' => 'radars'], function () {
        Route::post('store', 'RadarController@store')->name('radars.store');
        Route::get('create', 'RadarController@create');
        Route::get('all', 'RadarController@getAllRadars');
        Route::get('filter', 'RadarController@complexFilter')->name('radars.filter');
        Route::get('edit/{radar_id}','RadarController@editRadar');
        Route::post('update/{radar_id}','RadarController@UpdateRadar')->name('radars.update');

    });
});
Route::get('fillable','Power_StationController@getPower_Stations');
Route::group(['prefix'=>LaravelLocalization::setLocale(),'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]],function() {
    Route::group(['prefix' => 'power_stations'], function () {
        Route::post('store', 'Power_StationController@store')->name('power_stations.store');
        Route::get('create', 'Power_StationController@create');
        Route::get('all', 'Power_StationController@getAllPower_Stations');
        Route::get('filter', 'Power_StationController@complexFilter')->name('power_stations.filter');
        Route::get('edit/{power_station_id}','Power_StationController@editPower_Station');
        Route::post('update/{power_station_id}','Power_StationController@UpdatePower_Station')->name('power_stations.update');
        Route::get('delete/{power_station_id}','Power_StationController@delete')->name('power_stations.delete');

    });
});
Route::group (['prefix'=>'departments'],function (){
    Route::post('store','DepartmentsController@store')->name('departments.store');
    Route::get('create','DepartmentsController@create');
});
Route::group (['prefix'=>'documents'],function (){

        Route::get('create', 'DocumentsController@create');
        Route::post('store','DocumentsController@store')->name('documents.store');

});
Route::post('/emailusers/{data}', function () {
    Mail::to('nassarelshaymaa@gmail')->send(new notifyEmail());
    return 'A message has been sent to Mailtrap!';
});
Route::get('sendbasicemail','MailController@basic_email');
Route::get('sendhtmlemail','MailController@html_email')->name('mails.send');
Route::get('sendattachmentemail','MailController@attachment_email');
Route::get('send-mail','MailController@html_email');

Route::get('/index',  [App\Http\Controllers\PdfController::class, 'index']);
Route::get('/export-pdf', [App\Http\Controllers\PdfController::class, 'exportPdf']);

