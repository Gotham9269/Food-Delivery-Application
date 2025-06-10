package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import com.FoodApp.Model.Cart;
import com.FoodApp.Model.CartItem;
import com.FoodApp.Model.User;
import com.FoodApp.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/confirmOrder")
public class CheckoutServlet extends HttpServlet{
	  @Override
	    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession();

	        // Retrieve cart from session
	        Cart cart = (Cart) session.getAttribute("cart");
	        if (cart == null) {
	            response.sendRedirect("Cart.jsp");
	            return;
	        }

	        // Retrieve user from session
	        User user = (User) session.getAttribute("loggedInUser");
	        if (user == null) {
	            response.sendRedirect("Login.jsp");
	            return;
	        }

	        // Get parameters from form
	        String address = request.getParameter("address");
	        String paymentMethod = request.getParameter("paymentMethod");
	        double total = 0.0;
	        session.setAttribute("address",address);
	        session.setAttribute("paymentMethod",paymentMethod);
	        session.setAttribute("total",total);
	        
	        Map<Integer, CartItem> items = cart.getItems();

	        // Calculate total amount
	        for (CartItem item : items.values()) {
	            total += item.getPrice() * item.getQuantity();
	        }

	        Connection conn = null;
	        PreparedStatement orderStmt = null;
	        PreparedStatement orderItemStmt = null;
	        PreparedStatement orderHistoryStmt = null;
	        ResultSet rs = null;

	        try {
	        	conn=DBConnection.getConnection();
	            conn.setAutoCommit(false); // Disable auto-commit

	            // Insert order into database
	            String orderSql = "INSERT INTO `order_table` (restaurantid, userid, order_date, total_amount, status, payment_mode) VALUES (?, ?, NOW(), ?, 'pending', ?)";
	            orderStmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);

	            // Assuming there's only one restaurant for this order; adjust as needed
	            int restaurantId = items.values().iterator().next().getRestaurantId();

	            orderStmt.setInt(1, restaurantId);
	            orderStmt.setInt(2, user.getUser_id());
	            orderStmt.setDouble(3, total);
	            orderStmt.setString(4, paymentMethod);
	            orderStmt.executeUpdate();

	            // Get the generated order ID
	            rs = orderStmt.getGeneratedKeys();
	            int orderId = 0;
	            if (rs.next()) {
	                orderId = rs.getInt(1);
	            }

	            // Insert each cart item into the orderItem table
	            String orderItemSql = "INSERT INTO order_item (orderid, menuid, quantity, total_amount) VALUES (?, ?, ?, ?)";
	            orderItemStmt = conn.prepareStatement(orderItemSql);
	            for (CartItem item : items.values()) {
	                orderItemStmt.setInt(1, orderId);
	                orderItemStmt.setInt(2, item.getItemId()); // Use itemId instead of menuId
	                orderItemStmt.setInt(3, item.getQuantity());
	                orderItemStmt.setDouble(4, item.getPrice() * item.getQuantity());
	                orderItemStmt.executeUpdate();
	            }

	            // Insert order history into orderHistory table
	            String orderHistorySql = "INSERT INTO orderhistory (orderId, userId, orderDate, totalAmount, status) VALUES (?, ?, NOW(), ?, 'pending')";
	            orderHistoryStmt = conn.prepareStatement(orderHistorySql);
	            orderHistoryStmt.setInt(1, orderId);
	            orderHistoryStmt.setInt(2, user.getUser_id());
	            orderHistoryStmt.setDouble(3, total);
	            orderHistoryStmt.executeUpdate();

	            // Commit transaction
	            conn.commit();
	         
	            // Clear the cart and redirect to order confirmation page
	            session.setAttribute("cart", new Cart());
	            response.sendRedirect("orderConfirmation.jsp");

	        } catch (Exception e) {
	            try {
	                if (conn != null) conn.rollback(); // Rollback transaction on error
	            } catch (Exception rollbackEx) {
	                rollbackEx.printStackTrace();
	            }
	            e.printStackTrace();
	            response.sendRedirect("failure.jsp");
	        } finally {
	            // Close resources
	            try {
	                if (rs != null) rs.close();
	                if (orderStmt != null) orderStmt.close();
	                if (orderItemStmt != null) orderItemStmt.close();
	                if (orderHistoryStmt != null) orderHistoryStmt.close();
	                if (conn != null) conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	    }

}
