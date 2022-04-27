
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheet;

  /**
  * Filter for ENTravelSheet;  
  * 	
  */

public class ENTravelSheetFilter extends  ENTravelSheet {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateStart = null; 
    dateFinal = null; 
    speedometerStart = null; 
    speedometerFinal = null; 
    fuelCounterStart = null; 
    fuelCounterFinal = null; 
    timeStart = null; 
    timeFinal = null; 
    commentGen = null; 
    dateEdit = null; 
    userGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    isPrinted = Integer.MIN_VALUE; 
    isMobiliztn = Integer.MIN_VALUE; 
    department.code = Integer.MIN_VALUE;
    transportReal.code = Integer.MIN_VALUE;
    trailer1.code = Integer.MIN_VALUE;
    trailer2.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
    finWorker_additional_1.code = Integer.MIN_VALUE;
    finWorker_additional_2.code = Integer.MIN_VALUE;
    workModeRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheet

