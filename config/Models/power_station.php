<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Power_Station extends Model
{
  
    protected $table="power_stations";
    protected $fillable=['station_name',  'UpsSttp' ,  'UpsRadar' ,  'ContractUPS' ,  'UpslInstallation',  'PreDeliveryUPS' ,  'FinalDeliveryUPS' ,  'StatusRatioRadar' ,  'LastMessage',  'Desil' ,  'ContractDesil' ,  'PreDeliveryDesil' ,  'FinalDeliveryDesil',  'ATS1Transit' ,'DeisilInstallation','StatusRatioSTTB',  'ATS2VTMS' ,  'AvrRadar' ];
    protected $hidden=[  'IsolationTransformer'  ,  'SurgeRadar' ,  'TawkitatSurgeProtect'];
    public $timestamps=false;
}
