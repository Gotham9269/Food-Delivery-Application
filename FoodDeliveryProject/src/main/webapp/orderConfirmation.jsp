<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed - Tap Food Delivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
      	 <link rel="icon" href="Images/Logo Icon.png">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: orange;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .confirmation-container {
            text-align: center;
            padding: 40px;
        }

        .checkmark-container {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: white;
            margin: 0 auto 30px auto;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: scaleIn 0.6s ease-out;
        }

        .checkmark {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: #10b981;
            position: relative;
            animation: checkmarkBounce 0.8s ease-out 0.3s both;
        }

        .checkmark::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 35px;
            border: solid white;
            border-width: 0 4px 4px 0;
            transform: translate(-50%, -60%) rotate(45deg);
            animation: checkmarkDraw 0.4s ease-out 0.6s both;
        }

        .success-text {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 16px;
            animation: fadeInUp 0.6s ease-out 0.8s both;
        }

        .success-message {
            font-size: 18px;
            opacity: 0.9;
            margin-bottom: 40px;
            animation: fadeInUp 0.6s ease-out 1s both;
        }

        .back-button {
            display: inline-block;
            padding: 14px 28px;
            background: white;
            color: #667eea;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            animation: fadeInUp 0.6s ease-out 1.2s both;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        /* Animations */
        @keyframes scaleIn {
            0% {
                transform: scale(0);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        @keyframes checkmarkBounce {
            0% {
                transform: scale(0);
            }
            50% {
                transform: scale(1.2);
            }
            100% {
                transform: scale(1);
            }
        }

        @keyframes checkmarkDraw {
            0% {
                opacity: 0;
                transform: translate(-50%, -60%) rotate(45deg) scale(0);
            }
            100% {
                opacity: 1;
                transform: translate(-50%, -60%) rotate(45deg) scale(1);
            }
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .confirmation-container {
                padding: 20px;
            }

            .checkmark-container {
                width: 100px;
                height: 100px;
            }

            .checkmark {
                width: 50px;
                height: 50px;
            }

            .success-text {
                font-size: 28px;
            }

            .success-message {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="checkmark-container">
            <div class="checkmark"></div>
        </div>
        <h1 class="success-text">Order Confirmed!</h1>
        <p class="success-message">Thank you for your order. We'll prepare it with care.</p>
        
        <a href="RestaurantServlet" class="back-button">Continue Shopping</a>       
    </div>
</body>
</html>