<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Event Manager And Assistant</title>
	    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="/homepage_style.css" type = "text/css">
	    
	    <style>
			
		</style>

	</head>
	
	<body>
		<%@include file = "common/admin_navbar.jspf" %>
		
		<div class="create_event_board">
        	<div>
	            <div>
	                <p class = "board_text">Now Create And Manage <br>Event Easily!</p>
	            </div>
	            <div>
	                <p class="board_sub_text">With few easy steps!</p>
	            </div>
            	<a class="create_event_button" href="create-event">Create Event</a>
	
	        </div>
	        <div>
	            <img class="event_board_image" src="./Images/event_plan.png">
	        </div>
	    </div>
	    
	    <div class = "ongoing-event-list">
	    	<div class = "container">
	    		<table class = "table" style="margin-bottom: 40px;">
					<thead style="background-color: #8E8FFA; color: black;" >
						<tr>
							<th width = 36%>Name</th>
							<th width = 12%>Start Date</th>
							<th width = 12%>End Date</th>
							<th width = 12%></th>
							<th width = 11%></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items = "${ongoingEvents}" var = "event">
							<tr>
								<td>${event.eventName}</td>
								<td>${event.startDate}</td>
								<td>${event.endDate}</td>
								<td><a class ="btn btn-primary" href = "update-event?id=${event.eventId}">Update</a></td>
								<td><a href ="event-view?eventName=${event.eventName}&eventId=${event.eventId}" class ="btn btn-secondary" >View</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	    	</div>
	    	
	    </div>
		</body>
	
</html>