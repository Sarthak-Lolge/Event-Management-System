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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet{
	public static final String DeleteUserQuery = "delete from register_user where user_id=?";
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		int user_id= Integer.parseInt(request.getParameter("user_id"));

		
		try {
			Connection con = DBConnection.getConnection();

			
			PreparedStatement ps2 = con.prepareStatement(DeleteUserQuery);
			
			ps2.setInt(1,user_id);
			int deleteUser = ps2.executeUpdate();
			
			if(deleteUser>0) {
				pw.println("<script>alert('Delete record successfully');<script>");
			}
			else {
				pw.println("<h2 style='text-align:center'> Something went Wrong. </h2>");
			}
			response.sendRedirect("AdminPannel-ManageUsers.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
