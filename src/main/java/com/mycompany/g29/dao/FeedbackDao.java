package com.mycompany.g29.dao;

import com.mycompany.g29.entities.Feedback;
import static java.lang.System.out;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class FeedbackDao {



     private SessionFactory factory;

    public FeedbackDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveFeedBack(Feedback feedback)
    {
        
        boolean f = false ;
     try{
            
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(feedback);
        tx.commit();
        session.close();
        f = true;
      }
      catch(Exception e)
      {
          e.printStackTrace();
          out.println(e.getMessage());
          f = false;
      }
        return f;
    }
    
    public List<Feedback> getAllFeedback(){
        
        Session session  = factory.openSession();
        List<Feedback> list =  (List<Feedback>)  session.createQuery("from Feedback").list();
        
       return list;
    }

}
