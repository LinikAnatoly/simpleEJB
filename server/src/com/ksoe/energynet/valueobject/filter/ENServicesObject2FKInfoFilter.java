
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesObject2FKInfo;

  /**
  * Filter for ENServicesObject2FKInfo;  
  * 	
  */

public class ENServicesObject2FKInfoFilter extends  ENServicesObject2FKInfo {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesObject2FKInfoFilter()
   {
    code = Integer.MIN_VALUE; 
    isIncomeAct = Integer.MIN_VALUE; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    servicesObjectKindFKRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesObject2FKInfo

