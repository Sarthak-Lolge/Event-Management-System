package com.eventmanagement;
import com.eventmanagement.DBConnection;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegisterURL")
public class RegisterServlet extends HttpServlet{
	public static final String QUERY= "insert into register_user(Name, Mobile_no, email, city, fees, event_name) values(?,?,?,?,?,?)";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException
	{
		
		HttpSession session = request.getSession(false);
		
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("name");
		String mobileno = request.getParameter("mobileno");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String event_fees = (String) session.getAttribute("eventFees");
		String eventTitle = (String) session.getAttribute("eventTitle");
		

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(QUERY);
			
			ps.setString(1, name);
			ps.setString(2, mobileno);
			ps.setString(3, email);
			ps.setString(4, city);
			ps.setString(5, event_fees);
			ps.setString(6, eventTitle);
			int insert = ps.executeUpdate();
			if(insert>0) {
				response.sendRedirect("Attendee.jsp");
			}
			else {
				pw.println("<script> alert('Insert unsuccessfully');  </script>");
			}
		}catch(Exception cnf) {
			cnf.printStackTrace();
		}
	}
}
