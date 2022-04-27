
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMetrologyDevice;

  /**
  * Filter for ENMetrologyDevice;  
  * 	
  */

public class ENMetrologyDeviceFilter extends  ENMetrologyDevice {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMetrologyDeviceFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    buildNumber = null; 
    invNumber = null; 
    buhName = null; 
    commentGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    deviceType.code = Integer.MIN_VALUE;;
    element.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENMetrologyDevice

