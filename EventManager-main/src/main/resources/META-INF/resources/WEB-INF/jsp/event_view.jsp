<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Event Manager And Assistant</title>
	    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="./event_view.css">
	</head>

	<body style="margin-bottom:50px;">
		<%@ include file = "common/admin_navbar.jspf" %>
		
		<div class = "container">
			<h6><strong>Event name:</strong> ${event.eventName} </h6>
			<hr>
			<h6><strong>Event description:</strong> ${event.description} </h6> <hr>
			<h6><strong>Status:</strong> ${event.status} </h6> <hr>
			<h6><strong>Start date:</strong> ${event.startDate} </h6> <hr>
			<h6><strong>End date:</strong> ${event.endDate} </h6> <hr>
		</div>

 		<div class =  "container" style="margin-top:20px; margin-bottom:20px ">
			<%@ include file = "common/tasklist.jspf" %>
		</div>
		
		<%-- <div>
			<a href ="delete-event?eventId=${event.eventId}" class="btn btn-danger" style="position: absolute;
  			right: 150px; top: 0; top: 50%; transform: translateY(40%);">Delete</a>
		</div> --%>
		<div class = "container" style = "display:flex; justify-content: center;">
			<a href ="delete-event?eventId=${event.eventId}" class="btn btn-danger">Delete Event</a>
		</div>
		
		
		
		
		
		
		
<%@ include file = "common/footer.jspf" %>
		
		
		

