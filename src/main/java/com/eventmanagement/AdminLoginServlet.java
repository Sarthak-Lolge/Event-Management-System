package com.eventmanagement;
import com.eventmanagement.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	public static final String SQL = "select * from admin_login";
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(SQL);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(username.equals(rs.getString(2)) && password.equals(rs.getString(2))) {
					response.sendRedirect("Admin.jsp");
				}
				else {
					pw.println("<h1 style='text-align:center'>please try again</h1>");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
