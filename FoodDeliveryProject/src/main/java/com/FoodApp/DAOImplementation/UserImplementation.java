package com.FoodApp.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.FoodApp.DAO.UserDAO;
import com.FoodApp.Model.User;
import com.FoodApp.util.DBConnection;

public class UserImplementation implements UserDAO{
	private static String UPDATE="UPDATE user set name=?,username=?,password=?,email=?,phonenumber=?,address=?,role=? WHERE userid=?";
	private static String INSERT="INSERT into user(name,username,password,email,phonenumber,address,role,created_date,login_date) values(?,?,?,?,?,?,?,?,?)";
	private static String user_by_id="SELECT * FROM user where userid=?";
	private static String retrive_all_users="SELECT * FROM user";
	private static String delete_user="delete from user where userid=?";
    private static final String SELECT_ON_EMAIL = "SELECT * FROM `user` WHERE `email` = ?";
    private static final String INSERT_USER="Insert into user(username,password,email,phonenumber,address)"
    		+ "values(?,?,?,?,?)";

	@Override
	public List<User> retriveAllUsers() {
		List<User> list =new ArrayList<>();
		 User u=null;
			try(Connection connection=DBConnection.getConnection();
					PreparedStatement psmt=connection.prepareStatement(retrive_all_users);)
					{
					ResultSet resultset=psmt.executeQuery();
					while(resultset.next()) {
						int userid=resultset.getInt(1);
						String name=resultset.getString(2);
						String username=resultset.getString(3);
						String password=resultset.getString(4);
						String email=resultset.getString(5);
						String phonenumber=resultset.getString(6);
						String address=resultset.getString(7);
						String role=resultset.getString(8);
						Timestamp createdDate=resultset.getTimestamp(9);
						Timestamp lastlogin=resultset.getTimestamp(10);
						u=new User(userid,name,username,password,email,phonenumber,address,role,createdDate,lastlogin);
						list.add(u);
					}
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}	
			
	
		return list;
	}

	@Override
	public User retriveById(int user_id) {
		 User u=null;
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement psmt=connection.prepareStatement(user_by_id);)
				{
				psmt.setInt(1, user_id);
				ResultSet resultset=psmt.executeQuery();
				while(resultset.next()) {
					int userid=resultset.getInt(1);
					String name=resultset.getString(2);
					String username=resultset.getString(3);
					String password=resultset.getString(4);
					String email=resultset.getString(5);
					String phonenumber=resultset.getString(6);
					String address=resultset.getString(7);
					String role=resultset.getString(8);
					Timestamp createdDate=resultset.getTimestamp(9);
					Timestamp lastlogin=resultset.getTimestamp(10);
					u=new User(userid,name,username,password,email,phonenumber,address,role,createdDate,lastlogin);
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}	
		
		return u;
	
	}

	@Override
	public int addUser(User u) {		
		int i=0;
		try(Connection connection=DBConnection.getConnection();
			PreparedStatement psmt=connection.prepareStatement(INSERT);)
			{
			psmt.setString(1,u.getName());
			psmt.setString(2, u.getUsername());
			psmt.setString(3, u.getPassword());
			psmt.setString(4, u.getEmail());
			psmt.setString(5, u.getPhone());
			psmt.setString(6, u.getAddress());
			psmt.setString(7, u.getRole());
			psmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			psmt.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			 i=psmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}


	@Override
	public void updateUser(User u) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement psmt=connection.prepareStatement(UPDATE);
			psmt.setString(1,u.getName());
			psmt.setString(2, u.getUsername());
			psmt.setString(3, u.getPassword());
			psmt.setString(4, u.getEmail());
			psmt.setString(5, u.getPhone());
			psmt.setString(6, u.getAddress());
			psmt.setString(7, u.getRole());
			psmt.setInt(8, u.getUser_id());
			int i=psmt.executeUpdate();
			System.out.println(i);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	   @Override
	    public User getUser(String email) {
	        User user = null;
			Connection connection = DBConnection.getConnection();
	        try (PreparedStatement pstmt = connection.prepareStatement(SELECT_ON_EMAIL)) {
	            pstmt.setString(1, email);
	            try (ResultSet resultSet = pstmt.executeQuery()) {
	                if (resultSet.next()) {
	                    user = new User(
	                            resultSet.getInt("userId"),
	                            resultSet.getString("username"),
	                            resultSet.getString("email"),
	                            resultSet.getString("phonenumber"),
	                            resultSet.getString("password"),
	                            resultSet.getString("address")
	                    );
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return user;
	    }

	@Override
	public void daleteUser(int user_id) {
		try(Connection connection=DBConnection.getConnection();
			PreparedStatement psmt = connection.prepareStatement(delete_user);) {
			psmt.setInt(1, user_id);
			int i=psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public int addingUser(User u) {
		int i=0;
		try(Connection connection=DBConnection.getConnection();
			PreparedStatement psmt=connection.prepareStatement(INSERT_USER);)
			{
				psmt.setString(1, u.getUsername());
				psmt.setString(2, u.getPassword());
				psmt.setString(3, u.getEmail());
				psmt.setString(4, u.getPhone());
				psmt.setString(5, u.getAddress());
				i=psmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return i;
	}
	
}
