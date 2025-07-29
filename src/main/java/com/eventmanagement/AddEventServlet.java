package com.eventmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
	public static final String SQL = "insert into events(event_name,event_date,event_time,event_location,event_fees,organizer_name)"
				+"select ?,?,?,?,?,organizer_name from register_organizer where username=?";
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
			
		HttpSession session = request.getSession(false);
		String organizerUsername = (String )session.getAttribute("username");
		
		String eventName = (String) request.getParameter("eventName").toUpperCase();
		String eventDate = (String) request.getParameter("eventDate");
		String eventTime = (String) request.getParameter("eventTime");
		String eventVenue = (String) request.getParameter("eventVenue");
		String eventFees = (String) request.getParameter("eventFees");
		
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date d=sdf.parse(eventDate);
			java.sql.Date sd = new java.sql.Date(d.getTime());
			
			java.sql.Time st = java.sql.Time.valueOf(eventTime + ":00");
			try {
				Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(SQL);
				ps.setString(1, eventName);
				ps.setDate(2, sd);
				ps.setTime(3, st);
				ps.setString(4, eventVenue);
				ps.setString(5, eventFees);
				ps.setString(6, organizerUsername);
				int insert = ps.executeUpdate();
				if(insert>0) {
					response.sendRedirect("OrganizerDashboard.jsp");
				}else {
					pw.println("<h2 style='text-align:center'> Please fill the details again something went Wrong. </h2>");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
