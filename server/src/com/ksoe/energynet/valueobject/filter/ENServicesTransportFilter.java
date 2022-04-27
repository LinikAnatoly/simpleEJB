
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesTransport;

  /**
  * Filter for ENServicesTransport;  
  * 	
  */

public class ENServicesTransportFilter extends  ENServicesTransport {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesTransportFilter()
   {
    code = Integer.MIN_VALUE; 
    machineHoursCount = null; 
    distance = null; 
    costMachineHours = null; 
    costDistance = null; 
    costTotal = null; 
    servicesCostRef.code = Integer.MIN_VALUE;
    calcTransportRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesTransport

