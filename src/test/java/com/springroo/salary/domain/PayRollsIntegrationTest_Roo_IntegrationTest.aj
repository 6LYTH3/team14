// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.PayRolls;
import com.springroo.salary.domain.PayRollsDataOnDemand;
import com.springroo.salary.domain.PayRollsIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PayRollsIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PayRollsIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PayRollsIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PayRollsIntegrationTest: @Transactional;
    
    @Autowired
    private PayRollsDataOnDemand PayRollsIntegrationTest.dod;
    
    @Test
    public void PayRollsIntegrationTest.testCountPayRollses() {
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", dod.getRandomPayRolls());
        long count = PayRolls.countPayRollses();
        Assert.assertTrue("Counter for 'PayRolls' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PayRollsIntegrationTest.testFindPayRolls() {
        PayRolls obj = dod.getRandomPayRolls();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to provide an identifier", id);
        obj = PayRolls.findPayRolls(id);
        Assert.assertNotNull("Find method for 'PayRolls' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PayRolls' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PayRollsIntegrationTest.testFindAllPayRollses() {
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", dod.getRandomPayRolls());
        long count = PayRolls.countPayRollses();
        Assert.assertTrue("Too expensive to perform a find all test for 'PayRolls', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PayRolls> result = PayRolls.findAllPayRollses();
        Assert.assertNotNull("Find all method for 'PayRolls' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PayRolls' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PayRollsIntegrationTest.testFindPayRollsEntries() {
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", dod.getRandomPayRolls());
        long count = PayRolls.countPayRollses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PayRolls> result = PayRolls.findPayRollsEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PayRolls' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PayRolls' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PayRollsIntegrationTest.testFlush() {
        PayRolls obj = dod.getRandomPayRolls();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to provide an identifier", id);
        obj = PayRolls.findPayRolls(id);
        Assert.assertNotNull("Find method for 'PayRolls' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPayRolls(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'PayRolls' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PayRollsIntegrationTest.testMergeUpdate() {
        PayRolls obj = dod.getRandomPayRolls();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to provide an identifier", id);
        obj = PayRolls.findPayRolls(id);
        boolean modified =  dod.modifyPayRolls(obj);
        Integer currentVersion = obj.getVersion();
        PayRolls merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'PayRolls' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PayRollsIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", dod.getRandomPayRolls());
        PayRolls obj = dod.getNewTransientPayRolls(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PayRolls' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'PayRolls' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PayRollsIntegrationTest.testRemove() {
        PayRolls obj = dod.getRandomPayRolls();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PayRolls' failed to provide an identifier", id);
        obj = PayRolls.findPayRolls(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'PayRolls' with identifier '" + id + "'", PayRolls.findPayRolls(id));
    }
    
}
