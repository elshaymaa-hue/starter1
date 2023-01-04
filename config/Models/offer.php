<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    protected $table = "offers";
    protected $fillable = ['name_ar', 'price', 'details_ar', 'name_en', 'details_en', 'photo', 'directory', 'input', 'output', 'type', 'status','reply_on','require_monitor','monitor_date','additions','link','Requested_side','letterNo','side_type','subsubject'];
    protected $hidden = ['created_at', 'updated_at'];
    public $timestamps = false;
 //finally
}