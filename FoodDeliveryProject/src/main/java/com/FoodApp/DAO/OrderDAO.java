package com.FoodApp.DAO;

import java.util.List;

import com.FoodApp.Model.Order;

public interface OrderDAO {
	List<Order> retriveAllOrders();
	List<Order> retriveById(int orderid);
	void addOrder(Order o);
	public void updateOrder(Order o);
	public void deleteOrder(int orderid);
	

}
