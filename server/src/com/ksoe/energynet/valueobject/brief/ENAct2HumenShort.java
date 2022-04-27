
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2Humen;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2HumenShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int orederNum = Integer.MIN_VALUE;
	public String tabNumber;
	public String fio;
	public BigDecimal salary;
	public BigDecimal timeMonth;
	public BigDecimal daysMonth;
	public BigDecimal salaryHours;
	public BigDecimal timeWork;
	public BigDecimal timeObjectWork;
	public BigDecimal timeWorkFact;
	public BigDecimal timeDelivery;
	public BigDecimal paysWork;
	public BigDecimal bonus;
	public BigDecimal salaryHoursBonus;
	public BigDecimal paysWorkBonus;
	public BigDecimal chargePercent;
	public BigDecimal chargeSum;
	public String balans;
	public String podrcod;
	public String cehId;
	public BigDecimal payWorkCou;
	public int humenKindRefCode = Integer.MIN_VALUE;
	public String humenKindRefName;
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public int actRefFinDocCode = Integer.MIN_VALUE;
	public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public int chargeRefCode = Integer.MIN_VALUE;
	public String chargeRefName;
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


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setOrederNum(int aValue){
		orederNum = aValue;
	}

	public int getOrederNum(){
		return orederNum;
	}

	public void setTabNumber(String aValue){
		tabNumber = aValue;
	}

	public String getTabNumber(){
		return tabNumber;
	}

	public void setFio(String aValue){
		fio = aValue;
	}

	public String getFio(){
		return fio;
	}

	public void setSalary(BigDecimal aValue){
		salary = aValue;
	}

	public BigDecimal getSalary(){
		return salary;
	}

	public void setTimeMonth(BigDecimal aValue){
		timeMonth = aValue;
	}

	public BigDecimal getTimeMonth(){
		return timeMonth;
	}

	public void setDaysMonth(BigDecimal aValue){
		daysMonth = aValue;
	}

	public BigDecimal getDaysMonth(){
		return daysMonth;
	}

	public void setSalaryHours(BigDecimal aValue){
		salaryHours = aValue;
	}

	public BigDecimal getSalaryHours(){
		return salaryHours;
	}

	public void setTimeWork(BigDecimal aValue){
		timeWork = aValue;
	}

	public BigDecimal getTimeWork(){
		return timeWork;
	}

	public void setTimeObjectWork(BigDecimal aValue){
		timeObjectWork = aValue;
	}

	public BigDecimal getTimeObjectWork(){
		return timeObjectWork;
	}

	public void setTimeWorkFact(BigDecimal aValue){
		timeWorkFact = aValue;
	}

	public BigDecimal getTimeWorkFact(){
		return timeWorkFact;
	}

	public void setTimeDelivery(BigDecimal aValue){
		timeDelivery = aValue;
	}

	public BigDecimal getTimeDelivery(){
		return timeDelivery;
	}

	public void setPaysWork(BigDecimal aValue){
		paysWork = aValue;
	}

	public BigDecimal getPaysWork(){
		return paysWork;
	}

	public void setBonus(BigDecimal aValue){
		bonus = aValue;
	}

	public BigDecimal getBonus(){
		return bonus;
	}

	public void setSalaryHoursBonus(BigDecimal aValue){
		salaryHoursBonus = aValue;
	}

	public BigDecimal getSalaryHoursBonus(){
		return salaryHoursBonus;
	}

	public void setPaysWorkBonus(BigDecimal aValue){
		paysWorkBonus = aValue;
	}

	public BigDecimal getPaysWorkBonus(){
		return paysWorkBonus;
	}

	public void setChargePercent(BigDecimal aValue){
		chargePercent = aValue;
	}

	public BigDecimal getChargePercent(){
		return chargePercent;
	}

	public void setChargeSum(BigDecimal aValue){
		chargeSum = aValue;
	}

	public BigDecimal getChargeSum(){
		return chargeSum;
	}

	public void setBalans(String aValue){
		balans = aValue;
	}

	public String getBalans(){
		return balans;
	}

	public void setPodrcod(String aValue){
		podrcod = aValue;
	}

	public String getPodrcod(){
		return podrcod;
	}

	public void setCehId(String aValue){
		cehId = aValue;
	}

	public String getCehId(){
		return cehId;
	}


	public void setPayWorkCou(BigDecimal aValue){
		payWorkCou = aValue;
	}

	public BigDecimal getPayWorkCou(){
		return payWorkCou;
	}


	public void setHumenKindRefCode(int aValue){
		humenKindRefCode = aValue;
	}
	public int getHumenKindRefCode(){
		return humenKindRefCode;
	}

	public void setHumenKindRefName(String aValue){
		humenKindRefName = aValue;
	}
	public String getHumenKindRefName(){
		return humenKindRefName;
	}

	public void setActRefCode(int aValue){
		actRefCode = aValue;
	}
	public int getActRefCode(){
		return actRefCode;
	}

	public void setActRefNumberGen(String aValue){
		actRefNumberGen = aValue;
	}
	public String getActRefNumberGen(){
		return actRefNumberGen;
	}

	public void setActRefDateGen(Date aValue){
		actRefDateGen = aValue;
	}
	public Date getActRefDateGen(){
		return actRefDateGen;
	}

	public void setActRefFinDocCode(int aValue){
		actRefFinDocCode = aValue;
	}
	public int getActRefFinDocCode(){
		return actRefFinDocCode;
	}

	public void setActRefFinDocMechanicCode(int aValue){
		actRefFinDocMechanicCode = aValue;
	}
	public int getActRefFinDocMechanicCode(){
		return actRefFinDocMechanicCode;
	}

	public void setActRefFinMolName(String aValue){
		actRefFinMolName = aValue;
	}
	public String getActRefFinMolName(){
		return actRefFinMolName;
	}

	public void setActRefFinMechanicName(String aValue){
		actRefFinMechanicName = aValue;
	}
	public String getActRefFinMechanicName(){
		return actRefFinMechanicName;
	}

	public void setActRefInvNumber(String aValue){
		actRefInvNumber = aValue;
	}
	public String getActRefInvNumber(){
		return actRefInvNumber;
	}

	public void setActRefUserGen(String aValue){
		actRefUserGen = aValue;
	}
	public String getActRefUserGen(){
		return actRefUserGen;
	}

	public void setActRefDateEdit(Date aValue){
		actRefDateEdit = aValue;
	}
	public Date getActRefDateEdit(){
		return actRefDateEdit;
	}

	public void setActRefDateAct(Date aValue){
		actRefDateAct = aValue;
	}
	public Date getActRefDateAct(){
		return actRefDateAct;
	}

	public void setChargeRefCode(int aValue){
		chargeRefCode = aValue;
	}
	public int getChargeRefCode(){
		return chargeRefCode;
	}

	public void setChargeRefName(String aValue){
		chargeRefName = aValue;
	}
	public String getChargeRefName(){
		return chargeRefName;
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



}