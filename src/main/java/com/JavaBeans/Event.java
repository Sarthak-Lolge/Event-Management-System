package com.JavaBeans;

public class Event {
	private int eventId;
	private String eventTitle,eventDate,eventTime,eventLocation,eventFees,organizerName;
	
	
	public Event(int eventId,String eventTitle,String eventDate,String eventTime,String eventLocation,String eventFees,String organizerName) {
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventDate = eventDate;
		this.eventTime = eventTime;
		this.eventLocation = eventLocation;
		this.eventFees = eventFees;
		this.organizerName = organizerName;
	}
	
	//getters
	public int getEventId() {
		return eventId;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public String getEventDate() {
		return eventDate;
	}
	public String getEventTime() {
		return eventTime;
	}
	public String getEventLocation() {
		return eventLocation;
	}
	public String getEventFees() {
		return eventFees;
	}
	public String getEventOrganizerName() {
		return organizerName;
	}
}
