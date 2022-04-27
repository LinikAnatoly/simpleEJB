
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcHumenSalary;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCalcHumenSalaryShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int numberGen = Integer.MIN_VALUE;
	public String classificationTypeNumber;
	public String positionName;
	public BigDecimal timeGenMonth;
	public BigDecimal timeGen;
	public BigDecimal salaryMonth;
	public BigDecimal priceHour;
	public BigDecimal salaryHour;
	public BigDecimal salaryBonus;
	public BigDecimal salarySurcharge;
	public BigDecimal salaryPremium;
	public BigDecimal salaryAdditional;
	public BigDecimal salaryTotalBonus;
	public BigDecimal salaryTotal;
        public BigDecimal percentBonus;
	public BigDecimal percentSurcharge;
	public BigDecimal percentPremium;
	public BigDecimal percentAdditional;
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
	public int plan2CTypeRefCode = Integer.MIN_VALUE;
	public BigDecimal plan2CTypeRefCountGen;
	public String plan2CTypeRefUserGen;
	public Date plan2CTypeRefDateEdit;
	public BigDecimal plan2CTypeRefMachineHours;
	public BigDecimal plan2CTypeRefRelocationKm;
	public BigDecimal plan2CTypeRefTransportationLoad;
	public int plan2CTypeRefIsPrintOnKmOrMH = Integer.MIN_VALUE;
	public BigDecimal plan2CTypeRefCostWorksContractor;
	public Date plan2CTypeRefDateGen;
	public Date plan2CTypeRefTimeStart;
	public Date plan2CTypeRefTimeFinal;
	public int plan2CTypeRefCodeVirtualBrigade = Integer.MIN_VALUE;
	public int plan2CTypeRefIsJobsByTime = Integer.MIN_VALUE;
	public int plan2CTypeRefIsVisitClient = Integer.MIN_VALUE;
	public BigDecimal plan2CTypeRefProductionExpensesPercent;
	public int positionRefCode = Integer.MIN_VALUE;
	public String positionRefName;
	public String positionRefSafetyGroup;
	public String positionRefRank;
	public String positionRefShortName;

    public BigDecimal bonusPercent;

    public BigDecimal getBonusPercent() {
		return bonusPercent;
	}

	public void setBonusPercent(BigDecimal bonusPercent) {
		this.bonusPercent = bonusPercent;
	}

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumberGen(int aValue){
		numberGen = aValue;
	}

	public int getNumberGen(){
		return numberGen;
	}

	public void setClassificationTypeNumber(String aValue){
		classificationTypeNumber = aValue;
	}

	public String getClassificationTypeNumber(){
		return classificationTypeNumber;
	}

	public void setPositionName(String aValue){
		positionName = aValue;
	}

	public String getPositionName(){
		return positionName;
	}

	public void setTimeGenMonth(BigDecimal aValue){
		timeGenMonth = aValue;
	}

	public BigDecimal getTimeGenMonth(){
		return timeGenMonth;
	}

	public void setTimeGen(BigDecimal aValue){
		timeGen = aValue;
	}

	public BigDecimal getTimeGen(){
		return timeGen;
	}

	public void setSalaryMonth(BigDecimal aValue){
		salaryMonth = aValue;
	}

	public BigDecimal getSalaryMonth(){
		return salaryMonth;
	}

	public void setPriceHour(BigDecimal aValue){
		priceHour = aValue;
	}

	public BigDecimal getPriceHour(){
		return priceHour;
	}

	public void setSalaryHour(BigDecimal aValue){
		salaryHour = aValue;
	}

	public BigDecimal getSalaryHour(){
		return salaryHour;
	}

	public void setSalaryBonus(BigDecimal aValue){
		salaryBonus = aValue;
	}

	public BigDecimal getSalaryBonus(){
		return salaryBonus;
	}

	public void setSalarySurcharge(BigDecimal aValue){
		salarySurcharge = aValue;
	}

	public BigDecimal getSalarySurcharge(){
		return salarySurcharge;
	}

	public void setSalaryPremium(BigDecimal aValue){
		salaryPremium = aValue;
	}

	public BigDecimal getSalaryPremium(){
		return salaryPremium;
	}

	public void setSalaryAdditional(BigDecimal aValue){
		salaryAdditional = aValue;
	}

	public BigDecimal getSalaryAdditional(){
		return salaryAdditional;
	}

	public void setSalaryTotalBonus(BigDecimal aValue){
		salaryTotalBonus = aValue;
	}

	public BigDecimal getSalaryTotalBonus(){
		return salaryTotalBonus;
	}

	public void setSalaryTotal(BigDecimal aValue){
		salaryTotal = aValue;
	}

	public BigDecimal getSalaryTotal(){
		return salaryTotal;
	}

