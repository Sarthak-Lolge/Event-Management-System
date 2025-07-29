<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add New Event</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center px-4">
  <div class="w-full max-w-lg bg-white p-8 rounded-2xl shadow-lg">
    <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Add New Event</h2>
    
    <form action="AddEventServlet" method="POST" class="space-y-4">
      <div>
        <label class="block text-sm font-medium text-gray-700">Event Name</label>
        <input type="text" name="eventName" required class="mt-1 block w-full px-4 py-2 border rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="block text-sm font-medium text-gray-700">Date</label>
          <input type="date" name="eventDate" required class="mt-1 block w-full px-4 py-2 border rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700">Time</label>
          <input type="time" name="eventTime" required class="mt-1 block w-full px-4 py-2 border rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700">Venue</label>
        <input type="text" name="eventVenue" required class="mt-1 block w-full px-4 py-2 border rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700">Fees</label>
      <input type="text" name="eventFees" required class="mt-1 block w-full px-4 py-2 border rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded-xl hover:bg-blue-700 transition">
        Submit Event
      </button>
    </form>
  </div>
</body>
</html>
