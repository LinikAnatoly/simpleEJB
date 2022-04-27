
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPWI2Element;

  /**
  * Filter for ENPWI2Element;  
  * 	
  */

public class ENPWI2ElementFilter extends  ENPWI2Element {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPWI2ElementFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    planWorkItemRef.code = Integer.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPWI2Element

