package com.servlet;

import java.io.IOException;
import java.util.List;

import com.FoodApp.DAO.OrderItemDAO;
import com.FoodApp.DAOImplementation.OrderItemImplementation;
import com.FoodApp.Model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/HistoryDetails")
public class OrderItemServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderId=Integer.parseInt(req.getParameter("orderId"));
		OrderItemDAO orderDAO=new OrderItemImplementation();
		List<OrderItem> orderitemList = orderDAO.retriveById(orderId);
		HttpSession session=req.getSession();
		session.setAttribute("orderitemList",orderitemList );
		resp.sendRedirect("DisplayList.jsp");
	}
}
