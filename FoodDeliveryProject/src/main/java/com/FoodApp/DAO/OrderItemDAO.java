package com.FoodApp.DAO;

import java.util.List;
import com.FoodApp.Model.OrderItem;

public interface OrderItemDAO {
	List<OrderItem> retriveAllOrderitems();
	List<OrderItem> retriveById(int orderitemid);
	void addOrder(OrderItem o);
	public void updateOrder(OrderItem o);
	public void deleteOrder(int orderitemid);
}
