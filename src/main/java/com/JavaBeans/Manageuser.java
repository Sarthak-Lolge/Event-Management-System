package com.JavaBeans;

public class Manageuser {
	private int user_id,registered_count;
	private String name,email,city;
	
	public Manageuser(int user_id, String name, String email, String city, int registered_count) {
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.city = city;
		this.registered_count = registered_count;
	}
	public int getUserId() {
		return user_id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getCity() {
		return city;
	}
	public int getRegisteredCount() {
		return registered_count;
	}
}
