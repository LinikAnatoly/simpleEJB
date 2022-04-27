
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportOrder;

  /**
  * Filter for ENTransportOrder;  
  * 	
  */

public class ENTransportOrderFilter extends  ENTransportOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    numbergen = null; 
    timeStart = null; 
    timeFinal = null; 
    dateStart = null; 
    dateFinal = null; 
    isAssignment = Integer.MIN_VALUE; 
    isApproved = Integer.MIN_VALUE; 
    isRejected = Integer.MIN_VALUE; 
    commentGen = null; 
    dateEdit = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    transportOrderStatus.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    transport.code = Integer.MIN_VALUE;
    transportReal.code = Integer.MIN_VALUE;
    transportDepartment.code = Integer.MIN_VALUE;
    parentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportOrder

