// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.AdvancedPayments;
import com.springroo.salary.domain.Users;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect AdvancedPayments_Roo_Finder {
    
    public static TypedQuery<AdvancedPayments> AdvancedPayments.findAdvancedPaymentsesByDateWriteEquals(String dateWrite) {
        if (dateWrite == null || dateWrite.length() == 0) throw new IllegalArgumentException("The dateWrite argument is required");
        EntityManager em = AdvancedPayments.entityManager();
        TypedQuery<AdvancedPayments> q = em.createQuery("SELECT o FROM AdvancedPayments AS o WHERE o.dateWrite = :dateWrite", AdvancedPayments.class);
        q.setParameter("dateWrite", dateWrite);
        return q;
    }
    
    public static TypedQuery<AdvancedPayments> AdvancedPayments.findAdvancedPaymentsesByPid(Users pid) {
        if (pid == null) throw new IllegalArgumentException("The pid argument is required");
        EntityManager em = AdvancedPayments.entityManager();
        TypedQuery<AdvancedPayments> q = em.createQuery("SELECT o FROM AdvancedPayments AS o WHERE o.pid = :pid", AdvancedPayments.class);
        q.setParameter("pid", pid);
        return q;
    }
    
}
