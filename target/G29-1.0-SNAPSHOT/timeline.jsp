<%@page import="java.util.ListIterator"%>
<%@page import="com.mycompany.g29.helper.CurrentDateTime"%>
<%@page import="com.mycompany.g29.entities.Tweet"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.g29.helper.FactoryProvider"%>
<%@page import="com.mycompany.g29.dao.TweetDao"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Timeline</title>
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
                            <a href="endUser.jsp">  <button class="btn btn-outline-success" type="submit">Back</button></a>
                            <h2 style="float: right; margin-right: 30px; font-size: 25px; color:black; font-weight: bold;letter-spacing: 2.5px;">Recently &nbsp;Posted &nbsp;Tweet</h2>
                            <a href="logoutServlet.jsp">   <button class="btn btn-outline-success" type="submit">Logout</button></a>
                        </div>
                    </nav>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">UserName</th>
                                <th scope="col">Tweet</th>
                                <th scope="col">Tweet Date</th>
                                <th scope="col">Tweet Pic</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    TweetDao td = new TweetDao(FactoryProvider.getFactory());
                                    List<Tweet> list = td.getAllTweet();
                                  //  ListIterator<Tweet> li = list.listIterator(list.size());
                                     for (int i = list.size() - 1; i >= 0; i--)  {

                            %>
                            <tr>
                                <th scope="row"><%= list.get(i).getTweetId()%></th>
                                <td><%= list.get(i).getUserName()%></td>
                                <td><%= list.get(i).getTweet()%></td>
                                <td><%= list.get(i).getTweetTime() %></td>
                                <td><img src="tweetpic\<%=  list.get(i).getTweetPic() %>" style="height: 100px ; width: 110px" alt="image" ></td>
                            </tr>
                            <%                       }
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