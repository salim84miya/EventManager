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
		
	    <h5>Your Tasks</h5>
	    <hr>
	    <div>
	    	<table class = "table" >
				<thead>
					<tr>
						<th>Event Name</th>
						<th>Task Name</th>
						<th>Deadline</th>
						<th>Status</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items = "${tasks}" var = "task">
						<tr>
							<td>${task.eventname}</td> 
							<td>${task.taskName}</td>
							<td>${task.deadline}</td>							 	
							<td><c:if test="${!task.isDone}">
							     	   Pending
							    </c:if>
							    <c:if test="${task.isDone}">
							        Completed
							    </c:if>
						    </td>
							<td><a class = "btn btn-primary" href = "update-user-tasks-list?id=${task.id}">Update</a></td>
							<td><a class ="btn btn-secondary" href = "user-task-view?taskId=${task.id}">View</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		<%-- <div><a href="task-form?name=${task.eventname}" class=" btn btn-success">Add Task</a></div> --%>
		
		</div>
		
<%@ include file = "common/footer.jspf" %>