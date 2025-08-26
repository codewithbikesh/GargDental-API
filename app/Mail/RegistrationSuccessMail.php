<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class RegistrationSuccessMail extends Mailable
{
    use Queueable, SerializesModels;

    public $landing_data;
    
    public function __construct($landing_data)
    {
        $this->landing_data = $landing_data;
    }

    public function build()
    {
        return $this->view('frontend.emails_format.verification_success')
                    ->with([
                        'landing_data' => $this->landing_data
                    ])
                    ->subject('Account Verification Success');
    }
}
