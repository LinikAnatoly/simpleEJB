
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel;

  /**
  * Filter for ENPlanGraphFinancingFuel;  
  * 	
  */

public class ENPlanGraphFinancingFuelFilter extends  ENPlanGraphFinancingFuel {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanGraphFinancingFuelFilter()
   {
    code = Integer.MIN_VALUE; 
    monthGen = Integer.MIN_VALUE; 
    yearGen = Integer.MIN_VALUE; 
    totalSum = null; 
    koefDekada1 = null; 
    koefDekada2 = null; 
    koefDekada3 = null; 
    countFuelSpent = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    fuelTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanGraphFinancingFuel

