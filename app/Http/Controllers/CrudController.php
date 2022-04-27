<?php

namespace App\Http\Controllers;
use App\Http\Requests\OfferRequest;
use App\Models\Offer;
use App\Models\Power_Station;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use LaravelLocalization;
use Illuminate\Http\Exceptions\PostTooLargeException;
use App\Exports\OffersExport;
use App\Imports\OffersImport;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade as PDF;
use EloquentFilter\ModelFilter;
use Illuminate\Support\Facades\DB;

class CrudController extends Controller
{
    //
    public function _construct()
    {

    }

    public function getOffers()
    {
       return Offer::select('id', 'name_'.LaravelLocalization::getCurrentLocale().' as name','details_'.LaravelLocalization::getCurrentLocale().' as details','price','reply_on','additions')->get();
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
            'type',
            'status',
            'reply_on',
            'require_monitor',
            'monitor_date',
            'additions'
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
        $additions="";
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
        if ($request->additions) {

            $file_extension1 = $request->additions->getClientOriginalExtension();
    
                $dir=$request->dir;
                $in=$request->input;
                $out=$request->output;
                $date = $request->name_en;
                $additions = $dir.'-'.$date .'.' .'a'. $file_extension1;
                if($in)  $additions = $dir.'-'.$in.'-'.$date .'.' .'a'. $file_extension1;
                if($out)  $additions = $dir.'-'.$out.'-'.$date .'.' .'a'. $file_extension1;
            $path = 'images/'.$dir;
    
                $request->additions->move($path, $additions);
    
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
            'status'=>$request->status,
            'reply_on'=>$request->reply_on,
            'require_monitor'=>$request->require_monitor,
            'monitor_date'=>$request->monitor_date            ,
            'additions'=>$additions


        ]);

