package com.FoodApp.DAO;

import java.util.List;

import com.FoodApp.Model.User;

public interface UserDAO {
	List<User> retriveAllUsers();
	User retriveById(int user_id);
	int addUser(User u);
	public void updateUser(User u);
	public void daleteUser(int user_id);
	User getUser(String email);
	int addingUser(User u);

}
