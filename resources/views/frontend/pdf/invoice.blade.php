<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Received - Garg Dental Pvt. Ltd.</title>
    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #6366f1;
            --secondary: #64748b;
            --success: #10b981;
            --info: #06b6d4;
            --warning: #f59e0b;
            --danger: #ef4444;
            --light: #f8fafc;
            --dark: #1e293b;
            --gray: #94a3b8;
            --gray-light: #e2e8f0;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #334155;
            background-color: #f8fafc;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 100%;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--gray-light);
        }
        
        .header h1 {
            color: var(--primary);
            margin-bottom: 5px;
            font-size: 28px;
        }
        
        .header p {
            color: var(--secondary);
            margin-top: 0;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            margin-bottom: 25px;
            overflow: hidden;
        }
        
        .card-header {
            background-color: var(--primary);
            color: white;
            padding: 15px 20px;
            font-weight: 600;
            display: flex;
            align-items: center;
        }
        
        .card-header i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .card-body {
            padding: 20px;
        }
        
        .info-grid {
            display: flex;
            flex-wrap: wrap;
            /* grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); */
            gap: 20px;
            margin-bottom: 30px;
        }

        .info-grid .card {
            flex: 1;
            min-width: 300px;
        }
        
        .info-item {
            margin-bottom: 15px;
        }
        
        .info-label {
            font-weight: 600;
            color: var(--secondary);
            display: block;
            margin-bottom: 3px;
            font-size: 14px;
        }
        
        .info-value {
            color: var(--dark);
            font-size: 15px;
        }
        
        .badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            text-transform: capitalize;
        }
        
        .badge-processing {
            background-color: #fef3c7;
            color: #92400e;
        }
        
        .badge-shipped {
            background-color: #cffafe;
            color: #155e75;
        }
        
        .badge-delivered {
            background-color: #d1fae5;
            color: #065f46;
        }
        
        .badge-cancelled {
            background-color: #fee2e2;
            color: #991b1b;
        }
        
        .badge-paid {
            background-color: #d1fae5;
            color: #065f46;
        }
        
        .badge-unpaid {
            background-color: #fee2e2;
            color: #991b1b;
        }
        
        .badge-due {
            background-color: #ffedd5;
            color: #9a3412;
        }
        
        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        .table th {
            background-color: var(--primary);
            color: white;
            padding: 12px 15px;
            text-align: left;
        }
        
        .table td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--gray-light);
        }
        
        .table tr:last-child td {
            border-bottom: none;
        }
        
        .table tbody tr:hover {
            background-color: rgba(79, 70, 229, 0.05);
        }
        
        .text-right {
            text-align: right;
        }
        
        .text-center {
            text-align: center;
        }
        
        .total-row {
            font-weight: 600;
            background-color: #f1f5f9;
        }
        
        .grand-total {
            font-size: 16px;
            background-color: var(--primary);
            color: white;
        }
        
        .footer {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid var(--gray-light);
            color: var(--secondary);
            font-size: 14px;
        }
        
        @media print {
            body {
                background-color: white;
            }
            
            .card {
                box-shadow: none;
                border: 1px solid var(--gray-light);
            }
            
            .no-print {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>{{ $landing_data['company_name'] }}</h1>
            <p>Order Invoice #{{ $order->order_id }}</p>
            <p class="text-muted">Generated on: {{ now()->format('d M Y H:i:s') }}</p>
        </div>
        
        <!-- Order Summary -->
        <div class="info-grid">
            <!-- Order Information -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-shopping-cart"></i> Order Information
                </div>
                <div class="card-body">
                    <div class="info-item">
                        <span class="info-label">Order ID</span>
                        <span class="info-value">{{ $order->order_id }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Order Date</span>
                        <span class="info-value">{{ $order->created_at->format('d M Y H:i:s') }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Order Status</span>
                        <span class="info-value">
                            <span class="badge badge-{{ $order->order_status }}">
                                {{ ucfirst($order->order_status) }}
                            </span>
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Payment Status</span>
                        <span class="info-value">
                            <span class="badge badge-{{ $order->payment_status }}">
                                {{ ucfirst($order->payment_status) }}
                            </span>
                            @if ($order->orderPayment && $order->orderPayment->due_amount > 0)
                                <span class="badge badge-due ms-2">
                                    Due Remaining
                                </span>
                            @endif
                        </span>
                    </div>
                    @if($order->order_status == 'shipped')
                    <div class="info-item">
                        <span class="info-label">Tracking Number</span>
                        <span class="info-value">{{ $order->tracking_number ?? 'Not provided' }}</span>
                    </div>
                    @endif
                    @if($order->order_status == 'delivered')
                    <div class="info-item">
                        <span class="info-label">Delivery Date</span>
                        <span class="info-value">{{ $order->delivered_at ? $order->delivered_at->format('d M Y H:i:s') : 'Not recorded' }}</span>
                    </div>
                    @endif
                    @if($order->order_status == 'cancelled')
                    <div class="info-item">
                        <span class="info-label">Cancellation Reason</span>
                        <span class="info-value">{{ $order->cancellation_reason ?? 'Not specified' }}</span>
                    </div>
                    @endif
                </div>
            </div>
            
            <!-- Customer Information -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-user"></i> Customer Information
                </div>
                <div class="card-body">
                    <div class="info-item">
                        <span class="info-label">Name</span>
                        <span class="info-value">{{ $order->customer->full_name }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Email</span>
                        <span class="info-value">{{ $order->customer->email }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Phone</span>
                        <span class="info-value">{{ $order->customer->phone }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Customer Since</span>
                        <span class="info-value">{{ $order->customer->created_at->format('d M Y') }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Total Items</span>
                        <span class="info-value">{{ $order->total_items }}</span>
                    </div>
                </div>
            </div>
            
            <!-- Shipping Information -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-truck"></i> Shipping Information
                </div>
                <div class="card-body">
                    <div class="info-item">
                        <span class="info-label">Shipping Method</span>
                        <span class="info-value">{{ $order->shipping_method ?? 'Standard Shipping' }}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Address</span>
                        <span class="info-value">
                            {{ $order->deliveryInformation->address }},<br>
                            {{ $order->deliveryInformation->zone->zone_name }},<br>
                            {{ $order->deliveryInformation->city->city }},<br>
                            {{ $order->deliveryInformation->province->province_name }}
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Order Items -->
        <div class="card">
            <div class="card-header">
                <i class="fa fa-list"></i> Order Items
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th width="5%">#</th>
                            <th width="45%">Product</th>
                            <th width="10%" class="text-center">Qty</th>
                            <th width="20%" class="text-right">Unit Price</th>
                            <th width="20%" class="text-right">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($order->orderItems as $item)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>
                                <strong>{{ $item->product->product_name }}</strong>
                                @if($item->product->sku)
                                    <br><small class="text-muted">SKU: {{ $item->product->sku }}</small>
                                @endif
                            </td>
                            <td class="text-center">{{ $item->quantity }}</td>
                            <td class="text-right">Rs. {{ number_format($item->actual_price, 2) }}</td>
                            <td class="text-right">Rs. {{ number_format($item->subtotal_without_tax, 2) }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr class="total-row">
                            <td colspan="4" class="text-right">Subtotal:</td>
                            <td class="text-right">Rs. {{ number_format($order->subtotal_without_tax, 2) }}</td>
                        </tr>
                        <tr class="total-row">
                            <td colspan="4" class="text-right">Tax (13%):</td>
                            <td class="text-right">Rs. {{ number_format($order->tax, 2) }}</td>
                        </tr>
                        @if($order->discount > 0)
                        <tr class="total-row">
                            <td colspan="4" class="text-right">Discount:</td>
                            <td class="text-right">- Rs. {{ number_format($order->discount, 2) }}</td>
                        </tr>
                        @endif
                        <tr class="total-row">
                            <td colspan="4" class="text-right">Shipping Cost:</td>
                            <td class="text-right">Rs. {{ number_format($order->shipping_cost, 2) }}</td>
                        </tr>
                        <tr class="grand-total">
                            <td colspan="4" class="text-right"><strong>Total Amount:</strong></td>
                            <td class="text-right"><strong>Rs. {{ number_format($order->total_amount, 2) }}</strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        
        <div class="footer">
            Thank you for your order! If you have any questions, please contact our customer support.
        </div>
    </div>
</body>
</html>