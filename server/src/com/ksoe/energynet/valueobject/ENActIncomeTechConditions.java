//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENActIncomeTechConditions;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENActIncomeStatusRef;
import com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENActIncomeTechConditions implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numbergen;
    public Date dategen;
    public Date actDateStart;
    public Date actDateEnd;
    public BigDecimal summaGen;
    public BigDecimal summaVat;
    public String commentGen;
    public String domain_info;
    public long modify_time = Long.MIN_VALUE;
    public ENTechConditionsServicesRef techCondServicesRef = new ENTechConditionsServicesRef();
    public ENActIncomeStatusRef statusRef = new ENActIncomeStatusRef();
    public ENWarrantRef warrantRef = new ENWarrantRef();
    public static final String tableName = "ENACTINCOMETECHCONDTNS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINCOMETECHCONDTNS.CODE";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENACTINCOMETECHCONDTNS.NUMBERGEN";
    public static final String dategen_Attr = "dategen";
    public static final String dategen_Field = "DATEGEN";
    public static final String dategen_QFielld = "ENACTINCOMETECHCONDTNS.DATEGEN";
    public static final String actDateStart_Attr = "actDateStart";
    public static final String actDateStart_Field = "ACTDATESTART";
    public static final String actDateStart_QFielld = "ENACTINCOMETECHCONDTNS.ACTDATESTART";
    public static final String actDateEnd_Attr = "actDateEnd";
    public static final String actDateEnd_Field = "ACTDATEEND";
    public static final String actDateEnd_QFielld = "ENACTINCOMETECHCONDTNS.ACTDATEEND";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENACTINCOMETECHCONDTNS.SUMMAGEN";
    public static final String summaVat_Attr = "summaVat";
    public static final String summaVat_Field = "SUMMAVAT";
    public static final String summaVat_QFielld = "ENACTINCOMETECHCONDTNS.SUMMAVAT";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENACTINCOMETECHCONDTNS.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENACTINCOMETECHCONDTNS.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACTINCOMETECHCONDTNS.MODIFY_TIME";
    public static final String techCondServicesRef_Attr = "techCondServicesRef";
    public static final String techCondServicesRef_Field = "TECHCONDSERVICESREFCOD";
    public static final String techCondServicesRef_QFielld = "ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String statusRef_QFielld = "ENACTINCOMETECHCONDTNS.STATUSREFCODE";
    public static final String warrantRef_Attr = "warrantRef";
    public static final String warrantRef_Field = "WARRANTREFCODE";
    public static final String warrantRef_QFielld = "ENACTINCOMETECHCONDTNS.WARRANTREFCODE";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

    public void setNumbergen(String aValue) {
        numbergen = aValue;
    }

    public String getNumbergen() {
        return numbergen;
    }

    public void setDategen(Date aValue) {
        dategen = aValue;
    }

    public Date getDategen() {
        return dategen;
    }

    public void setActDateStart(Date aValue) {
        actDateStart = aValue;
    }

    public Date getActDateStart() {
        return actDateStart;
    }

    public void setActDateEnd(Date aValue) {
        actDateEnd = aValue;
    }

    public Date getActDateEnd() {
        return actDateEnd;
    }

    public void setSummaGen(BigDecimal aValue) {
        summaGen = aValue;
    }

    public BigDecimal getSummaGen() {
        return summaGen;
    }

    public void setSummaVat(BigDecimal aValue) {
        summaVat = aValue;
    }

    public BigDecimal getSummaVat() {
        return summaVat;
    }

    public void setCommentGen(String aValue) {
        commentGen = aValue;
    }

    public String getCommentGen() {
        return commentGen;
    }

    public void setDomain_info(String aValue) {
        domain_info = aValue;
    }

    public String getDomain_info() {
        return domain_info;
    }

    public void setModify_time(long aValue) {
        modify_time = aValue;
    }

    public long getModify_time() {
        return modify_time;
    }

    public void setTechCondServicesRef(ENTechConditionsServicesRef aValue) {
        techCondServicesRef = aValue;
    }

    public ENTechConditionsServicesRef getTechCondServicesRef() {
        return techCondServicesRef;
    }

    public void setStatusRef(ENActIncomeStatusRef aValue) {
        statusRef = aValue;
    }

    public ENActIncomeStatusRef getStatusRef() {
        return statusRef;
    }

    public void setWarrantRef(ENWarrantRef aValue) {
        warrantRef = aValue;
    }

    public ENWarrantRef getWarrantRef() {
        return warrantRef;
    }

} // end of ENActIncomeTechConditionsValueObject

