
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesObject2PaymentSchedule;

  /**
  * Filter for ENServicesObject2PaymentSchedule;  
  * 	
  */

public class ENServicesObject2PaymentScheduleFilter extends  ENServicesObject2PaymentSchedule {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesObject2PaymentScheduleFilter()
   {
    code = Integer.MIN_VALUE; 
    startDate = null; 
    endDate = null; 
    paySum = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesObject2PaymentSchedule

