<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.FoodApp.Model.OrderItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details | Tap Foods</title>
    <style>
        :root {
            --primary: #fc8019;
            --secondary: #ff6b6b;
            --dark: #2b2b2b;
            --light: #f8f8f8;
            --gray: #686b78;
            --success: #48c479;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            color: var(--dark);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background-color: white;
            box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
        }
        
        .logo img {
            height: 40px;
            margin-right: 10px;
        }
        
        .logo h1 {
            font-size: 24px;
            color: var(--primary);
            font-weight: 700;
        }
        
        .back-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
        }
        
        .back-btn:hover {
            background-color: #e67317;
            transform: translateY(-2px);
        }
        
        .back-btn i {
            margin-right: 8px;
            font-size: 18px;
        }
        
        .order-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            margin: 30px auto;
            overflow: hidden;
            max-width: 900px;
        }
        
        .order-header {
            background-color: var(--primary);
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .order-title {
            font-size: 20px;
            font-weight: 600;
        }
        
        .order-id {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .order-items {
            padding: 20px;
        }
        
        .item-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .item-table th {
            text-align: left;
            padding: 12px 15px;
            background-color: #f9f9f9;
            color: var(--gray);
            font-weight: 500;
            font-size: 14px;
            text-transform: uppercase;
        }
        
        .item-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }
        
        .item-table tr:last-child td {
            border-bottom: none;
        }
        
        .item-table tr:hover {
            background-color: #fff9f5;
        }
        
        .item-id {
            color: var(--gray);
            font-size: 14px;
        }
        
        .item-name {
            font-weight: 500;
            color: var(--dark);
        }
        
        .item-price {
            font-weight: 600;
            color: var(--dark);
        }
        
        .item-quantity {
            display: inline-block;
            background-color: #f0f0f0;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 14px;
        }
        
        .order-summary {
            background-color: #f9f9f9;
            padding: 20px;
            border-top: 1px solid #eee;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .summary-label {
            color: var(--gray);
        }
        
        .summary-value {
            font-weight: 600;
        }
        
        .total {
            font-size: 18px;
            color: var(--dark);
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px dashed #ddd;
        }
        
        .empty-state {
            text-align: center;
            padding: 50px 20px;
        }
        
        .empty-icon {
            font-size: 60px;
            color: #ddd;
            margin-bottom: 20px;
        }
        
        .empty-text {
            color: var(--gray);
            font-size: 16px;
        }
        
        .footer {
            background-color: var(--dark);
            color: white;
            padding: 20px 0;
            margin-top: 50px;
            text-align: center;
        }
        
        .copyright {
            color: #bbb;
            font-size: 14px;
        }
        
        @media (max-width: 768px) {
            .item-table th, 
            .item-table td {
                padding: 10px 8px;
                font-size: 13px;
            }
            
            .order-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .back-btn {
                padding: 8px 15px;
                font-size: 13px;
            }
        }
    </style>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" href="Images/Logo Icon.png">
</head>
<body>
    <header class="header">
        <div class="container header-content">
            <div class="logo">
                <img src="Images/Logo Icon.png" alt="Tap Foods Logo">
                <h1>Foodie Hub</h1>
            </div>
            <button class="back-btn" onclick="window.location.href='OrderHistory'">
                <i class='bx bx-arrow-back'></i> Order History
            </button>
        </div>
    </header>

    <div class="container">
        <div class="order-card">
            <%
                List<OrderItem> orderitemList = (List<OrderItem>) session.getAttribute("orderitemList");
                double total = 0;
                String orderId = "N/A";
                
                if (orderitemList != null && !orderitemList.isEmpty()) {
                    orderId = String.valueOf(orderitemList.get(0).getOrderid());
                }
            %>
            <div class="order-header">
                <div>
                    <div class="order-title">Order Details</div>
                    <div class="order-id">Order ID: #<%= orderId %></div>
                </div>
            </div>
            
            <div class="order-items">
                <table class="item-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Menu ID</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (orderitemList != null && !orderitemList.isEmpty()) {
                                for (OrderItem item : orderitemList) {
                                    total += item.getTotal_amount();
                        %>
                        <tr>
                            <td>
                                <div class="item-name">Item <%= item.getOrderitemid() %></div>
                                <div class="item-id">#<%= item.getOrderitemid() %></div>
                            </td>
                            <td><%= item.getMenuid() %></td>
                            <td>
                                <span class="item-quantity"><%= item.getQuantity() %></span>
                            </td>
                            <td class="item-price">₹<%= String.format("%.2f", item.getTotal_amount()) %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="4">
                                <div class="empty-state">
                                    <i class='bx bx-package empty-icon'></i>
                                    <div class="empty-text">No items found for this order</div>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            
            <% if (orderitemList != null && !orderitemList.isEmpty()) { %>
            <div class="order-summary">
                <div class="summary-row">
                    <span class="summary-label">Item Total</span>
                    <span class="summary-value">₹<%= String.format("%.2f", total) %></span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Delivery Fee</span>
                    <span class="summary-value">₹0.00</span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Taxes & Charges</span>
                    <span class="summary-value">₹0.00</span>
                </div>
                <div class="summary-row total">
                    <span>Total Amount</span>
                    <span>₹<%= String.format("%.2f", total) %></span>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p class="copyright">© 2025 Tap Foods. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>