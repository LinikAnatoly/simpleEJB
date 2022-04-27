
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPosition;

  /**
  * Filter for ENPosition;  
  * 	
  */

public class ENPositionFilter extends  ENPosition {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPositionFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    finCode = Integer.MIN_VALUE; 
   }

} // end of Filter for ENPosition

