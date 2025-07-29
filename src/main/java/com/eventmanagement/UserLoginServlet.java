package com.eventmanagement;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/authenticate")
public class UserLoginServlet extends HttpServlet{
	public final String QUERY ="select * from user_signup";
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session= request.getSession();
		 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Event_Management_System","root","sarthak");
			PreparedStatement ps = con.prepareStatement(QUERY);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(username.equals(rs.getString(2))&&password.equals(rs.getString(3))) {
					pw.println("LOGIN SUCCESSFULL ");
					response.sendRedirect("Home.jsp");
				}else {
					pw.println("ERROR OCCURS ");
				}
			}
		}catch(ClassNotFoundException cnf ) {
			cnf.printStackTrace();
		}catch(SQLException s) {
			s.printStackTrace();
		}
		session.setAttribute("username", "password");
	}
}
