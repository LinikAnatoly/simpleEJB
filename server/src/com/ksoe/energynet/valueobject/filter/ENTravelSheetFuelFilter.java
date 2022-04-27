
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheetFuel;

  /**
  * Filter for ENTravelSheetFuel;  
  * 	
  */

public class ENTravelSheetFuelFilter extends  ENTravelSheetFuel {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetFuelFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    series = null; 
    numbers = null; 
    dateGen = null; 
    isVRTU = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
    realTransport.code = Integer.MIN_VALUE;
    fuelType.code = Integer.MIN_VALUE;
    travelSheetFuelTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheetFuel

