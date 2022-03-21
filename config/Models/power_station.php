<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Power_Station extends Model
{
  
    protected $table="Power_Station";
    protected $fillable=['station_name',  'UpsSttp' ,  'UpsRadar' ,  'ContractUPS' ,  'UpslInstallation',  'PreDeliveryUPS' ,  'FinalDeliveryUPS' ,  'StatusRatioRadar' ,  'StatusRatioSTTB' ];
    protected $hidden=['LastMessage',  'Desil' ,'DeisilInstallation',  'ContractDesil' ,  'PreDeliveryDesil' ,  'FinalDeliveryDesil',  'ATS1Transit' ,  'IsolationTransformer' ,  'ATS2VTMS' ,  'AvrRadar' ,  'SurgeRadar' ,  'TawkitatSurgeProtect' ,];
    public $timestamps=false;
}
