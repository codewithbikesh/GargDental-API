<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VerificationCodeMail extends Mailable
{
    use Queueable, SerializesModels;
    
    public $customer_name;
    public $email;
    public $code;
    public $landing_data;

    public function __construct($customer_name, $email, $code, $landing_data)
    {
        $this->customer_name = $customer_name;
        $this->email = $email;
        $this->code = $code;
        $this->landing_data = $landing_data;
    }

    public function build()
    {
        return $this->view('frontend.emails_format.verification_code')
                    ->with([
                        'customer_name' => $this->customer_name,
                        'email' => $this->email,
                        'code' => $this->code,
                        'landing_data' => $this->landing_data,
                    ])
                    ->subject('Your Verification Code');
    }
}
