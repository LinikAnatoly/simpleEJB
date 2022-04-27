
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDepartment2CCExecutor;

  /**
  * Filter for ENDepartment2CCExecutor;  
  * 	
  */

public class ENDepartment2CCExecutorFilter extends  ENDepartment2CCExecutor {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDepartment2CCExecutorFilter()
   {
    code = Integer.MIN_VALUE; 
    ccExecutorCode = Integer.MIN_VALUE; 
    budgetRef.code = Integer.MIN_VALUE;
    responsibilityRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDepartment2CCExecutor

