
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWorkReason;

  /**
  * Filter for ENPlanWorkReason;  
  * 	
  */

public class ENPlanWorkReasonFilter extends  ENPlanWorkReason {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWorkReasonFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    numberGen = null; 
    name = null; 
    commentGen = null; 
    dateEdit = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    management.code = Integer.MIN_VALUE;;
    reasonType.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENPlanWorkReason

