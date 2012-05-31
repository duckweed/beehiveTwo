package com.beehivecoll.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPeopleByOpenIdIdentifier" })
public class Person implements UserDetails {

    @NotNull
    @Size(min = 5, max = 20)
    private String username;

    private String firstName;

    private String lastName;

    private String password;

    @NotNull
    private UserRole userRole = UserRole.ROLE_USER;

    private String bio;

    private String email;

    @Column(name = "openid_identifier")
    private String openIdIdentifier;
    //    private Date creation = new Date();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Circle> circles = new HashSet<Circle>();


    @Override
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    @Override
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    @Override
    public boolean isAccountNonExpired() {
        return true;
    }


    @Override
    public boolean isAccountNonLocked() {
        return true;
    }


    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }


    @Override
    public boolean isEnabled() {
        return true;
    }


    @Override
    public Collection getAuthorities() {
        Collection grantedAuthorities = new HashSet();
        grantedAuthorities.add(new GrantedAuthorityImpl(this.userRole.name()));
        return grantedAuthorities;
    }

}
