<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Organizer Dashboard - Evenza</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

  <!-- Navbar -->
  
  <nav class="bg-blue-600 text-white p-4">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
      <h1 class="text-xl font-bold">Evenza Organizer's DashBoard</h1>
      
      <a href="OrganizerSessionOut" class="text-sm hover:text-blue-400">Logout</a>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="max-w-7xl mx-auto p-6">
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-2xl font-semibold text-gray-800">Manage Your Events</h2>
      <a href="addEvent.jsp" class="bg-gray-900 text-white px-4 py-2 rounded hover:bg-gray-700">+ Add New Event</a>
    </div>

	<%@ page import="java.io.*,java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,com.JavaBeans.Event,com.eventmanagement.DBConnection" %>
	<%! public static final String QUERY="select * from events"; %>
	<%
		
		ArrayList<Event> eventList = new ArrayList<>();
	 
   		 try{
     	   Connection con = DBConnection.getConnection();
     	   PreparedStatement ps = con.prepareStatement(QUERY);
     	   ResultSet rs = ps.executeQuery();
     	   
     	   while(rs.next()){
     		   Event e = new Event(
     				rs.getInt("event_id"),
     				rs.getString("event_name"),
     				rs.getString("event_date"),
     				rs.getString("event_time"),
     				rs.getString("event_location"),
     				rs.getString("event_fees"),
     				rs.getString("organizer_name")
     			);
     		  eventList.add(e);
     	   }
     	   
     	   rs.close();
     	   ps.close();
     	   con.close();
     	   
   		 }catch(Exception s){
   			 s.printStackTrace();
   		 }
   		 
	%>

	<!-- Event List Grid Container (put outside the loop) -->
	<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
	<%
 	       for(Event ev : eventList) {
	%>
    <!-- Single Event Card -->
    <div class="bg-white shadow rounded-lg p-5">
        <h3 class="text-xl font-bold text-gray-800"><%= ev.getEventTitle().toUpperCase()  %></h3>
        <p class="text-sm text-gray-600">📅 Date: <%= ev.getEventDate() %></p>
        <p class="text-sm text-gray-600">⏰ Time: <%= ev.getEventTime() %></p>
        <p class="text-sm text-gray-600">📍 Location: <%= ev.getEventLocation() %></p>
        <p class="text-sm text-gray-600">💸 Fees: ₹ <%= ev.getEventFees() %></p>
        <div class="mt-4 flex space-x-2">
            <a href="edit-event.jsp?id=<%= ev.getEventId() %>" class="bg-yellow-400 text-white px-3 py-1 rounded hover:bg-yellow-500">Edit</a>
            <a href="DeleteEventServlet?id=<%= ev.getEventId() %>" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">Delete</a>
            <a href="RegisterUser.jsp?event_id=<%= ev.getEventId() %>&event_name=<%= ev.getEventTitle() %>" class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">Register Users</a>
        </div>
    </div>
	<%
        } 
	%>
	</div> <!-- end grid container -->
   </div>	

</body>
</html>
