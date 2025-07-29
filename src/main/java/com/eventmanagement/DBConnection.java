package com.eventmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
   private static final String URL = "jdbc:mysql://localhost:3306/Event_management_system";
   private static final String USER= "root";
   private static final String PASSWORD = "sarthak";
   
   static {
	   try {
		   Class.forName("com.mysql.cj.jdbc.Driver");
	   }catch(ClassNotFoundException cnf) {
		   cnf.printStackTrace();
	   }
   } 
   
   public static Connection getConnection() {
	   Connection con= null;
	   try {
		   con = DriverManager.getConnection(URL,USER,PASSWORD);
	   }catch(SQLException s) {
		   s.printStackTrace();
	   }
	   return con;
   }
}
