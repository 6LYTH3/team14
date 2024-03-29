// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.web;

import com.springroo.salary.domain.Months;
import com.springroo.salary.domain.PayRolls;
import com.springroo.salary.web.PayRollsController;
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

privileged aspect PayRollsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PayRollsController.create(@Valid PayRolls payRolls, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, payRolls);
            return "payrollses/create";
        }
        uiModel.asMap().clear();
        payRolls.persist();
        return "redirect:/payrollses/" + encodeUrlPathSegment(payRolls.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PayRollsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PayRolls());
        return "payrollses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PayRollsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("payrolls", PayRolls.findPayRolls(id));
        uiModel.addAttribute("itemId", id);
        return "payrollses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PayRollsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("payrollses", PayRolls.findPayRollsEntries(firstResult, sizeNo));
            float nrOfPages = (float) PayRolls.countPayRollses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("payrollses", PayRolls.findAllPayRollses());
        }
        return "payrollses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PayRollsController.update(@Valid PayRolls payRolls, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, payRolls);
            return "payrollses/update";
        }
        uiModel.asMap().clear();
        payRolls.merge();
        return "redirect:/payrollses/" + encodeUrlPathSegment(payRolls.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PayRollsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, PayRolls.findPayRolls(id));
        return "payrollses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PayRollsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PayRolls payRolls = PayRolls.findPayRolls(id);
        payRolls.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/payrollses";
    }
    
    void PayRollsController.populateEditForm(Model uiModel, PayRolls payRolls) {
        uiModel.addAttribute("payRolls", payRolls);
        uiModel.addAttribute("monthses", Arrays.asList(Months.values()));
    }
    
    String PayRollsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
