package com.mycompany.g29.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Tweet {

      @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      @Column(length = 10 , name = "id")
      private  int tweetId;
    
      @Column(length = 100 , name ="user_name")
      private String userName;
      
      @Column(length = 100 , name ="email")
      private String Email;
      
      @Column(length = 1500 , name="tweet")
      private String tweet;
      
      @Column(length =500 , name = "tweet_time" )
      private String tweetTime;

      
     @Column(name = "pic")
     private String tweetPic;
      
     @ManyToMany(mappedBy = "tweets")
     private List<User>user;

    public Tweet(int tweetId, String userName, String Email, String tweet, String tweetPic, String tweetTime , List<User> user) {
        this.tweetId = tweetId;
        this.userName = userName;
        this.Email = Email;
        this.tweet = tweet;
        this.tweetPic = tweetPic;
        this.tweetTime=tweetTime;
        this.user = user;
    }

    public Tweet(String userName, String Email, String tweet, String tweetPic,String tweetTime) {
        this.userName = userName;
        this.Email = Email;
        this.tweet = tweet;
        this.tweetPic = tweetPic;
        this.tweetTime=tweetTime;
      
    }

    public Tweet() {
        
    }

    public int getTweetId() {
        return tweetId;
    }

    public void setTweetId(int Id) {
        this.tweetId = tweetId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTweet() {
        return tweet;
    }

    public void setTweet(String tweet) {
        this.tweet = tweet;
    }

     public String getTweetTime() {
        return tweetTime;
    }

    public void setTweetTime(String tweetTime) {
        this.tweetTime = tweetTime;
    }
   
    
    public String getTweetPic() {
        return tweetPic;
    }

    public void setTweetPic(String tweetPic) {
        this.tweetPic = tweetPic;
    }

    public List<User> getUser() {
        return user;
    }

    public void setUser(List<User> user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Tweet{" + "Id=" + tweetId + ", userName=" + userName + ", Email=" + Email + ", tweet=" + tweet + ", tweetPic=" + tweetPic + ", user=" + user + '}';
    }
     
    
    
        
    
}
