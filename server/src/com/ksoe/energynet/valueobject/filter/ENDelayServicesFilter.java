
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDelayServices;

  /**
  * Filter for ENDelayServices;  
  * 	
  */

public class ENDelayServicesFilter extends  ENDelayServices {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDelayServicesFilter()
   {
    code = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinal = null; 
    workDaysCount = Integer.MIN_VALUE; 
    calendarDaysCount = Integer.MIN_VALUE; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDelayServices

