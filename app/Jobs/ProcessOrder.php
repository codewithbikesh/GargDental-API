<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\OrderItem;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderConfirmationMail;
use Illuminate\Support\Facades\Log;
use App\CentralLogics\Helpers;
use App\Models\Order;
use Exception;

class ProcessOrder implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $landing_data;
    protected $customername;
    protected $customerEmail;
    protected $orderId;

    /**
     * Create a new job instance.
     */
    public function __construct($landing_data, $customername, $customerEmail, $orderId)
    {
        $this->landing_data = $landing_data;
        $this->customername = $customername;
        $this->customerEmail = $customerEmail;
        $this->orderId = $orderId;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {    
        try {
            $landing_data = $this->landing_data;
            $customername = $this->customername;
            $orderId = $this->orderId;

            $order_pdf = Order::with('customer', 'deliveryInformation', 'orderItems.product', 'orderPayment')
                    ->where('order_id', $orderId)->first();

            Mail::to($this->customerEmail)->send(new OrderConfirmationMail($landing_data, $order_pdf, $orderId, $customername));

        } catch (Exception $e) {
            Log::error('Order processing failed: ' . $e->getMessage());
            throw $e;
        }
    }
}
