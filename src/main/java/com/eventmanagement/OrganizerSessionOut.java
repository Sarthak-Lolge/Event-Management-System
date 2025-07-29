package com.eventmanagement;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/OrganizerSessionOut")
public class OrganizerSessionOut extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		HttpSession session = request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		response.sendRedirect("Role.html");
	}
}
