package com.springroo.salary.domain;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;
import javax.validation.ConstraintViolationException;
import javax.validation.*;

@RooIntegrationTest(entity = Users.class)
public class UsersIntegrationTest {

    @Test(expected = ConstraintViolationException.class)
    public void testLenght_ids7() {
	    Users obj = new Users();
	    obj.setIds("1234567");
	    obj.persist();
	    obj.flush();
    }

    @Test(expected = ConstraintViolationException.class)
    public void testLenght_ids9() {
	    Users obj = new Users();
	    obj.setIds("123456789");
	    obj.persist();
	    obj.flush();
    }    
	
	@Test(expected = ConstraintViolationException.class)
    public void testLenght_Name4() {
	    Users obj = new Users();
	    obj.setUserName("ABCD");
	    obj.persist();
	    obj.flush();
    }

    @Test(expected = ConstraintViolationException.class)
    public void tesrLenght_Name6() {
	    Users obj = new Users();
	    obj.setUserName("ABCDEF");
	    obj.persist();
	    obj.flush();
    }    
}
