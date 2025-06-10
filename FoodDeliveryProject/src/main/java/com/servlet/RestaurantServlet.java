package com.servlet;

import java.io.IOException;
import java.util.List;

import com.FoodApp.DAOImplementation.RestaurantImplementation;
import com.FoodApp.Model.Restaurant;
import com.mysql.cj.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantImplementation ri=new RestaurantImplementation();
		List<Restaurant> list = ri.retriveAllrestaurant();
		HttpSession session = req.getSession();
		session.setAttribute("list", list);
		RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
		req.setAttribute("RestaurantList",list);
		rd.forward(req, resp);
		
	}
}
