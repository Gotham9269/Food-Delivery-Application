package com.FoodApp.DAO;

import com.FoodApp.Model.LoginDetails;
public interface LoginDAO {
	void adduser(LoginDetails u);
	boolean loginValidation(String email,String password);
}
