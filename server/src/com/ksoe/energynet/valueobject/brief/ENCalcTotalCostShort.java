
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcTotalCost;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCalcTotalCostShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal calculationCost;
	public BigDecimal materialExpenses;
	public BigDecimal transportExpenses;
	public BigDecimal deliveryCost;
	public BigDecimal costWithoutVAT;
	public BigDecimal costVAT;
	public BigDecimal totalCost;
	public BigDecimal limitedSum;
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


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setCalculationCost(BigDecimal aValue){
		calculationCost = aValue;
	}

	public BigDecimal getCalculationCost(){
		return calculationCost;
	}

	public void setMaterialExpenses(BigDecimal aValue){
		materialExpenses = aValue;
	}

	public BigDecimal getMaterialExpenses(){
		return materialExpenses;
	}

	public void setTransportExpenses(BigDecimal aValue){
		transportExpenses = aValue;
	}

	public BigDecimal getTransportExpenses(){
		return transportExpenses;
	}

	public void setDeliveryCost(BigDecimal aValue){
		deliveryCost = aValue;
	}

	public BigDecimal getDeliveryCost(){
		return deliveryCost;
	}

	public void setCostWithoutVAT(BigDecimal aValue){
		costWithoutVAT = aValue;
	}

	public BigDecimal getCostWithoutVAT(){
		return costWithoutVAT;
	}

	public void setCostVAT(BigDecimal aValue){
		costVAT = aValue;
	}

	public BigDecimal getCostVAT(){
		return costVAT;
	}

	public void setTotalCost(BigDecimal aValue){
		totalCost = aValue;
	}

	public BigDecimal getTotalCost(){
		return totalCost;
	}

	public void setLimitedSum(BigDecimal aValue){
		limitedSum = aValue;
	}

	public BigDecimal getLimitedSum(){
		return limitedSum;
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



}