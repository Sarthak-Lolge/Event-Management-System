package com.JavaBeans;

public class Manageorganizer {
	private int organizer_id;
	public String organizer_name, email,mobile_number;
	public Manageorganizer(int organizer_id, String organizer_name, String email, String mobile_number) {
		this.organizer_id=organizer_id;
		this.organizer_name=organizer_name;
		this.email=email;
		this.mobile_number=mobile_number;
	}
	public int getOrganizerId() {
		return organizer_id;
	}
	public String getOrganizerName() {
		return organizer_name;
	}
	public String getOrganizerEmail() {
		return email;
	}
	public String getMobileNumber() {
		return mobile_number;
	}
	
}
