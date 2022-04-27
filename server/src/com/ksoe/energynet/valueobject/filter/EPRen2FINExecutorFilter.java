
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.EPRen2FINExecutor;

  /**
  * Filter for EPRen2FINExecutor;  
  * 	
  */

public class EPRen2FINExecutorFilter extends  EPRen2FINExecutor {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public EPRen2FINExecutorFilter()
   {
    code = Integer.MIN_VALUE; 
    renRef.code = Integer.MIN_VALUE;
    finExecutorRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for EPRen2FINExecutor

