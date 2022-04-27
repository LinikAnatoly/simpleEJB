
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDeliveryOrder;

  /**
  * Filter for ENDeliveryOrder;  
  * 	
  */

public class ENDeliveryOrderFilter extends  ENDeliveryOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDeliveryOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    transportInRef.code = Integer.MIN_VALUE;;
    transportOut.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENDeliveryOrder

