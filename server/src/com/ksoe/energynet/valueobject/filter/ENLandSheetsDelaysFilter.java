
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENLandSheetsDelays;

  /**
  * Filter for ENLandSheetsDelays;  
  * 	
  */

public class ENLandSheetsDelaysFilter extends  ENLandSheetsDelays {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENLandSheetsDelaysFilter()
   {
    code = Integer.MIN_VALUE; 
    dateFrom = null; 
    dateTo = null; 
    standardDelay = Integer.MIN_VALUE; 
    nonstandardDelay = Integer.MIN_VALUE; 
    commentgen = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENLandSheetsDelays

