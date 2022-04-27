
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDeliveryTime;

  /**
  * Filter for ENDeliveryTime;  
  * 	
  */

public class ENDeliveryTimeFilter extends  ENDeliveryTime {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDeliveryTimeFilter()
   {
    code = Integer.MIN_VALUE; 
    deliveryTimePlan = null; 
    deliveryTimeFact = null; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    deliveryKind.code = Integer.MIN_VALUE;;
    humenItemRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENDeliveryTime

