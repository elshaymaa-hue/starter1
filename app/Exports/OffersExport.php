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


        $name =request()->input('search_');
        $input=request()->input('input');
        $output=request()->input('output');
        $type=request()->input('type');

       
        // return Offer::where('input','=',$input)->orderBy('id')->get();
        if ($name)
            return Offer::where('directory','=',$name)->orderBy('created_at')->get();
        if ($input)
            return Offer::where('input','=',$input)->orderBy('id')->get();
        if($output)
            return Offer::where('output','=',$output)->orderBy('id')->get();
        if($type)
            return Offer::where('type','=',$type)->orderBy('id')->get();

        else Offer::get();

    }


}
