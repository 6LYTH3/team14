package com.springroo.salary.web;

import com.springroo.salary.domain.AdvancedPayments;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/advancedpaymentses")
@Controller
@RooWebScaffold(path = "advancedpaymentses", formBackingObject = AdvancedPayments.class)
@RooWebFinder
public class AdvancedPaymentsController {
}
