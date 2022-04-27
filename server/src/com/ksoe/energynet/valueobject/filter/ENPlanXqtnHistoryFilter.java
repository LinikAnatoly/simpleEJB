
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanXqtnHistory;

  /**
  * Filter for ENPlanXqtnHistory;  
  * 	
  */

public class ENPlanXqtnHistoryFilter extends  ENPlanXqtnHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanXqtnHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    executionPercent = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanXqtnHistory

