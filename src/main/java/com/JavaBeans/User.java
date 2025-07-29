package com.JavaBeans;

public class User {
	private int user_id;
	private String name,mobileno,email,city,fees,event_name;
	public User(int user_id,String name,String mobileno,String email,String city,String fees,String event_name) {
		this.user_id=user_id;
		this.name= name;
		this.mobileno=mobileno;
		this.email=email;
		this.city=city;
		this.fees=fees;
		this.event_name=event_name;
	}
	public int getUserId() {
		return user_id;
	}
	public String getName() {
		return name;
	}
	public String getMobileno() {
		return mobileno;
	}
	public String getEmail() {
		return email;
	}
	public String getCity() {
		return city;
	}
	public String getFees() {
		return fees;
	}
	public String getEventName() {
		return event_name;
	}
}
