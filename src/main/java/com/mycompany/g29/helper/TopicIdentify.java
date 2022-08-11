package com.mycompany.g29.helper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TopicIdentify {

    
    public static String getTopic(String tweet)
    {
        String  regex="Cloud Computing|Artificial intelligence|Machine Learning|NetWorking|Deep Learning|IOT|Football|Cricket|Automation Testing|Politics|Corona Virus|Bollywood|Digital Marketing|Climate Change|Economy|Corruption|Globalization|Satue Of Unity|Education|Environment|Social issue|Crypto Currency|Health Care|Cricket|IPL|Sport|Tourist|Software Engineer|Covid-19|Fresher Hiring|Jobs";
		Pattern p = Pattern.compile(regex , Pattern.CASE_INSENSITIVE);
		Matcher m  = p.matcher(tweet);
		
		if(m.find())
		{
			//System.out.println("Match is Found");
			//System.out.println(m.group());
                        return m.group();
		}
		else {
			//System.out.println("Match not Found");
                        return "Casual";
		}
		
        
    }
    
}
