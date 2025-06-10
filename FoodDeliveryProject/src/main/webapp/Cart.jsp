<%@ page import="java.util.Map" %>
<%@ page import="com.FoodApp.Model.CartItem" %>
<%@ page import="com.FoodApp.Model.Cart" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve the cart from the session
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    Map<Integer, CartItem> items = cart.getItems();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://unpkg.com/boxicons/css/boxicons.min.css">
      	 <link rel="icon" href="Images/Logo Icon.png">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'ProximaNova', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
            background-color: #f7f7f7;
            color: #282c3f;
            line-height: 1.4;
        }

        /* Header */
        header {
            background: #ffffff;
            box-shadow: 0 2px 8px rgba(40, 44, 63, 0.07);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 80px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fc8019;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-links a {
            color: #3d4152;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: #fc8019;
        }

        /* Main Container */
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            gap: 30px;
            min-height: calc(100vh - 140px);
        }

        /* Cart Section */
        .cart-section {
            flex: 1;
        }

        .section-title {
            font-size: 24px;
            font-weight: 600;
            color: #282c3f;
            margin-bottom: 20px;
        }

        /* Empty Cart */
        .empty-cart {
            text-align: center;
            padding: 60px 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(40, 44, 63, 0.07);
        }

        .empty-cart-icon {
            width: 120px;
            height: 120px;
            margin: 0 auto 20px;
            background: #f7f7f7;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            color: #93959f;
        }

        .empty-cart h3 {
            font-size: 20px;
            color: #282c3f;
            margin-bottom: 8px;
        }

        .empty-cart p {
            color: #7e808c;
            margin-bottom: 24px;
        }

        /* Cart Items */
        .cart-items {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(40, 44, 63, 0.07);
            overflow: hidden;
        }

        .restaurant-header {
            padding: 20px;
            border-bottom: 1px solid #e9e9eb;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .restaurant-icon {
            width: 20px;
            height: 20px;
            color: #fc8019;
        }

        .restaurant-name {
            font-size: 18px;
            font-weight: 600;
            color: #282c3f;
        }

        .cart-item {
            padding: 20px;
            border-bottom: 1px solid #e9e9eb;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-info {
            flex: 1;
        }

        .item-name {
            font-size: 16px;
            font-weight: 500;
            color: #282c3f;
            margin-bottom: 4px;
        }

        .item-price {
            font-size: 14px;
            color: #7e808c;
            margin-bottom: 12px;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            border: 1px solid #d4edda;
            border-radius: 4px;
            padding: 6px;
            font-size: 14px;
        }

        .update-btn {
            background: #60b246;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
            transition: background-color 0.2s;
        }

        .update-btn:hover {
            background: #5ba143;
        }

        .remove-btn {
            background: none;
            border: none;
            color: #e23744;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: underline;
            transition: color 0.2s;
        }

        .remove-btn:hover {
            color: #d32f2f;
        }

        .item-total {
            font-size: 14px;
            font-weight: 600;
            color: #282c3f;
            margin-left: 16px;
        }

        /* Order Summary */
        .order-summary {
            width: 350px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(40, 44, 63, 0.07);
            height: fit-content;
            position: sticky;
            top: 100px;
        }

        .summary-header {
            padding: 20px;
            border-bottom: 1px solid #e9e9eb;
        }

        .summary-title {
            font-size: 18px;
            font-weight: 600;
            color: #282c3f;
        }

        .summary-content {
            padding: 20px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .summary-label {
            color: #7e808c;
        }

        .summary-value {
            color: #282c3f;
            font-weight: 500;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            padding-top: 12px;
            border-top: 1px solid #e9e9eb;
            font-size: 16px;
            font-weight: 600;
            color: #282c3f;
        }

        .checkout-btn {
            width: 100%;
            background: #60b246;
            color: white;
            border: none;
            padding: 16px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: background-color 0.2s;
            margin-left:auto;
            margin-right:auto;
        }

        .checkout-btn:hover {
            background: #5ba143;
        }

.add-more-btn {
    display: block;
    padding: 12px 24px;
    background: #fc8019;
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
    border-radius: 12px;
    margin: 16px auto;
    transition: all 0.2s ease;
    text-align: center;
    border: none;
    cursor: pointer;
    max-width: 200px;
    width: 100%;
}

.add-more-btn:hover {
    background: #e67e22;
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(252, 128, 25, 0.3);
}

.add-more-btn:active {
    transform: translateY(0);
}
		
		

        /* Browse Menu Button */
        .browse-menu-btn {
            background: #fc8019;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: background-color 0.2s;
        }

        .browse-menu-btn:hover {
            background: #e67e22;
        }

        /* Footer */
        footer {
            background: #ffffff;
            border-top: 1px solid #e9e9eb;
            padding: 20px;
            text-align: center;
            color: #7e808c;
            font-size: 14px;
            margin-top: 40px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
                padding: 16px;
                gap: 20px;
            }

            .order-summary {
                width: 100%;
                position: static;
            }

            .nav-links {
                display: none;
            }

            .header-container {
                padding: 0 16px;
                height: 60px;
            }

            .cart-item {
                flex-direction: column;
                gap: 16px;
            }

            .item-controls {
                justify-content: space-between;
                width: 100%;
            }
        }

        /* Delivery Info */
        .delivery-info {
            background: #f0f8ff;
            border: 1px solid #d4edda;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .delivery-icon {
            color: #60b246;
            font-size: 20px;
        }

        .delivery-text {
            font-size: 14px;
            color: #282c3f;
        }

        .delivery-time {
            font-weight: 600;
            color: #60b246;
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
        <a href="home.jsp" class="logo">FoodExpress</a>
        <nav class="nav-links">
            <a href="RestaurantServlet"><i class='bx bx-home'></i> Home</a>
            <a href="OrderHistory"><i class='bx bx-history'></i> Orders</a>
            <a href="UpdateProfile.jsp"><i class='bx bx-user'></i> Profile</a>
            <a href="#" onclick="return confirmLogout()"><i class='bx bx-log-out'></i> Logout</a>
        </nav>
    </div>
</header>

<div class="main-container">
    <div class="cart-section">
        <h1 class="section-title">Cart</h1>
        
        <% if (items.isEmpty()) { %>
            <div class="empty-cart">
                <div class="empty-cart-icon">
                    <i class='bx bx-cart'></i>
                </div>
                <h3>Your cart is empty</h3>
                <p>You can go to home page to view more restaurants</p>
                <form action="RestaurantServlet" style="display:inline;">
                    <button type="submit" class="browse-menu-btn">See restaurants near you</button>
                </form>
            </div>
        <% } else { %>
            <div class="cart-items">
                <div class="restaurant-header">
                    <i class='bx bx-store restaurant-icon'></i>
                    <span class="restaurant-name">Restaurant Items</span>
                </div>
                
                <% double total = 0.0;
                   for (CartItem item : items.values()) { 
                       total += item.getSubTotal(); %>
                    <div class="cart-item">
                        <div class="item-info">
                            <div class="item-name"><%= item.getName() %></div>
                            <div class="item-price">&#8377;<%= item.getPrice() %></div>
                            <div class="item-controls">
                                <form action="cart" method="post" style="display:inline-flex; align-items: center; gap: 8px;">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                    <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="quantity-input">
                                    <button type="submit" class="update-btn">Update</button>
                                </form>
                                <form action="cart" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                    <button type="submit" class="remove-btn">Remove</button>
                                </form>
                            </div>
                        </div>
                        <div class="item-total">&#8377;<%= item.getSubTotal() %></div>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>

    <% if (!items.isEmpty()) { %>
        <div class="order-summary">
            <div class="summary-header">
                <h3 class="summary-title">Bill Details</h3>
            </div>
            <div class="summary-content">
                <% double subtotal = 0.0;
                   for (CartItem item : items.values()) { 
                       subtotal += item.getSubTotal(); 
                   }
                   double deliveryFee = 40.0;
                   double taxes = subtotal * 0.05;
                   double finalTotal = subtotal + deliveryFee + taxes;
                %>
                
                <div class="summary-row">
                    <span class="summary-label">Item Total</span>
                    <span class="summary-value">&#8377;<%= subtotal %></span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Delivery Fee</span>
                    <span class="summary-value">&#8377;<%= deliveryFee %></span>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Taxes and Charges</span>
                    <span class="summary-value">&#8377;<%= String.format("%.2f", taxes) %></span>
                </div>
                
                <div class="total-row">
                    <span>TO PAY</span>
                    <span>&#8377;<%= String.format("%.2f", finalTotal) %></span>
                </div>
                <div class="delivery-info">
                    <i class='bx bx-time delivery-icon'></i>
                    <div class="delivery-text">
                        Your order will be delivered in <span class="delivery-time">30-40 mins</span>
                    </div>
                </div>
                
                <form action="checkout.jsp" method="post">
                    <button type="submit" class="checkout-btn">Proceed to Checkout</button>
                </form>
                
                <form action="menu.jsp" style="display:inline;" method="post">
                <button type="submit" class="add-more-btn">Add More</button>
            </form>
            </div>
        </div>
    <% } %>
</div>

<footer>
    <p>&copy; 2025 FoodExpress. All rights reserved.</p>
</footer>

</body>
</html>