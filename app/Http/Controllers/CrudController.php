<?php

namespace App\Http\Controllers;
use App\Http\Requests\OfferRequest;
use App\Models\Offer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use LaravelLocalization;
use Illuminate\Http\Exceptions\PostTooLargeException;
use App\Exports\OffersExport;
use App\Imports\OffersImport;
use Maatwebsite\Excel\Facades\Excel;
class CrudController extends Controller
{
    //
    public function _construct()
    {

    }

    public function getOffers()
    {
       return Offer::select('id', 'name_'.LaravelLocalization::getCurrentLocale().' as name','details_'.LaravelLocalization::getCurrentLocale().' as details','price')->get();
      //  return Offer::select('id', 'name_ar','name_en','details_ar', 'details_en','price')->get();
    }


    public function getAllOffers()
    {
        /* $offers = Offer::select('id',
             'price',
             'photo',
             'name_' . LaravelLocalization::getCurrentLocale() . ' as name',
             'details_' . LaravelLocalization::getCurrentLocale() . ' as details'
         )->get(); // return collection of all result*/


        ##################### paginate result ####################
//        $offers = Offer::select('id',
//            'price',
//            'photo',
//            'name_ar' . LaravelLocalization::getCurrentLocale() . ' as name',
//            'details_' . LaravelLocalization::getCurrentLocale() . ' as details'
//        )->get();
//
        $offers = Offer::select('id',
            'price',
            'photo',
            'name_ar' ,
            'name_en',
            'details_ar',
            'details_en',
            'directory',
            'input',
            'output',
            'type'
        )->get();



        return view('offers.all', compact('offers'));


        //return view('offers.paginations',compact('offers'));
    }

    public function store(OfferRequest $request)
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

            $dir=$request->dir;
            $in=$request->input;
            $out=$request->output;
            $date = $request->name_en;
            $file_name = $dir.'-'.$date .'.' . $file_extension;
            if($in)  $file_name = $dir.'-'.$in.'-'.$date .'.' . $file_extension;
            if($out)  $file_name = $dir.'-'.$out.'-'.$date .'.' . $file_extension;
        $path = 'images/'.$dir;

            $request->photo->move($path, $file_name);

        }
        //insert
//        offer::create([
//            'photo' => $file_name,
//           'name_'. LaravelLocalization::getCurrentLocale()=>$request->name_. LaravelLocalization::getCurrentLocale(),
//            'price'=>$request->price,
//            'details_'. LaravelLocalization::getCurrentLocale()=>$request->details_. LaravelLocalization::getCurrentLocale(),
//
//        ]);
        offer::create([
            'photo' => $file_name,
            'name_ar'=>$request->name_ar,
            'name_en'=>$request->name_en,
            'price'=>$request->price,
            'details_ar'=>$request->details_ar,
            'details_en'=>$request->details_en,
            'directory'=>$request->dir,
            'input'=>$request->input,
            'output'=>$request->output,
            'type'=>$request->type,

        ]);

       return redirect()->back()->with(['success'=> $file_name.'-'.'تم اضافة العرض بنجاج']);
    }
    public function complexFilter(Request $request){

        $name =$request->get('search_');
        $input=$request->get('input');
        $output=$request->get('output');
        $type=$request->get('type');

        if ($name)
            $offers = Offer::where(  'directory','=',$name)->orderBy('id')->paginate(6);
           // $filters="'directory','=',".$name;
       // return $filters;
        if ($input)
            $offers = Offer::where(  'input','=',$input)->orderBy('id')->paginate(6);
          // $filters="'input'".','."'='".",".$input;
        if($output)
            $offers = Offer::where(  'output','=',$output)->orderBy('id')->paginate(6);
        if($type)
            $offers = Offer::where(  'type','=',$type)->orderBy('id')->paginate(6);
       //    $filters= "'output'".","."'='".",".$output;
        //  return $name;
      //  return $name;
     //   $offers = Offer::where(  'directory','=',$name)->orderBy('id')->paginate(6);
        return view('offers.all',['offers' => $offers]);
        $categories=Offer::get();
        $categories= collect($categories);

        $resultOfFilter = $categories->filter(function ($value, $key){

            return $value['name_en']= '23/11/2021';
        });

        $offers=array_values($resultOfFilter->all());
        return view('offers.all', compact('offers'));

    }

    public function create(){
        return view('offers.create');
    }
    public function editOffer($offer_id){
      $offer=  Offer::find($offer_id);
      if(!$offer)
      return redirect()->back();
      $offer=Offer::select ('id','name_ar','name_en','details_ar','details_en','price','photo','input','output','type')->find($offer_id);
      return view('offers.edit',compact('offer'));
//      return $offer_id;
    }
    public function UpdateOffer(OfferRequest $request, $offer_id)
    {
        $file_name ="";
        //validtion
        if ($request->photo) {
            $file_extension = $request->photo->getClientOriginalExtension();

            $dir=$request->dir;
            $in=$request->input;
            $out=$request->output;
            $date = $request->name_en;
            $file_name = $dir.'-'.$date .'.' . $file_extension;
            if($in)  $file_name = $dir.'-'.$in.'-'.$date .'.' . $file_extension;
            if($out)  $file_name = $dir.'-'.$out.'-'.$date .'.' . $file_extension;


            $path = 'images/'.$dir;
//            $path = 'images/offers';
            $request->photo->move($path, $file_name);
        }
        // chek if offer exists

        $offer = Offer::find($offer_id);
        if (!$offer)
            return redirect()->back();

        //update data

     //   $offer->update($request->all());


       $offer->update([
            'name_ar' => $request->name_ar,
            'name_en' => $request->name_en,
            'price' => $request->price,
           'details_ar' => $request->details_ar,
           'details_en' => $request->details_en,
           'photo'=>  $file_name,
           'directory'=>$request->dir,
           'input'=>$request->input,
           'output'=>$request->output,
           'type'=>$request->type,
        ]);
//
        return redirect()->back()->with(['success' => $file_name.'-'.' تم التحديث بنجاح ']);

    }
//    public function getMessages(){
//        return [
//            'name.required' =>__('messages.offer name'),
//            'price.required' =>__('messages.price required'),
//            'details.required' =>__('messages.details required'),
//            'name.unique'=>__('messages.name unique'),
//        ];
//    }
//    public function getRules(){
//        return [
//            'name' =>'required|max:100|unique:offers,name',
//            'price' =>'required|numeric',
//            'details'=>'required',
//        ];
//    }
    public function importExportView()
    {

        return view('import');
    }
//
    public function export(Request $request){

        return Excel::download(new OffersExport, 'documents.xlsx');
    }

    public function import()
    {
        Excel::import(new OffersImport,request()->file('file'));

        return redirect()->back();
    }
}