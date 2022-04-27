
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINCurrency;

  /**
  * Filter for FINCurrency;  
  * 	
  */

public class FINCurrencyFilter extends  FINCurrency {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINCurrencyFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    shortName = null; 
    isoAlphabeticCode = null; 
    isoNumericCode = null; 
    sign = null; 
   }

} // end of Filter for FINCurrency

