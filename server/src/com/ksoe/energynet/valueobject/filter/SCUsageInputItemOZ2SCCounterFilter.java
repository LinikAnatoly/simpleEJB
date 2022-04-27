
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter;

  /**
  * Filter for SCUsageInputItemOZ2SCCounter;  
  * 	
  */

public class SCUsageInputItemOZ2SCCounterFilter extends  SCUsageInputItemOZ2SCCounter {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCUsageInputItemOZ2SCCounterFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    ozRef.code = Integer.MIN_VALUE;
    scCounterRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCUsageInputItemOZ2SCCounter

