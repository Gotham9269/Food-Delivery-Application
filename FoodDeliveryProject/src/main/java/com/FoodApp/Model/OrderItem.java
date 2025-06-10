package com.FoodApp.Model;

public class OrderItem {
	int orderitemid;
	int orderid;
	int menuid;
	int quantity;
	Double total_amount;
	public OrderItem(int orderitemid, int orderid, int menuid, int quantity, Double total_amount) {
		super();
		this.orderitemid = orderitemid;
		this.orderid = orderid;
		this.menuid = menuid;
		this.quantity = quantity;
		this.total_amount = total_amount;
	}
	public int getOrderitemid() {
		return orderitemid;
	}
	public void setOrderitemid(int orderitemid) {
		this.orderitemid = orderitemid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getMenuid() {
		return menuid;
	}
	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(Double total_amount) {
		this.total_amount = total_amount;
	}
	@Override
	public String toString() {
		return "OrderItem [orderitemid=" + orderitemid + ", orderid=" + orderid + ", menuid=" + menuid + ", quantity="
				+ quantity + ", total_amount=" + total_amount + "]";
	}
	
	
}
