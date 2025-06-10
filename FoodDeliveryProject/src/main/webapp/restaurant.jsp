<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.FoodApp.Model.Restaurant , java.util.*" %>    
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodieHub - Restaurant Directory</title>
  	 <link rel="stylesheet" href="restaurant.css"> 
  	 <link rel="icon" href="Images/Logo Icon.png">
  	 <style>
    a.restaurant-link {
        text-decoration: none !important;
        color: inherit !important;
    }
</style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="logo"> <img alt="" src="Images/ChatGPT Image Jun 8, 2025, 10_26_10 PM.png" width="50px" height="50px" style="position: relative; top: 12px"> FoodieHub</a>          
            <div class="search-bar">
                <input type="text" placeholder="Search for restaurants, cuisines...">
                <button class="search-btn">Search</button>
            </div>
            
            <ul class="nav-links">
                <li><a href="OrderHistory"><i class='bx bx-history'></i>Orders</a>
                <li><a href="Cart.jsp">Cart</a></li>
                <li><a href="Login.jsp">Login</a></li>
               <li><a href="registration.html">Register</a></li>
                <li><a href="UpdateProfile.jsp">Profile</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="header">
            <h1>Discover Amazing Restaurants</h1>
            <p>Order from the best restaurants in your area</p>
        </div>
		
 <div class="restaurant-grid">
    <% 
    List<Restaurant> list =(List<Restaurant>) request.getAttribute("RestaurantList"); 
    for(Restaurant restaurant: list){            	
    %>	          		
        <a href="MenuServlet?RestaurantById=<%= restaurant.getRestaurantId() %>" class="restaurant-link">
            <div class="restaurant-card">
                <img src="<%= restaurant.getImagePath() %>" alt="Pizza Palace" class="card-image">
                <div class="card-content">
                    <h3 class="restaurant-name"><%= restaurant.getName() %></h3>
                    <p class="restaurant-description"><%= restaurant.getCuisineType() %></p>
                    <div class="card-footer">
                        <div class="rating excellent">
                            <span class="star">⭐</span>
                           <%= restaurant.getRating() %>
                        </div>
                        <div class="eta"><%= restaurant.getDeliveryTime() %></div>
                    </div>
                </div>
            </div>
        </a>
    <%}
    %>
</div>
    </div>
</body>
</html>