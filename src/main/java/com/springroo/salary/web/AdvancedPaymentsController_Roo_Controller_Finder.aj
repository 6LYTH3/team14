// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springroo.salary.web;

import com.springroo.salary.domain.AdvancedPayments;
import com.springroo.salary.domain.Users;
import com.springroo.salary.web.AdvancedPaymentsController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AdvancedPaymentsController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByDateWriteEquals", "form" }, method = RequestMethod.GET)
    public String AdvancedPaymentsController.findAdvancedPaymentsesByDateWriteEqualsForm(Model uiModel) {
        return "advancedpaymentses/findAdvancedPaymentsesByDateWriteEquals";
    }
    
    @RequestMapping(params = "find=ByDateWriteEquals", method = RequestMethod.GET)
    public String AdvancedPaymentsController.findAdvancedPaymentsesByDateWriteEquals(@RequestParam("dateWrite") String dateWrite, Model uiModel) {
        uiModel.addAttribute("advancedpaymentses", AdvancedPayments.findAdvancedPaymentsesByDateWriteEquals(dateWrite).getResultList());
        return "advancedpaymentses/list";
    }
    
    @RequestMapping(params = { "find=ByPid", "form" }, method = RequestMethod.GET)
    public String AdvancedPaymentsController.findAdvancedPaymentsesByPidForm(Model uiModel) {
        uiModel.addAttribute("userses", Users.findAllUserses());
        return "advancedpaymentses/findAdvancedPaymentsesByPid";
    }
    
    @RequestMapping(params = "find=ByPid", method = RequestMethod.GET)
    public String AdvancedPaymentsController.findAdvancedPaymentsesByPid(@RequestParam("pid") Users pid, Model uiModel) {
        uiModel.addAttribute("advancedpaymentses", AdvancedPayments.findAdvancedPaymentsesByPid(pid).getResultList());
        return "advancedpaymentses/list";
    }
    
}