package com.springroo.salary.domain;
import static org.junit.Assert.assertNotNull;

import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = ProblemReports.class)
public class ProblemReportsIntegrationTest {

	@Test(expected = ConstraintViolationException.class)
    public void InputTopicOnlyNumber() {
        ProblemReports p = new ProblemReports();
        p.setTopic("1234");
        p.persist();
        p.flush();
    }
	@Test(expected = ConstraintViolationException.class)
    public void emptyTopicInput() {
        ProblemReports p = new ProblemReports();
        p.setTopic("");
        p.persist();
        p.flush();
    }


	@Test(expected = ConstraintViolationException.class)
    public void InputMessagesOnlyNumber() {
        ProblemReports p = new ProblemReports();
        p.setMessages("1234");
        p.persist();
        p.flush();
    }
	@Test(expected = ConstraintViolationException.class)
    public void emptyMessageInput() {
        ProblemReports p = new ProblemReports();
        p.setMessages("");
        p.persist();
        p.flush();
    }
	@Test(expected = java.lang.AssertionError.class)
	public void testNullNameInput() {
		ProblemReports p = new ProblemReports();
		assertNotNull(p.getName());
		p.persist();
		p.flush();
		
	}
//    @Test
//    public void testMarkerMethod() {
//    }
}
