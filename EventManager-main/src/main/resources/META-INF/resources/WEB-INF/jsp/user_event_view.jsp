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

	<body>
		<%@ include file = "common/user_navbar.jspf" %>
		
		<div class = "container">
			<h5><strong>Event name:</strong> ${event.eventName} </h5>
			<hr>
			<h5><strong>Event description:</strong> ${event.description} </h5> <hr>
			<h5><strong>status:</strong> ${event.status} </h5> <hr>
			<h5><strong>start date:</strong> ${event.startDate} </h5> <hr>
			<h5><strong>end date:</strong> ${event.endDate} </h5> <hr>
		</div>
		<div class="container">
		<h3>Tasks List</h3>
	    <hr>
	    <div class="container " >
	    <table class = "table" >
			<thead>
				<tr>
					<th width = 20%>Task Name</th>
					<th width = 20%>Event Name</th>	
					<!-- <th width = 10%>Description</th> -->
					<th width = 10%>Deadline</th>
					<th width = 10%>Status</th>
					<!-- <th width = 10%>Domain</th> -->
					<th width = 20%>Members</th>
					<th width = 7.5%></th>
					<th width = 10%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${tasks}" var = "task">
					<tr>
						<td>${task.taskName}</td>
						<td>${task.eventname}</td>	
						<%-- <td>${task.description}</td> --%>
						<td>${task.deadline}</td>
						<td>
							<c:if test="${!task.isDone}">
							     	Pending   
							    </c:if>
							    <c:if test="${task.isDone}">
							        Completed
							    </c:if>
						</td>
						<%-- <td>${task.domain}</td> --%>
						<td>${task.member}</td>
						<td><a class = "btn btn-primary" href = "update-user-tasks-list?id=${task.id}">Update</a></td>
							<td><a class ="btn btn-secondary" href = "user-task-view?taskId=${task.id}">View</a></td>
						<%-- <td><a class ="btn btn-warning" href = "delete-task-from-view?taskId=${task.id}&eventId=${task.eventId}">Delete</a></td> --%>
						<input type="hidden" name="eventId" value="${task.eventId}">
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<%-- <div><a href="task-form-from-event?eventName=${event.eventName}&eventId=${event.eventId}" class=" btn btn-success">Add Task</a></div> --%>
		
		</div>
		</div>

 	<%-- 	<div class =  "container">
			<%@ include file = "common/tasklist.jspf" %>
		</div> --%>
		
		<%-- <div>
			<a href ="delete-event?eventId=${event.eventId}" class="btn btn-success">Delete</a>
		</div> --%>
		
		
		
		
		
		
		
<%@ include file = "common/footer.jspf" %>
		
		
		

