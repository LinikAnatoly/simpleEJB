
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAccess2Enelement;

  /**
  * Filter for ENAccess2Enelement;  
  * 	
  */

public class ENAccess2EnelementFilter extends  ENAccess2Enelement {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAccess2EnelementFilter()
   {
    code = Integer.MIN_VALUE; 
    isAccess = Integer.MIN_VALUE; 
    elementRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAccess2Enelement

