<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Event Manager</title>
	    <link rel="stylesheet" href="event-form.css">
	    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
	    
	    <style>

	    </style>
	</head>

	<body class = "container">
	    
	    <div id ="main">
		    <div  id="add-event">
		    	<form:form method = "POST" modelAttribute="member" id="add-event_f">
		    		<h5><strong>Registration Form</strong></h5>
		    		<hr>
		    	
		    		<fieldset class = "mb-3">
						<form:label path="firstname">First Name</form:label>
						<form:input class= "form-control" type = "text" path = "firstname" required="required"/>
						<form:errors class = "text-warning" path = "firstname"/>
					</fieldset>
					
		    		<fieldset class = "mb-3">
						<form:label path="lastname">Last Name</form:label>
						<form:input class= "form-control" type = "text" path = "lastname" required="required"/>
						<form:errors class = "text-warning" path = "lastname"/>
					</fieldset>
					
		    		<fieldset class = "mb-3">
						<form:label path="age">Age</form:label>
						<form:input class = "input-box" type = "number" path = "age" required="required"/>
						<form:errors class = "text-warning" path = "age"/>
					</fieldset>
					
		    		<fieldset class = "mb-3">
						<form:label path="password">Password</form:label>
						<form:input type = "password" path = "password" required="required"/>
						<form:errors class = "text-warning" path = "password"/>
					</fieldset>
					
					
		    		<fieldset class = "mb-3">
						<form:label path="skill">Skills</form:label>
						<form:select path = "skill" class= "form-select">
							<option value = "Management">Management</option>
							<option value = "Promotion">Promotion</option>
							<option value = "Graphic Design">Graphic Design</option>
							<option value = "Cinematography">Cinematography</option>
							<option value = "Social Media">Social Media</option>
							<option value = "Content Curation">Content Curation</option>
							<option value = "Technical">Technical</option>
						</form:select>
						<form:errors class = "text-warning" path = "skill"/>
					</fieldset>
					
		    		<div id="btn_div">
                    	<button id="btn2">Submit</button>
               		</div>
					
		    	</form:form> 
		    
		    </div>
	    
	    </div>
	    
		
<%@ include file = "common/footer.jspf" %>