<?php

namespace App\Imports;

use App\Models\Offer;
use Maatwebsite\Excel\Concerns\ToModel;

class OffersImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Offer([
            //
           'name_ar' =>$row['name_ar'],
            'name_en' => $row['name_en'],
            'price' => $row['price'],
            'details_ar' => $row['details_ar'],
            'details_en' => $row['details_en'],
            'photo'=>  $row['photo'],
            'directory'=>$row['directory'],
            'input'=>$row['input'],
            'output'=>$row['output'],
            'type'=>$row['type'],

        ]);
    }
}
