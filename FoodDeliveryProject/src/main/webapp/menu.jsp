<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="com.FoodApp.Model.Menu, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Delicious Bites - Restaurant Menu</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="menu.css">
    	 <link rel="icon" href="Images/Logo Icon.png">
  
</head>
<body>
  <header class="header">
    <h1 class="restaurant-name">Delicious Bites</h1>
    <p class="restaurant-tagline">Crafted with passion, served with love</p>
  </header>

  
    <div class="container">
    <div class="menu-container">
     <%
     ArrayList<Menu> list = (ArrayList<Menu>) session.getAttribute("menuList");
    
    
    for(Menu menu:list){
    
   
    %>
      <!-- Menu Item 1 -->
      <div class="menu-card">
        <div class="menu-image-container">
          <img class="menu-image" src="<%= menu.getImageData() %>" alt="Margherita Pizza" />
        
          
        </div>
        <div class="menu-content">
          <div class="menu-header">
            <h2 class="menu-title"><%=menu.getItemName() %></h2>
            <div class="rating"><%=menu.getRatings()%></div>
          </div>
          <p class="menu-description"><%=menu.getDescription() %></p>
          <div class="menu-footer">
            <div class="price"><%= menu.getPrice() %></div>
          </div>
          
          <form action="cart" method="post">
           <input type="hidden" name="itemId" value="<%= menu.getMenuid()%>">
           Quantity: <input type="number" name="quantity" value="1" min="1">
          
          
          <button class="add-to-cart">Add to Cart</button>
          
          
            <input type="hidden" name="action" value="add">
            </form>
          
        </div>
      </div>
      
      <%}
  
  %>
  </div>
  </div>
  

  <footer class="footer">
    <div class="container">
      <h3 class="footer-title">Visit Us Today</h3>
      <p class="footer-address">123 Gourmet Street, Food District</p>
      <p class="footer-hours">Open Daily: 11:00 AM - 11:00 PM</p>
      <p class="footer-phone">Call: +91 98765 43210</p>
    </div>
  </footer>
</body>
</html>