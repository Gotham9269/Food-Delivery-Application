package com.FoodApp.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FoodApp.DAO.LoginDAO;
import com.FoodApp.Model.LoginDetails;
import com.FoodApp.util.DBConnection;

public class LoginImplementation implements LoginDAO{
	public static String Insert="INSERT into user(name,email,password,phone,address) VALUES(?,?,?,?,?)";
	   private static final String VALIATION = "SELECT * FROM user WHERE email=? and password=?";
	@Override
	public void adduser(LoginDetails u) {
		try(	Connection con=DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(Insert);){
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getPhone());
			pstmt.setString(5, u.getAddress());
			int i=pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public boolean loginValidation(String email, String password) {
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(VALIATION)) {
	        
	        pstmt.setString(1, email);
	        pstmt.setString(2, password);
	        
	        try (ResultSet res = pstmt.executeQuery()) {
	            if (res.next()) {
	                return true;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}


}
