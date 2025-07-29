<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

<div class="flex justify-center mt-12">
    <div class="bg-white w-full max-w-md p-8 rounded-xl shadow-md">
        <%
            String eventId = request.getParameter("eventId");
            String eventTitle = request.getParameter("eventTitle");	
            String eventFees = request.getParameter("eventFees");
      
			session.setAttribute("eventTitle",eventTitle);
			session.setAttribute("eventFees",eventFees);
        %>
        <h2 class="text-2xl font-bold mb-6 text-center">Register for: <%= eventTitle %></h2>
        
        <form action="RegisterURL" method="POST" class="space-y-5">
            <div>
                <label for="name" class="block font-medium mb-1">Enter Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="mobile" class="block font-medium mb-1">Enter Mobile Number:</label>
                <input type="text" id="mobile" name="mobileno" placeholder="Enter your mobile number" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="email" class="block font-medium mb-1">Enter Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="city" class="block font-medium mb-1">Select Your City:</label>
                <select id="city" name="city" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="">-- Select City --</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Bangalore">Bangalore</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Chennai">Chennai</option>
                    <option value="Kolkata">Kolkata</option>
                    <option value="Pune">Pune</option>
                </select>
            </div>

            <button type="submit"
                    class="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-md transition duration-200">
                Register
            </button>
        </form>
    </div>
</div>

</body>
</html>
