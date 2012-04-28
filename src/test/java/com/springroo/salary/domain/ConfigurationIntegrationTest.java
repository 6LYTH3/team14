package com.springroo.salary.domain;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Configuration.class)
	public class ConfigurationIntegrationTest {

		@Test
			public void testBooleanTrue(){
				Configuration config = new Configuration();
				Assert.assertTrue(config.getResetSalary());
				config.persist();
				config.flush();
			}
		@Test
			public void testBooleanNull(){
				Configuration config = new Configuration();
				Assert.assertNotNull(config.getResetSalary());
				config.persist();
				config.flush();
			}


//		@Test
//			public void testResetValue(){
//				Configuration config = new Configuration();
//				config.setResetSalary(true);
//				List<StartSalarys> salaryList = StartSalarys.findAllStartSala    ryses();
//				float[] withdrawArray = new float[salaryList.size()];
//				float[] bonusArray = new float[salaryList.size()];
//				float[] zeroArray = new float[salaryList.size()];
//				for(int i=0; i<salaryList.size(); i++){
//					withdrawArray[i] = salaryList.get(i).getWithdraw();
//					bonusArray[i] = salaryList.get(i).getBonus();
//					zeroArray[i] = 99.0f;
//				}
//				Assert.assertTrue(config.getResetSalary());
//				Assert.assertArrayEquals(zeroArray, withdrawArray, 0);
//				Assert.assertArrayEquals(zeroArray, bonusArray, 0);
//			}


		//    @Test
		//    public void testMarkerMethod() {
		//    }
	}
