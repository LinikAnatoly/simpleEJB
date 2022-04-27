
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENConnectionPowerPoint;

  /**
  * Filter for ENConnectionPowerPoint;  
  * 	
  */

public class ENConnectionPowerPointFilter extends  ENConnectionPowerPoint {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENConnectionPowerPointFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    coef = null; 
   }

} // end of Filter for ENConnectionPowerPoint

