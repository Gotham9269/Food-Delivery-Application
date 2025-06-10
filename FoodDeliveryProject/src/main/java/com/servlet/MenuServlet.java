package com.servlet;

import java.io.IOException;
import java.util.List;

import com.FoodApp.DAOImplementation.MenuImplementation;
import com.FoodApp.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("RestaurantById"));
		MenuImplementation mi = new MenuImplementation();
		List<Menu> m=mi.retriveAllMenuById(id);
		req.setAttribute("MenuOfRestaurant", m);
		HttpSession session=req.getSession();
		session.setAttribute("menuList",m);
		
		resp.sendRedirect("menu.jsp");
	}
}
