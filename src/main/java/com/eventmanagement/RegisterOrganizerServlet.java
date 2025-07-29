package com.eventmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterOrganizerServlet")
public class RegisterOrganizerServlet extends HttpServlet {
	public static final String SQL="insert into register_organizer(FullName,Email,Username,Password,ConfirmPassword,Mobile_Number)values(?,?,?,?,?,?)";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String full_name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		OrganizerBean og = new OrganizerBean();
		og.setFullName(full_name);
		og.setEmail(email);
		og.setUsername(username);
		og.setPassword(password);
		og.setConfirmPassword(confirmPassword);
		
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(SQL);
			ps.setString(1, full_name);
			ps.setString(2, email);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, confirmPassword);
			ps.setString(6, phone_number);
			int insert = ps.executeUpdate();
			
			if(insert>0) {
				response.sendRedirect("OrganiserLogin.html");
			}else {
				pw.println("<h2 style='text-align:center'> Please fill the details again something went Wrong. </h2>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
