<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Event Manager</title>
	    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	</head>

	<body style= "padding:16px;">
	<!-- navigation bar shortcut -->
		<%@include file = "common/user_navbar.jspf" %>
		
	    <h5>Your Events</h5>
	    <h6>Welcome ${firstname}!</h6>
	    <hr>
	    <table class = "table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Start Date</th>
					<th>Status</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${events}" var = "event">
					<tr>
						<td>${event.eventName}</td>
						<td>${event.startDate}</td>
						<td>${event.status}</td>
						<td><a href ="user-event-view?eventName=${event.eventName}&eventId=${event.eventId}" class ="btn btn-success" >View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
<%@ include file = "common/footer.jspf" %>