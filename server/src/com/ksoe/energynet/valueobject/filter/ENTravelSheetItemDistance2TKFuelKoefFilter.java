
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance2TKFuelKoef;

  /**
  * Filter for ENTravelSheetItemDistance2TKFuelKoef;  
  * 	
  */

public class ENTravelSheetItemDistance2TKFuelKoefFilter extends  ENTravelSheetItemDistance2TKFuelKoef {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetItemDistance2TKFuelKoefFilter()
   {
    code = Integer.MIN_VALUE; 
    travelSheetItemDistanceRef.code = Integer.MIN_VALUE;
    tkFuelKoefRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheetItemDistance2TKFuelKoef

