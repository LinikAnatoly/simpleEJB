
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesDelivery;

  /**
  * Filter for ENServicesDelivery;  
  * 	
  */

public class ENServicesDeliveryFilter extends  ENServicesDelivery {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesDeliveryFilter()
   {
    code = Integer.MIN_VALUE; 
    timeGen = null; 
    costGen = null; 
    chargeCostGen = null; 
    costTotal = null; 
    servicesCostRef.code = Integer.MIN_VALUE;
    calcDeliveryRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesDelivery

