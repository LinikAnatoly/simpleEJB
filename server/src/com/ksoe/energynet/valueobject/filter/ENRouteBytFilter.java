
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRouteByt;

  /**
  * Filter for ENRouteByt;  
  * 	
  */

public class ENRouteBytFilter extends  ENRouteByt {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRouteBytFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    numbergen = null; 
    routeCode = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENRouteByt

