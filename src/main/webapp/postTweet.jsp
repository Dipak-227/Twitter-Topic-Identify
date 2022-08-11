
<%@page import="com.mycompany.g29.helper.CurrentDateTime"%>
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
    <title>Post Tweet</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/postTweet.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <span class="material-symbols-outlined home">home</span>
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="endUser.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="timeline.jsp">Timeline</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Tweet</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="feedback.jsp">FeedBack</a>
                </li>
            </ul>
            <span><%= user.getUserName() %></span>
            <a href="logoutServlet.jsp"><button class="btn btn-outline-success" type="submit">Logout</button></a>
        </div>
    </nav>
            <form method="post" action="TweetServlet" enctype="multipart/form-data">
        <h1>Post Tweet</h1>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">User Name</label>
            <input type="text" value=<%= user.getUserName() %> class="form-control" id="exampleInputEmail1" name="user_name" readonly>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Email</label>
            <input type="email" value=<%=user.getUserEmail() %> class="form-control" id="exampleInputPassword1" name="email" readonly>
        </div>
        <div class="mb-3">
            <label for="floatingTextarea" class="feedback">Tweet</label>
            <textarea name="tweet" class="form-control" placeholder="Enter tweet here" id="floatingTextarea"></textarea>
        </div>
        
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Tweet Date</label>
            <input type="email" value=<%=CurrentDateTime.getDateTime() %> class="form-control" id="exampleInputPassword1" name="tweet_time" readonly>
        </div>
        
        <div>
            <label for="pic" class="form-label">Upload Photo</label>
            <input type="file" name="pic" class="form-control" id="pic" placeholder="Please upload Image file..">
        </div>
        <button type="submit" class="btn btn-primary fbtn">Post</button>
        <button type="reset" class="btn btn-primary rbtn">Reset</button>
    </form>
</body>
</html>