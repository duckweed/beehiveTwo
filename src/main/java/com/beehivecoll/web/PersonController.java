package com.beehivecoll.web;

import com.beehivecoll.domain.Person;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/people")
@Controller
@RooWebScaffold(path = "people", formBackingObject = Person.class)
public class PersonController {
}
