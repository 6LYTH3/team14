package com.springroo.salary.domain;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;
import javax.validation.ConstraintViolationException;
import javax.validation.*;

@RooIntegrationTest(entity = StartSalarys.class)
public class StartSalarysIntegrationTest {

    @Test(expected = ConstraintViolationException.class)
    public void testTax_less_zero() {
	    StartSalarys obj = new StartSalarys();
            obj.setTax(-1.0F);
	    obj.persist();
	    obj.flush();
    }
    @Test(expected = ConstraintViolationException.class)
    public void testTax_more_100() {
	    StartSalarys obj = new StartSalarys();
            obj.setTax(101F);
	    obj.persist();
	    obj.flush();
    }
    @Test(expected = ConstraintViolationException.class)
    public void testWithdraw_less_0() {
	    StartSalarys obj = new StartSalarys();
            obj.setWithdraw(-1F);
	    obj.persist();
	    obj.flush();
    }
    @Test(expected = ConstraintViolationException.class)
    public void testWithdraw_more_100() {
	    StartSalarys obj = new StartSalarys();
            obj.setWithdraw(20001F);
	    obj.persist();
	    obj.flush();
     }
}
