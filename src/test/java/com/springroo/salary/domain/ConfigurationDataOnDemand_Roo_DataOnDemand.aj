// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.Configuration;
import com.springroo.salary.domain.ConfigurationDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ConfigurationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ConfigurationDataOnDemand: @Component;
    
    private Random ConfigurationDataOnDemand.rnd = new SecureRandom();
    
    private List<Configuration> ConfigurationDataOnDemand.data;
    
    public Configuration ConfigurationDataOnDemand.getNewTransientConfiguration(int index) {
        Configuration obj = new Configuration();
        setApproveWithdraw(obj, index);
        setResetSalary(obj, index);
        return obj;
    }
    
    public void ConfigurationDataOnDemand.setApproveWithdraw(Configuration obj, int index) {
        Boolean approveWithdraw = Boolean.TRUE;
        obj.setApproveWithdraw(approveWithdraw);
    }
    
    public void ConfigurationDataOnDemand.setResetSalary(Configuration obj, int index) {
        Boolean resetSalary = Boolean.TRUE;
        obj.setResetSalary(resetSalary);
    }
    
    public Configuration ConfigurationDataOnDemand.getSpecificConfiguration(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Configuration obj = data.get(index);
        Long id = obj.getId();
        return Configuration.findConfiguration(id);
    }
    
    public Configuration ConfigurationDataOnDemand.getRandomConfiguration() {
        init();
        Configuration obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Configuration.findConfiguration(id);
    }
    
    public boolean ConfigurationDataOnDemand.modifyConfiguration(Configuration obj) {
        return false;
    }
    
    public void ConfigurationDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Configuration.findConfigurationEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Configuration' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Configuration>();
        for (int i = 0; i < 10; i++) {
            Configuration obj = getNewTransientConfiguration(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
