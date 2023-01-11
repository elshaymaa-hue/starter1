<?php

namespace App\Exports;

use App\Models\Offer;
use App\Http\Requests\OfferRequest;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Concerns\FromCollection;

class OffersExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */


    public function collection()
    {

        // return Offer::get();
        $name =request()->input('search_');
        $input=request()->input('input');
        $output=request()->input('output');
        $type=request()->input('type');
        $name_ar=request()->input('name_ar');
        $name_en=request()->input('name_en');
        $status=request()->input('status');
        $monitor_date=request()->input('monitor_date');
        // return Offer::where('input','=',$input)->orderBy('id')->get();
        if ($name)
            return Offer::where('directory','=',$name)->orderBy('created_at')->get();
       if ($input)
            return Offer::where('input','=',$input)->orderBy('id')->get();
        if($output)
            return Offer::where('output','=',$output)->orderBy('id')->get();
        if($type)
            return Offer::where('type','=',$type)->orderBy('id')->get();
        if($name_ar)
            return Offer::where('name_ar','=',$name_ar)->orderBy('id')->get();
        if($status)
            return Offer::where('status','=',$status)->orderBy('id')->get();
        if($name_en)
            return Offer::where('name_en','=',$name_en)->orderBy('id')->get();
        if($monitor_date)
            return Offer::where('monitor_date','=',$monitor_date)->orderBy('id')->get();
        elseif(request('directory')&& request('name_ar')&&!(request('subsubject'))){
             return Offer::where( 'directory',request('directory'))->where(  'name_ar',request('name_ar'))->get();
        }
        elseif(request('directory')&& request('name_ar')&&request('subsubject')){
            return Offer::where( 'directory',request('directory'))->where(  'name_ar',request('name_ar'))->where( 'subsubject',request('subsubject'))->get();
         }
        elseif(!request('directory')&& !request('name_ar')&&request('subsubject')){
                return Offer::where( 'subsubject',request('subsubject'))->get();
                            
        }
       else
       return Offer::get();

    }


}
