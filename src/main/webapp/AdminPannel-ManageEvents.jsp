<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Events</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

  <!-- Header -->
  <header class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-blue-700">Admin Panel - Manage Events</h1>
      <a href="Admin.jsp" class="text-sm text-blue-600 hover:underline">← Back to Dashboard</a>
    </div>
  </header>

  <!-- Main Content -->
  <main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Heading + Actions -->
    <div class="flex flex-col md:flex-row justify-between items-center gap-4 mb-6">
      <h2 class="text-xl font-semibold">All Events</h2>
      <a href="addEvent.jsp" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 text-sm">+ Add New Event</a>
    </div>

    <!-- Search Bar -->
    <div class="mb-6 text-center">
      <input
        type="text"
        placeholder="Search events..."
        class="w-full md:w-1/3 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
    </div>
	<%@page import="java.sql.*, java.io.*, java.util.*, com.JavaBeans.Event, com.eventmanagement.DBConnection" %>
    <%
    	ArrayList<Event> eventList = new ArrayList<>(); 
    	String QUERY = "select * from events";
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
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    %>
    <!-- Events Table -->
    <div class="overflow-x-auto bg-white rounded-xl shadow">
      <table class="min-w-full text-sm text-left">
        <thead class="bg-gray-100 border-b">
          <tr class="text-gray-600">
            <th class="py-3 px-4">Event ID</th>
            <th class="px-4">Title</th>
            <th class="px-4">Date</th>
            <th class="px-4">Time</th>
            <th class="px-4">Location</th>
            <th class="px-4">Fees</th>
            <th class="px-4">Organizer</th>
            <th class="px-4">Actions</th>
          </tr>
        </thead>
        <tbody class="divide-y">

		<%for(Event ev : eventList){ %>
          <!-- Example Row -->
          <tr class="hover:bg-gray-50">
            <td class="py-3 px-4"><%= ev.getEventId() %></td>
            <td class="px-4"><%= ev.getEventTitle() %></td>
            <td class="px-4"><%= ev.getEventDate() %></td>
            <td class="px-4"><%= ev.getEventTime() %></td>
            <td class="px-4"><%= ev.getEventLocation() %></td>
            <td class="px-4"><%= ev.getEventFees() %></td>
            <td class="px-4"><%= ev.getEventOrganizerName() %></td>
            <td class="px-4 space-x-2">
              <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-xs">Edit</button>
              <button class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">Delete</button>
            </td>
          </tr>
	<%} %>
          <!-- More rows dynamically -->

        </tbody>
      </table>
    </div>

  </main>

  <!-- Footer -->
  <footer class="text-center py-4 text-sm text-gray-500">
    &copy; 2025 Evenza Admin Panel. All rights reserved.
  </footer>

</body>
</html>
