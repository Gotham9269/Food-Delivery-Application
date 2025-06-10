package com.FoodApp.DAO;

import java.util.List;

import com.FoodApp.Model.Menu;

public interface MenuDAO {
	List<Menu> retrivewholeMenu();
	Menu retriveByID(int id);
	void updateMenu(Menu m);
	void deleteMenu(int id);
	void addToMenu(Menu m);
	List<Menu> retriveAllMenuById(int id);

}
