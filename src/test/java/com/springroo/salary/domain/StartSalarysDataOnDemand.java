package com.springroo.salary.domain;

import org.springframework.roo.addon.dod.RooDataOnDemand;

@RooDataOnDemand(entity = StartSalarys.class)
public class StartSalarysDataOnDemand {

     public void setTax(StartSalarys obj, int index) {
        float tax = 101F ;
	if ( tax < 100 || tax > -1 ){
        obj.setTax(tax);
   	 }
     } 

     public void setWithdraw(StartSalarys obj, int index) {
        float withdraw = 00.0F;
	if( withdraw > 0 || withdraw < 20000){
        obj.setWithdraw(withdraw);
	}
     }
   
}
