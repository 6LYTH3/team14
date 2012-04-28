// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.PayRolls;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PayRolls_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PayRolls.entityManager;
    
    public static final EntityManager PayRolls.entityManager() {
        EntityManager em = new PayRolls().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PayRolls.countPayRollses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PayRolls o", Long.class).getSingleResult();
    }
    
    public static List<PayRolls> PayRolls.findAllPayRollses() {
        return entityManager().createQuery("SELECT o FROM PayRolls o", PayRolls.class).getResultList();
    }
    
    public static PayRolls PayRolls.findPayRolls(Long id) {
        if (id == null) return null;
        return entityManager().find(PayRolls.class, id);
    }
    
    public static List<PayRolls> PayRolls.findPayRollsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PayRolls o", PayRolls.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PayRolls.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PayRolls.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PayRolls attached = PayRolls.findPayRolls(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PayRolls.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PayRolls.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PayRolls PayRolls.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PayRolls merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}