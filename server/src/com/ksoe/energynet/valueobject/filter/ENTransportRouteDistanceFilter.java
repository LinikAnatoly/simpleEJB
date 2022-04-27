
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportRouteDistance;

  /**
  * Filter for ENTransportRouteDistance;  
  * 	
  */

public class ENTransportRouteDistanceFilter extends  ENTransportRouteDistance {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportRouteDistanceFilter()
   {
    code = Integer.MIN_VALUE; 
    distance = null; 
    koef = null; 
    transportRouteRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportRouteDistance

