
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2Humen;

  /**
  * Filter for ENAct2Humen;  
  * 	
  */

public class ENAct2HumenFilter extends  ENAct2Humen {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2HumenFilter()
   {
    code = Integer.MIN_VALUE; 
    orederNum = Integer.MIN_VALUE; 
    tabNumber = null; 
    fio = null; 
    salary = null; 
    timeMonth = null; 
    daysMonth = null; 
    salaryHours = null; 
    timeWork = null; 
    timeObjectWork = null; 
    timeWorkFact = null; 
    timeDelivery = null; 
    paysWork = null; 
    bonus = null; 
    salaryHoursBonus = null; 
    paysWorkBonus = null; 
    chargePercent = null; 
    chargeSum = null; 
    balans = null; 
    podrcod = null; 
    cehId = null; 
    modify_time = Long.MIN_VALUE;
    payWorkCou = null; 
    humenKindRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
    chargeRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2Humen

