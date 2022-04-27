
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcCost;

  /**
  * Filter for ENCalcCost;  
  * 	
  */

public class ENCalcCostFilter extends  ENCalcCost {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcCostFilter()
   {
    code = Integer.MIN_VALUE; 
    directExpenses = null; 
    salaryExpenses = null; 
    socialCharges = null; 
    productionExpenses = null; 
    totalExpenses = null; 
    normIncome = null; 
    calculationCost = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    plan2CTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcCost

