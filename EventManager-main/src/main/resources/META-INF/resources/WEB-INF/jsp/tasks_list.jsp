<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Event Manager</title>
	    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	    <style type="text/css">
	    	thead{
	    		background-color:grey;
	    		color: white;
	    	}
	    	.container{
	    		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
	    		padding-top:20px;
	    		padding-bottom:20px;
	    		border-radius:16px;
	    		margin-bottom: 32px;
	    	}
	    	.let-center-things{
	    		display:flex; 
	    		justify-content:center ;
	    		margin: 36px;
	    	}
	    	
	    </style>
	</head>

	<body>
	<!-- navigation bar shortcut -->
		<%@include file = "common/admin_navbar.jspf" %>
		<div style = "display:flex; justify-content:center ;  margin-bottom: 24px"><h2>TASKS LIST</h2></div>
	    
	    <div class="container" style ="box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); padding-top:20px" >
	    
	    <div style = "display:flex; justify-content:center ;background-color: rgb(255, 53, 107); "><h5>OVERDUE TASKS</h5></div>
		<table class = "table" >
			<thead>
				<tr>
					<th width = 13%>Event Name</th>
					<th width = 17%>Task Name</th>
					<!-- <th width = 5%>Description</th> -->
					<th width = 10%>Deadline</th>
					<th width = 10%>Status</th>
					<th width = 15%>Domain</th>
					<th width = 12%>Members</th>
					<th width = 10%></th>
					<th width = 10%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${overdueTasks}" var = "task">
					<tr>
						<td>${task.eventname}</td> 
						<td>${task.taskName}</td>
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
						<td>${task.domain}</td>
						<td>${task.member}</td>
						<td><a class ="btn btn-primary" href = "update-task?id=${task.id}&eventName=${task.eventname}">Update</a></td>
						<td><a class ="btn btn-warning" href = "delete-task?taskId=${task.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	    
	    
	    <div style = "display:flex; justify-content:center; margin-top:100px;background-color: rgb(229, 229, 171); "><h5>ONGOING TASKS</h5></div>
	    <table class = "table" >
			<thead>
				<tr>
					<th width = 13%>Event Name</th>
					<th width = 17%>Task Name</th>
					<!-- <th width = 5%>Description</th> -->
					<th width = 10%>Deadline</th>
					<th width = 10%>Status</th>
					<th width = 15%>Domain</th>
					<th width = 12%>Members</th>
					<th width = 10%></th>
					<th width = 10%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${ongoingTasks}" var = "task">
					<tr>
						<td>${task.eventname}</td> 
						<td>${task.taskName}</td>
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
						<td>${task.domain}</td>
						<td>${task.member}</td>
						<td><a class ="btn btn-primary" href = "update-task?id=${task.id}&eventName=${task.eventname}">Update</a></td>
						<td><a class ="btn btn-warning" href = "delete-task?taskId=${task.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
		<div style = "display:flex; justify-content:center; margin-top:100px ; background-color:  #6bfff0;"><h5>COMPLETED TASKS</h5></div>
		<table class = "table" >
			<thead>
				<tr>
					<th width = 13%>Event Name</th>
					<th width = 17%>Task Name</th>
					<!-- <th width = 5%>Description</th> -->
					<th width = 10%>Deadline</th>
					<th width = 10%>Status</th>
					<th width = 15%>Domain</th>
					<th width = 12%>Members</th>
					<th width = 10%></th>
					<th width = 10%></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${completedTasks}" var = "task">
					<tr>
						<td>${task.eventname}</td> 
						<td>${task.taskName}</td>
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
						<td>${task.domain}</td>
						<td>${task.member}</td>
						<td><a class ="btn btn-primary" href = "update-task?id=${task.id}&eventName=${task.eventname}">Update</a></td>
						<td><a class ="btn btn-warning" href = "delete-task?taskId=${task.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class = "let-center-things">
			<a href="task-form?name=${task.eventname}" class=" btn btn-success update-btn">Add New Task</a></div>
		</div>
		
<%@ include file = "common/footer.jspf" %>