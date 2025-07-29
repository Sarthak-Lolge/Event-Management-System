package com.eventmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateEventServlet")
public class UpdateEventServlet extends HttpServlet{
	public static final String SQL = "update events set	event_name = ?,event_date=?, event_time=?, event_location=?,event_fees=? where event_id = ?";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		String event_name = request.getParameter("event_name");
		String event_date = request.getParameter("event_date");
		String event_time = request.getParameter("event_time");
		String event_location = request.getParameter("event_location");
		String event_fees  = request.getParameter("event_fees");
		
	
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(SQL);
			ps.setString(1, event_name);
			ps.setString(2, event_date);
			ps.setString(3, event_time);
			ps.setString(4, event_location);
			ps.setString(5, event_fees);
			ps.setInt(6, event_id);
			int update = ps.executeUpdate();
			if(update > 0) {
				response.sendRedirect("OrganizerDashboard.jsp");
			}else {
				pw.println("<h1 style='text-align:center'>Failed to update</h1>");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
