
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMetrologyObject;

  /**
  * Filter for ENMetrologyObject;  
  * 	
  */

public class ENMetrologyObjectFilter extends  ENMetrologyObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMetrologyObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
    is3phase = Integer.MIN_VALUE; 
    isElectron = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    element.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENMetrologyObject

