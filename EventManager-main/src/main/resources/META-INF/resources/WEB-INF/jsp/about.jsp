<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Event Management Application</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007ACC;
            color: #fff;
            text-align: center;
            padding: 30px;
        }
        h1 {
            font-size: 36px;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007ACC;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<!-- navigation bar shortcut -->
		<%@include file = "common/navbar.jspf" %>
    <header>
        <h1>About Event Management Application</h1>
    </header>
    <div class="container">
        <h2>Tech Stack</h2>
        <ul>
            <li>Spring Boot</li>
            <li>HTML, CSS</li>
            <li>JavaScript</li>
            <li>Java</li>
            <li>Docker</li>
            <li>MySQL</li>
            <li>JSP</li>
            <li>JDBC</li>
            <li>Spring Data JPA</li>
        </ul>
        <h2>Team Members</h2>
        <ul>
            <li>Salimmiya Saudagar</li>
            <li>Sunny Yadav</li>
            <li>Prathamesh Zingade</li>
        </ul>
        <h2>Guide</h2>
        <p>Prof. Sonali Deshpande</p>
        <h2>Department</h2>
        <p>Department of CSE (Artificial Intelligence and Machine Learning)</p>
        <h2>College</h2>
        <p>Smt. Indira Gandhi College of Engineering, Ghansoli</p>
    </div>
</body>
</html>

				
		
<%@ include file = "common/footer.jspf" %>