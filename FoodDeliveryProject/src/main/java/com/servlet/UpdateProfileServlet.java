package com.servlet;

import java.io.IOException;

import com.FoodApp.DAO.UserDAO;
import com.FoodApp.DAOImplementation.UserImplementation;
import com.FoodApp.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet{
	  @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        User loggedInUser = (User) session.getAttribute("loggedInUser");

	        if (loggedInUser != null) {
	            String newName = request.getParameter("name");
	            String newEmail = request.getParameter("email");
	            String newPassword = request.getParameter("password");
	            String newAddress = request.getParameter("address");
	            String newPhone = request.getParameter("phone");

	            loggedInUser.setUsername(newName);
	            loggedInUser.setEmail(newEmail);
	            loggedInUser.setPassword(newPassword);
	            loggedInUser.setAddress(newAddress);
	            loggedInUser.setPhone(newPhone);

	            UserDAO userDAO = new UserImplementation();
	            userDAO.updateUser(loggedInUser);

	            session.setAttribute("loggedInUser", loggedInUser);
	            response.sendRedirect("RestaurantServlet"); 
	        } else {
	            response.sendRedirect("Login.jsp"); 
	        }
	    }
}
