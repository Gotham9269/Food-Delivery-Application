<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.FoodApp.Model.OrderHistory" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History | FoodieHub</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
      	 <link rel="icon" href="Images/Logo Icon.png">
    
    <style>
        :root {
            --primary: #FF6B6B;
            --secondary: #4ECDC4;
            --dark: #292F36;
            --light: #F7FFF7;
            --gray: #6C757D;
            --light-gray: #E9ECEF;
            --success: #28A745;
            --warning: #FFC107;
            --danger: #DC3545;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --radius: 12px;
        }

         {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: var(--dark);
            line-height: 1.6;
        }

        header {
            background: linear-gradient(135deg, var(--primary), var(--danger));
            color: white;
            padding: 1.5rem 0;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            text-align: center;
        }

        .header-container h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .nav-links {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            margin-top: 1rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            color: #FFE66D;
            transform: translateY(-2px);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .order-history-container {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .order-card {
            background: white;
            border-radius: var(--radius);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border-left: 4px solid var(--primary);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .order-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--primary);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px dashed var(--light-gray);
        }

        .order-id {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary);
        }

        .order-date {
            color: var(--gray);
            font-size: 0.9rem;
        }

        .order-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 0.8rem;
            color: var(--gray);
            margin-bottom: 0.2rem;
        }

        .detail-value {
            font-weight: 500;
        }

        .status-badge {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: capitalize;
        }

        .status-delivered {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }

        .status-pending {
            background-color: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }

        .status-cancelled {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }

        .order-total {
            font-size: 1.1rem;
            font-weight: 600;
            margin-top: 1rem;
            text-align: right;
        }

        .order-total span {
            color: var(--primary);
        }

        .view-details-btn {
            display: inline-block;
            background: var(--primary);
            color: white;
            padding: 0.6rem 1.5rem;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 500;
            margin-top: 1rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            float: right;
        }

        .view-details-btn:hover {
            background: var(--danger);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }

        .empty-state {
            text-align: center;
            padding: 3rem 0;
        }

        .empty-state i {
            font-size: 4rem;
            color: var(--light-gray);
            margin-bottom: 1rem;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            color: var(--gray);
            margin-bottom: 0.5rem;
        }

        .empty-state p {
            color: var(--gray);
            max-width: 500px;
            margin: 0 auto 1.5rem;
        }

        .explore-btn {
            display: inline-block;
            background: var(--primary);
            color: white;
            padding: 0.7rem 1.8rem;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .explore-btn:hover {
            background: var(--danger);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }

        footer {
            background: white;
            color: var(--gray);
            text-align: center;
            padding: 1.5rem;
            margin-top: 2rem;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
        }

        @media (max-width: 768px) {
            .order-details {
                grid-template-columns: 1fr;
            }
            
            .nav-links {
                flex-wrap: wrap;
            }
        }
    </style>
    
       <script>
        function confirmLogout() {
            if (confirm("Are you sure you want to logout?")) {
                window.location.href = "LogoutServlet";
                return true;
            }
            return false;
        }
    </script>
    
</head>
<body>
    <header>
        <div class="header-container">
            <h1>Your Order History</h1>
            <div class="nav-links">
                <a href="RestaurantServlet"><i class='bx bx-home'></i> Home</a>
                <a href="Cart.jsp"><i class='bx bx-cart'></i> Cart</a>
                <a href="UpdateProfile.jsp"><i class='bx bx-user'></i> Profile</a>
                <a href="#" onclick="return confirmLogout()"><i class='bx bx-log-out'></i> Log Out</a>
            </div>
        </div>
    </header>

    <div class="container">
        <% 
            List<OrderHistory> orderHistoryList = (List<OrderHistory>) request.getAttribute("orderHistoryList");
            if (orderHistoryList != null && !orderHistoryList.isEmpty()) {
                for (OrderHistory orderHistory : orderHistoryList) {
                    String statusClass = "";
                    if (orderHistory.getStatus().equalsIgnoreCase("delivered")) {
                        statusClass = "status-delivered";
                    } else if (orderHistory.getStatus().equalsIgnoreCase("pending")) {
                        statusClass = "status-pending";
                    } else if (orderHistory.getStatus().equalsIgnoreCase("cancelled")) {
                        statusClass = "status-cancelled";
                    }
        %>
            <div class="order-card">
                <div class="order-header">
                    <div class="order-id">Order #<%= orderHistory.getOrderId() %></div>
                    <div class="order-date"><i class='bx bx-calendar'></i> <%= orderHistory.getOrderDate() %></div>
                </div>
                
                <div class="order-details">
                    <div class="detail-item">
                        <span class="detail-label">Order History ID</span>
                        <span class="detail-value"><%= orderHistory.getOrderHistoryId() %></span>
                    </div>
                    
                    <div class="detail-item">
                        <span class="detail-label">User ID</span>
                        <span class="detail-value"><%= orderHistory.getUserId() %></span>
                    </div>
                    
                    <div class="detail-item">
                        <span class="detail-label">Status</span>
                        <span class="detail-value status-badge <%= statusClass %>"><%= orderHistory.getStatus() %></span>
                    </div>
                </div>
                
                <div class="order-total">
                    Total Amount: <span>₹<%= orderHistory.getTotalAmount() %></span>
                </div>
                
                <a href="HistoryDetails?orderId=<%= orderHistory.getOrderId() %>" class="view-details-btn">
                    View Details <i class='bx bx-chevron-right'></i>
                </a>
                <div style="clear: both;"></div>
            </div>
        <%
                }
            } else {
        %>
            <div class="empty-state">
                <i class='bx bx-package'></i>
                <h3>No Order History Available</h3>
                <p>You haven't placed any orders yet. Start exploring our delicious menu!</p>
                <a href="restaurant.jsp" class="explore-btn">Explore Restaurants</a>
            </div>
        <%
            }
        %>
    </div>

    <footer>
        <p>&copy; 2025 FoodieHub. All rights reserved.</p>
    </footer>
</body>
</html>