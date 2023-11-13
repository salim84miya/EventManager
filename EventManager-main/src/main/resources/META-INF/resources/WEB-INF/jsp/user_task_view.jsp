<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <title>Task Information</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: linear-gradient(to right, #000000, #ffffff);
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
        }

        .task-info {
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .task-info h2 {
            font-size: 24px;
            font-weight: bold;
        }

        .task-info label {
            font-size: 16px;
            font-weight: bold;
        }

        .task-info p {
            font-size: 16px;
        }
        
        .completed{
        	color:green;
        }
        .overdue{
        	color: red;
        }
        .pending{
        	color:blue;
        }
        

        .delete-btn {
            background-color: #f44336;
            color: #fff;
            padding: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }     
    </style>
</head>
<body>
	<%@include file = "common/user_navbar.jspf" %>

    <div class="container">
        <div class="task-info">
            <h2>Task Information</h2>
            <label>Task name:</label>
            <p>${task.taskName}</p>
            <label>Event name:</label>
            <p>${task.eventname}</p>
            <label>Description:</label>
            <p>${task.description}</p>
            <label>Deadline:</label>
            <p>${task.deadline}</p>
            
            
            <label>Status:</label>
            <c:choose>
			    <c:when test="${taskStatus == 'Completed'}">
			        <p class="completed">${taskStatus}</p>
			    </c:when>
			    <c:when test="${taskStatus == 'Pending'}">
			        <p class="pending">${taskStatus}</p>
			    </c:when>
			    <c:when test="${taskStatus == 'Overdue'}">
			        <p class="overdue">${taskStatus}</p>
			    </c:when>
			</c:choose>

            
            
            
            <label>Domain:</label>
            <p>${task.domain}</p>
            <label>Member:</label>
            <p>${task.member}</p>
            <a href="update-user-tasks-list?id=${task.id}" class="btn btn-secondary">Update Status</a>
        </div>
    </div>
    
    <script type="text/javascript" src = "webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
