// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.beehivecoll.domain;

import com.beehivecoll.domain.Circle;
import com.beehivecoll.domain.Person;
import com.beehivecoll.domain.UserRole;
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
    
    public String Person.getOpenIdIdentifier() {
        return this.openIdIdentifier;
    }
    
    public void Person.setOpenIdIdentifier(String openIdIdentifier) {
        this.openIdIdentifier = openIdIdentifier;
    }
    
    public Set<Circle> Person.getCircles() {
        return this.circles;
    }
    
    public void Person.setCircles(Set<Circle> circles) {
        this.circles = circles;
    }
    
}
