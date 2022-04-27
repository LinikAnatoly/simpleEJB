
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef;

  /**
  * Filter for ENTransportRouteDistance2TKFuelKoef;  
  * 	
  */

public class ENTransportRouteDistance2TKFuelKoefFilter extends  ENTransportRouteDistance2TKFuelKoef {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportRouteDistance2TKFuelKoefFilter()
   {
    code = Integer.MIN_VALUE; 
    transportRouteDistanceRef.code = Integer.MIN_VALUE;
    tkFuelKoefRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportRouteDistance2TKFuelKoef

