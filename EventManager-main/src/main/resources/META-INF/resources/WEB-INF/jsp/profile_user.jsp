<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Kanit:wght@300;700&display=swap');

body {
    margin: 0px;
    padding: 0px;
    width: 100%;
    background-color: #FAFAFA;
}

* {
    font-family: 'Kanit', sans-serif;
}

#navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
}

#navbar ul {
    list-style: none;
    display: flex;
    justify-content: center;
    align-items: center;
}

#nav_list li {
    padding: 10px;
    font-size: 1.2rem;
}

#nav_list li a {
    text-decoration: none;
    color: black;
    display: block;
    position: relative;
    font-size: 1rem;
}

#nav_list li a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 0.1em;
    background-color: black;
    opacity: 0;
    transition: opacity 300ms, transform 300ms;
}

#nav_list li a:hover::after,
#nav_list li a:focus::after {
    opacity: 1;
    transform: translate3d(0, 0.2em, 0);
}

#btn1 {
    width: 10%;
    padding: 10px;
    border: 2px solid black;
    border-radius: 25px;
    background: black;
    color: white;
    cursor: pointer;
    font-weight: bolder;
}

#btn1:hover {
    color: black;
    background: #ffef94;
}

#profile {
    /* border: 2px solid red; */
    padding: 36px;
    display: flex;
    background: #ffe9af;
}

#sec1 {
    /* border: 2px solid blue; */
    width: 50%;
}
#sec2 {
    /* border: 2px solid blue; */
    width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

#sec2 img {
    width: 50%;
    padding: 5px;
    border: 2px solid black;
    border-radius: 50%;
}

#btn_div {
    display: flex;
    justify-content:flex-start;
    align-items: center;
    margin-top: 10px;
    margin-bottom: 10px;
}

#btn2 {
    align-self: center;
    width: 45%;
    padding: 10px;
    border: 2px solid black;
    border-radius: 25px;
    background: black;
    color: white;
    cursor: pointer;
    font-weight: bolder;
    margin-block-start: 20px;
    margin-block-end: 20px;
}

#btn2:hover {
    color: black;
    background: #ffef94;
}
</style>
    
</head>
<body>
   <%@include file = "common/user_navbar.jspf" %>


	<div id="profile">
        <div id="sec1">
            <h2>${member.firstname} ${member.lastname}</h2>
            <span id="text1">
                Hii There..!
            </span>
            <br>
            <span id="text2">
		            <c:choose>
					    <c:when test="${member.skill.contains('Management')}">
					     <p>Congratulations on joining the management team! I am excited to have you on board, and I am confident that your leadership skills and experience will be a valuable asset to our team.
							I look forward to working with you to achieve our goals and continue to grow and succeed.
						</p> 
					    </c:when>
                        <c:when test="${member.skill.contains('Promotion')}">
					     <p>Congratulations on joining the [promotion/PR] team! I am thrilled to have you on board, and I am confident that your skills and experience will be a valuable asset to our team.
					     I look forward to working with you to achieve our goals and continue to grow and succeed.
					     </p>
					    </c:when>
					    <c:when test="${member.skill.contains('Graphic Desigin')}">
					     <p>
					     Congratulations on joining the graphic design team! I am thrilled to have you on board, and I am confident that your creativity and skills will be a valuable asset to our team.
					     I look forward to working with you to achieve our goals and continue to grow and succeed.
					     </p> 
					    </c:when>
					    <c:when test="${member.skill.contains('Cinematography')}">
					   <p>
					   Congratulations on joining the cinematography team! I am thrilled to have you on board, and I am confident that your creativity and technical expertise will be a valuable asset to our team.
					   I look forward to working with you to achieve our goals and continue to grow and succeed.
					   </p>
					    </c:when>
					    <c:when test="${member.skill.contains('Social Media')}">
					     <p>
					   	Congratulations on joining the social media team! I am thrilled to have you on board, and I am confident that your creativity, communication skills, and understanding of social media platforms will be a valuable asset to our team.
					   I look forward to working with you to achieve our goals and continue to grow and succeed
					   </p>
					    </c:when>
					    <c:when test="${member.skill.contains('Content Curation')}">
					     <p>
					   		Congratulations on joining the content curation team! I am thrilled to have you on board, and I am confident that your discernment, knowledge, and ability to identify and share high-quality content will be a valuable asset to our team.
					   I look forward to working with you to achieve our goals and continue to grow and succeed.
					   </p>
					    </c:when>
					    <c:otherwise>
					      <p>
					   Congratulations on joining the technical team! I am thrilled to have you on board, and I am confident that your technical expertise and problem-solving skills will be a valuable asset to our team.
					   I look forward to working with you to achieve our goals and continue to grow and succeed.
					   </p>
					    </c:otherwise>
		  			</c:choose>
            </span>

            <div id="btn_div">
                <button id="btn2">Update</button>
            </div>
        </div>
        <div id="sec2">
            <img src="./Images/profile.jpg" alt="">
        </div>
    </div>
    
    <%-- <header>
        <h1>My Profile</h1>
    </header>
    <div class="container">
        <img class="profile-image" src="./Images/profile-icon.png" alt="My Horror Profile Picture">
        <h2>About Me</h2>
        <p>
            Welcome to my profile happy to be part of this amazing community.
        </p>
        <h2>Contact Information</h2>
        <div class="contact-info">
            <p><strong>First Name:</strong> ${member.firstname}</p>
            <p><strong>Last Name:</strong> ${member.lastname}</p>
            <p><strong>Age:</strong> ${member.age}</p>
            <p><strong>Skill:</strong>${member.skill}</p>
         
        </div>
    </div> --%>
</body>
</html>
