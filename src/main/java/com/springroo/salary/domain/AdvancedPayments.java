package com.springroo.salary.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;



@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findAdvancedPaymentsesByPid", "findAdvancedPaymentsesByDateWriteEquals" })
public class AdvancedPayments {

    @ManyToOne
    private Users pid;

	@NotNull
    private String dateWrite = date();

    @NotNull
    @Size(max = 300)
    private String reason;

    private Float amount;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date amoutDate;

    @Value("false")
    private Boolean approve;

    @Size(max = 300)
    private String reasonNotApprove;

    private String date() {
        Date dateNow = new Date();
        SimpleDateFormat dateformatDDMMYYYY = new SimpleDateFormat("dd.MM.yyyy");
        StringBuilder dateformat = new StringBuilder(dateformatDDMMYYYY.format(dateNow));
        return dateformat.toString();
    }
    
    public void setApprove(Boolean approve) {
        this.approve = approve;
    }
}
