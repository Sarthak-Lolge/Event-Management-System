<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <h1 class="text-2xl font-bold text-blue-700">Admin Panel - Manage Users</h1>
      <a href="Admin.jsp" class="text-sm text-blue-600 hover:underline">← Back to Dashboard</a>
    </div>
  </header>

  <!-- Main Content -->
  <main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Page Heading & Search -->
    <div class="flex flex-col sm:flex-row justify-between items-center mb-6 gap-4">
      <h2 class="text-xl font-semibold">All Registered Users</h2>
      <input type="text" placeholder="Search users..." class="px-4 py-2 w-full sm:w-64 rounded-lg border border-gray-300 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

	<%@page import="java.sql.*, java.io.*, java.util.*, com.JavaBeans.Event, com.JavaBeans.User, com.eventmanagement.DBConnection, com.JavaBeans.Manageuser" %>	
	<%
	    ArrayList<Manageuser> list = new ArrayList<>();
		String QUERY = "select r.user_id, r.name, r.email, r.city, COUNT(r.event_name) AS registered_count from register_user r GROUP BY r.user_id,r.name,r.email,r.city ORDER BY COUNT(event_name) DESC;";
		try{
			
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(QUERY); 
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Manageuser users = new Manageuser(
					rs.getInt("user_id"),
					rs.getString("Name"),
					rs.getString("Email"),
					rs.getString("City"),
					rs.getInt("registered_count")
				);
				list.add(users);
			}
			 rs.close();
		        ps.close();
		        con.close();
		}catch(Exception e){
			e.printStackTrace();
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
            <th class="px-4">Registered Events</th>
            <th class="px-4">Actions</th>
          </tr>
        </thead>
        <tbody class="divide-y">

		<%for(Manageuser u : list) {  %>
          <!-- Example User Row -->
          <tr class="hover:bg-gray-50">
            <td class="py-3 px-4"><%= u.getUserId() %></td>
            <td class="px-4"><%= u.getName() %></td>
            <td class="px-4"><%= u.getEmail() %></td>
            <td class="px-4"><%= u.getCity() %></td>
            <td class="px-4"><%= u.getRegisteredCount() %></td>
            <td class="px-4 space-x-2">
              <a href="#" class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-xs">Edit</a>
              <a href="DeleteUserServlet?user_id=<%= u.getUserId()%>" class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">Delete</a>
            </td>
          </tr>
		<%} %>
          <!-- Add more rows dynamically -->

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
