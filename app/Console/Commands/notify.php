<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use Illuminate\Support\Facades\Mail;
use phpDocumentor\Reflection\DocBlock\Tags\Uses;
use App\Mail\notifyEmail;
class notify extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notify:email';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'document added or modified everydays';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //
        $user=User::select('email')->get();
        $emails=User::pluck('emails')->toArray();
        $data=['title'=>'vtms','boy'=>'radar'];
        foreach ($emails as $email){
            // how to send email
            Mail::To($email)->send (new \App\Mail\notifyEmail($data));
        }
    }
}
