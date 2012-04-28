package com.springroo.salary.web;

import com.springroo.salary.domain.PayRolls;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/payrollses")
@Controller
@RooWebScaffold(path = "payrollses", formBackingObject = PayRolls.class)
@RooWebFinder
public class PayRollsController {
}
