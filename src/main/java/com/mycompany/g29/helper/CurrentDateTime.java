package com.mycompany.g29.helper;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    

public class CurrentDateTime {

    public static String getDateTime()
    {
         LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String formattedDate = myDateObj.format(myFormatObj);
	   

	  return formattedDate;
       
    }
}
