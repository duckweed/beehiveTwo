// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.beehivecoll.domain;

import com.beehivecoll.domain.Circle;
import com.beehivecoll.domain.Person;
import com.beehivecoll.domain.UserRole;
import java.util.Set;

privileged aspect Person_Roo_JavaBean {
    
    public void Person.setUsername(String username) {
        this.username = username;
    }
    
    public String Person.getFirstname() {
        return this.firstname;
    }
    
    public void Person.setFirstname(String firstname) {
        this.firstname = firstname;
    }
    
    public String Person.getLastname() {
        return this.lastname;
    }
    
    public void Person.setLastname(String lastname) {
        this.lastname = lastname;
    }
    
    public void Person.setPassword(String password) {
        this.password = password;
    }
    
    public UserRole Person.getUserRole() {
        return this.userRole;
    }
    
    public void Person.setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }
    
    public String Person.getBio() {
        return this.bio;
    }
    
    public void Person.setBio(String bio) {
        this.bio = bio;
    }
    
    public String Person.getEmail() {
        return this.email;
    }
    
    public void Person.setEmail(String email) {
        this.email = email;
    }
    
    public Set<Circle> Person.getCircles() {
        return this.circles;
    }
    
    public void Person.setCircles(Set<Circle> circles) {
        this.circles = circles;
    }
    
}
