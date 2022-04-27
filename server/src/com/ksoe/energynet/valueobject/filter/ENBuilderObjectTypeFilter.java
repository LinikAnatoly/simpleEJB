
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilderObjectType;

  /**
  * Filter for ENBuilderObjectType;  
  * 	
  */

public class ENBuilderObjectTypeFilter extends  ENBuilderObjectType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuilderObjectTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
   }

} // end of Filter for ENBuilderObjectType

