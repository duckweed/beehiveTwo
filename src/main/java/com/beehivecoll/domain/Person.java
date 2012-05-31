package com.beehivecoll.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Person {

    @NotNull
    private String firstName;

    private String lastName;

    private String email;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Circle> circles = new HashSet<Circle>();
}
