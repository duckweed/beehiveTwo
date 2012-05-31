// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.beehivecoll.web;

import com.beehivecoll.domain.Circle;
import com.beehivecoll.domain.Person;
import com.beehivecoll.domain.UserRole;
import com.beehivecoll.web.PersonController;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PersonController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PersonController.create(@Valid Person person, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, person);
            return "people/create";
        }
        uiModel.asMap().clear();
        person.persist();
        return "redirect:/people/" + encodeUrlPathSegment(person.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PersonController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Person());
        return "people/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PersonController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("person", Person.findPerson(id));
        uiModel.addAttribute("itemId", id);
        return "people/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PersonController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("people", Person.findPersonEntries(firstResult, sizeNo));
            float nrOfPages = (float) Person.countPeople() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("people", Person.findAllPeople());
        }
        return "people/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PersonController.update(@Valid Person person, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, person);
            return "people/update";
        }
        uiModel.asMap().clear();
        person.merge();
        return "redirect:/people/" + encodeUrlPathSegment(person.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PersonController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Person.findPerson(id));
        return "people/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PersonController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Person person = Person.findPerson(id);
        person.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/people";
    }
    
    void PersonController.populateEditForm(Model uiModel, Person person) {
        uiModel.addAttribute("person", person);
        uiModel.addAttribute("circles", Circle.findAllCircles());
        uiModel.addAttribute("userroles", Arrays.asList(UserRole.values()));
    }
    
    String PersonController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
