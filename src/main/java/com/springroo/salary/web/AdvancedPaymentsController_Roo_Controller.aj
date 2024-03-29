// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.web;

import com.springroo.salary.domain.AdvancedPayments;
import com.springroo.salary.domain.Users;
import com.springroo.salary.web.AdvancedPaymentsController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AdvancedPaymentsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AdvancedPaymentsController.create(@Valid AdvancedPayments advancedPayments, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, advancedPayments);
            return "advancedpaymentses/create";
        }
        uiModel.asMap().clear();
        advancedPayments.persist();
        return "redirect:/advancedpaymentses/" + encodeUrlPathSegment(advancedPayments.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AdvancedPaymentsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AdvancedPayments());
        return "advancedpaymentses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AdvancedPaymentsController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("advancedpayments", AdvancedPayments.findAdvancedPayments(id));
        uiModel.addAttribute("itemId", id);
        return "advancedpaymentses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AdvancedPaymentsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("advancedpaymentses", AdvancedPayments.findAdvancedPaymentsEntries(firstResult, sizeNo));
            float nrOfPages = (float) AdvancedPayments.countAdvancedPaymentses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("advancedpaymentses", AdvancedPayments.findAllAdvancedPaymentses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "advancedpaymentses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AdvancedPaymentsController.update(@Valid AdvancedPayments advancedPayments, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, advancedPayments);
            return "advancedpaymentses/update";
        }
        uiModel.asMap().clear();
        advancedPayments.merge();
        return "redirect:/advancedpaymentses/" + encodeUrlPathSegment(advancedPayments.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AdvancedPaymentsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AdvancedPayments.findAdvancedPayments(id));
        return "advancedpaymentses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AdvancedPaymentsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AdvancedPayments advancedPayments = AdvancedPayments.findAdvancedPayments(id);
        advancedPayments.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/advancedpaymentses";
    }
    
    void AdvancedPaymentsController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("advancedPayments_amoutdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void AdvancedPaymentsController.populateEditForm(Model uiModel, AdvancedPayments advancedPayments) {
        uiModel.addAttribute("advancedPayments", advancedPayments);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("userses", Users.findAllUserses());
    }
    
    String AdvancedPaymentsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
