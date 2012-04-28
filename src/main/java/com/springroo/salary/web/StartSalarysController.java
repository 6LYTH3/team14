package com.springroo.salary.web;

import com.springroo.salary.domain.StartSalarys;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/startsalaryses")
@Controller
@RooWebScaffold(path = "startsalaryses", formBackingObject = StartSalarys.class)
@RooWebFinder
public class StartSalarysController {
}
