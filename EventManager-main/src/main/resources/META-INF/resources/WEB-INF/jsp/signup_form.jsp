<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="signup_form_style.css">
    <script src="signup_form_js.js"></script>
</head>

<body>
    <div id="signup" class="container">
        <form:form ud="signup_f" action="" method = "POST" modelAttribute="member">
            <div class="text1">
                Sign Up
            </div>
            <form:label for="f_name" path="firstname">First Name</form:label>
            <form:input type="text" placeholder="First Name" path="firstname" required="required"/>
            <form:label for="l_name" path="lastname">Last Name</form:label>
            <form:input type="text" placeholder="Last Name" path="lastname" required="required"/>

            <label for="skills" path = "skill">Skills</label>

            <div id="skills">

                <div id="skills_main" >
                    <div id="skills_in"></div>
                    <button id="btn_menu"><img src="./Images/down.png" alt=""></button>
                </div>

                <div id="skills_item" class="list_item">
                    <ul>
                        <li id="one" onclick="get_value(this)" path = "skill"> Media </li>
                        <li id="two" onclick="get_value(this)" path = "skill"> Management </li>
                        <li id="three" onclick="get_value(this)" path = "skill"> documentation </li>
                        <li id="four" onclick="get_value(this)" path = "skill"> Content Curation </li>
                    </ul>
                </div>

            </div>

            <form:label for="age" path="age">Age</form:label>
            <form:input type="number" placeholder="Age" path="age"  required="required"/>
            <form:label for="password" path="password">Enter Password</form:label>
            <form:input type="password" placeholder="Password" path="password" required="required"/>
            <form:label for="r_password" path="password">Repeat Password</form:label>
            <form:input type="password" placeholder="Repeat Password" path="password" required="required"/>
            <div id="forget_p">
                <a href="login-page">Already have an account? Login</a>
            </div>
            
            
			<input type="submit" class="btn btn-success"/>
			
            <!--
            <div id="btn_div">
                <button method="POST" type="submit" id="btn1">Sign Up</button>
                <button id="btn2"> <img src="./Images/google_logo.png" alt="google_logo"> Google</button>
            </div>  
            -->
        </form:form>
    </div>
</body>

</html>