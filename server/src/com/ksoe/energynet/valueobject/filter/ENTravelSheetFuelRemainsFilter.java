
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;

  /**
  * Filter for ENTravelSheetFuelRemains;  
  * 	
  */

public class ENTravelSheetFuelRemainsFilter extends  ENTravelSheetFuelRemains {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetFuelRemainsFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    countGenStart = null; 
    priceGenStart = null; 
    sumGenStart = null; 
    countGenIn = null; 
    priceGenIn = null; 
    sumGenIn = null; 
    countGenOut = null; 
    priceGenOut = null; 
    sumGenOut = null; 
    countGenFinal = null; 
    priceGenFinal = null; 
    sumGenFinal = null; 
    modify_time = Long.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
    fuelTypeRef.code = Integer.MIN_VALUE;
    realTransport.code = Integer.MIN_VALUE;
    travelSheetFuelTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheetFuelRemains

