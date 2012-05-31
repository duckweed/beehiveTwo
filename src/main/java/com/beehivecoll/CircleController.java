package com.beehivecoll;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/circles")
@Controller
@RooWebScaffold(path = "circles", formBackingObject = Circle.class)
public class CircleController {
}
