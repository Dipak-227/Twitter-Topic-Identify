<%@page import="com.mycompany.g29.entities.User"%>
<%@page import="com.mycompany.g29.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.g29.helper.FactoryProvider"%>
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
                            <h2 style="float: right; margin-right: 30px; font-size: 24px; color:black; font-weight: bold;letter-spacing: 2.5px;">User  Details</h2>
                            <a href="logoutServlet.jsp">  <button class="btn btn-outline-success" type="submit">Logout</button></a>
                        </div>
                    </nav>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">User Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Address</th>
                                <th scope="col">Mobile No.</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                try {

                                    UserDao ud = new UserDao(FactoryProvider.getFactory());
                                    List<User> list = ud.getAllUser();
                                    for (User user : list) {
                            %> 
                            <tr>
                                <td><%= user.getUserId()%></td>
                                <td><%= user.getUserName()%></td>
                                <td><%= user.getUserEmail()%></td>
                                <td><%= user.getUserAddress()%></td>
                                <td><%= user.getUserPhone()%></td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println(e.getMessage());
                                }

                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </body>
</html>