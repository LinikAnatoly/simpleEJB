
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSettings;

  /**
  * Filter for ENSettings;  
  * 	
  */

public class ENSettingsFilter extends  ENSettings {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSettingsFilter()
   {
    code = Integer.MIN_VALUE; 
    key = null; 
    comment = null;
    currentValue = null;
   }

} // end of Filter for ENSettings

