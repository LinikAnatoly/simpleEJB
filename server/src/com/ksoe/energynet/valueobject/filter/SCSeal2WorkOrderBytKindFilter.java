
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCSeal2WorkOrderBytKind;

  /**
  * Filter for SCSeal2WorkOrderBytKind;  
  * 	
  */

public class SCSeal2WorkOrderBytKindFilter extends  SCSeal2WorkOrderBytKind {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCSeal2WorkOrderBytKindFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
   }

} // end of Filter for SCSeal2WorkOrderBytKind

