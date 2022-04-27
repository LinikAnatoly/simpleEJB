
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBonusListItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBonusListItemShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String podrId;
	public String podrName;
	public String fio;
	public String tabNumber;
	public String positionId;
	public String positionName;
	public BigDecimal fundWorkTime;
	public BigDecimal workTimeFact;
	public BigDecimal hoursWorkedWithStaff;
	public BigDecimal timeDelivery;
	public BigDecimal hoursWorkedPlan;
	public BigDecimal hoursWorkedNotPlan;
	public BigDecimal hoursWorkedSum;
	public BigDecimal percentLoadWork;
	public BigDecimal percentLoadByPlanWork;
	public BigDecimal percentLoadByNotPlanWork;
	public BigDecimal percentBonus;
	public BigDecimal coefficient;
	public BigDecimal percentBonusForCharging;
	public BigDecimal countFactWorkedDays;
	public String tradeCategoryId;
	public Date dateStart ;
	public Date dateFinal ;
	public BigDecimal noWayOutFromPeriod;
	public BigDecimal summaCompensation;
	public BigDecimal coefficientQuality;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public String reasonInvalid;
	public String userSetInvalid;
	public Date dateSetInvalid ;
	public int bonusListCode = Integer.MIN_VALUE;
	public String bonusListNumberGen;
	public int bonusListMonthGen = Integer.MIN_VALUE;
	public int bonusListYearGen = Integer.MIN_VALUE;
	public String bonusListUserAdd;
	public Date bonusListDateAdd;
	public String bonusListUserGen;
	public Date bonusListDateEdit;
	public int statusCode = Integer.MIN_VALUE;
	public String statusName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setPodrId(String aValue){
		podrId = aValue;
	}

	public String getPodrId(){
		return podrId;
	}

	public void setPodrName(String aValue){
		podrName = aValue;
	}

	public String getPodrName(){
		return podrName;
	}

	public void setFio(String aValue){
		fio = aValue;
	}

	public String getFio(){
		return fio;
	}

	public void setTabNumber(String aValue){
		tabNumber = aValue;
	}

	public String getTabNumber(){
		return tabNumber;
	}

	public void setPositionId(String aValue){
		positionId = aValue;
	}

	public String getPositionId(){
		return positionId;
	}

	public void setPositionName(String aValue){
		positionName = aValue;
	}

	public String getPositionName(){
		return positionName;
	}

	public void setFundWorkTime(BigDecimal aValue){
		fundWorkTime = aValue;
	}

	public BigDecimal getFundWorkTime(){
		return fundWorkTime;
	}

	public void setWorkTimeFact(BigDecimal aValue){
		workTimeFact = aValue;
	}

	public BigDecimal getWorkTimeFact(){
		return workTimeFact;
	}

	public void setHoursWorkedWithStaff(BigDecimal aValue){
		hoursWorkedWithStaff = aValue;
	}

	public BigDecimal getHoursWorkedWithStaff(){
		return hoursWorkedWithStaff;
	}

	public void setTimeDelivery(BigDecimal aValue){
		timeDelivery = aValue;
	}

	public BigDecimal getTimeDelivery(){
		return timeDelivery;
	}

	public void setHoursWorkedPlan(BigDecimal aValue){
		hoursWorkedPlan = aValue;
	}

	public BigDecimal getHoursWorkedPlan(){
		return hoursWorkedPlan;
	}

	public void setHoursWorkedNotPlan(BigDecimal aValue){
		hoursWorkedNotPlan = aValue;
	}

	public BigDecimal getHoursWorkedNotPlan(){
		return hoursWorkedNotPlan;
	}

	public void setHoursWorkedSum(BigDecimal aValue){
		hoursWorkedSum = aValue;
	}

	public BigDecimal getHoursWorkedSum(){
		return hoursWorkedSum;
	}

	public void setPercentLoadWork(BigDecimal aValue){
		percentLoadWork = aValue;
	}

	public BigDecimal getPercentLoadWork(){
		return percentLoadWork;
	}

	public void setPercentLoadByPlanWork(BigDecimal aValue){
		percentLoadByPlanWork = aValue;
	}

	public BigDecimal getPercentLoadByPlanWork(){
		return percentLoadByPlanWork;
	}

	public void setPercentLoadByNotPlanWork(BigDecimal aValue){
		percentLoadByNotPlanWork = aValue;
	}

	public BigDecimal getPercentLoadByNotPlanWork(){
		return percentLoadByNotPlanWork;
	}

	public void setPercentBonus(BigDecimal aValue){
		percentBonus = aValue;
	}

	public BigDecimal getPercentBonus(){
		return percentBonus;
	}

	public void setCoefficient(BigDecimal aValue){
		coefficient = aValue;
	}

	public BigDecimal getCoefficient(){
		return coefficient;
	}

	public void setPercentBonusForCharging(BigDecimal aValue){
		percentBonusForCharging = aValue;
	}

	public BigDecimal getPercentBonusForCharging(){
		return percentBonusForCharging;
	}

	public void setCountFactWorkedDays(BigDecimal aValue){
		countFactWorkedDays = aValue;
	}

	public BigDecimal getCountFactWorkedDays(){
		return countFactWorkedDays;
	}

	public void setTradeCategoryId(String aValue){
		tradeCategoryId = aValue;
	}

	public String getTradeCategoryId(){
		return tradeCategoryId;
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

	public void setNoWayOutFromPeriod(BigDecimal aValue){
		noWayOutFromPeriod = aValue;
	}

	public BigDecimal getNoWayOutFromPeriod(){
		return noWayOutFromPeriod;
	}

	public void setSummaCompensation(BigDecimal aValue){
		summaCompensation = aValue;
	}

	public BigDecimal getSummaCompensation(){
		return summaCompensation;
	}

	public void setCoefficientQuality(BigDecimal aValue){
		coefficientQuality = aValue;
	}

	public BigDecimal getCoefficientQuality(){
		return coefficientQuality;
	}

	public void setUserAdd(String aValue){
		userAdd = aValue;
	}

	public String getUserAdd(){
		return userAdd;
	}

	public void setDateAdd(Date aValue){
		dateAdd = aValue;
	}

	public Date getDateAdd(){
		return dateAdd;
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


	public void setReasonInvalid(String aValue){
		reasonInvalid = aValue;
	}

	public String getReasonInvalid(){
		return reasonInvalid;
	}

	public void setUserSetInvalid(String aValue){
		userSetInvalid = aValue;
	}

	public String getUserSetInvalid(){
		return userSetInvalid;
	}

	public void setDateSetInvalid(Date aValue){
		dateSetInvalid = aValue;
	}

	public Date getDateSetInvalid(){
		return dateSetInvalid;
	}


	public void setBonusListCode(int aValue){
		bonusListCode = aValue;
	}
	public int getBonusListCode(){
		return bonusListCode;
	}

	public void setBonusListNumberGen(String aValue){
		bonusListNumberGen = aValue;
	}
	public String getBonusListNumberGen(){
		return bonusListNumberGen;
	}

	public void setBonusListMonthGen(int aValue){
		bonusListMonthGen = aValue;
	}
	public int getBonusListMonthGen(){
		return bonusListMonthGen;
	}

	public void setBonusListYearGen(int aValue){
		bonusListYearGen = aValue;
	}
	public int getBonusListYearGen(){
		return bonusListYearGen;
	}

	public void setBonusListUserAdd(String aValue){
		bonusListUserAdd = aValue;
	}
	public String getBonusListUserAdd(){
		return bonusListUserAdd;
	}

	public void setBonusListDateAdd(Date aValue){
		bonusListDateAdd = aValue;
	}
	public Date getBonusListDateAdd(){
		return bonusListDateAdd;
	}

	public void setBonusListUserGen(String aValue){
		bonusListUserGen = aValue;
	}
	public String getBonusListUserGen(){
		return bonusListUserGen;
	}

	public void setBonusListDateEdit(Date aValue){
		bonusListDateEdit = aValue;
	}
	public Date getBonusListDateEdit(){
		return bonusListDateEdit;
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



}
