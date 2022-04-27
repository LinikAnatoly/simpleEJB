
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FKTrans2AXTrans;

  /**
  * Filter for FKTrans2AXTrans;  
  * 	
  */

public class FKTrans2AXTransFilter extends  FKTrans2AXTrans {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FKTrans2AXTransFilter()
   {
    code = Integer.MIN_VALUE; 
    monthGen = Integer.MIN_VALUE; 
    yearGen = Integer.MIN_VALUE; 
    taskOwner = null; 
   }

} // end of Filter for FKTrans2AXTrans

