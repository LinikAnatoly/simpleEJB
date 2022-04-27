
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportOrder2TransportItem;

  /**
  * Filter for ENTransportOrder2TransportItem;  
  * 	
  */

public class ENTransportOrder2TransportItemFilter extends  ENTransportOrder2TransportItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportOrder2TransportItemFilter()
   {
    code = Integer.MIN_VALUE; 
    transportOrder.code = Integer.MIN_VALUE;
    transportItem.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportOrder2TransportItem

