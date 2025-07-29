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

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet{
	public static final String QUERY = "delete from events where event_id = ?";
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String eventId= (String)request.getParameter("id");
		int id = Integer.parseInt(eventId);
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(QUERY);

			ps.setInt(1, id);
			int delete = ps.executeUpdate();
		
			if(delete > 0) {
				response.sendRedirect("OrganizerDashboard.jsp");
			}
			else {
				pw.println("<h2 style='text-align:center'> Something went Wrong. </h2>");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
