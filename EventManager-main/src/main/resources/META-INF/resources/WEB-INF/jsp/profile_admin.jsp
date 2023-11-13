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
    <!-- <nav class="navbar navbar-expand-md navbar-light bg-light mb-3 p-1">
        <a class="navbar-brand m-1" href="">Event Manager and Assistant</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="user_homepage">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="user-event-list">Events List</a></li>
                <li class="nav-item"><a class="nav-link" href="user-tasks-list">Tasks List</a></li>
            </ul>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="landing-page">Logout</a></li>
        </ul>
    </nav> -->

<%@include file = "common/admin_navbar.jspf" %>

    <div id="profile">
        <div id="sec1">
            <h2>Admin</h2>
            <span id="text1">
                Hii There..!
            </span>
            <br>
            <span id="text2">
		         <p>
		         Welcome back to the website admin ! We're so glad to have you back on board.

We've missed your expertise in Web security,Troubleshooting and debugging and Performance optimization. We know that with your help, we can continue to improve and maintain our website, providing our users with the best possible experience.

We're looking forward to working with you again and achieving great things together.
		         
		         </p>   
            </span>

            <div id="btn_div">
                <button id="btn2">Update</button>
            </div>
        </div>
        <div id="sec2">
            <img src="./Images/profile.jpg" alt="">
        </div>
    </div>
    
    
    
    
    
    
    
    
    <!-- <header>
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
            <p><strong>Name:</strong> [Your Name]</p>
            <p><strong>Domain:</strong> [Domain]</p>
         
        </div>
    </div> -->
</body>
</html>