public void setPercentBonus(BigDecimal aValue){
		percentBonus = aValue;
	}

	public BigDecimal getPercentBonus(){
		return percentBonus;
	}

	public void setPercentSurcharge(BigDecimal aValue){
		percentSurcharge = aValue;
	}

	public BigDecimal getPercentSurcharge(){
		return percentSurcharge;
	}

	public void setPercentPremium(BigDecimal aValue){
		percentPremium = aValue;
	}

	public BigDecimal getPercentPremium(){
		return percentPremium;
	}

	public void setPercentAdditional(BigDecimal aValue){
		percentAdditional = aValue;
	}

	public BigDecimal getPercentAdditional(){
		return percentAdditional;
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

	public void setPlan2CTypeRefCode(int aValue){
		plan2CTypeRefCode = aValue;
	}
	public int getPlan2CTypeRefCode(){
		return plan2CTypeRefCode;
	}

	public void setPlan2CTypeRefCountGen(BigDecimal aValue){
		plan2CTypeRefCountGen = aValue;
	}
	public BigDecimal getPlan2CTypeRefCountGen(){
		return plan2CTypeRefCountGen;
	}

	public void setPlan2CTypeRefUserGen(String aValue){
		plan2CTypeRefUserGen = aValue;
	}
	public String getPlan2CTypeRefUserGen(){
		return plan2CTypeRefUserGen;
	}

	public void setPlan2CTypeRefDateEdit(Date aValue){
		plan2CTypeRefDateEdit = aValue;
	}
	public Date getPlan2CTypeRefDateEdit(){
		return plan2CTypeRefDateEdit;
	}

	public void setPlan2CTypeRefMachineHours(BigDecimal aValue){
		plan2CTypeRefMachineHours = aValue;
	}
	public BigDecimal getPlan2CTypeRefMachineHours(){
		return plan2CTypeRefMachineHours;
	}

	public void setPlan2CTypeRefRelocationKm(BigDecimal aValue){
		plan2CTypeRefRelocationKm = aValue;
	}
	public BigDecimal getPlan2CTypeRefRelocationKm(){
		return plan2CTypeRefRelocationKm;
	}

	public void setPlan2CTypeRefTransportationLoad(BigDecimal aValue){
		plan2CTypeRefTransportationLoad = aValue;
	}
	public BigDecimal getPlan2CTypeRefTransportationLoad(){
		return plan2CTypeRefTransportationLoad;
	}

	public void setPlan2CTypeRefIsPrintOnKmOrMH(int aValue){
		plan2CTypeRefIsPrintOnKmOrMH = aValue;
	}
	public int getPlan2CTypeRefIsPrintOnKmOrMH(){
		return plan2CTypeRefIsPrintOnKmOrMH;
	}

	public void setPlan2CTypeRefCostWorksContractor(BigDecimal aValue){
		plan2CTypeRefCostWorksContractor = aValue;
	}
	public BigDecimal getPlan2CTypeRefCostWorksContractor(){
		return plan2CTypeRefCostWorksContractor;
	}

	public void setPlan2CTypeRefDateGen(Date aValue){
		plan2CTypeRefDateGen = aValue;
	}
	public Date getPlan2CTypeRefDateGen(){
		return plan2CTypeRefDateGen;
	}

	public void setPlan2CTypeRefTimeStart(Date aValue){
		plan2CTypeRefTimeStart = aValue;
	}
	public Date getPlan2CTypeRefTimeStart(){
		return plan2CTypeRefTimeStart;
	}

	public void setPlan2CTypeRefTimeFinal(Date aValue){
		plan2CTypeRefTimeFinal = aValue;
	}
	public Date getPlan2CTypeRefTimeFinal(){
		return plan2CTypeRefTimeFinal;
	}

	public void setPlan2CTypeRefCodeVirtualBrigade(int aValue){
		plan2CTypeRefCodeVirtualBrigade = aValue;
	}
	public int getPlan2CTypeRefCodeVirtualBrigade(){
		return plan2CTypeRefCodeVirtualBrigade;
	}

	public void setPlan2CTypeRefIsJobsByTime(int aValue){
		plan2CTypeRefIsJobsByTime = aValue;
	}
	public int getPlan2CTypeRefIsJobsByTime(){
		return plan2CTypeRefIsJobsByTime;
	}

	public void setPlan2CTypeRefIsVisitClient(int aValue){
		plan2CTypeRefIsVisitClient = aValue;
	}
	public int getPlan2CTypeRefIsVisitClient(){
		return plan2CTypeRefIsVisitClient;
	}

	public void setPlan2CTypeRefProductionExpensesPercent(BigDecimal aValue){
		plan2CTypeRefProductionExpensesPercent = aValue;
	}
	public BigDecimal getPlan2CTypeRefProductionExpensesPercent(){
		return plan2CTypeRefProductionExpensesPercent;
	}

	public void setPositionRefCode(int aValue){
		positionRefCode = aValue;
	}
	public int getPositionRefCode(){
		return positionRefCode;
	}

	public void setPositionRefName(String aValue){
		positionRefName = aValue;
	}
	public String getPositionRefName(){
		return positionRefName;
	}

	public void setPositionRefSafetyGroup(String aValue){
		positionRefSafetyGroup = aValue;
	}
	public String getPositionRefSafetyGroup(){
		return positionRefSafetyGroup;
	}

	public void setPositionRefRank(String aValue){
		positionRefRank = aValue;
	}
	public String getPositionRefRank(){
		return positionRefRank;
	}

	public void setPositionRefShortName(String aValue){
		positionRefShortName = aValue;
	}
	public String getPositionRefShortName(){
		return positionRefShortName;
	}



}