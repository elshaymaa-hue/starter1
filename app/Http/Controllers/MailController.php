<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Mail;

use App\Http\Requests;
use App\Http\Controllers\Controller;
class MailController extends Controller
{
    //
    public function basic_email() {
        $data = array('name'=>"Virat Gandhi");

        Mail::send(['text'=>'mail'], $data, function($message) {
            $message->to('nassrelshaymaa@gmail.com', 'test recieve')->subject
            ('Laravel Basic Testing Mail');
            $message->from('elshaymaanassar@gmail.com','test send');
        });
        echo "Basic Email Sent. Check your inbox.";
    }
    public function html_email(Request $request) {
       $name =$request->get('message');
//return $name;
        $data = array('name'=>$name);
        Mail::send('mail', $data, function($message) {
            $message->to('nassrelshaymaa@gmail.com', 'test recieve')->subject
            ('Laravel HTML Testing Mail');
            $message->from('elshaymaanassar@gmail.com','test send');
        });

    }
    public function attachment_email() {
        $data = array('name'=>"Virat Gandhi");
        Mail::send('mail', $data, function($message) {
            $message->to('nassrelshaymaa@gmail.com', 'test recieve')->subject
            ('Laravel Testing Mail with Attachment');
//            $message->attach('C:\laravel-master\laravel\public\uploads\image.png');
//            $message->attach('C:\laravel-master\laravel\public\uploads\test.txt');
            $message->from('elshaymaanassar@gmail.com','test send');
        });
        echo "Email Sent with attachment. Check your inbox.";
    }
}
