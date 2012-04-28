package com.springroo.salary.web;

import com.springroo.salary.domain.ProblemReports;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/problemreportses")
@Controller
@RooWebScaffold(path = "problemreportses", formBackingObject = ProblemReports.class)
@RooWebFinder
public class ProblemReportsController {
}
