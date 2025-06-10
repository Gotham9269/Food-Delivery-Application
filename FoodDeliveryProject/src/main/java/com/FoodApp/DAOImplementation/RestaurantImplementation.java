package com.FoodApp.DAOImplementation;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.FoodApp.DAO.RestaurantDAO;
import com.FoodApp.Model.Restaurant;
import com.FoodApp.util.DBConnection;

public class RestaurantImplementation implements RestaurantDAO {
	public static final String add_restaurant="INSERT INTO restaurant(RestaurantId,name,address,phoneNumber,cuisineType,deliveryTime,AdminUserId,Rating,isActive,imagePath)"
			+ "values(?,?,?,?,?,?,?,?,?,?)";
	public static final String retrive_by_id="SELECT * from restaurant where RestaurantId = ?";
	public static final String retrive_all_restaurants="SELECT * from restaurant";
	public static final String update_restaurant="UPDATE restaurant set name=?,address=?,phoneNumber=?,cuisineType=?,deliveryTime=?,AdminUserId=?,Rating=?,isActive=?,imagePath=? where RestaurantId =?";
	public static final String delete_restaurant="DELETE from restaurant where  RestaurantId = ?";
	@Override
	public List<Restaurant> retriveAllrestaurant() {
		// TODO Auto-generated method stub
		List<Restaurant> list = new ArrayList<Restaurant>();
		try(Connection conn=DBConnection.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(retrive_all_restaurants);) 
		{
		 ResultSet res = pstmt.executeQuery();
		 while(res.next()) {
			 int id =res.getInt(1);
			 String name=res.getString(2);
			 String address = res.getString(3); 
			 String phoneNumber = res.getString(4); 
			 String cuisineType = res.getString(5); 
			 int deliveryTime = res.getInt(6); 
			 int adminUserId = res.getInt(7); 
			 double rating = res.getDouble(8);
			 int isActive = res.getInt(9);
			 String imagePath = res.getString(10);
			 Restaurant r=new Restaurant(id, name, address, phoneNumber, cuisineType, 
				        deliveryTime, adminUserId, rating, isActive, 
				        imagePath );
			 list.add(r);
		 }
		 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
				
	}

	@Override
	public Restaurant retriveById(int restaurantID) {
		// TODO Auto-generated method stub
		Restaurant r=null;
		try(Connection conn=DBConnection.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(retrive_by_id);) 
		{
		 pstmt.setInt(1, restaurantID);
		 ResultSet res = pstmt.executeQuery();
		 while(res.next()) {
			 int id =res.getInt(1);
			 String name=res.getString(2);
			 String address = res.getString(3); 
			 String phoneNumber = res.getString(4); 
			 String cuisineType = res.getString(5); 
			 int deliveryTime = res.getInt(6); 
			 int adminUserId = res.getInt(7); 
			 double rating = res.getDouble(8);
			 int isActive = res.getInt(9);
			 String imagePath = res.getString(10);
			 r=new Restaurant(id, name, address, phoneNumber, cuisineType, 
				        deliveryTime, adminUserId, rating, isActive, 
				        imagePath );
		 }
		 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return r;
	}

	@Override
	public void addRestaurant(Restaurant r) {
		
		try (Connection connection=DBConnection.getConnection();
			PreparedStatement preparedStatement=connection.prepareStatement(add_restaurant);){
			
			preparedStatement.setInt(1, r.getRestaurantId());
			preparedStatement.setString(2, r.getName());
			preparedStatement.setString(3, r.getAddress());
			preparedStatement.setString(4, r.getPhoneNumber());
			preparedStatement.setString(5, r.getCuisineType());
			preparedStatement.setInt(6, r.getDeliveryTime());
			preparedStatement.setInt(7,r.getAdminUser_id());
			preparedStatement.setDouble(8, r.getRating());
			preparedStatement.setInt(9, r.getIsActive());
			FileInputStream fis=null;
			try {
				fis = new FileInputStream(r.getImagePath());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			preparedStatement.setBinaryStream(10,fis);
			int i =preparedStatement.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updaterestaurant(Restaurant r) {
		try(Connection conn=DBConnection.getConnection();
				PreparedStatement pstmt=conn.prepareStatement(update_restaurant);) 
			{
			 pstmt.setString(1, r.getName());
			 pstmt.setString(2,r.getAddress()); 
			  pstmt.setString(3,r.getPhoneNumber()); 
			  pstmt.setString(4,r.getCuisineType()); 
			  pstmt.setInt(5,r.getDeliveryTime()); 
			pstmt.setInt(6,r.getAdminUser_id()); 
			pstmt.setDouble(7,r.getRating());
			pstmt.setInt(8,r.getIsActive());
		 pstmt.setString(9,r.getImagePath());
		pstmt.setInt(10, r.getRestaurantId());
		int i=pstmt.executeUpdate();
			System.out.println(i);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
	}

	@Override
	public void daleterestaurant(int restaurantID) {
		try (Connection connection=DBConnection.getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(delete_restaurant);){
			preparedStatement.setInt(1, restaurantID);
			int i=preparedStatement.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	

}
}
