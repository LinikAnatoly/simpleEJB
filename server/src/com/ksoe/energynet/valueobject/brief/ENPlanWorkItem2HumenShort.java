
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkItem2Humen;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanWorkItem2HumenShort implements Serializable {

	private static final long serialVersionUID = 1L;

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
	public BigDecimal costDelivery;
	public BigDecimal generalExpenses;
	public BigDecimal administrativeExpenses;
	public String cehId;
	public BigDecimal percentSurcharge;
	public BigDecimal salaryHoursSurcharge;
	public BigDecimal paysWorkSurcharge;
	public BigDecimal percentPremium;
	public BigDecimal salaryHoursPremium;
	public BigDecimal paysWorkPremium;
	public BigDecimal percentAdditional;
	public BigDecimal salaryHoursAdditional;
	public BigDecimal paysWorkAdditional;
	public BigDecimal paysWorkWithAllSurcharge;
	public BigDecimal paysWorkWithAllSurchargeWithoutDeliv;
	public BigDecimal paysWorkBonusWithoutDeliv;
	public BigDecimal paysWorkSurchargeWithoutDeliv;
	public BigDecimal paysWorkPremiumWithoutDeliv;
	public BigDecimal paysWorkAdditionalWithoutDeliv;
	public BigDecimal chargeSumWithoutDeliv;
	public int humenKindRefCode = Integer.MIN_VALUE;
	public String humenKindRefName;
	public int plaItemRefCode = Integer.MIN_VALUE;
	public BigDecimal plaItemRefCountGen;
	public BigDecimal plaItemRefTimeGen;
	public BigDecimal plaItemRefCostGen;
	public String plaItemRefUserGen;
	public Date plaItemRefDateEdit;
	public int classificationTypeRefCode = Integer.MIN_VALUE;
	public String classificationTypeRefName;
	public String classificationTypeRefKod;
	public int chargeRefCode = Integer.MIN_VALUE;
	public String chargeRefName;
	public int positionRefCode = Integer.MIN_VALUE;
	public String positionRefName;
	public String positionRefSafetyGroup;
	public String positionRefRank;
	public String positionRefShortName;
	public int transportCode = Integer.MIN_VALUE;
	public String transportName;


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

	public void setCostDelivery(BigDecimal aValue){
		costDelivery = aValue;
	}

	public BigDecimal getCostDelivery(){
		return costDelivery;
	}

	public void setGeneralExpenses(BigDecimal aValue){
		generalExpenses = aValue;
	}

	public BigDecimal getGeneralExpenses(){
		return generalExpenses;
	}

	public void setAdministrativeExpenses(BigDecimal aValue){
		administrativeExpenses = aValue;
	}

	public BigDecimal getAdministrativeExpenses(){
		return administrativeExpenses;
	}

	public void setCehId(String aValue){
		cehId = aValue;
	}

	public String getCehId(){
		return cehId;
	}

	public void setPercentSurcharge(BigDecimal aValue){
		percentSurcharge = aValue;
	}

	public BigDecimal getPercentSurcharge(){
		return percentSurcharge;
	}

	public void setSalaryHoursSurcharge(BigDecimal aValue){
		salaryHoursSurcharge = aValue;
	}

	public BigDecimal getSalaryHoursSurcharge(){
		return salaryHoursSurcharge;
	}

	public void setPaysWorkSurcharge(BigDecimal aValue){
		paysWorkSurcharge = aValue;
	}

	public BigDecimal getPaysWorkSurcharge(){
		return paysWorkSurcharge;
	}

	public void setPercentPremium(BigDecimal aValue){
		percentPremium = aValue;
	}

	public BigDecimal getPercentPremium(){
		return percentPremium;
	}

	public void setSalaryHoursPremium(BigDecimal aValue){
		salaryHoursPremium = aValue;
	}

	public BigDecimal getSalaryHoursPremium(){
		return salaryHoursPremium;
	}

	public void setPaysWorkPremium(BigDecimal aValue){
		paysWorkPremium = aValue;
	}

	public BigDecimal getPaysWorkPremium(){
		return paysWorkPremium;
	}

	public void setPercentAdditional(BigDecimal aValue){
		percentAdditional = aValue;
	}

	public BigDecimal getPercentAdditional(){
		return percentAdditional;
	}

	public void setSalaryHoursAdditional(BigDecimal aValue){
		salaryHoursAdditional = aValue;
	}

	public BigDecimal getSalaryHoursAdditional(){
		return salaryHoursAdditional;
	}

	public void setPaysWorkAdditional(BigDecimal aValue){
		paysWorkAdditional = aValue;
	}

	public BigDecimal getPaysWorkAdditional(){
		return paysWorkAdditional;
	}

	public void setPaysWorkWithAllSurcharge(BigDecimal aValue){
		paysWorkWithAllSurcharge = aValue;
	}

	public BigDecimal getPaysWorkWithAllSurcharge(){
		return paysWorkWithAllSurcharge;
	}

	public void setPaysWorkWithAllSurchargeWithoutDeliv(BigDecimal aValue){
		paysWorkWithAllSurchargeWithoutDeliv = aValue;
	}

	public BigDecimal getPaysWorkWithAllSurchargeWithoutDeliv(){
		return paysWorkWithAllSurchargeWithoutDeliv;
	}

	public void setPaysWorkBonusWithoutDeliv(BigDecimal aValue){
		paysWorkBonusWithoutDeliv = aValue;
	}

	public BigDecimal getPaysWorkBonusWithoutDeliv(){
		return paysWorkBonusWithoutDeliv;
	}

	public void setPaysWorkSurchargeWithoutDeliv(BigDecimal aValue){
		paysWorkSurchargeWithoutDeliv = aValue;
	}

	public BigDecimal getPaysWorkSurchargeWithoutDeliv(){
		return paysWorkSurchargeWithoutDeliv;
	}

	public void setPaysWorkPremiumWithoutDeliv(BigDecimal aValue){
		paysWorkPremiumWithoutDeliv = aValue;
	}

	public BigDecimal getPaysWorkPremiumWithoutDeliv(){
		return paysWorkPremiumWithoutDeliv;
	}

	public void setPaysWorkAdditionalWithoutDeliv(BigDecimal aValue){
		paysWorkAdditionalWithoutDeliv = aValue;
	}

	public BigDecimal getPaysWorkAdditionalWithoutDeliv(){
		return paysWorkAdditionalWithoutDeliv;
	}

	public void setChargeSumWithoutDeliv(BigDecimal aValue){
		chargeSumWithoutDeliv = aValue;
	}

	public BigDecimal getChargeSumWithoutDeliv(){
		return chargeSumWithoutDeliv;
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

	public void setPlaItemRefCode(int aValue){
		plaItemRefCode = aValue;
	}
	public int getPlaItemRefCode(){
		return plaItemRefCode;
	}

	public void setPlaItemRefCountGen(BigDecimal aValue){
		plaItemRefCountGen = aValue;
	}
	public BigDecimal getPlaItemRefCountGen(){
		return plaItemRefCountGen;
	}

	public void setPlaItemRefTimeGen(BigDecimal aValue){
		plaItemRefTimeGen = aValue;
	}
	public BigDecimal getPlaItemRefTimeGen(){
		return plaItemRefTimeGen;
	}

	public void setPlaItemRefCostGen(BigDecimal aValue){
		plaItemRefCostGen = aValue;
	}
	public BigDecimal getPlaItemRefCostGen(){
		return plaItemRefCostGen;
	}

	public void setPlaItemRefUserGen(String aValue){
		plaItemRefUserGen = aValue;
	}
	public String getPlaItemRefUserGen(){
		return plaItemRefUserGen;
	}

	public void setPlaItemRefDateEdit(Date aValue){
		plaItemRefDateEdit = aValue;
	}
	public Date getPlaItemRefDateEdit(){
		return plaItemRefDateEdit;
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

	public void setTransportCode(int aValue){
		transportCode = aValue;
	}
	public int getTransportCode(){
		return transportCode;
	}

	public void setTransportName(String aValue){
		transportName = aValue;
	}
	public String getTransportName(){
		return transportName;
	}



}
