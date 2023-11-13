<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Event Manager</title>
	   <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	   <link rel="stylesheet" href="Eventstyle.css">
	   
	</head>

	<body style="margin-bottom: 200px; margin-left:10px; margin-right:10px;">
	<!-- navigation bar shortcut -->
		<%@include file = "common/admin_navbar.jspf" %>
		
	    <h3 >Event List</h3>
	    <hr style="margin-bottom: 50px;">
	    <h5 >Ongoing</h5>
<!-- 	    <hr> -->
	    <table class = "table" style="margin-bottom: 40px;">
			<thead style="background-color: #8E8FFA; color: black;" >
				<tr>
					<th width = 5%>ID</th>
					<th width = 36%>Name</th>
					<th width = 12%>Start Date</th>
					<th width = 12%>End Date</th>
					<th width = 12%>Status</th>
					<th width = 12%></th>
					<th width = 11%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${ongoingEvents}" var = "event">
					<tr>
						<td>${event.eventId}</td>
						<td>${event.eventName}</td>
						<td>${event.startDate}</td>
						<td>${event.endDate}</td>
						<td>${event.status}</td>
						<td><a class ="btn btn-primary" href = "update-event?id=${event.eventId}">Update</a></td>
						<td><a href ="event-view?eventName=${event.eventName}&eventId=${event.eventId}" class ="btn btn-secondary" >View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h5>Upcoming</h5>
<!-- 	    <hr> -->
	    <table class = "table" style="margin-bottom: 40px;">
			<thead style="background-color: #8E8FFA; color: black;">
				<tr>
					<th width = 5%>ID</th>
					<th width = 36%>Name</th>
					<th width = 12%>Start Date</th>
					<th width = 12%>End Date</th>
					<th width = 12%>Status</th>
					<th width = 12%></th>
					<th width = 11%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${upcomingEvents}" var = "event">
					<tr>
						<td>${event.eventId}</td>
						<td>${event.eventName}</td>
						<td>${event.startDate}</td>
						<td>${event.endDate}</td>
						<td>${event.status}</td>
						<td><a class ="btn btn-primary" href = "update-event?id=${event.eventId}">Update</a></td>
						<td><a href ="event-view?eventName=${event.eventName}&eventId=${event.eventId}" class ="btn btn-secondary" >View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h5>Completed</h5>
<!-- 	    <hr> -->
	    <table class = "table" style="margin-bottom: 40px;">
			<thead style="background-color: #8E8FFA; color: black;">
				<tr>
					<th width = 5%>ID</th>
					<th width = 36%>Name</th>
					<th width = 12%>Start Date</th>
					<th width = 12%>End Date</th>
					<th width = 12%>Status</th>
					<th width = 12%></th>
					<th width = 11%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${CompletedEvents}" var = "event">
					<tr>
						<td>${event.eventId}</td>
						<td>${event.eventName}</td>
						<td>${event.startDate}</td>
						<td>${event.endDate}</td>
						<td>${event.status}</td>
						<td><a class ="btn btn-primary" href = "update-event?id=${event.eventId}">Update</a></td>
						<td><a href ="event-view?eventName=${event.eventName}&eventId=${event.eventId}" class ="btn btn-secondary" >View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
					<fieldset class = "ml-5">
					<a href="create-event" class ="btn btn-primary">Add Event</a>
					</fieldset>
				
		
<%@ include file = "common/footer.jspf" %>