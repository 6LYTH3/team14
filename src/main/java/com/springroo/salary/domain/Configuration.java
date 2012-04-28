package com.springroo.salary.domain;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Configuration {


		@Value("true")
	private Boolean resetSalary;
		
		 @Value("false")
    private Boolean approveWithdraw;

	public void clearList(){
		List<StartSalarys> salaryList = StartSalarys.findAllStartSalaryses()    ;
		for(int i=0; i<salaryList.size(); i++){
			salaryList.get(i).setWithdraw(0f);
			salaryList.get(i).setBonus(0f);
		}
	}
	public void setResetSalary(Boolean resetSalary) {
		if(resetSalary.equals(true)) clearList();
		this.resetSalary = resetSalary;
	}
	
	 public void payWithdraw() {
    	List<StartSalarys> salaryList = StartSalarys.findAllStartSalaryses();
    	List<AdvancedPayments> adPayList = AdvancedPayments.findAllAdvancedPaymentses();
    	
    	for(int i=0; i<salaryList.size(); i++){
		String sly = salaryList.get(i).getIds().getIds().trim();
		String apl = adPayList.get(i).getPid().getIds().trim();
		String monthAp = adPayList.get(i).getDateWrite().toString();
		String monthNow = months();
		if((sly.compareTo(apl)==0) && adPayList.get(i).getApprove()){
			//if(monthAp.equals(monthNow))
				salaryList.get(i).setWithdraw(adPayList.get(i).getAmount());
			}
		}
    }
    
    private String months() {
        Date dateNow = new Date();
        SimpleDateFormat dateformatDDMMYYYY = new SimpleDateFormat("MMM dd, yyyy");
        StringBuilder dateformat = new StringBuilder(dateformatDDMMYYYY.format(dateNow));
        return dateformat.toString();
    }
     public void setApproveWithdraw(Boolean approveWithdraw) {
    	if (approveWithdraw) payWithdraw();
        this.approveWithdraw = approveWithdraw;
    }
}
