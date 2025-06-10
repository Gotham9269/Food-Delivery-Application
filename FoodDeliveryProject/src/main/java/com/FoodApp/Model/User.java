package com.FoodApp.Model;

import java.sql.Timestamp;

public class User {
	int user_id;
	String name;
	String username;
	String password;
	String email;
	String phone;
	String address;
	String role;
	Timestamp createDate;
	java.sql.Timestamp lastLoginDate;
	
	public User() {
	}

	public String getAddress() {
		return address;
	}

	public User(String username, String password, String email, String phone, String address) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}
	

	public void setAddress(String address) {
		this.address = address;
	}

	public User(String name, String username, String password, String email, String phone, String address,
			String role) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}


	public User(int user_id, String username, String password, String email, String phone, String address) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public User(int user_id, String name, String username, String password, String email, String phone, String address,
			String role) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}
	
	



	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	@Override
	public String toString() {
		return "User: {" + name+" "+username+" "+password+" "+email+"}";
	}

	public User(int user_id, String name, String username, String password, String email, String phone, String address,
			String role, Timestamp createDate, Timestamp lastLoginDate) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.createDate = createDate;
		this.lastLoginDate = lastLoginDate;
	}

}
