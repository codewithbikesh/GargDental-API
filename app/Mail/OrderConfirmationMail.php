<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Barryvdh\DomPDF\Facade\Pdf;

class OrderConfirmationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $landing_data;
    public $order_pdf;
    public $orderNumber;
    public $customername;
    
    public function __construct($landing_data, $order_pdf, $orderNumber, $customername)
    {
        $this->landing_data = $landing_data;
        $this->order_pdf = $order_pdf;
        $this->orderNumber = $orderNumber;
        $this->customername = $customername;
    }

    public function build()
    {
        $pdf = Pdf::loadView('frontend.pdf.invoice', ['order' => $this->order_pdf, 'landing_data' => $this->landing_data]);
        return $this->view('frontend.emails_format.order_confirmation')
                    ->subject('Order Confirmed - ' . $this->orderNumber . ' !. Thank You for Choosing Garg Dental')
                    ->with([
                        'landing_data' => $this->landing_data,
                        'order_pdf' => $this->order_pdf,
                        'customername' => $this->customername,
                    ])
                    ->attachData($pdf->output(), 'Invoice_' . $this->orderNumber . '.pdf', [
                        'mime' => 'application/pdf',
                    ]);
    }
}
