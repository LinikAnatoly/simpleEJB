
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkBilling;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENPlanWorkBillingShort implements Serializable {

    public int code = Integer.MIN_VALUE;

    public String objectName;
    public String invNumber;

    public Date dateGen;
    public Date dateStart;
    public Date dateFinal;
    public int yearGen = Integer.MIN_VALUE;
    public int monthGen = Integer.MIN_VALUE;

    public int yearOriginal = Integer.MIN_VALUE;
    public int monthOriginal = Integer.MIN_VALUE;

    public String userGen;
    public Date dateEdit;
    public int workOrderCode = Integer.MIN_VALUE;
    public String workOrderNumber;
    public Date dateWorkOrder;
    public String priConnectionNumber;
    public int servicesFSideFinId = Integer.MIN_VALUE;
    public String servicesFSideCnNum;
    public int statusCode = Integer.MIN_VALUE;
    public String statusName;
    public int elementRefCode = Integer.MIN_VALUE;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public String typeRefShortName;
    public int kindCode = Integer.MIN_VALUE;
    public String kindName;
    public int renRefCode = Integer.MIN_VALUE;
    public String renRefName;
    public int finExecutorCode = Integer.MIN_VALUE;
    public String finExecutorName;
    public int finExecutorFinCode = Integer.MIN_VALUE;
    public String finExecutorFinTypeName;
    public int finExecutorFinTypeCode = Integer.MIN_VALUE;
    public String finExecutorFinKindName;
    public int finExecutorFinKindCode = Integer.MIN_VALUE;
    public String finExecutorFinCehName;
    public int finExecutorFinCehCode = Integer.MIN_VALUE;
    public int stateRefCode = Integer.MIN_VALUE;
    public String stateRefName;
    public String stateRefShortName;
    public int budgetRefCode = Integer.MIN_VALUE;
    public String budgetRefShortName;
    public Date budgetRefDateStart;
    public Date budgetRefDateFinal;
    public int responsibilityRefCode = Integer.MIN_VALUE;
    public String responsibilityRefShortName;
    public Date responsibilityRefDateStart;
    public Date responsibilityRefDateFinal;
    public int departmentRefCode = Integer.MIN_VALUE;
    public String departmentRefShortName;
    public Date departmentRefDateStart;
    public Date departmentRefDateFinal;

    public int formRefCode = Integer.MIN_VALUE;
    public String formRefName;

    public int sourceRefCode = Integer.MIN_VALUE;
    public String sourceRefName;

    public int invgroupRefCode = Integer.MIN_VALUE;
    public String invgroupRefName;

    public int ddsCodesCode = Integer.MIN_VALUE;
    public BigDecimal totalTimeHours;
    public BigDecimal totalTimeDays;
    
    public Date dateCounterInst;
    public Date dateCounterCheck;
    public String  counterType;


    public int getSourceRefCode() {
		return sourceRefCode;
	}
	public void setSourceRefCode(int sourceRefCode) {
		this.sourceRefCode = sourceRefCode;
	}
	public String getSourceRefName() {
		return sourceRefName;
	}
	public void setSourceRefName(String sourceRefName) {
		this.sourceRefName = sourceRefName;
	}
	public int getFormRefCode() {
		return formRefCode;
	}
	public void setFormRefCode(int formRefCode) {
		this.formRefCode = formRefCode;
	}
	public String getFormRefName() {
		return formRefName;
	}
	public void setFormRefName(String formRefName) {
		this.formRefName = formRefName;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }
    public Date getDateGen(){
       return dateGen;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }
    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }
    public Date getDateFinal(){
       return dateFinal;
    }

    public void setYearGen(int aValue){
       yearGen = aValue;
    }
    public int getYearGen(){
       return yearGen;
    }

    public void setMonthGen(int aValue){
       monthGen = aValue;
    }
    public int getMonthGen(){
       return monthGen;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }
    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }
    public Date getDateEdit(){
       return dateEdit;
    }

    public void setWorkOrderNumber(String aValue){
       workOrderNumber = aValue;
    }
    public String getWorkOrderNumber(){
       return workOrderNumber;
    }

    public void setDateWorkOrder(Date aValue){
       dateWorkOrder = aValue;
    }
    public Date getDateWorkOrder(){
       return dateWorkOrder;
    }

    public void setPriConnectionNumber(String aValue){
       priConnectionNumber = aValue;
    }
    public String getPriConnectionNumber(){
       return priConnectionNumber;
    }

    public void setServicesFSideFinId(int aValue){
    	servicesFSideFinId = aValue;
    }

    public int getServicesFSideFinId(){
       return servicesFSideFinId;
    }

    public void setServicesFSideCnNum(String aValue){
       servicesFSideCnNum = aValue;
    }

    public String getServicesFSideCnNum(){
       return servicesFSideCnNum;
    }

    public void setStatusCode(int aValue){
       statusCode = aValue;
    }

    public int getStatusCode(){
       return statusCode;
    }

    public void setStatusName(String aValue){
       statusName = aValue;
    }
    public String getStatusName(){
       return statusName;
    }

    public void setElementRefCode(int aValue){
       elementRefCode = aValue;
    }
    public int getElementRefCode(){
       return elementRefCode;
    }

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }

    public void setTypeRefShortName(String aValue){
       typeRefShortName = aValue;
    }
    public String getTypeRefShortName(){
       return typeRefShortName;
    }

    public void setKindCode(int aValue){
       kindCode = aValue;
    }
    public int getKindCode(){
       return kindCode;
    }

    public void setKindName(String aValue){
       kindName = aValue;
    }
    public String getKindName(){
       return kindName;
    }

    public void setRenRefCode(int aValue){
       renRefCode = aValue;
    }
    public int getRenRefCode(){
       return renRefCode;
    }

    public void setRenRefName(String aValue){
       renRefName = aValue;
    }
    public String getRenRefName(){
       return renRefName;
    }

    public void setFinExecutorCode(int aValue){
       finExecutorCode = aValue;
    }
    public int getFinExecutorCode(){
       return finExecutorCode;
    }

    public void setFinExecutorName(String aValue){
       finExecutorName = aValue;
    }
    public String getFinExecutorName(){
       return finExecutorName;
    }

    public void setFinExecutorFinCode(int aValue){
       finExecutorFinCode = aValue;
    }
    public int getFinExecutorFinCode(){
       return finExecutorFinCode;
    }

    public void setFinExecutorFinTypeName(String aValue){
       finExecutorFinTypeName = aValue;
    }
    public String getFinExecutorFinTypeName(){
       return finExecutorFinTypeName;
    }

    public void setFinExecutorFinTypeCode(int aValue){
       finExecutorFinTypeCode = aValue;
    }
    public int getFinExecutorFinTypeCode(){
       return finExecutorFinTypeCode;
    }

    public void setFinExecutorFinKindName(String aValue){
       finExecutorFinKindName = aValue;
    }
    public String getFinExecutorFinKindName(){
       return finExecutorFinKindName;
    }

    public void setFinExecutorFinKindCode(int aValue){
       finExecutorFinKindCode = aValue;
    }
    public int getFinExecutorFinKindCode(){
       return finExecutorFinKindCode;
    }

    public void setFinExecutorFinCehName(String aValue){
       finExecutorFinCehName = aValue;
    }
    public String getFinExecutorFinCehName(){
       return finExecutorFinCehName;
    }

    public void setFinExecutorFinCehCode(int aValue){
       finExecutorFinCehCode = aValue;
    }
    public int getFinExecutorFinCehCode(){
       return finExecutorFinCehCode;
    }

    public void setStateRefCode(int aValue){
       stateRefCode = aValue;
    }
    public int getStateRefCode(){
       return stateRefCode;
    }

    public void setStateRefName(String aValue){
       stateRefName = aValue;
    }
    public String getStateRefName(){
       return stateRefName;
    }

    public void setStateRefShortName(String aValue){
       stateRefShortName = aValue;
    }
    public String getStateRefShortName(){
       return stateRefShortName;
    }

    public void setBudgetRefCode(int aValue){
       budgetRefCode = aValue;
    }
    public int getBudgetRefCode(){
       return budgetRefCode;
    }

    public void setBudgetRefShortName(String aValue){
       budgetRefShortName = aValue;
    }
    public String getBudgetRefShortName(){
       return budgetRefShortName;
    }

    public void setBudgetRefDateStart(Date aValue){
       budgetRefDateStart = aValue;
    }
    public Date getBudgetRefDateStart(){
       return budgetRefDateStart;
    }

    public void setBudgetRefDateFinal(Date aValue){
       budgetRefDateFinal = aValue;
    }
    public Date getBudgetRefDateFinal(){
       return budgetRefDateFinal;
    }

    public void setResponsibilityRefCode(int aValue){
       responsibilityRefCode = aValue;
    }
    public int getResponsibilityRefCode(){
       return responsibilityRefCode;
    }

    public void setResponsibilityRefShortName(String aValue){
       responsibilityRefShortName = aValue;
    }
    public String getResponsibilityRefShortName(){
       return responsibilityRefShortName;
    }

    public void setResponsibilityRefDateStart(Date aValue){
       responsibilityRefDateStart = aValue;
    }
    public Date getResponsibilityRefDateStart(){
       return responsibilityRefDateStart;
    }

    public void setResponsibilityRefDateFinal(Date aValue){
       responsibilityRefDateFinal = aValue;
    }
    public Date getResponsibilityRefDateFinal(){
       return responsibilityRefDateFinal;
    }

    public void setDepartmentRefCode(int aValue){
       departmentRefCode = aValue;
    }
    public int getDepartmentRefCode(){
       return departmentRefCode;
    }

    public void setDepartmentRefShortName(String aValue){
       departmentRefShortName = aValue;
    }
    public String getDepartmentRefShortName(){
       return departmentRefShortName;
    }

    public void setDepartmentRefDateStart(Date aValue){
       departmentRefDateStart = aValue;
    }
    public Date getDepartmentRefDateStart(){
       return departmentRefDateStart;
    }

    public void setDepartmentRefDateFinal(Date aValue){
       departmentRefDateFinal = aValue;
    }
    public Date getDepartmentRefDateFinal(){
       return departmentRefDateFinal;
    }
	public String getInvNumber() {
		return invNumber;
	}
	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}
	public String getObjectName() {
		return objectName;
	}
	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}
	public int getWorkOrderCode() {
		return workOrderCode;
	}
	public void setWorkOrderCode(int workOrderCode) {
		this.workOrderCode = workOrderCode;
	}
	public int getYearOriginal() {
		return yearOriginal;
	}
	public void setYearOriginal(int yearOriginal) {
		this.yearOriginal = yearOriginal;
	}
	public int getMonthOriginal() {
		return monthOriginal;
	}
	public void setMonthOriginal(int monthOriginal) {
		this.monthOriginal = monthOriginal;
	}


    public void setInvgroupRefCode(int aValue) {
       invgroupRefCode = aValue;
    }

    public int getInvgroupRefCode() {
       return invgroupRefCode;
    }

    public void setInvgroupRefName(String aValue) {
       invgroupRefName = aValue;
    }

    public String getInvgroupRefName() {
       return invgroupRefName;
    }

    public final int getDdsCodesCode() {
		return ddsCodesCode;
	}

    public final void setDdsCodesCode(int ddsCodesCode) {
		this.ddsCodesCode = ddsCodesCode;
	}

    public final BigDecimal getTotalTimeHours() {
		return totalTimeHours;
	}

    public final void setTotalTimeHours(BigDecimal totalTimeHours) {
		this.totalTimeHours = totalTimeHours;
	}

    public final BigDecimal getTotalTimeDays() {
		return totalTimeDays;
	}

    public final void setTotalTimeDays(BigDecimal totalTimeDays) {
		this.totalTimeDays = totalTimeDays;
	}
	public final String getCounterType() {
		return counterType;
	}
	public final void setCounterType(String counterType) {
		this.counterType = counterType;
	}
	public final Date getDateCounterCheck() {
		return dateCounterCheck;
	}
	public final void setDateCounterCheck(Date dateCounterCheck) {
		this.dateCounterCheck = dateCounterCheck;
	}
	public final Date getDateCounterInst() {
		return dateCounterInst;
	}
	public final void setDateCounterInst(Date dateCounterInst) {
		this.dateCounterInst = dateCounterInst;
	}


}