package com.mycompany.g29.servlet;

import com.mycompany.g29.dao.TweetDao;
import com.mycompany.g29.entities.Tweet;
import com.mycompany.g29.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet(name = "TweetServlet", urlPatterns = {"/TweetServlet"})
public class TweetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
           response.setContentType("text/html;charset=UTF-8");
     try{
        
    String Name = request.getParameter("user_name");
    String Email = request.getParameter("email");
    String Tweets = request.getParameter("tweet");
    String tweetTime = request.getParameter("tweet_time");
    Part part = request.getPart("pic");
    
    Tweet tweet = new  Tweet();
     tweet.setUserName(Name);
     tweet.setEmail(Email);
     tweet.setTweet(Tweets);
     tweet.setTweetTime(tweetTime);
     tweet.setTweetPic(part.getSubmittedFileName());
     
    // m.setMoviePic(part.getSubmittedFileName());

    
    
    TweetDao td = new TweetDao(FactoryProvider.getFactory());
    td.saveTweet(tweet);
    
    String path = request.getRealPath("tweetpic") + File.separator + part.getSubmittedFileName();
    
     InputStream is = part.getInputStream();
     boolean upload = uploadFile(is , path);
      if(upload)
      {
           HttpSession httpSession = request.getSession();
           //httpSession.setAttribute("message", " Save Successfully...!!");
           response.sendRedirect("endUser.jsp");
     
      }
      else{
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Error...");
            response.sendRedirect("endUser.jsp");
     
      }
    
     }
    
      catch(Exception e)
      {
          e.printStackTrace();
          out.println("Problem in save data to database "+e.getMessage());

      }
        
   }

    
    

   public boolean uploadFile(InputStream is , String path)
   {
       boolean test = false;
       
       try{
           
         byte data[] = new byte[is.available()];
         is.read(data);
         FileOutputStream fos =  new FileOutputStream(path);
         fos.write(data);
         fos.flush();
         fos.close();
         test = true;
       }
       catch(Exception e)
       {
           e.printStackTrace();
            out.println(e.getMessage());
       }
       
       return test;
       
       
   } 
          
    
}
