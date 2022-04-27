
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanType2PlanState;

  /**
  * Filter for ENPlanType2PlanState;  
  * 	
  */

public class ENPlanType2PlanStateFilter extends  ENPlanType2PlanState {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanType2PlanStateFilter()
   {
    code = Integer.MIN_VALUE; 
    typeRef.code = Integer.MIN_VALUE;;
    stateRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENPlanType2PlanState

