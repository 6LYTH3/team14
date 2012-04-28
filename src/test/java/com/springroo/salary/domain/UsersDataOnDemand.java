package com.springroo.salary.domain;
import java.util.Random;
import org.springframework.roo.addon.dod.RooDataOnDemand;

@RooDataOnDemand(entity = Users.class)
public class UsersDataOnDemand {
	 public void setIds(Users obj, int index) {
        	String ids = "1234567" + index;
		if ( ids.length() > 8 ) {
			ids = new Random().nextInt(10) + ids.substring(1,8);
		}	
        	obj.setIds(ids);
	}    
	
	 public void setUserName(Users obj, int index) {
        String userName = "ABCDE";
		if( userName.length() > 5){
			userName.substring(0,5);
		}
        obj.setUserName(userName);
    }
  
}
