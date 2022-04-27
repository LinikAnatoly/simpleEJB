
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcTransportUsageHour;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCalcTransportUsageHourShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public BigDecimal salaryMonthDriver;
	public BigDecimal normWorkTimeMonth;
	public BigDecimal salaryHourDriver;
	public BigDecimal salaryChargeHourDriver;
	public BigDecimal salaryTotalHourDriver;
	public BigDecimal costMachine;
	public BigDecimal amortizationYearMachine;
	public BigDecimal amortizationHourMachine;
	public BigDecimal fuelExpensesMachine;
	public BigDecimal annualRepairCostsPercent;
	public BigDecimal annualRepairCosts;
	public BigDecimal repairCostsPerHour;
	public BigDecimal costTotalHourMachine;
	public BigDecimal productionCosts;
	public BigDecimal administrativeCosts;
	public BigDecimal profitRate;
	public BigDecimal costPerKilometer;
	public String commentPerKilometer;
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
	public int tkTransportRefCode = Integer.MIN_VALUE;
	public String tkTransportRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setSalaryMonthDriver(BigDecimal aValue){
		salaryMonthDriver = aValue;
	}

	public BigDecimal getSalaryMonthDriver(){
		return salaryMonthDriver;
	}

	public void setNormWorkTimeMonth(BigDecimal aValue){
		normWorkTimeMonth = aValue;
	}

	public BigDecimal getNormWorkTimeMonth(){
		return normWorkTimeMonth;
	}

	public void setSalaryHourDriver(BigDecimal aValue){
		salaryHourDriver = aValue;
	}

	public BigDecimal getSalaryHourDriver(){
		return salaryHourDriver;
	}

	public void setSalaryChargeHourDriver(BigDecimal aValue){
		salaryChargeHourDriver = aValue;
	}

	public BigDecimal getSalaryChargeHourDriver(){
		return salaryChargeHourDriver;
	}

	public void setSalaryTotalHourDriver(BigDecimal aValue){
		salaryTotalHourDriver = aValue;
	}

	public BigDecimal getSalaryTotalHourDriver(){
		return salaryTotalHourDriver;
	}

	public void setCostMachine(BigDecimal aValue){
		costMachine = aValue;
	}

	public BigDecimal getCostMachine(){
		return costMachine;
	}

	public void setAmortizationYearMachine(BigDecimal aValue){
		amortizationYearMachine = aValue;
	}

	public BigDecimal getAmortizationYearMachine(){
		return amortizationYearMachine;
	}

	public void setAmortizationHourMachine(BigDecimal aValue){
		amortizationHourMachine = aValue;
	}

	public BigDecimal getAmortizationHourMachine(){
		return amortizationHourMachine;
	}

	public void setFuelExpensesMachine(BigDecimal aValue){
		fuelExpensesMachine = aValue;
	}

	public BigDecimal getFuelExpensesMachine(){
		return fuelExpensesMachine;
	}

	public void setAnnualRepairCostsPercent(BigDecimal aValue){
		annualRepairCostsPercent = aValue;
	}

	public BigDecimal getAnnualRepairCostsPercent(){
		return annualRepairCostsPercent;
	}

	public void setAnnualRepairCosts(BigDecimal aValue){
		annualRepairCosts = aValue;
	}

	public BigDecimal getAnnualRepairCosts(){
		return annualRepairCosts;
	}

	public void setRepairCostsPerHour(BigDecimal aValue){
		repairCostsPerHour = aValue;
	}

	public BigDecimal getRepairCostsPerHour(){
		return repairCostsPerHour;
	}

	public void setCostTotalHourMachine(BigDecimal aValue){
		costTotalHourMachine = aValue;
	}

	public BigDecimal getCostTotalHourMachine(){
		return costTotalHourMachine;
	}

	public void setProductionCosts(BigDecimal aValue){
		productionCosts = aValue;
	}

	public BigDecimal getProductionCosts(){
		return productionCosts;
	}

	public void setAdministrativeCosts(BigDecimal aValue){
		administrativeCosts = aValue;
	}

	public BigDecimal getAdministrativeCosts(){
		return administrativeCosts;
	}

	public void setProfitRate(BigDecimal aValue){
		profitRate = aValue;
	}

	public BigDecimal getProfitRate(){
		return profitRate;
	}

	public void setCostPerKilometer(BigDecimal aValue){
		costPerKilometer = aValue;
	}

	public BigDecimal getCostPerKilometer(){
		return costPerKilometer;
	}

	public void setCommentPerKilometer(String aValue){
		commentPerKilometer = aValue;
	}

	public String getCommentPerKilometer(){
		return commentPerKilometer;
	}



	public void setPlanRefCode(int aValue){
		planRefCode = aValue;
	}
	public int getPlanRefCode(){
		return planRefCode;
	}

	public void setPlanRefDateGen(Date aValue){
		planRefDateGen = aValue;
	}
	public Date getPlanRefDateGen(){
		return planRefDateGen;
	}

	public void setPlanRefDateStart(Date aValue){
		planRefDateStart = aValue;
	}
	public Date getPlanRefDateStart(){
		return planRefDateStart;
	}

	public void setPlanRefDateFinal(Date aValue){
		planRefDateFinal = aValue;
	}
	public Date getPlanRefDateFinal(){
		return planRefDateFinal;
	}

	public void setPlanRefYearGen(int aValue){
		planRefYearGen = aValue;
	}
	public int getPlanRefYearGen(){
		return planRefYearGen;
	}

	public void setPlanRefMonthGen(int aValue){
		planRefMonthGen = aValue;
	}
	public int getPlanRefMonthGen(){
		return planRefMonthGen;
	}

	public void setPlanRefYearOriginal(int aValue){
		planRefYearOriginal = aValue;
	}
	public int getPlanRefYearOriginal(){
		return planRefYearOriginal;
	}

	public void setPlanRefMonthOriginal(int aValue){
		planRefMonthOriginal = aValue;
	}
	public int getPlanRefMonthOriginal(){
		return planRefMonthOriginal;
	}

	public void setPlanRefUserGen(String aValue){
		planRefUserGen = aValue;
	}
	public String getPlanRefUserGen(){
		return planRefUserGen;
	}

	public void setPlanRefDateEdit(Date aValue){
		planRefDateEdit = aValue;
	}
	public Date getPlanRefDateEdit(){
		return planRefDateEdit;
	}

	public void setPlanRefWorkOrderNumber(String aValue){
		planRefWorkOrderNumber = aValue;
	}
	public String getPlanRefWorkOrderNumber(){
		return planRefWorkOrderNumber;
	}

	public void setPlanRefDateWorkOrder(Date aValue){
		planRefDateWorkOrder = aValue;
	}
	public Date getPlanRefDateWorkOrder(){
		return planRefDateWorkOrder;
	}

	public void setPlanRefPriConnectionNumber(String aValue){
		planRefPriConnectionNumber = aValue;
	}
	public String getPlanRefPriConnectionNumber(){
		return planRefPriConnectionNumber;
	}

	public void setPlanRefDateEndPriConnection(Date aValue){
		planRefDateEndPriConnection = aValue;
	}
	public Date getPlanRefDateEndPriConnection(){
		return planRefDateEndPriConnection;
	}

	public void setPlanRefInvestWorksDescription(String aValue){
		planRefInvestWorksDescription = aValue;
	}
	public String getPlanRefInvestWorksDescription(){
		return planRefInvestWorksDescription;
	}

	public void setPlanRefServicesFSideFinId(int aValue){
		planRefServicesFSideFinId = aValue;
	}
	public int getPlanRefServicesFSideFinId(){
		return planRefServicesFSideFinId;
	}

	public void setPlanRefServicesFSideCnNum(String aValue){
		planRefServicesFSideCnNum = aValue;
	}
	public String getPlanRefServicesFSideCnNum(){
		return planRefServicesFSideCnNum;
	}

	public void setPlanRefTotalTimeHours(BigDecimal aValue){
		planRefTotalTimeHours = aValue;
	}
	public BigDecimal getPlanRefTotalTimeHours(){
		return planRefTotalTimeHours;
	}

	public void setPlanRefTotalTimeDays(BigDecimal aValue){
		planRefTotalTimeDays = aValue;
	}
	public BigDecimal getPlanRefTotalTimeDays(){
		return planRefTotalTimeDays;
	}

	public void setPlanRefInvestItemNumber(String aValue){
		planRefInvestItemNumber = aValue;
	}
	public String getPlanRefInvestItemNumber(){
		return planRefInvestItemNumber;
	}

	public void setTkTransportRefCode(int aValue){
		tkTransportRefCode = aValue;
	}
	public int getTkTransportRefCode(){
		return tkTransportRefCode;
	}

	public void setTkTransportRefName(String aValue){
		tkTransportRefName = aValue;
	}
	public String getTkTransportRefName(){
		return tkTransportRefName;
	}



}
