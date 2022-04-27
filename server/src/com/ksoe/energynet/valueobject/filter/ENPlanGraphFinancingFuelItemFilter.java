
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem;

  /**
  * Filter for ENPlanGraphFinancingFuelItem;  
  * 	
  */

public class ENPlanGraphFinancingFuelItemFilter extends  ENPlanGraphFinancingFuelItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanGraphFinancingFuelItemFilter()
   {
    code = Integer.MIN_VALUE; 
    totalSum = null; 
    sumDekada1 = null; 
    sumDekada2 = null; 
    sumDekada3 = null; 
    countFuelSpent = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
    planGraphRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanGraphFinancingFuelItem

