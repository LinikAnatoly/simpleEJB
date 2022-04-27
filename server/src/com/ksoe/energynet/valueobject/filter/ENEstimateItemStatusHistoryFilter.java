
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory;

  /**
  * Filter for ENEstimateItemStatusHistory;  
  * 	
  */

public class ENEstimateItemStatusHistoryFilter extends  ENEstimateItemStatusHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENEstimateItemStatusHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    isLast = Integer.MIN_VALUE; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    estimateItemRef.code = Integer.MIN_VALUE;;
    statusRef.code = Integer.MIN_VALUE;;
    typeRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENEstimateItemStatusHistory

