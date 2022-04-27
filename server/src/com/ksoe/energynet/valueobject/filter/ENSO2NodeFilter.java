
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSO2Node;

  /**
  * Filter for ENSO2Node;  
  * 	
  */

public class ENSO2NodeFilter extends  ENSO2Node {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSO2NodeFilter()
   {
    code = Integer.MIN_VALUE; 
    ccNodeCode = Integer.MIN_VALUE; 
    power = null; 
    description = null; 
    isCalc = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
    so2nodeType.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSO2Node

