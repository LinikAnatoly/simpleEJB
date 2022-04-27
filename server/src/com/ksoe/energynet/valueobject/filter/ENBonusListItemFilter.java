
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBonusListItem;

  /**
  * Filter for ENBonusListItem;  
  * 	
  */

public class ENBonusListItemFilter extends  ENBonusListItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBonusListItemFilter()
   {
    code = Integer.MIN_VALUE; 
    podrId = null; 
    podrName = null; 
    fio = null; 
    tabNumber = null; 
    positionId = null; 
    positionName = null; 
    fundWorkTime = null; 
    workTimeFact = null; 
    hoursWorkedWithStaff = null; 
    timeDelivery = null; 
    hoursWorkedPlan = null; 
    hoursWorkedNotPlan = null; 
    hoursWorkedSum = null; 
    percentLoadWork = null; 
    percentLoadByPlanWork = null; 
    percentLoadByNotPlanWork = null; 
    percentBonus = null; 
    coefficient = null; 
    percentBonusForCharging = null; 
    countFactWorkedDays = null; 
    tradeCategoryId = null; 
    dateStart = null; 
    dateFinal = null; 
    noWayOutFromPeriod = null; 
    summaCompensation = null; 
    coefficientQuality = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    reasonInvalid = null; 
    userSetInvalid = null; 
    dateSetInvalid = null; 
    bonusList.code = Integer.MIN_VALUE;
    status.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBonusListItem

