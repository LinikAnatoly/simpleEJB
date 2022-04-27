
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;

  /**
  * Filter for SCUsageInputItemOZ;  
  * 	
  */

public class SCUsageInputItemOZFilter extends  SCUsageInputItemOZ {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCUsageInputItemOZFilter()
   {
    code = Integer.MIN_VALUE; 
    numberDoc = null; 
    numberInt = Integer.MIN_VALUE; 
    counterType = null; 
    account = null; 
    cost = null; 
    countGen = Integer.MIN_VALUE; 
    scCode = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    usageInputItemRef.code = Integer.MIN_VALUE;
    budgetRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCUsageInputItemOZ

