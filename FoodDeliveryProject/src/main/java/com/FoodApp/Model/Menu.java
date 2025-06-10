package com.FoodApp.Model;

public class Menu {
	int menuid;
	int restaurantid;
	String itemName;
	String description;
	Double price;
	int isAvailable;
	Double ratings;
	String imageData;
	public Menu(int menuid, String itemName, String description, Double price, int isAvailable,
			Double ratings, String imageData) {
		super();
		this.menuid = menuid;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.ratings = ratings;
		this.imageData = imageData;
	}
	public Menu(int menuid, int restaurantid, String itemName, String description, Double price, int isAvailable,
			Double ratings, String imageData) {
		super();
		this.menuid = menuid;
		this.restaurantid = restaurantid;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.ratings = ratings;
		this.imageData = imageData;
	}

	public int getMenuid() {
		return menuid;
	}
	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}
	public int getRestaurantid() {
		return restaurantid;
	}
	public void setRestaurantid(int restaurantid) {
		this.restaurantid = restaurantid;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public int getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(int isAvailable) {
		this.isAvailable = isAvailable;
	}
	public Double getRatings() {
		return ratings;
	}
	public void setRatings(Double ratings) {
		this.ratings = ratings;
	}
	public String getImageData() {
		return imageData;
	}
	public void setImageData(String imageData) {
		this.imageData = imageData;
	}
	@Override
	public String toString() {
		return "Menu [menuid=" + menuid + ", restaurantid=" + restaurantid + ", itemName=" + itemName + ", description="
				+ description + ", price=" + price + ", isAvailable=" + isAvailable + ", ratings=" + ratings
				+ ", imageData=" + imageData + "]";
	}
	

}
