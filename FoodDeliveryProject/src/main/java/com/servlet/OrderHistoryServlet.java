package com.servlet;

import java.io.IOException;
import java.util.List;

import com.FoodApp.DAO.OrderHistoryDAO;
import com.FoodApp.DAOImplementation.OrderHstoryImplementation;
import com.FoodApp.Model.OrderHistory;
import com.FoodApp.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderHistory")
public class OrderHistoryServlet extends HttpServlet{
	  private static final long serialVersionUID = 1L;
	    private OrderHistoryDAO orderHistoryDAO;

	    @Override
	    public void init() throws ServletException {
	        orderHistoryDAO = new OrderHstoryImplementation();
	    }

	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        HttpSession session = req.getSession(false);

	        if (session == null) {
	            resp.sendRedirect("Login.jsp");
	            return;
	        }

	        User user = (User) session.getAttribute("loggedInUser");
	        if (user == null) {
	            resp.sendRedirect("Login.jsp");
	            return;
	        }

	        int userId = user.getUser_id();
	        List<OrderHistory> orderHistoryList = orderHistoryDAO.getOrderHistoriesByUserId(userId);
	        
	      
	        req.setAttribute("orderHistoryList", orderHistoryList);
	        req.getRequestDispatcher("OrderHistory.jsp").forward(req, resp);
	        

}
}
