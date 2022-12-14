package com.mycompany.g29.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import org.hibernate.annotations.ManyToAny;

@Entity
public class User {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10 , name="user_id")
    private int userId;
    @Column(length = 100 , name="user_name")
    private String userName;
    @Column(length = 100 , name="user_email")
    private String userEmail;
    @Column(length = 100 , name="user_password")
    private  String userPassword;
    @Column(length = 12 , name="user_phone")
    private String userPhone;
    @Column(length = 1500 , name="user_address")
    private String userAddress;
    
    @Column(length = 1500 , name="user_type")
    private String userType;
    
    @ManyToMany
    private List<Tweet> tweets  = new ArrayList<>();

    public User(int userId, String userName, String userEmail, String userPassword, String userPhone,  String userAddress , String userType , List<Tweet>tweets) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userType = userType;
        this.tweets=tweets;
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userAddress , String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userType = userType;

    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

  
    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
   
     public List<Tweet> getTweet() {
		return tweets;
	}
  
    public void setTweet(List<Tweet> tweets) {
		this.tweets = tweets;
	}
    
    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone +  ", userAddress=" + userAddress + '}';
    }
    
   
   
}
