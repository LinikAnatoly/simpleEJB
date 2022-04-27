
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;

  /**
  * Filter for ENAccumulatorsHistory;  
  * 	
  */

public class ENAccumulatorsHistoryFilter extends  ENAccumulatorsHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAccumulatorsHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    installDate = null; 
    uninstallDate = null; 
    distance = null; 
    replacementReason = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    accumulatorsRef.code = Integer.MIN_VALUE;
    transportRealRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAccumulatorsHistory

