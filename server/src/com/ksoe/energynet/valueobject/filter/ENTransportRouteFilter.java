
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportRoute;

  /**
  * Filter for ENTransportRoute;  
  * 	
  */

public class ENTransportRouteFilter extends  ENTransportRoute {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportRouteFilter()
   {
    code = Integer.MIN_VALUE; 
    distance = null; 
    weight = null; 
    commentGen = null; 
    dateEdit = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    elementInRef.code = Integer.MIN_VALUE;
    elementOutRef.code = Integer.MIN_VALUE;
    distanceRef.code = Integer.MIN_VALUE;
    distanceTypeRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportRoute

