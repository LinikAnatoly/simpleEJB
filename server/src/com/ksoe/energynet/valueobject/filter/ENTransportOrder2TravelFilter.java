
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportOrder2Travel;

  /**
  * Filter for ENTransportOrder2Travel;  
  * 	
  */

public class ENTransportOrder2TravelFilter extends  ENTransportOrder2Travel {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportOrder2TravelFilter()
   {
    code = Integer.MIN_VALUE; 
    transportorder.code = Integer.MIN_VALUE;
    travelsheet.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportOrder2Travel

