<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.JavaBeans.Event, com.eventmanagement.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Event ev = null;

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM events WHERE event_id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            ev = new Event(
                rs.getInt("event_id"),
                rs.getString("event_name"),
                rs.getString("event_date"),
                rs.getString("event_time"),
                rs.getString("event_location"),
                rs.getString("event_fees"),
                rs.getString("organizer_name")
            );
        }

        rs.close();
        ps.close();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Event - Evenza</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen p-8">
  <div class="max-w-2xl mx-auto bg-white shadow p-6 rounded-lg">
    <h2 class="text-2xl font-bold mb-4">Edit Event</h2>
    <form action="UpdateEventServlet" method="POST" class="space-y-4">
      <input type="hidden" name="event_id" value="<%= ev.getEventId() %>">

      <div>
        <label class="block font-semibold">Event Name:</label>
        <input type="text" name="event_name" value="<%= ev.getEventTitle() %>" required class="w-full border px-3 py-2 rounded">
      </div>

      <div>
        <label class="block font-semibold">Event Date:</label>
        <input type="date" name="event_date" value="<%= ev.getEventDate() %>" required class="w-full border px-3 py-2 rounded">
      </div>

      <div>
        <label class="block font-semibold">Event Time:</label>
        <input type="time" name="event_time" value="<%= ev.getEventTime() %>" required class="w-full border px-3 py-2 rounded">
      </div>

      <div>
        <label class="block font-semibold">Location:</label>
        <input type="text" name="event_location" value="<%= ev.getEventLocation() %>" required class="w-full border px-3 py-2 rounded">
      </div>

      <div>
        <label class="block font-semibold">Fees (₹):</label>
        <input type="text" name="event_fees" value="<%= ev.getEventFees() %>" required class="w-full border px-3 py-2 rounded">
      </div>

      <div class="pt-4">
        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Update Event</button>
        <a href="OrganizerDashboard.jsp" class="ml-2 text-sm text-blue-600 hover:underline">Cancel</a>
      </div>
    </form>
  </div>
</body>
</html>
