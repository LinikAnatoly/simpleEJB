
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcTotalCost;

  /**
  * Filter for ENCalcTotalCost;  
  * 	
  */

public class ENCalcTotalCostFilter extends  ENCalcTotalCost {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcTotalCostFilter()
   {
    code = Integer.MIN_VALUE; 
    calculationCost = null; 
    materialExpenses = null; 
    transportExpenses = null; 
    deliveryCost = null; 
    costWithoutVAT = null; 
    costVAT = null; 
    totalCost = null; 
    limitedSum = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    plan2CTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcTotalCost

