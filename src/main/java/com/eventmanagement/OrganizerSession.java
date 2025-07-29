package com.eventmanagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/OrganizerSession")
public class OrganizerSession extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Do not create new session
        if (session != null && Boolean.TRUE.equals(session.getAttribute("organizerLoggedIn"))) {
            response.sendRedirect("OrganizerDashboard.jsp");
        } else {
           
            response.sendRedirect("OrganiserLogin.html");
        }
    }
}
