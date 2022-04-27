
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlan2WorkOrderEntry;

  /**
  * Filter for ENPlan2WorkOrderEntry;  
  * 	
  */

public class ENPlan2WorkOrderEntryFilter extends  ENPlan2WorkOrderEntry {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlan2WorkOrderEntryFilter()
   {
    code = Integer.MIN_VALUE; 
    entryCode = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlan2WorkOrderEntry

