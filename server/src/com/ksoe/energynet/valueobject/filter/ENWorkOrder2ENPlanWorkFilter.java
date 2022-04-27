
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;

  /**
  * Filter for ENWorkOrder2ENPlanWork;  
  * 	
  */

public class ENWorkOrder2ENPlanWorkFilter extends  ENWorkOrder2ENPlanWork {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENWorkOrder2ENPlanWorkFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    workOrder.code = Integer.MIN_VALUE;;
    plan.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENWorkOrder2ENPlanWork

