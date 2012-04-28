package com.springroo.salary.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.PersistenceContext;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPayRollsesByPayPerMonth", "findPayRollsesByIdsEquals" })
public class PayRolls {

    @Enumerated
    private Months payPerMonth;

    private String payTotal;

    private String ids;

    private Float bonus;

    private Float pTax;

    public void autoGen() {
	List<StartSalarys> salaryList = StartSalarys.findAllStartSalaryses();
		for(int i=0; i<salaryList.size(); i++){
			PayRolls dataAutoGen = new PayRolls(); 
			dataAutoGen.setIds(salaryList.get(i).getIds().getIds()+" ");	
			dataAutoGen.setBonus(salaryList.get(i).getBonus());
			dataAutoGen.payTotal = salaryList.get(i).getTotal()+" ";
			dataAutoGen.pTax = salaryList.get(i).getTax();
			
			dataAutoGen.persist();
			dataAutoGen.flush();
			}	
    }
    public void setPayTotal(String payTotal) {

    }
    public void setPayPerMonth(Months payPerMonth) {
        this.payPerMonth = payPerMonth;
	autoGen();
    }
   
    public void setIds(String ids) {
        this.ids = ids;
    }

    public void setBonus(Float bonus) {
        this.bonus = bonus;
    }

    public void setPTax(Float pTax) {
        this.pTax = pTax;
    }
}
