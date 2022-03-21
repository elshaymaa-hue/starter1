<?php

namespace App\Http\Controllers;
use App\Http\Requests\Power_StationRequest;
use App\Models\power_station;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use LaravelLocalization;
use Illuminate\Http\Exceptions\PostTooLargeException;
class Power_StationController extends Controller
{
    //
    public function _construct()
    {

    }

    public function getPower_Stations()
    {
       return Power_Station::select('id','station_name',  'UpsSttp' ,  'UpsRadar' ,  'ContractUPS' ,  'UpslInstallation',  'PreDeliveryUPS' ,  'FinalDeliveryUPS' ,  'StatusRatioRadar' ,  'StatusRatioSTTB')->get();
      //  return Power_Station::select('id', 'name_ar','name_en','details_ar', 'details_en','price')->get();
    }
    public function getAllPower_Stations()
    {
        /* $Power_Stations = Power_Station::select('id',
             'price',
             'photo',
             'name_' . LaravelLocalization::getCurrentLocale() . ' as name',
             'details_' . LaravelLocalization::getCurrentLocale() . ' as details'
         )->get(); // return collection of all result*/


        ##################### paginate result ####################
//        $Power_Stations = Power_Station::select('id',
//            'price',
//            'photo',
//            'name_ar' . LaravelLocalization::getCurrentLocale() . ' as name',
//            'details_' . LaravelLocalization::getCurrentLocale() . ' as details'
//        )->get();
//
        $power_stations = Power_Station::select('id','station_name',  'UpsSttp' ,  'UpsRadar' ,  'ContractUPS' ,  'UpslInstallation',  'PreDeliveryUPS' ,  'FinalDeliveryUPS' ,  'StatusRatioRadar' ,  'StatusRatioSTTB'
            )->get();



        return view('Power_Stations.all', compact('power_stations'));


        //return view('Power_Stations.paginations',compact('Power_Stations'));
    }

    public function store(Power_StationRequest $request)
    {
//        $rules = $request->getRules();
//        $messages= $request>getMessages();
//        //validate data before insert to database
//        $validator = Validator::make($request->all(),$rules,$messages );
//        if($validator->fails()){
////            return $validator->errors();
//            return redirect()->back()->withErrors($validator)->withInput($request->all());
//        }
        $file_name ="";
        if ($request->photo) {

        $file_extension = $request->photo->getClientOriginalExtension();
        $file_name = time() . '.' . $file_extension;
        $path = 'images/Power_Stations';
        
            return redirect()->back()->withErrors(['File size is too large']);
        
            $request->photo->move($path, $file_name);
       
        }
        //insert
//        Power_Station::create([
//            'photo' => $file_name,
//           'name_'. LaravelLocalization::getCurrentLocale()=>$request->name_. LaravelLocalization::getCurrentLocale(),
//            'price'=>$request->price,
//            'details_'. LaravelLocalization::getCurrentLocale()=>$request->details_. LaravelLocalization::getCurrentLocale(),
//
//        ]);
        Power_Station::create([
            'station_name'=>$request->station_name,  
            'UpsSttp' =>$request->UpsSttp, 
            'UpsRadar' =>$request->UpsRadar,
            'ContractUPS' =>$request->ContractUPS,
            'UpslInstallation'=>$request->UpslInstallation,
            'PreDeliveryUPS' =>$request->PreDeliveryUPS,
            'FinalDeliveryUPS' =>$request->FinalDeliveryUPS,
            'StatusRatioRadar' =>$request->StatusRatioRadar,
            'StatusRatioSTTB'=>$request->StatusRatioSTTB,
        ]);

       return redirect()->back()->with(['success'=>'تم اضافة العرض بنجاج']);
    }
    public function create(){
        return view('Power_Stations.create');
    }
    public function editPower_Station($Power_Station_id){
      $Power_Station=  Power_Station::find($Power_Station_id);
      if(!$Power_Station)
      return redirect()->back();
      $Power_Station=Power_Station::select ('id','station_name',  'UpsSttp' ,  'UpsRadar' ,  'ContractUPS' ,  'UpslInstallation',  'PreDeliveryUPS' ,  'FinalDeliveryUPS' ,  'StatusRatioRadar' ,  'StatusRatioSTTB')->find($Power_Station_id);
      return view('Power_Stations.edit',compact('Power_Station'));
//      return $Power_Station_id;
    }
    public function UpdatePower_Station(Power_StationRequest $request, $Power_Station_id)
    {
        $file_name ="";
        //validtion
        if ($request->photo) {
            $file_extension = $request->photo->getClientOriginalExtension();
            $file_name = time() . '.' . $file_extension;
            $path = 'images/Power_Stations';
            $request->photo->move($path, $file_name);
        }
        // chek if Power_Station exists

        $Power_Station = Power_Station::find($Power_Station_id);
        if (!$Power_Station)
            return redirect()->back();

        //update data

     //   $Power_Station->update($request->all());


       $Power_Station->update([
           'photo'=>$file_name,
           'station_name'=>$request->station_name,
           'UpsSttp' =>$request->UpsSttp,
           'UpsRadar' =>$request->UpsRadar,
           'ContractUPS' =>$request->ContractUPS,
           'UpslInstallation'=>$request->UpslInstallation,
           'PreDeliveryUPS' =>$request->PreDeliveryUPS,
           'FinalDeliveryUPS' =>$request->FinalDeliveryUPS,
           'StatusRatioRadar' =>$request->StatusRatioRadar,
           'StatusRatioSTTB'=>$request->StatusRatioSTTB,
       ]);
//
        return redirect()->back()->with(['success' => ' تم التحديث بنجاح ']);

    }
//    public function getMessages(){
//        return [
//            'name.required' =>__('messages.Power_Station name'),
//            'price.required' =>__('messages.price required'),
//            'details.required' =>__('messages.details required'),
//            'name.unique'=>__('messages.name unique'),
//        ];
//    }
//    public function getRules(){
//        return [
//            'name' =>'required|max:100|unique:Power_Stations,name',
//            'price' =>'required|numeric',
//            'details'=>'required',
//        ];
//    }
}