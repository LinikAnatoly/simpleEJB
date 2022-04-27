
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWork2PlanWorkReason;

  /**
  * Filter for ENPlanWork2PlanWorkReason;  
  * 	
  */

public class ENPlanWork2PlanWorkReasonFilter extends  ENPlanWork2PlanWorkReason {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWork2PlanWorkReasonFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;;
    planWorkReasonRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENPlanWork2PlanWorkReason

