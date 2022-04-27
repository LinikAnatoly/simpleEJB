
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder;

  /**
  * Filter for ENTransportRoute2RQFKOrder;  
  * 	
  */

public class ENTransportRoute2RQFKOrderFilter extends  ENTransportRoute2RQFKOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportRoute2RQFKOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    fkOrderRef.code = Integer.MIN_VALUE;
    transportRouteRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportRoute2RQFKOrder

