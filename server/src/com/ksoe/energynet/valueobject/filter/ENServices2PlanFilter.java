
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServices2Plan;

  /**
  * Filter for ENServices2Plan;  
  * 	
  */

public class ENServices2PlanFilter extends  ENServices2Plan {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServices2PlanFilter()
   {
    code = Integer.MIN_VALUE; 
    dfPackCode = Integer.MIN_VALUE; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServices2Plan

