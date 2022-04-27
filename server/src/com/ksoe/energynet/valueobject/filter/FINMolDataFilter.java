
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINMolData;

  /**
  * Filter for FINMolData;  
  * 	
  */

public class FINMolDataFilter extends  FINMolData {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINMolDataFilter()
   {
    code = Integer.MIN_VALUE; 
    finMolCode = null; 
    finMolName = null; 
    modify_time = Long.MIN_VALUE;
    molTypeRef.code = Integer.MIN_VALUE;;
    act.code = Integer.MIN_VALUE;;
    workOrder.code = Integer.MIN_VALUE;;
   }

} // end of Filter for FINMolData

