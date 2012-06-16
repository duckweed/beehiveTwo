package com.beehivecoll.web;

import com.beehivecoll.domain.Person;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.openid.OpenIDAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@RequestMapping("/people")
@Controller
@RooWebScaffold(path = "people", formBackingObject = Person.class)
public class PersonController {

  @RequestMapping(params = "updateUser", produces = "text/html")
  public String updateUser(Principal principal, Model uiModel) {
    populateEditForm(uiModel, (Person) ((OpenIDAuthenticationToken)principal).getPrincipal());
    return "people/update";
  }

}
