<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

    <!-- Navbar -->
  <header class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-blue-700">Evenza</h1>
      <nav class="space-x-6">
        <a href="index.html" class="hover:text-blue-700">Home</a>
        <a href="#features" class="hover:text-blue-700">Features</a>
        <a href="#about" class="hover:text-blue-700">About</a>
        <a href="#contact" class="hover:text-blue-700">Contact</a>
      </nav>
    </div>
  </header>

    <!-- Main Content -->
    <section id="eventsList" style="margin-bottom:50px">
     <div class="max-w-6xl mx-auto mt-10 px-4">
       <h2 class="text-3xl font-semibold mb-6">Upcoming Events</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
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
        
       <%
               
                for(Event ev :eventList) {
            %>
            <!-- Event Card -->
            <div class="bg-white rounded-xl shadow p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-2"><%= ev.getEventTitle() %></h3>
                <p><span class="font-medium text-sm text-gray-600">📅 Date:</span> <%= ev.getEventDate() %></p>
                <p><span class="font-medium text-sm text-gray-600">⏰ Time:</span> <%= ev.getEventTime() %></p>
                <p><span class="font-medium text-sm text-gray-600">📍 Location:</span> <%= ev.getEventLocation() %></p>
                <p><span class="font-medium text-sm text-gray-600">💸 Fees:</span> ₹<%= ev.getEventFees() %></p>
                <p><span class="font-medium text-sm text-gray-600">👤 Organizer:</span> <%= ev.getEventOrganizerName()  %></p>
                <a href='Register.jsp?eventId=<%= ev.getEventId() %>&eventTitle=<%= ev.getEventTitle() %>&eventFees=<%= ev.getEventFees() %>' 
                   id="regbtn" 
                   class='mt-4 inline-block bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition'>
                    Register
                </a>
            </div>
            <%	} %>
        </div>
    </div>
	</section>

	  <!-- Features Section -->
  <section id="features" class="py-16 bg-white">
    <div class="max-w-6xl mx-auto px-4">
      <h3 class="text-3xl font-bold text-center text-gray-900 mb-12">Key Features</h3>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="p-6 bg-blue-50 rounded-xl shadow hover:shadow-lg transition">
          <h4 class="text-xl font-semibold text-gray-900 mb-2">Event Scheduling</h4>
          <p>Set and manage dates, times, and venues with an intuitive interface.</p>
        </div>
        <div class="p-6 bg-blue-50 rounded-xl shadow hover:shadow-lg transition">
          <h4 class="text-xl font-semibold text-gray-900 mb-2">Attendee Management</h4>
          <p>Track RSVPs, send invitations, and manage check-ins in real time.</p>
        </div>
        <div class="p-6 bg-blue-50 rounded-xl shadow hover:shadow-lg transition">
          <h4 class="text-xl font-semibold text-gray-900 mb-2">Real-Time Analytics</h4>
          <p>Gain insights with dashboards that show real-time event data.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Call to Action -->
  <section class="py-16 bg-blue-600 text-white text-center">
    <h4 class="text-2xl font-bold mb-4">Ready to simplify your event planning?</h4>
    <p class="mb-6">Sign up now and make your next event unforgettable.</p>
    <a href="#" class="bg-white text-blue-600 px-6 py-3 rounded-xl font-semibold hover:bg-blue-100 transition">Create Account</a>
  </section>

  <!-- Footer -->
  <footer class="bg-gray-100 py-6 text-center text-gray-600">
    &copy; 2025 Evenza. All rights reserved.
  </footer>
 
</body>
</html>
