
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheetItem;

  /**
  * Filter for ENTravelSheetItem;  
  * 	
  */

public class ENTravelSheetItemFilter extends  ENTravelSheetItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetItemFilter()
   {
    code = Integer.MIN_VALUE; 
    travelFrom = null; 
    travelTo = null; 
    timeStart = null; 
    timeFinal = null; 
    speedometerStart = null; 
    speedometerFinal = null; 
    fuelCounterStart = null; 
    fuelCounterFinal = null; 
    sumDistances = null; 
    sumMachineHours = null; 
    heatingTime = null; 
    commentGen = null; 
    rashodProbeg = null; 
    rashodWork = null; 
    transportKoef = null; 
    distanceByGPS = null; 
    hoursByGPS = null; 
    hoursInMotionByGPS = null; 
    hoursStopWorkByGPS = null; 
    hoursStopOffByGPS = null; 
    travelOrder = Integer.MIN_VALUE; 
    dateEdit = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    parentItemRef.code = Integer.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    kindRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheetItem

