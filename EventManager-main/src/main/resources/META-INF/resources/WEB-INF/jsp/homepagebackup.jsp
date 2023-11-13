<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/homepage_style.css" type = "text/css">
</head>

<body>
    <nav id="nav_text">
        <span class="text1">EVENT SCHEDULER AND ASSISTANT</span>
        <img src="./Images/menu_icon.png" alt="" id="menu_img" onclick="toggleMenu()">

        <div id="nav_list" class="showMenu">
            <ul id="list_ul">
                <li>
                    <a href="profile-page">
                        <img src="./Images/profile_icon.png" alt="profile">
                        <span>Profile</span>
                    </a>
                </li>
                <li>
                    <a href="team-page">
                        <img src="./Images/team_icon.png" alt="team">
                        <span>Team</span>
                    </a>
                </li>
                <li>
                    <a href="tasks-list">
                        <img src="./Images/task_icon.png" alt="task">
                        <span>Tasks</span>
                    </a>
                </li>
                <li>
                    <a href="event-list">
                        <img src="./Images/event_icon.png" alt="event">
                        <span>Event</span>
                    </a>
                </li>
                <li>
                    <a href="landing-page">
                        <img src="./Images/home_icon.png" alt="home">
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div id="feature_div"> <!-- make a scrollview -->
        <div class="feature">
            <p>Whats's New!</p>
            <a href="#">Read More..</a>
        </div>
        <div class="feature">
            <p>Interesting Events.</p>
            <a href="#">Read More..</a>
        </div>
        <div class="feature">
            <p>Introducing Tasks</p>
            <a href="#">Read More..</a>
        </div>
        <div class="feature">
            <p>Introducing Tasks</p>
            <a href="#">Read More..</a>
        </div>
    </div>

    <div id="create_div">
        <ul id="create_list">
            <li>
                <a href="create-event">
                <img src="./Images/create.png" alt="create">
                <p>Create Event</p>
                </a>
            </li>
            <li>
                <a href="task-form">
                <img src="/Images/create.png" alt="create">
                <p>Create Task</p>
                </a>
            </li>
            <li>
                <a href="">
                <img src="./Images/create.png" alt="create">
                <p>Create Team</p>
                </a>
            </li>
        </ul>
    </div>

    <%-- <div id="task_event">
        <div id="task" class="task_event_div">

            <div id="task_head1" class="task_event_head1">
                Task Assigned
            </div>

            <div class="task_event_line1"></div>

            <div id="task_head2" class="task_event_head2">
                
                <div class="name">
                    Name
                </div>
                
                <div class="status">
                    Status
                </div>

            </div>

            <div id="task_grid" class="task_event_grid">

                <div id="task1" class="task_event_list">
                    <div id="task1_text" class="task_text"> Task 1 </div>
                    <div id="task1_status" class="task_status">
                        <img src="./Images/green-circle.png" alt="status">
                    </div>
                </div>

                <div id="task2" class="task_event_list">
                    <div id="task2_text" class="task_text"> Task 2 </div>
                    <div id="task2_status" class="task_status">
                        <img src="./Images/green-circle.png" alt="status">
                    </div>
                </div>

                <div id="task3" class="task_event_list">
                    <div id="task3_text" class="task_text"> Task 3 </div>
                    <div id="task3_status" class="task_status">
                        <img src="./Images/green-circle.png" alt="status">
                    </div>
                </div>

            </div>

        </div>

        <div id="event" class="task_event_div">

            <div id="event_grid" class="task_event_grid">

                <div id="event_head1" class="task_event_head1">
                    Current Event
                </div>

                <div class="task_event_line1"></div>

                <div id="event_head2" class="task_event_head2">

                    <div class="name">
                        Name
                    </div>
                    
                    <div class="status">
                        Status
                    </div>

                </div>

                <div id="event1" class="task_event_list">
                    <div id="event1_text" class="event_text"> Event 1 </div>
                    <div id="event1_status" class="event_status">
                        <img src="./Images/green-circle.png" alt="status">
                    </div>
                </div>

                <div id="event2" class="task_event_list">
                    <div id="event2_text" class="event_text"> Event 2 </div>
                    <div id="event2_status" class="event_status">
                        <img src="./Images/green-circle.png" alt="status">
                    </div>
                </div>

                <div id="event3" class="task_event_list">
                    <div id="event3_text" class="event_text"> Event 3 </div>
                    <div id="event3_status" class="event_status">
                        <img src="./Images/green-circle.png" alt="status">
                    </div>
                </div>

            </div>

        </div>
    </div>
    
    <div>Welcome ${username}</div> --%>

    <script src="homepage_js.js"></script>
</body>

</html>