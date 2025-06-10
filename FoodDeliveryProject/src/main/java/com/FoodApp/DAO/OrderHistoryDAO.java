package com.FoodApp.DAO;
import java.util.ArrayList;
import java.util.List;
import com.FoodApp.Model.OrderHistory;

public interface OrderHistoryDAO {

	    int addOrderHistory(OrderHistory orderHistory);
	    ArrayList<OrderHistory> getAllOrderHistories();
	    OrderHistory getSpecificOrderHistory(int orderHistoryId);
	    List<OrderHistory> getOrderHistoriesByUserId(int userId);
	    
}
