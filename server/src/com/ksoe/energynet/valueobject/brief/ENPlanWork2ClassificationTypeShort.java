
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWork2ClassificationType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanWork2ClassificationTypeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public BigDecimal countGen;
	public String userGen;
	public Date dateEdit ;
	public BigDecimal machineHours;
	public BigDecimal relocationKm;
	public BigDecimal transportationLoad;
	public int isPrintOnKmOrMH = Integer.MIN_VALUE;
	public BigDecimal costWorksContractor;
	public Date dateGen ;
	public Date timeStart ;
	public Date timeFinal ;
	public int codeVirtualBrigade = Integer.MIN_VALUE;
	public int isJobsByTime = Integer.MIN_VALUE;
	public int isVisitClient = Integer.MIN_VALUE;
	public BigDecimal productionExpensesPercent;
	public BigDecimal administrativeExpensesPercent;
	public int servicePaymentKind = Integer.MIN_VALUE;
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
	public int classificationTypeRefCode = Integer.MIN_VALUE;
	public String classificationTypeRefName;
	public String classificationTypeRefKod;
	public int connectionWorkTypeRefCode = Integer.MIN_VALUE;
	public String connectionWorkTypeRefName;
	public int calcKindRefCode = Integer.MIN_VALUE;
	public int isGiveCounter = Integer.MIN_VALUE;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setCountGen(BigDecimal aValue){
		countGen = aValue;
	}

	public BigDecimal getCountGen(){
		return countGen;
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

	public void setMachineHours(BigDecimal aValue){
		machineHours = aValue;
	}

	public BigDecimal getMachineHours(){
		return machineHours;
	}

	public void setRelocationKm(BigDecimal aValue){
		relocationKm = aValue;
	}

	public BigDecimal getRelocationKm(){
		return relocationKm;
	}

	public void setTransportationLoad(BigDecimal aValue){
		transportationLoad = aValue;
	}

	public BigDecimal getTransportationLoad(){
		return transportationLoad;
	}

	public void setIsPrintOnKmOrMH(int aValue){
		isPrintOnKmOrMH = aValue;
	}

	public int getIsPrintOnKmOrMH(){
		return isPrintOnKmOrMH;
	}

	public void setCostWorksContractor(BigDecimal aValue){
		costWorksContractor = aValue;
	}

	public BigDecimal getCostWorksContractor(){
		return costWorksContractor;
	}

	public void setDateGen(Date aValue){
		dateGen = aValue;
	}

	public Date getDateGen(){
		return dateGen;
	}

	public void setTimeStart(Date aValue){
		timeStart = aValue;
	}

	public Date getTimeStart(){
		return timeStart;
	}

	public void setTimeFinal(Date aValue){
		timeFinal = aValue;
	}

	public Date getTimeFinal(){
		return timeFinal;
	}

	public void setCodeVirtualBrigade(int aValue){
		codeVirtualBrigade = aValue;
	}

	public int getCodeVirtualBrigade(){
		return codeVirtualBrigade;
	}

	public void setIsJobsByTime(int aValue){
		isJobsByTime = aValue;
	}

	public int getIsJobsByTime(){
		return isJobsByTime;
	}

	public void setIsVisitClient(int aValue){
		isVisitClient = aValue;
	}

	public int getIsVisitClient(){
		return isVisitClient;
	}

	public void setProductionExpensesPercent(BigDecimal aValue){
		productionExpensesPercent = aValue;
	}

	public BigDecimal getProductionExpensesPercent(){
		return productionExpensesPercent;
	}

	public void setAdministrativeExpensesPercent(BigDecimal aValue){
		administrativeExpensesPercent = aValue;
	}

	public BigDecimal getAdministrativeExpensesPercent(){
		return administrativeExpensesPercent;
	}


public void setServicePaymentKind(int aValue){
		servicePaymentKind = aValue;
	}

	public int getServicePaymentKind(){
		return servicePaymentKind;
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

	public void setClassificationTypeRefCode(int aValue){
		classificationTypeRefCode = aValue;
	}
	public int getClassificationTypeRefCode(){
		return classificationTypeRefCode;
	}

	public void setClassificationTypeRefName(String aValue){
		classificationTypeRefName = aValue;
	}
	public String getClassificationTypeRefName(){
		return classificationTypeRefName;
	}

	public void setClassificationTypeRefKod(String aValue){
		classificationTypeRefKod = aValue;
	}
	public String getClassificationTypeRefKod(){
		return classificationTypeRefKod;
	}

	public void setConnectionWorkTypeRefCode(int aValue){
		connectionWorkTypeRefCode = aValue;
	}
	public int getConnectionWorkTypeRefCode(){
		return connectionWorkTypeRefCode;
	}

	public void setConnectionWorkTypeRefName(String aValue){
		connectionWorkTypeRefName = aValue;
	}
	public String getConnectionWorkTypeRefName(){
		return connectionWorkTypeRefName;
	}

	public void setCalcKindRefCode(int aValue){
		calcKindRefCode = aValue;
	}
	public int getCalcKindRefCode(){
		return calcKindRefCode;
	}

    public final int getIsGiveCounter() {
        return isGiveCounter;
    }

    public final void setIsGiveCounter(int isGiveCounter) {
        this.isGiveCounter = isGiveCounter;
    }

}
