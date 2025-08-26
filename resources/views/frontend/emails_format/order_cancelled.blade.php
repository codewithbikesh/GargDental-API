<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Cancelled</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header img {
            max-width: 100%;
            height: auto;
        }
        .content {
            margin-bottom: 20px;
        }
        h1, h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        table th {
            background-color: #f2f2f2;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <img src="{{ $landing_data['company_logo_header'] }}" alt="{{ $landing_data['company_name'] }}">
    </div>
    
    <div class="content">
        <h1>Order Cancellation Confirmation</h1>
        <p>Dear {{ $customer_name }},</p>
        <p>We are sorry to hear that you have cancelled your order. Your order number is <strong>{{ $orderNumber }}</strong>.</p>
    
        <h2>Order Cancelled Details:</h2>
        <table>
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Final Price</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($OrderMail as $item)
                    <tr>
                        <td>{{ $item['product_name'] }}</td>
                        <td>{{ $item['quantity'] }}</td>
                        <td>{{ isset($item['unitPrice']) ? number_format($item['unitPrice'], 2) : 'N/A' }}</td>
                        <td>{{ isset($item['finalPrice']) ? number_format($item['finalPrice'], 2) : 'N/A' }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <p><b>Remarks:</b> {{ $remarks }}</p>
        <p>If you have any questions or concerns about your cancellation, please don't hesitate to reach out to our customer service team. We're here to help!</p>
    
        <p>Thank you for your time and consideration. We hope to serve you soon again in the future!</p>
    </div>
    
    <div class="footer">
        <p>Thank you for choosing {{ $landing_data['company_name'] }}.</p>
        <p>&copy; {{ date('Y') }} {{ $landing_data['company_name'] }}. All rights reserved.</p>
    </div>
</div>

</body>
</html>
