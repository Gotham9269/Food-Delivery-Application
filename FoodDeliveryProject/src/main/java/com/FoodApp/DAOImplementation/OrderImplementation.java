package com.FoodApp.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.FoodApp.DAO.OrderDAO;
import com.FoodApp.Model.Order;
import com.FoodApp.Model.OrderItem;
import com.FoodApp.util.DBConnection;

public class OrderImplementation implements OrderDAO{
	static String insert="insert into order_table(orderid,restaurantid,userid,order_date,total_amount,status,payment_mode)"
			+ "values(?,?,?,?,?,?,?)";
	static String retrive_all_orders="Select * from order_table";
	static String retrive_by_id="Select * from order_table where orderid=?";
	static String update="update order_table set orderid=?,restaurantid=?,userid=?,order_date=?,total_amount=?,status=?,payment_mode=?";
	static String delete="Delete from order_table where id=? ";
		@Override
		public List<Order> retriveAllOrders() {
			List<Order> list=null;
			Order o=null;
		try(Connection con=DBConnection.getConnection();
			PreparedStatement pstmt= con.prepareStatement(retrive_all_orders);) {
			ResultSet res= pstmt.executeQuery();
			while(res.next()) {
				o=new Order(res.getInt(1),res.getInt(2),res.getInt(3),res.getString(4),res.getDouble(5),res.getString(6),res.getString(7));
				list.add(o);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return list;
		}

		@Override
		public List<Order> retriveById(int orderid) {
			List<Order> list=null;
			Order o=null;
			try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt= con.prepareStatement(retrive_by_id);) {
				pstmt.setInt(1, orderid);
				ResultSet res= pstmt.executeQuery();
				while(res.next()) {
					o=new Order(res.getInt(1),res.getInt(2),res.getInt(3),res.getString(4),res.getDouble(5),res.getString(6),res.getString(7));	
					list.add(o);
				}		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return list;
			}

		@Override
		public void addOrder(Order o) {
			try(Connection con=DBConnection.getConnection();
				PreparedStatement pstmt= con.prepareStatement(insert);) {		
				pstmt.setInt(1, o.getOrderid());
				pstmt.setInt(2, o.getRestaurantid());
				pstmt.setInt(3,o.getUserid());	
				pstmt.setString(4, o.getOrder_date());
				pstmt.setDouble(5, o.getTotal_amount());
				pstmt.setString(6, o.getStatus());
				pstmt.setString(7, o.getPayment_mode());
				int i=pstmt.executeUpdate();
				System.out.println(i);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

		@Override
		public void updateOrder(Order o) {
			try(Connection con=DBConnection.getConnection();
					PreparedStatement pstmt= con.prepareStatement(update);) {	
					pstmt.setInt(1, o.getOrderid());
					pstmt.setInt(2, o.getRestaurantid());
					pstmt.setInt(3,o.getUserid());	
					pstmt.setString(4, o.getOrder_date());
					pstmt.setDouble(5, o.getTotal_amount());
					pstmt.setString(6, o.getStatus());
					pstmt.setString(7, o.getPayment_mode());
					int i=pstmt.executeUpdate();
					System.out.println(i);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

		@Override
		public void deleteOrder(int orderid) {
			try(Connection con=DBConnection.getConnection();
					PreparedStatement pstmt= con.prepareStatement(delete);) {	
					pstmt.setInt(1, orderid);
					int i=pstmt.executeUpdate();
					System.out.println(i);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
