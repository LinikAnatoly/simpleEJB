//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENPlan2Humen;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENPlan2HumenShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String tabNumber;
	public String fio;
	public int positionCode = Integer.MIN_VALUE;
	public String positionId;
	public BigDecimal priceGen;
	public BigDecimal timeWorkGen;
	public BigDecimal timeWorkFact;
	public BigDecimal timeDelivery;
	public int planRefCode = Integer.MIN_VALUE;
	public Date planRefDateGen;
	public Date planRefDateStart;
	public Date planRefDateFinal;
	public int planRefYearGen = Integer.MIN_VALUE;
	public int planRefMonthGen = Integer.MIN_VALUE;
	public int planRefYearOriginal = Integer.MIN_VALUE;
	public int planRefMonthOriginal = Integer.MIN_VALUE;
	public String planRefUserGen;
	public Date planRefDateEdit;
	public String planRefWorkOrderNumber;
	public Date planRefDateWorkOrder;
	public String planRefPriConnectionNumber;
	public Date planRefDateEndPriConnection;
	public String planRefInvestWorksDescription;
	public int planRefServicesFSideFinId = Integer.MIN_VALUE;
	public String planRefServicesFSideCnNum;
	public BigDecimal planRefTotalTimeHours;
	public BigDecimal planRefTotalTimeDays;
	public String planRefInvestItemNumber;
	public int humenKindRefCode = Integer.MIN_VALUE;
	public String humenKindRefName;


	/** *******************************************/
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public int actRefStatusCode = Integer.MIN_VALUE;
	public String actRefStatusName;
	/** *******************************************/


	public int getActRefStatusCode() {
		return actRefStatusCode;
	}

	public void setActRefStatusCode(int actRefStatusCode) {
		this.actRefStatusCode = actRefStatusCode;
	}

	public int getActRefCode() {
		return actRefCode;
	}

	public void setActRefCode(int actRefCode) {
		this.actRefCode = actRefCode;
	}

	public Date getActRefDateGen() {
		return actRefDateGen;
	}

	public void setActRefDateGen(Date actRefDateGen) {
		this.actRefDateGen = actRefDateGen;
	}

	public String getActRefNumberGen() {
		return actRefNumberGen;
	}

	public void setActRefNumberGen(String actRefNumberGen) {
		this.actRefNumberGen = actRefNumberGen;
	}

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setTabNumber(String aValue) {
		tabNumber = aValue;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setFio(String aValue) {
		fio = aValue;
	}

	public String getFio() {
		return fio;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(int positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public BigDecimal getPriceGen() {
		return priceGen;
	}

	public void setPriceGen(BigDecimal priceGen) {
		this.priceGen = priceGen;
	}

	public void setTimeWorkGen(BigDecimal aValue) {
		timeWorkGen = aValue;
	}

	public BigDecimal getTimeWorkGen() {
		return timeWorkGen;
	}

	public void setTimeWorkFact(BigDecimal aValue) {
		timeWorkFact = aValue;
	}

	public BigDecimal getTimeWorkFact() {
		return timeWorkFact;
	}

	public void setTimeDelivery(BigDecimal aValue) {
		timeDelivery = aValue;
	}

	public BigDecimal getTimeDelivery() {
		return timeDelivery;
	}

	public void setPlanRefCode(int aValue) {
		planRefCode = aValue;
	}

	public int getPlanRefCode() {
		return planRefCode;
	}

	public void setPlanRefDateGen(Date aValue) {
		planRefDateGen = aValue;
	}

	public Date getPlanRefDateGen() {
		return planRefDateGen;
	}

	public void setPlanRefDateStart(Date aValue) {
		planRefDateStart = aValue;
	}

	public Date getPlanRefDateStart() {
		return planRefDateStart;
	}

	public void setPlanRefDateFinal(Date aValue) {
		planRefDateFinal = aValue;
	}

	public Date getPlanRefDateFinal() {
		return planRefDateFinal;
	}

	public void setPlanRefYearGen(int aValue) {
		planRefYearGen = aValue;
	}

	public int getPlanRefYearGen() {
		return planRefYearGen;
	}

	public void setPlanRefMonthGen(int aValue) {
		planRefMonthGen = aValue;
	}

	public int getPlanRefMonthGen() {
		return planRefMonthGen;
	}

	public void setPlanRefYearOriginal(int aValue) {
		planRefYearOriginal = aValue;
	}

	public int getPlanRefYearOriginal() {
		return planRefYearOriginal;
	}

	public void setPlanRefMonthOriginal(int aValue) {
		planRefMonthOriginal = aValue;
	}

	public int getPlanRefMonthOriginal() {
		return planRefMonthOriginal;
	}

	public void setPlanRefUserGen(String aValue) {
		planRefUserGen = aValue;
	}

	public String getPlanRefUserGen() {
		return planRefUserGen;
	}

	public void setPlanRefDateEdit(Date aValue) {
		planRefDateEdit = aValue;
	}

	public Date getPlanRefDateEdit() {
		return planRefDateEdit;
	}

	public void setPlanRefWorkOrderNumber(String aValue) {
		planRefWorkOrderNumber = aValue;
	}

	public String getPlanRefWorkOrderNumber() {
		return planRefWorkOrderNumber;
	}

	public void setPlanRefDateWorkOrder(Date aValue) {
		planRefDateWorkOrder = aValue;
	}

	public Date getPlanRefDateWorkOrder() {
		return planRefDateWorkOrder;
	}

	public void setPlanRefPriConnectionNumber(String aValue) {
		planRefPriConnectionNumber = aValue;
	}

	public String getPlanRefPriConnectionNumber() {
		return planRefPriConnectionNumber;
	}

	public void setPlanRefDateEndPriConnection(Date aValue) {
		planRefDateEndPriConnection = aValue;
	}

	public Date getPlanRefDateEndPriConnection() {
		return planRefDateEndPriConnection;
	}

	public void setPlanRefInvestWorksDescription(String aValue) {
		planRefInvestWorksDescription = aValue;
	}

	public String getPlanRefInvestWorksDescription() {
		return planRefInvestWorksDescription;
	}

	public void setPlanRefServicesFSideFinId(int aValue) {
		planRefServicesFSideFinId = aValue;
	}

	public int getPlanRefServicesFSideFinId() {
		return planRefServicesFSideFinId;
	}

	public void setPlanRefServicesFSideCnNum(String aValue) {
		planRefServicesFSideCnNum = aValue;
	}

	public String getPlanRefServicesFSideCnNum() {
		return planRefServicesFSideCnNum;
	}

	public void setPlanRefTotalTimeHours(BigDecimal aValue) {
		planRefTotalTimeHours = aValue;
	}

	public BigDecimal getPlanRefTotalTimeHours() {
		return planRefTotalTimeHours;
	}

	public void setPlanRefTotalTimeDays(BigDecimal aValue) {
		planRefTotalTimeDays = aValue;
	}

	public BigDecimal getPlanRefTotalTimeDays() {
		return planRefTotalTimeDays;
	}

	public String getPlanRefInvestItemNumber() {
		return planRefInvestItemNumber;
	}

	public void setPlanRefInvestItemNumber(String planRefInvestItemNumber) {
		this.planRefInvestItemNumber = planRefInvestItemNumber;
	}

	public void setHumenKindRefCode(int aValue) {
		humenKindRefCode = aValue;
	}

	public int getHumenKindRefCode() {
		return humenKindRefCode;
	}

	public void setHumenKindRefName(String aValue) {
		humenKindRefName = aValue;
	}

	public String getHumenKindRefName() {
		return humenKindRefName;
	}

	public String getActRefStatusName() {
		return actRefStatusName;
	}

	public void setActRefStatusName(String actRefStatusName) {
		this.actRefStatusName = actRefStatusName;
	}

}