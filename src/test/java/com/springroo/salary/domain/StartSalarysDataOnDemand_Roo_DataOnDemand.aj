// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.StartSalarys;
import com.springroo.salary.domain.StartSalarysDataOnDemand;
import com.springroo.salary.domain.Users;
import com.springroo.salary.domain.UsersDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect StartSalarysDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StartSalarysDataOnDemand: @Component;
    
    private Random StartSalarysDataOnDemand.rnd = new SecureRandom();
    
    private List<StartSalarys> StartSalarysDataOnDemand.data;
    
    @Autowired
    private UsersDataOnDemand StartSalarysDataOnDemand.usersDataOnDemand;
    
    public StartSalarys StartSalarysDataOnDemand.getNewTransientStartSalarys(int index) {
        StartSalarys obj = new StartSalarys();
        setBonus(obj, index);
        setDateConf(obj, index);
        setIds(obj, index);
        setSalaryDefualt(obj, index);
        setTax(obj, index);
        setTotal(obj, index);
        setWithdraw(obj, index);
        return obj;
    }
    
    public void StartSalarysDataOnDemand.setBonus(StartSalarys obj, int index) {
        Float bonus = new Integer(index).floatValue();
        obj.setBonus(bonus);
    }
    
    public void StartSalarysDataOnDemand.setDateConf(StartSalarys obj, int index) {
        String dateConf = "dateConf_" + index;
        obj.setDateConf(dateConf);
    }
    
    public void StartSalarysDataOnDemand.setIds(StartSalarys obj, int index) {
        Users ids = usersDataOnDemand.getRandomUsers();
        obj.setIds(ids);
    }
    
    public void StartSalarysDataOnDemand.setSalaryDefualt(StartSalarys obj, int index) {
        Float salaryDefualt = new Integer(index).floatValue();
        obj.setSalaryDefualt(salaryDefualt);
    }
    
    public void StartSalarysDataOnDemand.setTotal(StartSalarys obj, int index) {
        Float total = new Integer(index).floatValue();
        obj.setTotal(total);
    }
    
    public StartSalarys StartSalarysDataOnDemand.getSpecificStartSalarys(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        StartSalarys obj = data.get(index);
        Long id = obj.getId();
        return StartSalarys.findStartSalarys(id);
    }
    
    public StartSalarys StartSalarysDataOnDemand.getRandomStartSalarys() {
        init();
        StartSalarys obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return StartSalarys.findStartSalarys(id);
    }
    
    public boolean StartSalarysDataOnDemand.modifyStartSalarys(StartSalarys obj) {
        return false;
    }
    
    public void StartSalarysDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = StartSalarys.findStartSalarysEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'StartSalarys' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<StartSalarys>();
        for (int i = 0; i < 10; i++) {
            StartSalarys obj = getNewTransientStartSalarys(i);
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
