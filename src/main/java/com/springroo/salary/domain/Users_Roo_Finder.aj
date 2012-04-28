// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.domain;

import com.springroo.salary.domain.Users;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Users_Roo_Finder {
    
    public static TypedQuery<Users> Users.findUsersesByIdsEquals(String ids) {
        if (ids == null || ids.length() == 0) throw new IllegalArgumentException("The ids argument is required");
        EntityManager em = Users.entityManager();
        TypedQuery<Users> q = em.createQuery("SELECT o FROM Users AS o WHERE o.ids = :ids", Users.class);
        q.setParameter("ids", ids);
        return q;
    }
    
    public static TypedQuery<Users> Users.findUsersesByUserNameEquals(String userName) {
        if (userName == null || userName.length() == 0) throw new IllegalArgumentException("The userName argument is required");
        EntityManager em = Users.entityManager();
        TypedQuery<Users> q = em.createQuery("SELECT o FROM Users AS o WHERE o.userName = :userName", Users.class);
        q.setParameter("userName", userName);
        return q;
    }
    
}