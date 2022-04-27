
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportTemperature;

  /**
  * Filter for ENTransportTemperature;  
  * 	
  */

public class ENTransportTemperatureFilter extends  ENTransportTemperature {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportTemperatureFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    dateGen = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    transportDepartmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportTemperature

