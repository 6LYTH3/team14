package com.springroo.salary.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findUsersesByIdsEquals", "findUsersesByUserNameEquals" })
public class Users {

//    @NotNull
    private String ids;

    @NotNull
    @Size(min = 5)
    private String userName;

    @NotNull
    private String positions;
}
