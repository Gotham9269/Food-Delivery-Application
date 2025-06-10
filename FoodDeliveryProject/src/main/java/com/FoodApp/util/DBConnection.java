package com.FoodApp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String url="jdbc:mysql://localhost:3306/fooddelivery";
	private static final String user="root";
	private static final String pass="root";
	private static Connection connection;
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = DriverManager.getConnection(url,user,pass);
		} 
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();			
		}
		return connection;
	}
}
