// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.beehivecoll.domain;

import com.beehivecoll.domain.Circle;
import com.beehivecoll.domain.CircleController;
import com.beehivecoll.domain.Officer;
import com.beehivecoll.domain.Person;
import java.io.UnsupportedEncodingException;
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

privileged aspect CircleController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CircleController.create(@Valid Circle circle, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, circle);
            return "circles/create";
        }
        uiModel.asMap().clear();
        circle.persist();
        return "redirect:/circles/" + encodeUrlPathSegment(circle.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CircleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Circle());
        return "circles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CircleController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("circle", Circle.findCircle(id));
        uiModel.addAttribute("itemId", id);
        return "circles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CircleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("circles", Circle.findCircleEntries(firstResult, sizeNo));
            float nrOfPages = (float) Circle.countCircles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("circles", Circle.findAllCircles());
        }
        return "circles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CircleController.update(@Valid Circle circle, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, circle);
            return "circles/update";
        }
        uiModel.asMap().clear();
        circle.merge();
        return "redirect:/circles/" + encodeUrlPathSegment(circle.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CircleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Circle.findCircle(id));
        return "circles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CircleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Circle circle = Circle.findCircle(id);
        circle.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/circles";
    }
    
    void CircleController.populateEditForm(Model uiModel, Circle circle) {
        uiModel.addAttribute("circle", circle);
        uiModel.addAttribute("officers", Officer.findAllOfficers());
        uiModel.addAttribute("people", Person.findAllPeople());
    }
    
    String CircleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
