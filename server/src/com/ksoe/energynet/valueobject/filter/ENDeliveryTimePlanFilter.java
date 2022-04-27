
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDeliveryTimePlan;

  /**
  * Filter for ENDeliveryTimePlan;  
  * 	
  */

public class ENDeliveryTimePlanFilter extends  ENDeliveryTimePlan {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDeliveryTimePlanFilter()
   {
    code = Integer.MIN_VALUE; 
    deliveryTimePlan = null; 
    deliveryTimeFact = null; 
    deliveryDistance = null; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    planWorkRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENDeliveryTimePlan

