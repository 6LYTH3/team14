package com.springroo.salary.domain;

import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findStartSalarysesByIds" })
public class StartSalarys {

    @ManyToOne
    private Users ids;

    @NotNull
    @Value("0.0")
    private Float salaryDefualt;
    @Value("0.0")
    private Float bonus;
    
//    @Max(100F)
    @Value("0.0")
    private Float tax;
	
//    @Max(20000F)
//    @Min(0F)
    @Value("0.0")
    private Float withdraw;

    private Float total;

    @NotNull
    private String dateConf = date();

    public void setTotal(Float total) {
	this.total = calculate();
    }
    public Float calculate() {
        return (((this.salaryDefualt+this.bonus)-this.withdraw)-(((this.salaryDefualt+this.bonus)*this.tax)/100));
    }
    
    public void setWithdraw(Float withdraw) {
        this.withdraw = withdraw;
        this.total = calculate();
    }
   
    public void setBonus(Float bonus) {
        this.bonus = bonus;
        this.total = calculate();
    }
    
    public void setTax(Float tax) {
        this.tax = tax;
        this.total = calculate();
    }
    
    public void setSalaryDefualt(Float salaryDefualt) {
        this.salaryDefualt = salaryDefualt;
        this.total = calculate();
    }
   
       private String date() {
        Date dateNow = new Date();
        SimpleDateFormat dateformatDDMMYYYY = new SimpleDateFormat("dd.MM.yyyy");
        StringBuilder dateformat = new StringBuilder(dateformatDDMMYYYY.format(dateNow));
        return dateformat.toString();
       } 
}
