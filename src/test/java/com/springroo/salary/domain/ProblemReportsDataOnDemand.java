package com.springroo.salary.domain;

import org.springframework.roo.addon.dod.RooDataOnDemand;
import java.util.Random;

@RooDataOnDemand(entity = ProblemReports.class)
	public class ProblemReportsDataOnDemand {

		public void setTopic(ProblemReports obj, int index) {
			String topic = "test input in topic field" + index;
			obj.setTopic(topic);
		}

		public void setMessages(ProblemReports obj, int index) {
			//String messages = "test input in message field" + index;
			String messages = "test in put in message field";
			if (messages.length() > 500) {
				messages = messages.substring(0, 500);
			}
			obj.setMessages(messages);
		}

	}
