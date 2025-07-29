package com.eventmanagement;

public class OrganizerBean {
     private String username;
     private String password;
     private String full_name;
     private String email;
     private String confirmPassword;
     public String getFullName() {
    	 return full_name;
     }
     public String getEmail() {
    	 return email;
     }
     public String getUsername() {
    	return username;
     }
     public String getPassword() {
    	 return password;
     }
     public String getConfirmPassword() {
    	 return confirmPassword;
     }
     
     
     public void setFullName(String fullName) {
    	 this.full_name=fullName;
     }
     public void setEmail(String email) {
    	 this.email=email;
     }
     public void setUsername(String password) {
    	 this.password=password;
     }
     public void setPassword(String password) {
    	 this.password=password;
     }
     public void setConfirmPassword(String confirmPassword) {
    	 this.confirmPassword=confirmPassword;
     }
}
