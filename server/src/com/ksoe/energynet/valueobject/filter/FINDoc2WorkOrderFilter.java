
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINDoc2WorkOrder;

  /**
  * Filter for FINDoc2WorkOrder;  
  * 	
  */

public class FINDoc2WorkOrderFilter extends  FINDoc2WorkOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINDoc2WorkOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    finDocMOLCode = Integer.MIN_VALUE; 
    finDocMechanicCode = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;;
    workOrderRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for FINDoc2WorkOrder

