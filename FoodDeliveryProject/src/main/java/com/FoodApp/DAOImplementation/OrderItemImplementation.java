package com.FoodApp.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.FoodApp.DAO.OrderItemDAO;
import com.FoodApp.Model.OrderItem;
import com.FoodApp.util.DBConnection;

public class OrderItemImplementation implements OrderItemDAO{
	static String retrive_all_orderItems="SELECT * from order_item";
	static String retrive_by_id="SELECT * from order_item where orderitemid=?";
	static String Insert="Insert into order_item(orderitemid, orderid, menuid, quantity, total_amount) "
			+ "values(?,?,?,?,?)";
	static String update="UPDATE order_item set orderitemid=?, orderid=?, menuid=?, quantity=?, total_amount=?";
	static String Delete="DELETE from order_item where orderitemid=?";
	@Override
	public List<OrderItem> retriveAllOrderitems() {	
		List<OrderItem> list=null;
		OrderItem o=null;
	try(Connection con=DBConnection.getConnection();
		PreparedStatement pstmt= con.prepareStatement(retrive_all_orderItems);) {
		ResultSet res= pstmt.executeQuery();
		while(res.next()) {
			o=new OrderItem(res.getInt(1),res.getInt(2),res.getInt(3),res.getInt(4),res.getDouble(5));
			list.add(o);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		// TODO Auto-generated method stub
		return list;
	}
	
	@Override
	public List<OrderItem> retriveById(int orderitemid) {
		
		List<OrderItem> list=null;
		OrderItem o=null;
	try(Connection con=DBConnection.getConnection();
		PreparedStatement pstmt= con.prepareStatement(retrive_by_id);) {
		pstmt.setInt(1, orderitemid);
		ResultSet res= pstmt.executeQuery();
		while(res.next()) {
			o=new OrderItem(res.getInt(1),res.getInt(2),res.getInt(3),res.getInt(4),res.getDouble(5));
			list.add(o);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public void addOrder(OrderItem o) {
		try(Connection con=DBConnection.getConnection();
			PreparedStatement pstmt= con.prepareStatement(Insert);) {
			pstmt.setInt(1, o.getOrderitemid());
			pstmt.setInt(2, o.getOrderid());
			pstmt.setInt(3, o.getMenuid());
			pstmt.setInt(4, o.getQuantity());
			pstmt.setDouble(5, o.getTotal_amount());
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOrder(OrderItem o) {
		try(Connection con=DBConnection.getConnection();
			PreparedStatement pstmt= con.prepareStatement(update);) {
			pstmt.setInt(1, o.getOrderitemid());
			pstmt.setInt(2, o.getOrderid());
			pstmt.setInt(3, o.getMenuid());
			pstmt.setInt(4, o.getQuantity());
			pstmt.setDouble(5, o.getTotal_amount());
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteOrder(int orderitemid) {
		// TODO Auto-generated method stub
		try(Connection con=DBConnection.getConnection();
			PreparedStatement pstmt= con.prepareStatement(Delete);) {
			pstmt.setInt(1, orderitemid);
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
