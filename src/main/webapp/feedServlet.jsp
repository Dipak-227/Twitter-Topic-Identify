<%@page import="com.mycompany.g29.dao.FeedbackDao"%>
<%@page import="com.mycompany.g29.entities.Feedback"%>
<%@page import="com.mycompany.g29.helper.FactoryProvider"%>
<%@page import="com.mycompany.g29.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
        User user = (User) session.getAttribute("current-user");
     try
     {
         String userName = request.getParameter("user_name");
        String  email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
       
      
         
       Feedback feed = new Feedback(userName, email, feedback);
                   
      FeedbackDao fd = new FeedbackDao(FactoryProvider.getFactory());
     boolean ans =  fd.saveFeedBack(feed);
      
      HttpSession httpSession = request.getSession();
      httpSession.setAttribute("message", "FeedBack Submitted Successfully...!!");
      response.sendRedirect("endUser.jsp");
      return;
  
    }
     
     catch(Exception e)
     {
         e.printStackTrace();
         out.println("Data Not Save in Database "+e.getMessage());
     }

%>