package com.beehivecoll;

import com.beehivecoll.domain.Person;
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
public class Circle {

    @NotNull
    @Size(min = 5, max = 50)
    private String name;

    @NotNull
    @Size(max = 1024)
    private String description;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Person> persons = new HashSet<Person>();
}
