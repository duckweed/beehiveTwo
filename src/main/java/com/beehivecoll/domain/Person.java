package com.beehivecoll.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Person {

    @NotNull
    @Size(min = 5, max = 20)
    private String firstName;
    private String lastName;
    private String bio;
    private String email;
    private Date creation;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Circle> circles = new HashSet<Circle>();
}
