<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderCancelledMail extends Mailable
{
    use Queueable, SerializesModels;

    public $orderNumber;
    public $remarks;
    public $OrderMail;
    public $customer_name;
    public $landing_data;
    
    public function __construct($orderNumber, $remarks, $OrderMail, $customer_name, $landing_data)
    {
        $this->orderNumber = $orderNumber;
        $this->remarks = $remarks;
        $this->OrderMail = $OrderMail;
        $this->customer_name = $customer_name;
        $this->landing_data = $landing_data;
    }

    public function build()
    {
        return $this->view('frontend.emails_format.order_cancelled')
                    ->subject('Cancellation of Order - ' . $this->orderNumber)
                    ->with([
                        'remarks' => $this->remarks,
                        'OrderMail' => $this->OrderMail,
                        'customer_name' => $this->customer_name,
                        'landing_data' => $this->landing_data
                    ]);
    }
}
