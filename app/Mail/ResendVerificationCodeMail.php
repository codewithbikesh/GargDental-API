<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ResendVerificationCodeMail extends Mailable
{
    use Queueable, SerializesModels;
    
    public $email;
    public $code;
    public $landing_data;

    public function __construct($email, $code, $landing_data)
    {
        $this->email = $email;
        $this->code = $code;
        $this->landing_data = $landing_data;
    }

    public function build()
    {
        return $this->view('frontend.emails_format.resend_verification_code')
                    ->with([
                        'email' => $this->email,
                        'code' => $this->code,
                        'landing_data' => $this->landing_data
                    ])
                    ->subject('Your Verification Code');
    }
}
