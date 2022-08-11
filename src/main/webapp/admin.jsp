
<%@page import="com.mycompany.g29.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   User user = (User) session.getAttribute("current-user");
   
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin User</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/endUser.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <span class="material-symbols-outlined home">home</span>
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="userDetails.jsp">User Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="userTweet.jsp">User Tweet</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="userFeedback.jsp">User FeedBack</a>
                </li>
                 <li class="nav-item">
                     <a class="nav-link" href="topicIdentify.jsp">Topic Identify</a>
                </li>
            </ul>
            <h2 style="float: right; margin-right: 39px; font-size: 20px; color:black;"><%=user.getUserName() %></h2>

<a href="logoutServlet.jsp"> <button class="btn btn-outline-success" type="submit">Logout</button></a>
        </div>
    </nav>
</body>
</html>
