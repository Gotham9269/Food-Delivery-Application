package com.servlet;

import java.io.IOException;
import java.util.List;

import com.FoodApp.DAO.UserDAO;
import com.FoodApp.DAOImplementation.LoginImplementation;
import com.FoodApp.DAOImplementation.RestaurantImplementation;
import com.FoodApp.DAOImplementation.UserImplementation;
import com.FoodApp.Model.Restaurant;
import com.FoodApp.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginValidationServlet")
public class LoginValidationServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password= req.getParameter("password");
		UserDAO userDAO=new UserImplementation();
		User user=userDAO.getUser(email);
		LoginImplementation impl = new LoginImplementation();
		boolean isValid=impl.loginValidation(email, password);
		if(isValid) {
			RestaurantImplementation rdaoi = new RestaurantImplementation();
			List<Restaurant> restaurantList = rdaoi.retriveAllrestaurant();
			
			HttpSession session=req.getSession();
			session.setAttribute("loggedInUser", user);
			session.setAttribute("restaurantList", restaurantList);
			
			resp.sendRedirect("RestaurantServlet");
		}
		else {
			RequestDispatcher rd= req.getRequestDispatcher("registration.html");
			rd.forward(req, resp);
		}
	}
	
	}

