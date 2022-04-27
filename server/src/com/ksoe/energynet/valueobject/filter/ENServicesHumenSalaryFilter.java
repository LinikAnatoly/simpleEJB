
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesHumenSalary;

  /**
  * Filter for ENServicesHumenSalary;  
  * 	
  */

public class ENServicesHumenSalaryFilter extends  ENServicesHumenSalary {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesHumenSalaryFilter()
   {
    code = Integer.MIN_VALUE; 
    timeGen = null; 
    salary = null; 
    salaryBonus = null; 
    salarySurcharge = null; 
    salaryPremium = null; 
    salaryAdditional = null; 
    salaryTotalBonus = null; 
    salaryTotal = null; 
    servicesCostRef.code = Integer.MIN_VALUE;
    calcHumenSalaryRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesHumenSalary

