<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Organizers</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

  <!-- Header -->
  <header class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-blue-700">Admin Panel - Manage Organizers</h1>
      <a href="Admin.jsp" class="text-sm text-blue-600 hover:underline">← Back to Dashboard</a>
    </div>
  </header>

  <!-- Main Content -->
  <main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Heading + Add Button -->
    <div class="flex flex-col md:flex-row justify-between items-center gap-4 mb-6">
      <h2 class="text-xl font-semibold">All Organizers</h2>
      <a href="OrganiserSignup.html" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 text-sm">+ Add New Organizer</a>
    </div>

    <!-- Search Bar -->
    <div class="mb-6 text-center">
      <input
        type="text"
        placeholder="Search organizers..."
        class="w-full md:w-1/3 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
    </div>
<%@page import="java.sql.*, java.io.*, java.util.*, com.JavaBeans.Event, com.eventmanagement.DBConnection, com.JavaBeans.Manageorganizer" %>

	<%
	   ArrayList<Manageorganizer> organizerList = new ArrayList<>();
		String QUERY = "select organizer_id, organizer_name, email, mobile_number from register_organizer";
		try{
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(QUERY);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Manageorganizer mo = new Manageorganizer(
					rs.getInt("organizer_id"),
					rs.getString("organizer_name"),
					rs.getString("email"),
					rs.getString("mobile_number")
				);
				organizerList.add(mo);
			}
			ps.close();
			rs.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>

    <!-- Organizers Table -->
    <div class="overflow-x-auto bg-white rounded-xl shadow">
      <table class="min-w-full text-sm text-left">
        <thead class="bg-gray-100 border-b">
          <tr class="text-gray-600">
            <th class="py-3 px-4">Organizer ID</th>
            <th class="px-4">Name</th>
            <th class="px-4">Email</th>
            <th class="px-4">Phone</th>
            <th class="px-4">Actions</th>
          </tr>
        </thead>
        <tbody class="divide-y">

	<%for(Manageorganizer o : organizerList) {%>
          <!-- Sample Row -->
          <tr class="hover:bg-gray-50">
            <td class="py-3 px-4"><%= o.getOrganizerId() %></td>
            <td class="px-4"><%= o.getOrganizerName() %></td>
            <td class="px-4"><%= o.getOrganizerEmail() %></td>
            <td class="px-4"><%= o.getMobileNumber()%></td>
            <td class="px-4 space-x-2">
              <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-xs">Edit</button>
              <button class="bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 text-xs">Delete</button>
            </td>
          </tr>
<%} %>
          <!-- More rows can be dynamically inserted -->

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
