package com.springroo.salary.domain;

import java.util.Random;
import org.springframework.roo.addon.dod.RooDataOnDemand;

@RooDataOnDemand(entity = AdvancedPayments.class)
	public class AdvancedPaymentsDataOnDemand {
		
	public void setAmount(AdvancedPayments obj, int index) {
		Float amount = new Integer(index).floatValue();
		obj.setAmount(amount);
	}

	public void setReason(AdvancedPayments obj, int index) {
	        String reason = "reason_" + index;
	        if (reason.length() > 300) {
	            reason = reason.substring(0, 300);
	        }
	        obj.setReason(reason);
	}
	
	public void setDateWrite(AdvancedPayments obj, int index) {
	        String dateWrite = "dateWrite_" + index;
	        obj.setDateWrite(dateWrite);
	 }
}

