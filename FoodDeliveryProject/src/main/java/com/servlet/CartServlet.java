package com.servlet;

import java.io.IOException;

import com.FoodApp.DAO.MenuDAO;
import com.FoodApp.DAOImplementation.MenuImplementation;
import com.FoodApp.Model.Cart;
import com.FoodApp.Model.CartItem;
import com.FoodApp.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart=(Cart) session.getAttribute("cart");
		if(cart==null)
		{
			cart=new Cart();
			session.setAttribute("cart",cart);
		}
		String action=request.getParameter("action");
		if(action.equals("add"))
		{
			addItemToCart(request,cart);
		}
		else if("update".equals(action))
		{
			updateCartItem(request,cart);
		}
		else if("remove".equals(action))
		{
			removeItemFromCart(request,cart);
		}
		session.setAttribute("cart",cart);
		response.sendRedirect("Cart.jsp");
	}

	private void removeItemFromCart(HttpServletRequest request, Cart cart) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        cart.removeItem(itemId);
    }

	private void updateCartItem(HttpServletRequest request, Cart cart) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cart.updateItem(itemId, quantity);
    }

	 private void addItemToCart(HttpServletRequest request, Cart cart) {
	        int itemId = Integer.parseInt(request.getParameter("itemId"));
	        int quantity = Integer.parseInt(request.getParameter("quantity"));

	        MenuDAO menuDAO = new MenuImplementation();
	        Menu menuItem = menuDAO.retriveByID(itemId);

	        if (menuItem != null) {
	            CartItem item = new CartItem(
	                menuItem.getMenuid(),
	                menuItem.getRestaurantid(),
	                menuItem.getItemName(),
	                menuItem.getPrice(),
	                quantity,
	                quantity*menuItem.getPrice()
	            );
	            cart.addItem(item);
		}
	 }
}

