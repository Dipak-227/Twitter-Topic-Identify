
package com.mycompany.g29.dao;

import com.mycompany.g29.entities.Tweet;
import static java.lang.System.out;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class TweetDao {

     private SessionFactory factory;

    public TweetDao(SessionFactory factory) {
        this.factory = factory;
    }
     
     public boolean saveTweet(Tweet tweets)
     {
         
         boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(tweets);
            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {

            e.printStackTrace();
            out.println(e.getMessage());

            f = false;

        }
        return f;

     }
     
     public List<Tweet> getAllTweet() {

        Session session = factory.openSession();
        List<Tweet> list = (List<Tweet>) session.createQuery("from Tweet").list();

        return list;
    }

}