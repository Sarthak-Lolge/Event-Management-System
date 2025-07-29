<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*, com.JavaBeans.User, com.eventmanagement.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Manage Users</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

  <!-- Header -->
  <header class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-blue-700">Organizer's Dashboard - Users</h1>
      <a href="OrganizerDashboard.jsp" class="text-sm text-blue-600 hover:underline">← Back to Dashboard</a>
    </div>
  </header>

  <!-- Main Content -->
  <main class="max-w-7xl mx-auto px-6 py-8">
    <div class="flex flex-col sm:flex-row justify-between items-center mb-6 gap-4">
      <h2 class="text-xl font-semibold">
        <% String eventNameParam = request.getParameter("event_name"); %>
        Registered Users for <span class="text-blue-700"><%= eventNameParam != null ? eventNameParam : "N/A" %></span>
      </h2>
    </div>

    <%
        List<User> userlist = new ArrayList<>();
        String query = "SELECT * FROM register_user WHERE event_name = ?"; 
        String event_name = request.getParameter("event_name");

        if (event_name != null && !event_name.trim().isEmpty()) {
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, event_name);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    User u = new User(
                        rs.getInt("user_id"),
                        rs.getString("Name"),
                        rs.getString("Mobile_no"),
                        rs.getString("Email"),
                        rs.getString("City"),
                        rs.getString("fees"),
                        rs.getString("event_name")
                    );
                    userlist.add(u);
                }

                rs.close();
                ps.close();
                con.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    %>

    <!-- Users Table -->
    <div class="overflow-x-auto bg-white rounded-xl shadow">
      <table class="min-w-full text-sm text-left">
        <thead class="bg-gray-100 border-b">
          <tr class="text-gray-600">
            <th class="py-3 px-4">User ID</th>
            <th class="px-4">Name</th>
            <th class="px-4">Email</th>
            <th class="px-4">City</th>
            <th class="px-4">Registered Event</th>
            <th class="px-4">Actions</th>
          </tr>
        </thead>
        <tbody class="divide-y">
          <%
              if (userlist.isEmpty()) {
          %>
              <tr>
                <td colspan="6" class="text-center py-4 text-gray-500">No users found for this event.</td>
              </tr>
          <%
              } else {
                for (User user : userlist) {
          %>
          <tr class="hover:bg-gray-50">
            <td class="py-3 px-4"><%= user.getUserId() %></td>
            <td class="px-4"><%= user.getName() %></td>
            <td class="px-4"><%= user.getEmail() %></td>
            <td class="px-4"><%= user.getCity() %></td>
            <td class="px-4"><%= user.getEventName() %></td>
            <td class="px-4 space-x-2">
              <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-xs">Edit</button>
              <button class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">Delete</button>
            </td>
          </tr>
          <%
                }
              }
          %>
        </tbody>
      </table>
    </div>
  </main>

  <!-- Footer -->
  <footer class="text-center py-4 text-sm text-gray-500">
    &copy; 2025 Evenza Organizer Panel. All rights reserved.
  </footer>

</body>
</html>
