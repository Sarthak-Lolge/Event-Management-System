<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Panel - Evenza</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

	<%@ page import="java.sql.*, java.util.*, com.JavaBeans.User, com.eventmanagement.DBConnection, com.JavaBeans.EventOverview" %>

  <!-- Navbar -->
  <nav class="bg-blue-700 text-white px-6 py-4 flex justify-between items-center">
    <h1 class="text-2xl font-bold">Admin Panel</h1>
    <a href="#" class="hover:underline">Logout</a>
  </nav>
  <%
  	int usercount = 0 ;
  	int eventCount = 0;
  	int maxRegistration=0;
  	String eventTitle= "";
  	
  	
  	ArrayList<EventOverview> eu = new ArrayList<>();
  	
  	try{
  		String countUserQuery = "SELECT COUNT(*) from register_user"; 
  		String countEventQuery = "SELECT COUNT(*) from events"; 
  		String countMaxRegiration= "SELECT event_name, COUNT(*) AS registration_count FROM register_user GROUP BY event_name ORDER BY registration_count DESC LIMIT 1";
  		String eventOverViewQuery = " SELECT  e.event_id, e.event_name,e.event_date, COUNT(r.user_id) AS registered_users from events e left join  register_user r ON e.event_name = r.event_name group by  e.event_id, e.event_name, e.event_date order by e.event_id";
  		
  		Connection con = DBConnection.getConnection();
  		PreparedStatement ps1 = con.prepareStatement(countUserQuery);
  		PreparedStatement ps2 = con.prepareStatement(countEventQuery);
  		PreparedStatement ps3 = con.prepareStatement(countMaxRegiration);
  		PreparedStatement ps4 = con.prepareStatement(eventOverViewQuery);
  		
  		ResultSet rs1 = ps1.executeQuery();
  		ResultSet rs2 = ps2.executeQuery();
  		ResultSet rs3 = ps3.executeQuery();
  		ResultSet rs4 = ps4.executeQuery();
  		
  		if(rs1.next()){
  			usercount=rs1.getInt(1);
  		}
  		if(rs2.next()){
  			eventCount=rs2.getInt(1);
  		}
  		if(rs3.next()){
  			maxRegistration = rs3.getInt("registration_count");
  			eventTitle = rs3.getString("event_name");
  		}
  		while(rs4.next()){
  			
  			EventOverview eov = new EventOverview();
  			eov.setEventId(rs4.getInt("event_id"));
  			eov.setEventName(rs4.getString("event_name"));
  			eov.setEventDate(rs4.getString("event_date"));
  			eov.setRegisteredUsers(rs4.getInt("registered_users"));
  			
  			eu.add(eov);
  			
  		}
  		con.close();
  		rs1.close();
  		rs2.close();
  		rs3.close();
  		rs4.close();
  		ps1.close();
  		ps2.close();
  		ps3.close();
  		ps4.close();
  	}catch(Exception e){
  		
  		e.printStackTrace();
  	}
  %>
  <!-- Dashboard Insights -->
<div class="max-w-7xl mx-auto px-6 mt-6">
  <h2 class="text-2xl font-semibold mb-4">Quick Insights</h2>
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">

    <!-- Total Users Registered -->
    <div class="bg-white p-6 rounded-xl shadow border-l-4 border-blue-600">
      <h4 class="text-sm text-gray-500">Total Registered Users</h4>
      <p class="text-2xl font-bold text-blue-700 mt-1"><%= usercount %></p>
    </div>

    <!-- Total Events -->
    <div class="bg-white p-6 rounded-xl shadow border-l-4 border-green-600">
      <h4 class="text-sm text-gray-500">Total Events</h4>
      <p class="text-2xl font-bold text-green-700 mt-1"><%= eventCount %></p>
    </div>

    <!-- Most Popular Event -->
    <div class="bg-white p-6 rounded-xl shadow border-l-4 border-yellow-500">
      <h4 class="text-sm text-gray-500">Most Registered Event</h4>
      <p class="text-lg font-semibold text-gray-800 mt-1"><%= eventTitle %></p>
      <p class="text-sm text-gray-600"><%= maxRegistration %> registrations</p>
    </div>

  </div>
</div>
  
  
  <!-- Event Registration Stats --><!-- Event Registration Stats with Spacing -->
 <div class=" max-w-7xl mx-auto px-6">
<h3 class="mt-9 text-xl font-bold mb-4">Event Registration Overview</h3>
  <div class="overflow-y-scroll h-60 bg-white p-6 mt-8 rounded-xl shadow">
    
    <table class=" w-full text-sm text-left">
      <thead>
        <tr class="text-gray-600 border-b">
          <th class="py-2">Event ID</th>
          <th>Title</th>
          <th>Date</th>
          <th>Registered Users</th>
        </tr>
      </thead>
      <tbody>
      	
      	<% for (EventOverview eve : eu) { %>
		<tr class="border-b hover:bg-gray-50">
 			 <td class="py-2"><%= eve.getEventId() %></td>
  			 <td><%= eve.getEventName() %></td>
			 <td><%= eve.getEventDate() %></td>
 			 <td><%= eve.getRegisteredUsers() %></td>
		</tr>
		<% } %>

        
      </tbody>
    </table>
  </div>
</div>


  <!-- Dashboard -->
  <div class="max-w-7xl mx-auto p-6 grid grid-cols-1 md:grid-cols-3 gap-8 mt-6">

    <!-- Users Section -->
    <div class="bg-white rounded-xl shadow p-6 text-center">
      <h2 class="text-xl font-bold mb-4">Manage Users</h2>
      <div class="mt-4">
        <a href="AdminPannel-ManageUsers.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Users Detail</a>
      </div>
    </div>

    <!-- Events Section -->
    <div class="bg-white rounded-xl shadow p-6 text-center">
      <h2 class="text-xl font-bold mb-4">Manage Events</h2>
      
      <div class="mt-4">
    	 <a href="AdminPannel-ManageEvents.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Events Detail</a>
      </div>
    </div>
	
	 <!-- Organizers Management -->
      <div class="bg-white p-6 rounded-xl shadow text-center">
        <h3 class="text-xl font-bold mb-4">Organizers</h3>
        <div class="mt-4">
          <a href="AdminPannel-ManageOrganizer.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Organizer's Detail</a>
        </div>
      </div>

    </div>
  </div>
	
		
  </div>

  <!-- Footer -->
  <footer class="bg-gray-100 py-6 text-center text-sm text-gray-600">
    &copy; 2025 Evenza Admin. All rights reserved.
  </footer>

</body>
</html>

