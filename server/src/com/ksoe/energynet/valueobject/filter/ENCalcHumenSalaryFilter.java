
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcHumenSalary;

  /**
  * Filter for ENCalcHumenSalary;  
  * 	
  */

public class ENCalcHumenSalaryFilter extends  ENCalcHumenSalary {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcHumenSalaryFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = Integer.MIN_VALUE; 
    classificationTypeNumber = null; 
    positionName = null; 
    timeGenMonth = null; 
    timeGen = null; 
    salaryMonth = null; 
    priceHour = null; 
    salaryHour = null; 
    salaryBonus = null; 
    salarySurcharge = null; 
    salaryPremium = null; 
    salaryAdditional = null; 
    salaryTotalBonus = null; 
    salaryTotal = null; 
    percentBonus = null; 
    percentSurcharge = null; 
    percentPremium = null; 
    percentAdditional = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    plan2CTypeRef.code = Integer.MIN_VALUE;
    positionRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcHumenSalary

