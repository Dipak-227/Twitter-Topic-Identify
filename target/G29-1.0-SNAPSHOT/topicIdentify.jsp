<%@page import="com.mycompany.g29.helper.TopicIdentify"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.g29.entities.Tweet"%>
<%@page import="com.mycompany.g29.helper.FactoryProvider"%>
<%@page import="com.mycompany.g29.dao.TweetDao"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Details</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="stylesheet" href="css/table.css">
    </head>
    <body>
        <section>
            <div class="card">
                <div class="card-body">
                    <nav class="navbar navbar-expand-lg bg-light">
                        <div class="container-fluid">
                            <a href="admin.jsp"> <button class="btn btn-outline-success" type="submit">Back</button></a>
                            <h2 style="float: right; margin-right: 30px; font-size: 25px; color:black; font-weight: bold;letter-spacing: 2.5px;">Topic &nbsp;Identify</h2>
                            <a href="logoutServlet.jsp"> <button class="btn btn-outline-success" type="submit">Logout</button></a>
                        </div>
                    </nav>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">UserName</th>
                                <th scope="col">Topic Identify</th>
                                <th scope="col">Tweet</th>
                                <th scope="col">Tweet Pic</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    TweetDao td = new TweetDao(FactoryProvider.getFactory());
                                    List<Tweet> list = td.getAllTweet();
                                    for (Tweet tweet : list) {

                            %>
                            <tr>
                                <th scope="row"><%= tweet.getTweetId()%></th>
                                <td><%=tweet.getUserName()%></td>
                                <td><%= TopicIdentify.getTopic(tweet.getTweet())%></td>
                                <td><%=tweet.getTweet()%></td>
                                <td><img src="tweetpic\<%= tweet.getTweetPic() %>" style="height: 100px ; width: 110px" alt="image" ></td>
                            </tr>
                            <%                        }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println(e.getMessage());
                                }

                            %>

                    </table>
                </div>
            </div>
        </section>
    </body>
</html>