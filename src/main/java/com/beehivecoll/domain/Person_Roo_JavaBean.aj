// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.beehivecoll.domain;

import java.util.Set;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getFirstName() {
        return this.firstName;
    }
    
    public void Person.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Person.getLastName() {
        return this.lastName;
    }
    
    public void Person.setLastName(String lastName) {
        this.lastName = lastName;
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
