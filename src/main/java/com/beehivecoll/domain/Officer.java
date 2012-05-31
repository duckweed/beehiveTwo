package com.beehivecoll.domain;

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
public class Officer {

    @NotNull
    @Size(min = 5, max = 20)
    private String Title;

    @Size(max = 20)
    private String description;

    @Size(max = 1024)
    private String responsibility;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Person> holder = new HashSet<Person>();
}
