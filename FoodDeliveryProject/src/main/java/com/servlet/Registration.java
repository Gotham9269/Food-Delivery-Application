package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.FoodApp.DAOImplementation.UserImplementation;
import com.FoodApp.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Registration")
public class Registration extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    PrintWriter pw	=  resp.getWriter();
		UserImplementation impl = new UserImplementation();
		String username =req.getParameter("name");
		String email=req.getParameter("email");
		String password= req.getParameter("password");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		User u =new User(username,email,password,phone,address);
		int i=impl.addingUser(u);
		if(i!=0) {
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
		else {
			pw.println("Sorry registration has failed.....");
		}
		
	}

}
