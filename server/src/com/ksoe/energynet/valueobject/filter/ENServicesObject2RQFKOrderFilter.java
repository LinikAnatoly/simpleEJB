
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesObject2RQFKOrder;

  /**
  * Filter for ENServicesObject2RQFKOrder;
  *
  */

public class ENServicesObject2RQFKOrderFilter extends  ENServicesObject2RQFKOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesObject2RQFKOrderFilter()
   {
    code = Integer.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
    fkOrderRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesObject2RQFKOrder

