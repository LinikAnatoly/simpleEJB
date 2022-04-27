
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesCost;

  /**
  * Filter for ENServicesCost;  
  * 	
  */

public class ENServicesCostFilter extends  ENServicesCost {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesCostFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    countGen = null; 
    materialExpenses = null; 
    transportExpenses = null; 
    deliveryCost = null; 
    salaryExpenses = null; 
    socialCharges = null; 
    directExpenses = null; 
    productionExpenses = null; 
    totalExpenses = null; 
    normIncome = null; 
    calculationCost = null; 
    costWithoutVAT = null; 
    costVAT = null; 
    costWithVAT = null; 
    tkCalcCostRef.code = Integer.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesCost

