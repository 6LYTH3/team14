package com.springroo.salary.domain;

import java.util.Date;
import java.text.SimpleDateFormat;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findProblemReportsesByTopicLike", "findProblemReportsesByProblemChoices", "findProblemReportsesByProblemStatus" })
public class ProblemReports {

    @NotNull
    private String topic;

    @ManyToOne
    private Users name;

    @NotNull
    @Size(max = 500)
    private String messages;

    @Enumerated(EnumType.STRING)
    private ProblemChoices problemChoices;

    @Enumerated(EnumType.STRING)
    private ProblemStatus problemStatus;

    @NotNull
    private String write_date = date();

    private String date() {
        Date dateNow = new Date();
        SimpleDateFormat dateformatDDMMYYYY = new SimpleDateFormat("dd.MM.yyyy");
        StringBuilder dateformat = new StringBuilder(dateformatDDMMYYYY.format(dateNow));
        return dateformat.toString();
    }

}
