package com.springroo.salary.domain;

import javax.validation.ConstraintViolationException;
import org.junit.Test;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = AdvancedPayments.class)
	public class AdvancedPaymentsIntegrationTest {
		/*
		   @Test
		   public void testMarkerMethod() {
		   }
		 */
	@Test(expected = ConstraintViolationException.class) 	
	public void testAmount(){
			AdvancedPayments am = new AdvancedPayments();
			am.setAmount(1000.0f);
			am.persist();
			am.flush();
		} 
	@Test
	public void testReason(){
		AdvancedPayments am = new AdvancedPayments();
		String t1 = new	String();
		t1 = "haha";
		for(int i=1;i>=500;i++){
			t1 += "A";
		}
		am.setReason(t1);
		am.persist();
		am.flush();
	}
	
	@Test(expected=ConstraintViolationException.class )
	public void testNotNullReason(){
		AdvancedPayments am = new AdvancedPayments();
		am.setReason(null);
		am.persist();
		am.flush();
	}
		
	@Test(expected = ConstraintViolationException.class)
	public void testDateWrite(){
		AdvancedPayments am = new AdvancedPayments();
		am.setDateWrite(null);
		am.persist();
		am.flush();
	}
}
