package com.FoodApp.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.FoodApp.DAO.MenuDAO;
import com.FoodApp.Model.Menu;
import com.FoodApp.util.DBConnection;

public class MenuImplementation implements MenuDAO{
	private static String addToMenu="INSERT INTO menu(menuid,restaurantid,itemName,description,price,isAvailable,ratings,imageData) values(?,?,?,?,?,?,?,?)";
	private static String retriveAllMenu="SELECT * from menu";
	private static String retriveById="Select * from menu where menuid=?";
	private static String delete="DELETE from menu where menuid=?";
	private static String update_menu="UPDATE menu set menuid=?,restaurantid=?,itemName=?,description=?,price=?,isAvailable=?,ratings=?,imageData=?";
	private static String retriveAllMenuById="Select * from menu where restaurantid=?";
	
	@Override
	public List<Menu> retrivewholeMenu() {
		List<Menu> list = new ArrayList<Menu>();
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt =con.prepareStatement(retriveAllMenu);) {
				ResultSet res=pstmt.executeQuery();
				while(res.next()) {
					int menuid = res.getInt(1);
					int restaurantid=res.getInt(2);
					String itemName=res.getString(3);
					String description=res.getString(4);
					Double price=res.getDouble(5);
					int isAvailable=res.getInt(6);
					Double ratings=res.getDouble(7);
					String imageData=res.getString(8);
					
					Menu m =new Menu(menuid,restaurantid,itemName,description,price,isAvailable,ratings,imageData);
					list.add(m);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Menu retriveByID(int id) {
		Menu m=null;
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt =con.prepareStatement(retriveById);) {
				pstmt.setInt(1, id);
				ResultSet res=pstmt.executeQuery();
				while(res.next()) {
					int menuid = res.getInt(1);
					int restaurantid=res.getInt(2);
					String itemName=res.getString(3);
					String description=res.getString(4);
					Double price=res.getDouble(5);
					int isAvailable=res.getInt(6);
					Double ratings=res.getDouble(7);
					String imageData=res.getString(8);
					m=new Menu(menuid,restaurantid,itemName,description,price,isAvailable,ratings,imageData);
					
				}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return m;
	}

	@Override
	public void updateMenu(Menu m) {
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt =con.prepareStatement(update_menu);) {
				pstmt.setInt(1, m.getMenuid());
				pstmt.setInt(2, m.getRestaurantid());
				pstmt.setString(3, m.getItemName());
				pstmt.setString(4, m.getDescription());
				pstmt.setDouble(5, m.getPrice());
				pstmt.setInt(6, m.getIsAvailable());
				pstmt.setDouble(7, m.getRatings());
				pstmt.setString(8, m.getImageData());
				int i=pstmt.executeUpdate();
				System.out.println(i);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteMenu(int id) {
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt =con.prepareStatement(delete);) {
				pstmt.setInt(1, id);
				int i=pstmt.executeUpdate();
				System.out.println(i);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void addToMenu(Menu m) {
		// TODO Auto-generated method stub
		try(Connection con=DBConnection.getConnection();
			PreparedStatement pstmt =con.prepareStatement(addToMenu);) {
			pstmt.setInt(1, m.getMenuid());
		        pstmt.setInt(2, m.getRestaurantid());
		        pstmt.setString(3, m.getItemName());
		        pstmt.setString(4, m.getDescription());
		        pstmt.setDouble(5, m.getPrice());
		        pstmt.setInt(6, m.getIsAvailable());
		        pstmt.setDouble(7, m.getRatings());
		        pstmt.setString(8, m.getImageData());
		        int i=pstmt.executeUpdate();
		        System.out.println(i);
		        
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<Menu> retriveAllMenuById(int id) {
		
		List<Menu> list = new ArrayList<Menu>();
		try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt =con.prepareStatement(retriveAllMenuById);) {
				pstmt.setInt(1, id);
				ResultSet res=pstmt.executeQuery();
				while(res.next()) {
					int menuid = res.getInt(1);
					int restaurantid=res.getInt(2);
					String itemName=res.getString(3);
					String description=res.getString(4);
					Double price=res.getDouble(5);
					int isAvailable=res.getInt(6);
					Double ratings=res.getDouble(7);
					String imageData=res.getString(8);
					
					Menu m =new Menu(menuid,restaurantid,itemName,description,price,isAvailable,ratings,imageData);
					list.add(m);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}


}
