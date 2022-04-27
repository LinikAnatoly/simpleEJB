
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCUsageInputItem;

  /**
  * Filter for SCUsageInputItem;  
  * 	
  */

public class SCUsageInputItemFilter extends  SCUsageInputItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCUsageInputItemFilter()
   {
    code = Integer.MIN_VALUE; 
    numberDoc = null; 
    numberInt = Integer.MIN_VALUE; 
    countGen = Integer.MIN_VALUE; 
    scCode = Integer.MIN_VALUE; 
    molCode = null; 
    molName = null; 
    modify_time = Long.MIN_VALUE;
    usageInputRef.code = Integer.MIN_VALUE;
    kindRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCUsageInputItem

