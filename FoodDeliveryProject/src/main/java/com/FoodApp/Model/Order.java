package com.FoodApp.Model;

public class Order {
	int orderid;
	int restaurantid;
	int userid;
	String order_date;
	Double total_amount;
	String status;
	String payment_mode;
	public Order(int orderid, int restaurantid, int userid, String order_date, Double total_amount, String status,
			String payment_mode) {
		super();
		this.orderid = orderid;
		this.restaurantid = restaurantid;
		this.userid = userid;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.status = status;
		this.payment_mode = payment_mode;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getRestaurantid() {
		return restaurantid;
	}
	public void setRestaurantid(int restaurantid) {
		this.restaurantid = restaurantid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public Double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(Double total_amount) {
		this.total_amount = total_amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", restaurantid=" + restaurantid + ", userid=" + userid + ", order_date="
				+ order_date + ", total_amount=" + total_amount + ", status=" + status + ", payment_mode="
				+ payment_mode + "]";
	}
	
}
