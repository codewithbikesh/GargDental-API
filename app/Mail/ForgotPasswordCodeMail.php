<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ForgotPasswordCodeMail extends Mailable
{
    use Queueable, SerializesModels;
    
    public $code;
    public $landing_data;

    public function __construct($code, $landing_data)
    {
        $this->code = $code;
        $this->landing_data = $landing_data;
    }

    public function build()
    {
        return $this->view('frontend.emails_format.forgot_password_code')
                    ->with([
                        'code' => $this->code,
                        'landing_data' => $this->landing_data
                    ])
                    ->subject('Forgot Password Code');
    }
}
