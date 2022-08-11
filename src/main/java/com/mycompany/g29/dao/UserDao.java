package com.mycompany.g29.dao;

import com.mycompany.g29.entities.User;
import static java.lang.System.out;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDao {



            private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

      public  User getUserEmailPassword(String email , String password)
      {
          
          User user = null;
          
          try{
              String q = "from User where userEmail =: e and userPassword =: p";
              Session session =  factory.openSession();
           
              user = (User) session.createQuery(q).setParameter("e", email).setParameter("p", password).uniqueResult(); 
             
              session.close();
          }
          catch(Exception e)
          {
              e.printStackTrace();
              out.println(e.getMessage());
          }
        return user;
      }
      
       public List<User> getAllUser(){
        
        Session session  = factory.openSession();
        List<User> list =  (List<User>)  session.createQuery("from User").list();
        
       return list;
    }
}
