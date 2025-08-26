<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Received - Garg Dental Pvt. Ltd.</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 30px;
        }
        .email-container {
            background-color: #ffffff;
            max-width: 600px;
            margin: auto;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .header {
            /* background-color: #007BFF; */
            /* color: white; */
            text-align: center;
            padding: 30px 20px 20px;
        }
        .header img {
            max-width: 150px;
            margin-bottom: 10px;
        }
        .content {
            padding: 30px 20px;
            color: #333;
            line-height: 1.6;
        }
        .content h1 {
            font-size: 22px;
            color: #007BFF;
        }
        .content p {
            margin: 15px 0;
        }
        .footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #777;
        }
        .contact-info {
            margin-top: 15px;
        }
        a.website {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <!-- Header -->
        <div class="header">
            <img src="{{ $landing_data['company_logo_header'] }}" alt="Garg Dental Pvt. Ltd.">
        </div>

        <!-- Main Content -->
        <div class="content">
            <p>Hi <strong>{{ $customername }}</strong>,</p>

            <p>Your order with <strong>Garg Dental Pvt. Ltd.</strong> has been successfully received — and our team is already working to get it to you as soon as possible! 🦷✨</p>

            <p>Got any questions or special instructions? Just hit <strong>Reply</strong> — we’re always here to help.</p>

            <p>Stay tuned! We’ll update you when your order is on its way.</p>

            <p><strong>Thank you for trusting Garg Dental — your smile is our priority!</strong></p>

            <p><strong>📎 Your invoice is attached with this mail.</strong></p>

            <p style="margin-top: 30px;">— <br><strong>Team Garg Dental Pvt. Ltd.</strong></p>

            <div class="contact-info">
                <p><a class="website" href="{{ $landing_data['website_link'] }}">{{ $landing_data['website_link'] }}</a> | {{ $landing_data['primary_phone'] }}</p>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; {{ date('Y') }} Garg Dental Pvt. Ltd. All rights reserved.
        </div>
    </div>
</body>
</html>
