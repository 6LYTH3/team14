// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.Users;
import com.springroo.salary.domain.UsersDataOnDemand;
import com.springroo.salary.domain.UsersIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UsersIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UsersIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UsersIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UsersIntegrationTest: @Transactional;
    
    @Autowired
    private UsersDataOnDemand UsersIntegrationTest.dod;
    
    @Test
    public void UsersIntegrationTest.testCountUserses() {
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", dod.getRandomUsers());
        long count = Users.countUserses();
        Assert.assertTrue("Counter for 'Users' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UsersIntegrationTest.testFindUsers() {
        Users obj = dod.getRandomUsers();
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Users' failed to provide an identifier", id);
        obj = Users.findUsers(id);
        Assert.assertNotNull("Find method for 'Users' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Users' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UsersIntegrationTest.testFindAllUserses() {
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", dod.getRandomUsers());
        long count = Users.countUserses();
        Assert.assertTrue("Too expensive to perform a find all test for 'Users', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Users> result = Users.findAllUserses();
        Assert.assertNotNull("Find all method for 'Users' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Users' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UsersIntegrationTest.testFindUsersEntries() {
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", dod.getRandomUsers());
        long count = Users.countUserses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Users> result = Users.findUsersEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Users' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Users' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UsersIntegrationTest.testFlush() {
        Users obj = dod.getRandomUsers();
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Users' failed to provide an identifier", id);
        obj = Users.findUsers(id);
        Assert.assertNotNull("Find method for 'Users' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUsers(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Users' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UsersIntegrationTest.testMergeUpdate() {
        Users obj = dod.getRandomUsers();
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Users' failed to provide an identifier", id);
        obj = Users.findUsers(id);
        boolean modified =  dod.modifyUsers(obj);
        Integer currentVersion = obj.getVersion();
        Users merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Users' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UsersIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", dod.getRandomUsers());
        Users obj = dod.getNewTransientUsers(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Users' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Users' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Users' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UsersIntegrationTest.testRemove() {
        Users obj = dod.getRandomUsers();
        Assert.assertNotNull("Data on demand for 'Users' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Users' failed to provide an identifier", id);
        obj = Users.findUsers(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Users' with identifier '" + id + "'", Users.findUsers(id));
    }
    
}
