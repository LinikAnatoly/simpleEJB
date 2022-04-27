
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder;

  /**
  * Filter for FINDoc2Act2WorkOrder;  
  * 	
  */

public class FINDoc2Act2WorkOrderFilter extends  FINDoc2Act2WorkOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINDoc2Act2WorkOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    finDocCode300 = Integer.MIN_VALUE; 
    axJournalId = null; 
    modify_time = Long.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
    workOrderRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for FINDoc2Act2WorkOrder

