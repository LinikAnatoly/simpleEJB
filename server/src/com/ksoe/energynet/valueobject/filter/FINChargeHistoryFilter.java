
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINChargeHistory;

  /**
  * Filter for FINChargeHistory;  
  * 	
  */

public class FINChargeHistoryFilter extends  FINChargeHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINChargeHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    chargePercent = null; 
    dategen = null; 
    chargeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for FINChargeHistory

