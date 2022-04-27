
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
* Short Object for ENInspectionSheet;
*/

import java.math.BigDecimal;
import java.util.Date;

public class ENInspectionSheetShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String name;
	public int inspectionKind = Integer.MIN_VALUE;
	public Date dateGen;
	public String executor;
	public String accepted;
	public String objectInvNumber;
	public String objectName;
	public int equipmentKind = Integer.MIN_VALUE;
	public int takeIntoCalculation = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int elementRefCode = Integer.MIN_VALUE;
	public int defects2InspectRefCode = Integer.MIN_VALUE;
	public String defects2InspectRefName;
	public String defects2InspectRefUserGen;
	public Date defects2InspectRefDateEdit;
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
	public Date planRefInvestDateStartWork;
	public int planRefInvestWorkMeasCode = Integer.MIN_VALUE;
	public int planRefServicesFSideFinId = Integer.MIN_VALUE;
	public String planRefServicesFSideCnNum;
	public BigDecimal planRefTotalTimeHours;
	public BigDecimal planRefTotalTimeDays;
	public String planRefInvestItemNumber;


	/** **************************** */

	public String inspectionKindName;
	public String elementType;
	public String elementInvNumber;
	public String elementName;
	public int renCode = Integer.MIN_VALUE;
	public String renName;

	/** **************************** */



	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getInspectionKind() {
		return inspectionKind;
	}

	public void setInspectionKind(int inspectionKind) {
		this.inspectionKind = inspectionKind;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public String getExecutor() {
		return executor;
	}

	public void setExecutor(String executor) {
		this.executor = executor;
	}

	public String getAccepted() {
		return accepted;
	}

	public void setAccepted(String accepted) {
		this.accepted = accepted;
	}

	public String getObjectInvNumber() {
		return objectInvNumber;
	}

	public void setObjectInvNumber(String objectInvNumber) {
		this.objectInvNumber = objectInvNumber;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public int getEquipmentKind() {
		return equipmentKind;
	}

	public void setEquipmentKind(int equipmentKind) {
		this.equipmentKind = equipmentKind;
	}

	public int getTakeIntoCalculation() {
		return takeIntoCalculation;
	}

	public void setTakeIntoCalculation(int takeIntoCalculation) {
		this.takeIntoCalculation = takeIntoCalculation;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public int getStatusRefCode() {
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName() {
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}

	public int getElementRefCode() {
		return elementRefCode;
	}

	public void setElementRefCode(int elementRefCode) {
		this.elementRefCode = elementRefCode;
	}

	public int getDefects2InspectRefCode() {
		return defects2InspectRefCode;
	}

	public void setDefects2InspectRefCode(int defects2InspectRefCode) {
		this.defects2InspectRefCode = defects2InspectRefCode;
	}

	public String getDefects2InspectRefName() {
		return defects2InspectRefName;
	}

	public void setDefects2InspectRefName(String defects2InspectRefName) {
		this.defects2InspectRefName = defects2InspectRefName;
	}

	public String getDefects2InspectRefUserGen() {
		return defects2InspectRefUserGen;
	}

	public void setDefects2InspectRefUserGen(String defects2InspectRefUserGen) {
		this.defects2InspectRefUserGen = defects2InspectRefUserGen;
	}

	public Date getDefects2InspectRefDateEdit() {
		return defects2InspectRefDateEdit;
	}

	public void setDefects2InspectRefDateEdit(Date defects2InspectRefDateEdit) {
		this.defects2InspectRefDateEdit = defects2InspectRefDateEdit;
	}

	public int getPlanRefCode() {
		return planRefCode;
	}

	public void setPlanRefCode(int planRefCode) {
		this.planRefCode = planRefCode;
	}

	public Date getPlanRefDateGen() {
		return planRefDateGen;
	}

	public void setPlanRefDateGen(Date planRefDateGen) {
		this.planRefDateGen = planRefDateGen;
	}

	public Date getPlanRefDateStart() {
		return planRefDateStart;
	}

	public void setPlanRefDateStart(Date planRefDateStart) {
		this.planRefDateStart = planRefDateStart;
	}

	public Date getPlanRefDateFinal() {
		return planRefDateFinal;
	}

	public void setPlanRefDateFinal(Date planRefDateFinal) {
		this.planRefDateFinal = planRefDateFinal;
	}

	public int getPlanRefYearGen() {
		return planRefYearGen;
	}

	public void setPlanRefYearGen(int planRefYearGen) {
		this.planRefYearGen = planRefYearGen;
	}

	public int getPlanRefMonthGen() {
		return planRefMonthGen;
	}

	public void setPlanRefMonthGen(int planRefMonthGen) {
		this.planRefMonthGen = planRefMonthGen;
	}

	public int getPlanRefYearOriginal() {
		return planRefYearOriginal;
	}

	public void setPlanRefYearOriginal(int planRefYearOriginal) {
		this.planRefYearOriginal = planRefYearOriginal;
	}

	public int getPlanRefMonthOriginal() {
		return planRefMonthOriginal;
	}

	public void setPlanRefMonthOriginal(int planRefMonthOriginal) {
		this.planRefMonthOriginal = planRefMonthOriginal;
	}

	public String getPlanRefUserGen() {
		return planRefUserGen;
	}

	public void setPlanRefUserGen(String planRefUserGen) {
		this.planRefUserGen = planRefUserGen;
	}

	public Date getPlanRefDateEdit() {
		return planRefDateEdit;
	}

	public void setPlanRefDateEdit(Date planRefDateEdit) {
		this.planRefDateEdit = planRefDateEdit;
	}

	public String getPlanRefWorkOrderNumber() {
		return planRefWorkOrderNumber;
	}

	public void setPlanRefWorkOrderNumber(String planRefWorkOrderNumber) {
		this.planRefWorkOrderNumber = planRefWorkOrderNumber;
	}

	public Date getPlanRefDateWorkOrder() {
		return planRefDateWorkOrder;
	}

	public void setPlanRefDateWorkOrder(Date planRefDateWorkOrder) {
		this.planRefDateWorkOrder = planRefDateWorkOrder;
	}

	public String getPlanRefPriConnectionNumber() {
		return planRefPriConnectionNumber;
	}

	public void setPlanRefPriConnectionNumber(String planRefPriConnectionNumber) {
		this.planRefPriConnectionNumber = planRefPriConnectionNumber;
	}

	public Date getPlanRefDateEndPriConnection() {
		return planRefDateEndPriConnection;
	}

	public void setPlanRefDateEndPriConnection(Date planRefDateEndPriConnection) {
		this.planRefDateEndPriConnection = planRefDateEndPriConnection;
	}

	public String getPlanRefInvestWorksDescription() {
		return planRefInvestWorksDescription;
	}

	public void setPlanRefInvestWorksDescription(String planRefInvestWorksDescription) {
		this.planRefInvestWorksDescription = planRefInvestWorksDescription;
	}

	public Date getPlanRefInvestDateStartWork() {
		return planRefInvestDateStartWork;
	}

	public void setPlanRefInvestDateStartWork(Date planRefInvestDateStartWork) {
		this.planRefInvestDateStartWork = planRefInvestDateStartWork;
	}

	public int getPlanRefInvestWorkMeasCode() {
		return planRefInvestWorkMeasCode;
	}

	public void setPlanRefInvestWorkMeasCode(int planRefInvestWorkMeasCode) {
		this.planRefInvestWorkMeasCode = planRefInvestWorkMeasCode;
	}

	public int getPlanRefServicesFSideFinId() {
		return planRefServicesFSideFinId;
	}

	public void setPlanRefServicesFSideFinId(int planRefServicesFSideFinId) {
		this.planRefServicesFSideFinId = planRefServicesFSideFinId;
	}

	public String getPlanRefServicesFSideCnNum() {
		return planRefServicesFSideCnNum;
	}

	public void setPlanRefServicesFSideCnNum(String planRefServicesFSideCnNum) {
		this.planRefServicesFSideCnNum = planRefServicesFSideCnNum;
	}

	public BigDecimal getPlanRefTotalTimeHours() {
		return planRefTotalTimeHours;
	}

	public void setPlanRefTotalTimeHours(BigDecimal planRefTotalTimeHours) {
		this.planRefTotalTimeHours = planRefTotalTimeHours;
	}

	public BigDecimal getPlanRefTotalTimeDays() {
		return planRefTotalTimeDays;
	}

	public void setPlanRefTotalTimeDays(BigDecimal planRefTotalTimeDays) {
		this.planRefTotalTimeDays = planRefTotalTimeDays;
	}

	public String getPlanRefInvestItemNumber() {
		return planRefInvestItemNumber;
	}

	public void setPlanRefInvestItemNumber(String planRefInvestItemNumber) {
		this.planRefInvestItemNumber = planRefInvestItemNumber;
	}

	public String getInspectionKindName() {
		return inspectionKindName;
	}

	public void setInspectionKindName(String inspectionKindName) {
		this.inspectionKindName = inspectionKindName;
	}

	public String getElementType() {
		return elementType;
	}

	public void setElementType(String elementType) {
		this.elementType = elementType;
	}

	public String getElementInvNumber() {
		return elementInvNumber;
	}

	public void setElementInvNumber(String elementInvNumber) {
		this.elementInvNumber = elementInvNumber;
	}

	public String getElementName() {
		return elementName;
	}

	public void setElementName(String elementName) {
		this.elementName = elementName;
	}

	public int getRenCode() {
		return renCode;
	}

	public void setRenCode(int renCode) {
		this.renCode = renCode;
	}

	public String getRenName() {
		return renName;
	}

	public void setRenName(String renName) {
		this.renName = renName;
	}

}
