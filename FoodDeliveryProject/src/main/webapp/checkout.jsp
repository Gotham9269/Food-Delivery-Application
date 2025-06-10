<%@ page import="java.util.Map" %>
<%@ page import="com.FoodApp.Model.CartItem" %>
<%@ page import="com.FoodApp.Model.Cart" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Tap Food Delivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/boxicons/css/boxicons.min.css">
      	 <link rel="icon" href="Images/Logo Icon.png">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            color: #1a1a1a;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        .header {
            background: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            padding: 20px 0;
            margin-bottom: 30px;
            border-radius: 12px;
        }

        .header h1 {
            text-align: center;
            color: #1a1a1a;
            font-size: 28px;
            font-weight: 700;
            margin: 0;
        }

        /* Main Layout */
        .checkout-layout {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 30px;
            align-items: start;
        }

        /* Order Summary Card */
        .order-summary {
            background: white;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #e8e8e8;
            position: sticky;
            top: 20px;
        }

        .order-summary h2 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #1a1a1a;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .order-summary h2 i {
            color: #ff6b35;
            font-size: 20px;
        }

        /* Order Items */
        .order-items {
            margin-bottom: 20px;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 16px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .item-details {
            flex: 1;
            padding-right: 12px;
        }

        .item-name {
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 6px;
            font-size: 15px;
            line-height: 1.4;
        }

        .item-meta {
            font-size: 13px;
            color: #666;
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .item-price {
            font-weight: 700;
            color: #1a1a1a;
            font-size: 15px;
            text-align: right;
            min-width: 80px;
        }

        /* Bill Details */
        .bill-details {
            border-top: 2px solid #f0f0f0;
            padding-top: 16px;
        }

        .bill-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .bill-row .label {
            color: #666;
            font-weight: 400;
        }

        .bill-row .amount {
            color: #1a1a1a;
            font-weight: 500;
        }

        .bill-row.total {
            font-weight: 700;
            font-size: 16px;
            color: #1a1a1a;
            border-top: 1px solid #e8e8e8;
            padding-top: 12px;
            margin-top: 12px;
            margin-bottom: 0;
        }

        .bill-row.total .label,
        .bill-row.total .amount {
            color: #1a1a1a;
            font-weight: 700;
        }

        /* Checkout Form */
        .checkout-form {
            background: white;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #e8e8e8;
        }

        .form-section {
            margin-bottom: 32px;
        }

        .form-section:last-of-type {
            margin-bottom: 24px;
        }

        .form-section h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1a1a1a;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-section h3 i {
            color: #ff6b35;
            font-size: 18px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            color: #1a1a1a;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e8e8e8;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 400;
            background: white;
            transition: all 0.2s ease;
            color: #1a1a1a;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #ff6b35;
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
        }

        .form-group input::placeholder {
            color: #999;
        }

        /* Custom Select Styling */
        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23666' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
            padding-right: 40px;
            cursor: pointer;
        }

        /* Buttons */
        .btn {
            padding: 16px 24px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-family: inherit;
            width: 100%;
        }

        .btn-primary {
            background: #ff6b35;
            color: white;
            font-size: 16px;
            padding: 18px;
            margin-bottom: 12px;
        }

        .btn-primary:hover {
            background: #e55a2b;
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(255, 107, 53, 0.3);
        }

        .btn-secondary {
            background: white;
            color: #666;
            border: 2px solid #e8e8e8;
        }

        .btn-secondary:hover {
            border-color: #ccc;
            background: #f8f9fa;
        }

        /* Empty Cart */
        .empty-cart {
            text-align: center;
            background: white;
            border-radius: 16px;
            padding: 60px 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #e8e8e8;
        }

        .empty-cart-icon {
            font-size: 64px;
            margin-bottom: 20px;
            color: #ccc;
        }

        .empty-cart h2 {
            font-size: 24px;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 12px;
        }

        .empty-cart p {
            color: #666;
            font-size: 16px;
            margin-bottom: 24px;
        }

        /* Footer */
        footer {
            background: white;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            margin-top: 40px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            border: 1px solid #e8e8e8;
        }

        footer p {
            color: #666;
            font-size: 14px;
            margin: 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 16px;
            }

            .checkout-layout {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .order-summary {
                order: 2;
                position: static;
            }

            .checkout-form {
                order: 1;
            }

            .header h1 {
                font-size: 24px;
            }

            .form-section {
                margin-bottom: 24px;
            }

            .empty-cart {
                padding: 40px 20px;
            }

            .empty-cart-icon {
                font-size: 48px;
            }

            .order-summary {
                padding: 20px;
            }

            .item-details {
                padding-right: 8px;
            }

            .item-name {
                font-size: 14px;
            }

            .item-meta {
                font-size: 12px;
            }

            .item-price {
                font-size: 14px;
                min-width: 70px;
            }
        }

        /* Button Container */
        .button-container {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 24px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Checkout</h1>
        </div>

        <% 
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            Map<Integer, CartItem> items = cart.getItems();
            double total = 0.0;
        %>

        <% if (items.isEmpty()) { %>
            <div class="empty-cart">
                <div class="empty-cart-icon">
                    <i class='bx bx-cart'></i>
                </div>
                <h2>Your cart is empty</h2>
                <p>Add some delicious items to your cart to proceed with checkout</p>
                <a href="Menu.jsp" class="btn btn-primary">
                    <i class='bx bx-restaurant'></i>
                    Browse Menu
                </a>
            </div>
        <% } else { %>
            <div class="checkout-layout">
                <!-- Checkout Form -->
                <div class="checkout-form">
                    <form action="confirmOrder">
                        <!-- Delivery Address Section -->
                        <div class="form-section">
                            <h3>
                                <i class='bx bx-map'></i>
                                Delivery Address
                            </h3>
                            <div class="form-group">
                                <label for="address">Enter your delivery address</label>
                                <input type="text" id="address" name="address" placeholder="House/Flat no., Building, Street, Area" required>
                            </div>
                        </div>

                        <!-- Payment Method Section -->
                        <div class="form-section">
                            <h3>
                                <i class='bx bx-credit-card'></i>
                                Payment Method
                            </h3>
                            <div class="form-group">
                                <select id="paymentMethod" name="paymentMethod" required>
                                    <option value="" disabled selected>Choose payment method</option>
                                    <option value="cod">Cash on Delivery</option>
                                    <option value="upi">UPI (PhonePe, GPay, Paytm)</option>
                                    <option value="card">Credit/Debit Card</option>
                                </select>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="button-container">
                            <button type="submit" class="btn btn-primary">
                                <i class='bx bx-check-circle'></i>
                                Place Order
                            </button>
                        </div>
                    </form>

                    <form action="Cart.jsp" method="get">
                        <button type="submit" class="btn btn-secondary">
                            <i class='bx bx-arrow-back'></i>
                            Back to Cart
                        </button>
                    </form>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <h2>
                        <i class='bx bx-receipt'></i>
                        Order Summary
                    </h2>
                    
                    <div class="order-items">
                        <% 
                            for (CartItem item : items.values()) { 
                                double subtotal = item.getPrice() * item.getQuantity();
                                total += subtotal;
                        %>
                            <div class="order-item">
                                <div class="item-details">
                                    <div class="item-name"><%= item.getName() %></div>
                                    <div class="item-meta">
                                        <span>Qty: <%= item.getQuantity() %></span>
                                        <span>$<%= String.format("%.2f", item.getPrice()) %> each</span>
                                    </div>
                                </div>
                                <div class="item-price">$<%= String.format("%.2f", subtotal) %></div>
                            </div>
                        <% } %>
                    </div>

                    <div class="bill-details">
                        <div class="bill-row">
                            <span class="label">Item Total</span>
                            <span class="amount">$<%= String.format("%.2f", total) %></span>
                        </div>
                        <div class="bill-row">
                            <span class="label">Delivery Fee</span>
                            <span class="amount">$2.99</span>
                        </div>
                        <div class="bill-row">
                            <span class="label">Taxes & Charges</span>
                            <span class="amount">$<%= String.format("%.2f", total * 0.08) %></span>
                        </div>
                        <div class="bill-row total">
                            <span class="label">Total Amount</span>
                            <span class="amount">$<%= String.format("%.2f", total + 2.99 + (total * 0.08)) %></span>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>

        <footer>
            <p>&copy; 2025 Tap Online Food Delivery. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>