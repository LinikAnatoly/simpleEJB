
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo;

  /**
  * Filter for SCUsageInputItemOZInfo;  
  * 	
  */

public class SCUsageInputItemOZInfoFilter extends  SCUsageInputItemOZInfo {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCUsageInputItemOZInfoFilter()
   {
    code = Integer.MIN_VALUE; 
    sourceCode = null; 
    account = null; 
    expensesCode = null; 
    sumWithNds = null; 
    sumNds = null; 
    sumGen = null; 
    modify_time = Long.MIN_VALUE;
    usageInputItemOZRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCUsageInputItemOZInfo

