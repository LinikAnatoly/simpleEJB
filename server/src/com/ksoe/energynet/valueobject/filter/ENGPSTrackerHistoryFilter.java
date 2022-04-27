
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;

  /**
  * Filter for ENGPSTrackerHistory;  
  * 	
  */

public class ENGPSTrackerHistoryFilter extends  ENGPSTrackerHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENGPSTrackerHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinal = null; 
    reg_id = null; 
    phoneNumber = null; 
    cardNumber = null; 
    userGen = null; 
    dateEdit = null; 
    realTransport.code = Integer.MIN_VALUE;
    gpsTracker.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENGPSTrackerHistory

