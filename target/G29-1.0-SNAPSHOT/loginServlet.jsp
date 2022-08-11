
<%@page import="com.mycompany.g29.entities.User"%>
<%@page import="com.mycompany.g29.helper.FactoryProvider"%>
<%@page import="com.mycompany.g29.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
 String email = request.getParameter("user_name");
 String password = request.getParameter("password");
    
   
 UserDao userDao =  new UserDao(FactoryProvider.getFactory());
 User user = userDao.getUserEmailPassword(email, password);
 
 HttpSession httpSession = request.getSession();
 
 if(user==null)
 {
     out.println("<h1>Invalid User...!</h1>");
 }
 /* 
 else{
     out.println("<h1>Welcome "+user.getUserName() +"</h1>");
 }
 */
 
  httpSession.setAttribute("current-user", user);
  if(user.getUserType().equalsIgnoreCase("Admin"))
  {
      response.sendRedirect("admin.jsp");
  }
  
  else if(user.getUserType().equalsIgnoreCase("Normal"))
  {
      response.sendRedirect("endUser.jsp");
              
  }
  else{
      
      out.println("User Not Found..");
  }


%>