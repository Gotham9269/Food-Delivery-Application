package com.FoodApp.Model;

public class Restaurant {
	int restaurantId;
	String name;
	String address;
	String phoneNumber;
	String cuisineType;
	int deliveryTime;
	int adminUser_id;
	double rating;
	int isActive;
	String imagePath;
	
	public Restaurant() {
	}
	public Restaurant(int restaurantId, String name, String address, String phoneNumber, String cuisineType,
			int deliveryTime, int adminUser_id, double rating, int isActive, String imagePath) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.adminUser_id = adminUser_id;
		this.rating = rating;
		this.isActive = isActive;
		this.imagePath = imagePath;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getCuisineType() {
		return cuisineType;
	}
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	public int getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public int getAdminUser_id() {
		return adminUser_id;
	}
	public void setAdminUser_id(int adminUser_id) {
		this.adminUser_id = adminUser_id;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", address=" + address + ", phoneNumber="
				+ phoneNumber + ", cuisineType=" + cuisineType + ", deliveryTime=" + deliveryTime + ", adminUser_id="
				+ adminUser_id + ", rating=" + rating + ", isActive=" + isActive + ", imagePath=" + imagePath + "]";
	}

}
