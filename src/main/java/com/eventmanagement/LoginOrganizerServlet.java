package com.eventmanagement;

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
import javax.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginOrganizerServlet extends HttpServlet {
	public static final String SQL= "select * from register_organizer";
	Connection con=null;
	protected void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
//		HttpSession session = request.getSession();		
		
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		
		OrganizerBean og = new OrganizerBean();
		og.setUsername(username);
		og.setPassword(password);
		
		try {
			con=DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(SQL);
			ResultSet res = ps.executeQuery();
			while(res.next()) {
				if(username.equals(res.getString(4)) && password.equals(res.getString(5))) {
					HttpSession session = request.getSession();
                    session.setAttribute("organizerLoggedIn", true);// set login flag
                    session.setAttribute("username", username); 
                    response.sendRedirect("OrganizerDashboard.jsp");
				}
				else {
					pw.println("<h2 style='text-align:center'> Please fill the details again something went Wrong. </h2>");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
