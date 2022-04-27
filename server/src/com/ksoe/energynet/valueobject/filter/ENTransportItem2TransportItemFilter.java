
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportItem2TransportItem;

  /**
  * Filter for ENTransportItem2TransportItem;  
  * 	
  */

public class ENTransportItem2TransportItemFilter extends  ENTransportItem2TransportItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportItem2TransportItemFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    inRef.code = Integer.MIN_VALUE;;
    outRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENTransportItem2TransportItem

