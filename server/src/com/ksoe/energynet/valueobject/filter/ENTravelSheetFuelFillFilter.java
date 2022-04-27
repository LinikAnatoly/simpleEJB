
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheetFuelFill;

  /**
  * Filter for ENTravelSheetFuelFill;  
  * 	
  */

public class ENTravelSheetFuelFillFilter extends  ENTravelSheetFuelFill {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetFuelFillFilter()
   {
    code = Integer.MIN_VALUE; 
    reg_id = Integer.MIN_VALUE; 
    timeGen = null; 
    countGen = null; 
    timeReceived = null; 
    modify_time = Long.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheetFuelFill

