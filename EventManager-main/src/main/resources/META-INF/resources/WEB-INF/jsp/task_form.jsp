<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Manager</title>
    <link rel="stylesheet" href="event-form.css">
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css">
</head>

<body>
    <%@ include file = "common/admin_navbar.jspf" %>
    <hr>
    
    <div id="main">
        <div class="container" id="add-event">
            <form:form method="POST" modelAttribute="task" class="form-group" id="add-event_f">
                <div class="text1">
                    Add a Task!
                </div>
                <fieldset class="mb-3">
                    <form:label path="taskName">Task Name</form:label>
                    <form:input class="form-control" type="text" path="taskName" required="required"/>
                    <form:errors class="text-warning" path="taskName"/>
                </fieldset>
                
                <fieldset class="mb-3">
                    <form:label path="description">More about Task</form:label>
                    <form:input class="form-control" type="text" path="description" required="required"/>
                    <form:errors class="text-warning" path="description"/>
                </fieldset>

                <fieldset class="mb-3">
                    <form:label path="deadline">Deadline</form:label>
                    <form:input type="text" path="deadline" required="required"/>
                    <form:errors class="text-warning" path="deadline"/>
                </fieldset>

                <fieldset class="mb-3">
                    <form:label path="isDone">Status</form:label>
                    <form:select path="isDone" class="form-select">
                        <option value="true">Completed</option>
                        <option value="false">Pending</option>
                    </form:select>
                    <form:errors class="text-warning" path="isDone"/>
                </fieldset>
                
                <fieldset class="mb-3">
                    <form:label path="domain">Domain</form:label>
                    <form:select path="domain" class="form-select" id="domainSelect">
                        <option value="">Select</option>
                        <option value="Management">Management</option>
                        <option value="Promotion">Promotion</option>
                        <option value="Graphic Design">Graphic Design</option>
                        <option value="Cinematography">Cinematography</option>
                        <option value="Social Media">Social Media</option>
                        <option value="Content Curation">Content Curation</option>
                        <option value="Technical">Technical</option>
                    </form:select>
                    <form:errors class="text-warning" path="domain"/>
                </fieldset>
                
                <fieldset class="mb-3">
                    <form:label path="member">Members</form:label>
                    <form:select path="member" class="form-select" id="memberSelect">
                        <option value="">select</option> <!-- Add the "All" option to show all members initially -->
                        <c:forEach items="${members}" var="member">
                            <option value="${member.firstname}" data-skill="${member.skill}">${member.firstname}</option>
                        </c:forEach>
                    </form:select>
                    <form:errors class="text-warning" path="member"/>
                </fieldset>
                
                <fieldset class="mb-3">
                    <form:label path="eventname">Event Name</form:label>
                    <form:select path="eventname" class="form-select">
                    	<option value="">select</option>
                        <c:forEach items="${events}" var="event">
                            <option value="${event.eventName}">${event.eventName}</option>
                        </c:forEach>
                    </form:select>
                    <form:errors class="text-warning" path="eventname"/>
                </fieldset>
                
                <div id="btn_div">
                    <button id="btn2">Submit</button>
                </div>
                
            </form:form>
        </div>
    </div>
    
    <script type="text/javascript" src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        $('#deadline').datepicker({
            format: 'yyyy-mm-dd',
        });
    </script>
    
    <script type="text/javascript">
        $('#domainSelect').change(function() {
            var selectedDomain = $(this).val();
            $('#memberSelect option').show(); // Show all members initially
            if (selectedDomain !== 'All') {
                $('#memberSelect option[data-skill!="' + selectedDomain + '"]').hide();
            }
        });
    </script>
</body>
</html>
