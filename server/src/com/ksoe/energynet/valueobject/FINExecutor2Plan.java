//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for FINExecutor2Plan;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.energynet.valueobject.references.FINExecutorTypeRef;

public class FINExecutor2Plan implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal percentLoad;
	public Date dateStart;
	public Date dateFinal;
	public BigDecimal totalTimeHours;
	public BigDecimal totalTimeDays;
	public BigDecimal totalTimeManHours;
	public BigDecimal deliveryTime;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public FINExecutorTypeRef finExecutorTypeRef = new FINExecutorTypeRef();
	public ENPlanWorkRef planRef = new ENPlanWorkRef();
	public FINExecutor finExecutor = new FINExecutor();
	public ENDepartmentRef budgetRef = new ENDepartmentRef();
	public static final String tableName = "FINEXECUTOR2PLAN";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "FINEXECUTOR2PLAN.CODE";
	public static final String percentLoad_Attr = "percentLoad";
	public static final String percentLoad_Field = "PERCENTLOAD";
	public static final String percentLoad_QFielld = "FINEXECUTOR2PLAN.PERCENTLOAD";
	public static final String dateStart_Attr = "dateStart";
	public static final String dateStart_Field = "DATESTART";
	public static final String dateStart_QFielld = "FINEXECUTOR2PLAN.DATESTART";
	public static final String dateFinal_Attr = "dateFinal";
	public static final String dateFinal_Field = "DATEFINAL";
	public static final String dateFinal_QFielld = "FINEXECUTOR2PLAN.DATEFINAL";
	public static final String totalTimeHours_Attr = "totalTimeHours";
	public static final String totalTimeHours_Field = "TOTALTIMEHOURS";
	public static final String totalTimeHours_QFielld = "FINEXECUTOR2PLAN.TOTALTIMEHOURS";
	public static final String totalTimeDays_Attr = "totalTimeDays";
	public static final String totalTimeDays_Field = "TOTALTIMEDAYS";
	public static final String totalTimeDays_QFielld = "FINEXECUTOR2PLAN.TOTALTIMEDAYS";
	public static final String totalTimeManHours_Attr = "totalTimeManHours";
	public static final String totalTimeManHours_Field = "TOTALTIMEMANHOURS";
	public static final String totalTimeManHours_QFielld = "FINEXECUTOR2PLAN.TOTALTIMEMANHOURS";
	public static final String deliveryTime_Attr = "deliveryTime";
	public static final String deliveryTime_Field = "DELIVERYTIME";
	public static final String deliveryTime_QFielld = "FINEXECUTOR2PLAN.DELIVERYTIME";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "FINEXECUTOR2PLAN.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "FINEXECUTOR2PLAN.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "FINEXECUTOR2PLAN.MODIFY_TIME";
	public static final String finExecutorTypeRef_Attr = "finExecutorTypeRef";
	public static final String finExecutorTypeRef_Field = "FINEXECUTORTYPEREFCODE";
	public static final String finExecutorTypeRef_QFielld = "FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE";
	public static final String planRef_Attr = "planRef";
	public static final String planRef_Field = "PLANREFCODE";
	public static final String planRef_QFielld = "FINEXECUTOR2PLAN.PLANREFCODE";
	public static final String finExecutor_Attr = "finExecutor";
	public static final String finExecutor_Field = "FINEXECUTORCODE";
	public static final String finExecutor_QFielld = "FINEXECUTOR2PLAN.FINEXECUTORCODE";
	public static final String budgetRef_Attr = "budgetRef";
	public static final String budgetRef_Field = "BUDGETREFCODE";
	public static final String budgetRef_QFielld = "FINEXECUTOR2PLAN.BUDGETREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setPercentLoad(BigDecimal aValue) {
		percentLoad = aValue;
	}

	public BigDecimal getPercentLoad() {
		return percentLoad;
	}

	public void setDateStart(Date aValue) {
		dateStart = aValue;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateFinal(Date aValue) {
		dateFinal = aValue;
	}

	public Date getDateFinal() {
		return dateFinal;
	}

	public void setTotalTimeHours(BigDecimal aValue) {
		totalTimeHours = aValue;
	}

	public BigDecimal getTotalTimeHours() {
		return totalTimeHours;
	}

	public void setTotalTimeDays(BigDecimal aValue) {
		totalTimeDays = aValue;
	}

	public BigDecimal getTotalTimeDays() {
		return totalTimeDays;
	}

	public void setTotalTimeManHours(BigDecimal aValue) {
		totalTimeManHours = aValue;
	}

	public BigDecimal getTotalTimeManHours() {
		return totalTimeManHours;
	}

	public void setDeliveryTime(BigDecimal aValue) {
		deliveryTime = aValue;
	}

	public BigDecimal getDeliveryTime() {
		return deliveryTime;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setFinExecutorTypeRef(FINExecutorTypeRef aValue) {
		finExecutorTypeRef = aValue;
	}

	public FINExecutorTypeRef getFinExecutorTypeRef() {
		return finExecutorTypeRef;
	}

	public void setPlanRef(ENPlanWorkRef aValue) {
		planRef = aValue;
	}

	public ENPlanWorkRef getPlanRef() {
		return planRef;
	}

	public void setFinExecutor(FINExecutor aValue) {
		finExecutor = aValue;
	}

	public FINExecutor getFinExecutor() {
		return finExecutor;
	}

	public void setBudgetRef(ENDepartmentRef aValue) {
		budgetRef = aValue;
	}

	public ENDepartmentRef getBudgetRef() {
		return budgetRef;
	}

} // end of FINExecutor2PlanValueObject

