// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.Months;
import com.springroo.salary.domain.PayRolls;
import com.springroo.salary.domain.PayRollsDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect PayRollsDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PayRollsDataOnDemand: @Component;
    
    private Random PayRollsDataOnDemand.rnd = new SecureRandom();
    
    private List<PayRolls> PayRollsDataOnDemand.data;
    
    public PayRolls PayRollsDataOnDemand.getNewTransientPayRolls(int index) {
        PayRolls obj = new PayRolls();
        setBonus(obj, index);
        setIds(obj, index);
        setPTax(obj, index);
        setPayPerMonth(obj, index);
        setPayTotal(obj, index);
        return obj;
    }
    
    public void PayRollsDataOnDemand.setBonus(PayRolls obj, int index) {
        Float bonus = new Integer(index).floatValue();
        obj.setBonus(bonus);
    }
    
    public void PayRollsDataOnDemand.setIds(PayRolls obj, int index) {
        String ids = "ids_" + index;
        obj.setIds(ids);
    }
    
    public void PayRollsDataOnDemand.setPTax(PayRolls obj, int index) {
        Float pTax = new Integer(index).floatValue();
        obj.setPTax(pTax);
    }
    
    public void PayRollsDataOnDemand.setPayPerMonth(PayRolls obj, int index) {
        Months payPerMonth = Months.class.getEnumConstants()[0];
        obj.setPayPerMonth(payPerMonth);
    }
    
    public void PayRollsDataOnDemand.setPayTotal(PayRolls obj, int index) {
        String payTotal = "payTotal_" + index;
        obj.setPayTotal(payTotal);
    }
    
    public PayRolls PayRollsDataOnDemand.getSpecificPayRolls(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PayRolls obj = data.get(index);
        Long id = obj.getId();
        return PayRolls.findPayRolls(id);
    }
    
    public PayRolls PayRollsDataOnDemand.getRandomPayRolls() {
        init();
        PayRolls obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return PayRolls.findPayRolls(id);
    }
    
    public boolean PayRollsDataOnDemand.modifyPayRolls(PayRolls obj) {
        return false;
    }
    
    public void PayRollsDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = PayRolls.findPayRollsEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PayRolls' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PayRolls>();
        for (int i = 0; i < 10; i++) {
            PayRolls obj = getNewTransientPayRolls(i);
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