<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Event Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">EventSys</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li id="user-login" class="nav-item"><a class="nav-link" href="UserLogin.html">User Login</a></li>
                     <li id="login-msg" class="nav-item"><span ></span></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="mb-4">Upcoming Events</h2>
        <div class="row">
            <%
                // Sample code: Replace with actual DB loop
                String[][] events = {
                    {"1", "Java Workshop", "2025-05-10", "Online Zoom", "200"},
                    {"2", "AI Seminar", "2025-06-05", "Delhi Convention Center","500"}
                };
				
                for(String[] event : events) {
            %>
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm p-3">
                    <h4><%= event[1] %></h4>
                    <p><strong>Date:</strong> <%= event[2] %></p>
                    <p><strong>Location:</strong> <%= event[3] %></p>
                    <p><strong>Fees: </strong><%=event[4] %></p>
              		<a href='Register.jsp?eventId=<%=event[0]%>&eventTitle=<%=event[1] %>' id="regbtn" class='btn btn-primary'>Register</a>
                    
                </div>
            </div>
            <% 
            	String eventID= event[0];
            	session.setAttribute("eventID",eventID);
            	
            	String eventName= event[1];
            	session.setAttribute("eventName",eventName);
            	
            	String eventDate=event[2];
            	session.setAttribute("eventDate",eventDate);
            	
            	String eventLocation= event[3];
            	session.setAttribute("eventLocation",eventLocation);
            	
            	String eventFees=event[4];
            	session.setAttribute("eventFees",eventFees);
                }
             	   
             %>
        </div>
    </div>
    

    <script>
    // Check if the user is logged in
    	var regbtn = document.getElementById("regbtn");
       
    	regbtn.style.display="none";
   		window.addEventListener("DOMContentLoaded", function() {
        if (sessionStorage.getItem("loggedIn") === "true") {
            var loginLink = document.getElementById("user-login");

            if (loginLink ) {
                loginLink.style.display = "none"; // Hides the User Login link
               	document.getElementById("login-msg").innerHTML="<span style='color:white'>Logged in Successfull</span>";
                regbtn.style.display="block";
            }
        }
    });
</script>

  
</body>
</html>
