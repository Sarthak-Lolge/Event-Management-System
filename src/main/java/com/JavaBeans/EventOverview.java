package com.JavaBeans;

public class EventOverview {
	private int eventID,registeredUser;
	private String eventName,eventDate;
	
	public int getEventId() {
		return eventID;
	}
	public String getEventName() {
		return eventName;
	}
	public String getEventDate() {
		return eventDate;
	}
	public int getRegisteredUsers() {
		return registeredUser;
	}
	
	public void setEventId(int eventID) {
		this.eventID=eventID;
	}
	public void setEventName(String eventName) {
		this.eventName=eventName;
	}
	public void setEventDate(String eventDate) {
		this.eventDate=eventDate;
	}
	public void setRegisteredUsers(int registeredUser) {
		this.registeredUser=registeredUser;
	}
}
