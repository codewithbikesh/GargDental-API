<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderCancelledMail;
use Illuminate\Support\Facades\Log;
use Exception;

class ProcessOrderCancel implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $landing_data;
    protected $customer_name;
    protected $customer_email;
    protected $orderNumber;
    protected $OrderMail;
    protected $remarks;

    /**
     * Create a new job instance.
     */
    public function __construct($landing_data, $customer_name, $customer_email, $orderNumber, $OrderMail, $remarks)
    {
        $this->landing_data = $landing_data;
        $this->customer_name = $customer_name;
        $this->customer_email = $customer_email;
        $this->orderNumber = $orderNumber;
        $this->OrderMail = $OrderMail;
        $this->remarks = $remarks;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {    
        try {
            $landing_data = $this->landing_data;
            $customer_name = $this->customer_name;
            $customer_email = $this->customer_email;
            $orderNumber = $this->orderNumber;
            $OrderMail = $this->OrderMail;
            $remarks = $this->remarks;
            
            Mail::to($customer_email)->send(new OrderCancelledMail($orderNumber, $remarks, $OrderMail, $customer_name, $landing_data));
                
        } catch (Exception $e) {
            Log::error('Order processing failed: ' . $e->getMessage());
            throw $e;
        }
    }
}
