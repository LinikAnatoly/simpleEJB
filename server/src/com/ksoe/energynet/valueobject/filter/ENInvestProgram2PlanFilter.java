
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENInvestProgram2Plan;

  /**
  * Filter for ENInvestProgram2Plan;  
  * 	
  */

public class ENInvestProgram2PlanFilter extends  ENInvestProgram2Plan {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENInvestProgram2PlanFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    investProgramRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENInvestProgram2Plan

