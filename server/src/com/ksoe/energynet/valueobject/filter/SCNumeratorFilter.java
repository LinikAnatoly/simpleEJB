
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCNumerator;

  /**
  * Filter for SCNumerator;  
  * 	
  */

public class SCNumeratorFilter extends  SCNumerator {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCNumeratorFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    numberInt = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for SCNumerator

