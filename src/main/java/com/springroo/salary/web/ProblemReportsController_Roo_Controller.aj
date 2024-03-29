// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.web;

import com.springroo.salary.domain.ProblemChoices;
import com.springroo.salary.domain.ProblemReports;
import com.springroo.salary.domain.ProblemStatus;
import com.springroo.salary.domain.Users;
import com.springroo.salary.web.ProblemReportsController;
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

privileged aspect ProblemReportsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProblemReportsController.create(@Valid ProblemReports problemReports, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, problemReports);
            return "problemreportses/create";
        }
        uiModel.asMap().clear();
        problemReports.persist();
        return "redirect:/problemreportses/" + encodeUrlPathSegment(problemReports.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProblemReportsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProblemReports());
        return "problemreportses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProblemReportsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("problemreports", ProblemReports.findProblemReports(id));
        uiModel.addAttribute("itemId", id);
        return "problemreportses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProblemReportsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("problemreportses", ProblemReports.findProblemReportsEntries(firstResult, sizeNo));
            float nrOfPages = (float) ProblemReports.countProblemReportses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("problemreportses", ProblemReports.findAllProblemReportses());
        }
        return "problemreportses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProblemReportsController.update(@Valid ProblemReports problemReports, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, problemReports);
            return "problemreportses/update";
        }
        uiModel.asMap().clear();
        problemReports.merge();
        return "redirect:/problemreportses/" + encodeUrlPathSegment(problemReports.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProblemReportsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ProblemReports.findProblemReports(id));
        return "problemreportses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProblemReportsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProblemReports problemReports = ProblemReports.findProblemReports(id);
        problemReports.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/problemreportses";
    }
    
    void ProblemReportsController.populateEditForm(Model uiModel, ProblemReports problemReports) {
        uiModel.addAttribute("problemReports", problemReports);
        uiModel.addAttribute("problemchoiceses", Arrays.asList(ProblemChoices.values()));
        uiModel.addAttribute("problemstatuses", Arrays.asList(ProblemStatus.values()));
        uiModel.addAttribute("userses", Users.findAllUserses());
    }
    
    String ProblemReportsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
