
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTrafficGPS;

  /**
  * Filter for ENTrafficGPS;  
  * 	
  */

public class ENTrafficGPSFilter extends  ENTrafficGPS {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTrafficGPSFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    sumKm = null; 
    sumFuel = null; 
    realTransport.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTrafficGPS

