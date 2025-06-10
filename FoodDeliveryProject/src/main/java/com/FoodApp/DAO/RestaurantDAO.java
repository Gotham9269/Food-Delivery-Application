package com.FoodApp.DAO;

import java.util.List;

import com.FoodApp.Model.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> retriveAllrestaurant();
	Restaurant retriveById(int restaurantID);
	void addRestaurant(Restaurant r);
	public void updaterestaurant(Restaurant r);
	public void daleterestaurant(int restaurantID);
}