       return redirect()->back()->with(['success'=> $file_name.'-'.'تم اضافة العرض بنجاج']);
    }
    public function complexFilter(Request $request){
      
        // return Offer::filter($request->all())->get();

        $name =$request->get('search_');
        $input=$request->get('input');
        $output=$request->get('output');
        $type=$request->get('type');
        $status=$request->get('status');
        $monitor=$request->get('require_monitor');
        $details=$request->get('details_ar');
       // $offers = Offer::select('*')->paginate(5);
        // $offers = $users->appends(['keyword'=>'value']);
      
        if (request()->has('search_')){
            $filter = $request->query('filter');
            if (request('search_')=="radars"){
                $offers =  Offer::where( 'directory',request('search_'))->paginate(5)
                ->appends('search_',request('search_'));
            }else{
        $offers =  Offer::where( 'directory',request('search_'))->paginate(2)
                        ->appends('search_',request('search_'));
            }
        // return view('offers.index_paging')->with('offers', $offers);
        }
        if ($input){
        $filter = $request->query('filter');
        $offers = Offer::where(  'input','=',$input)->orderBy('id')->simplepaginate(2);
        // return view('offers.index_paging')->with('offers', $offers);
    }
          // $filters="'input'".','."'='".",".$input;
        if($output){
        
        $offers = Offer::where(  'output','=',$output)->orderBy('id')->paginate(2);
        // return view('offers.index_paging')->with('offers', $offers);
        }
        if($type){
        $filter = $request->query('filter');
        $offers = Offer::where(  'type',request('type'))->paginate(2)
                        ->appends('type',request('type'));
        // return view('offers.index_paging')->with('offers', $offers)->with('filter',$filter);
        }
        if(request('monitor_date')){
            $filter = $request->query('filter');
            $offers = Offer::where(  'monitor_date',request('monitor_date'))->paginate(2)
                            ->appends('monitor_date',request('monitor_date'));
            // return view('offers.index_paging')->with('offers', $offers)->with('filter',$filter);
            }
        if(request('details_ar')){
                // $generatequery = "select * from offers where details_ar like '%$details%'";

                // $offers = Offer::select($generatequery)->paginate(2);
                // $filter = $request->query('filter');
                $offers = Offer::where('details_ar','like','%'.request('details_ar').'%')->paginate(2)
                                   ->appends('details_ar',request('details_ar'));
                // return view('offers.index_paging')->with('offers', $offers)->with('filter',$filter);
                if(!$offers){
                return redirect()->back()->with('alert','%'.request('details_ar').'%');
                }
        }
        if($status){
        $filter = $request->query('filter');
        $offers = Offer::where(  'status','=',$status)->orderBy('id')->paginate(2)
                          ->appends('status',request('status'));
        }
        return view('offers.index_paging')->with('offers', $offers);//->with('filter',$filter);
       //    $filters= "'output'".","."'='".",".$output;
        //  return $name;
      //  return $name;
     //   $offers = Offer::where(  'directory','=',$name)->orderBy('id')->paginate(6);
     //$offers=array_values($resultOfFilter->all());
        
    //  return view('offers.index_paging', ['offers' =>$offers]);
 
        // return view('offers.index_paging',compact('offers'));
        // $categories=Offer::get();
        // $categories= collect($categories);

        // $resultOfFilter = $categories->filter(function ($value, $key){

        //     return $value['name_en']= '23/11/2021';
        // });

        // $offers=array_values($resultOfFilter->all());
        // return view('offers.index_paging', compact('offers'));

    }
    public function report() {

        return view('offers.report');//

    }

    public function create(){
        return view('offers.create');
    }
    public function editOffer($offer_id){
      $offer=  Offer::find($offer_id);
      if(!$offer)
      return redirect()->back();
      $offer=Offer::select ('id','name_ar','name_en','details_ar','details_en','price','photo','input','output','type','status','reply_on', 'require_monitor', 'monitor_date','additions')->find($offer_id);
      return view('offers.edit',compact('offer'));
//      return $offer_id;
    }
    public function UpdateOffer(OfferRequest $request, $offer_id)
    {
        $file_name ="";
        $additions="";
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
        if ($request->additions) {

            $file_extension1 = $request->additions->getClientOriginalExtension();
    
                $dir=$request->dir;
                $in=$request->input;
                $out=$request->output;
                $date = $request->name_en;
                $additions = $dir.'-'.$date .'.' .'a'. $file_extension1;
                if($in)  $additions = $dir.'-'.$in.'-'.$date .'.' .'a'. $file_extension1;
                if($out)  $additions = $dir.'-'.$out.'-'.$date .'.' .'a'. $file_extension1;
            $path = 'images/'.$dir;
    
                $request->additions->move($path, $additions);
    
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
           'status'=>$request->status,
           'reply_on'=>$request->reply_on,
           'require_monitor'=>$request->require_monitor,
           'monitor_date'=>$request->monitor_date,
           'additions'=>$additions
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
    public function exportPdf() {
        $pdf = \Barryvdh\DomPDF\Facade::loadView('welcome'); // <--- load your view into theDOM wrapper;
        $path = public_path('pdf_docs/'); // <--- folder to store the pdf documents into the server;
        $fileName =  time().'.'. 'pdf' ; // <--giving the random filename,
        $pdf->save($path . '/' . $fileName);
        $generated_pdf_link = url('pdf_docs/'.$fileName);
        return response()->json($generated_pdf_link);
    }
    public function import()
    {
        Excel::import(new OffersImport,request()->file('file'));

        return redirect()->back();
    }
    public function delete($offer_id){
        $offer=  Offer::find($offer_id);

        if (!$offer){
            return redirect()->back()->with(['error'=>"المستند غير موجودة"]);
        }
        $offer->delete();
        return redirect()->back()->with(['error'=>"تم المسحح بنجاح"]);
    }
    public function index_Paging()
    {
        $perPage=5;
        
       $offers = Offer::paginate(5)->fragment('offers');

        return view('offers.index_paging')->with('offers', $offers);
    }
    
}