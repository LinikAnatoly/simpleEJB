
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTimeLine;

  /**
  * Filter for ENTimeLine;  
  * 	
  */

public class ENTimeLineFilter extends  ENTimeLine {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTimeLineFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    timeStart = null; 
    timeFinal = null; 
    timeMoveToObject = null; 
    timeMoveOfObject = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    virtualBrigadeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTimeLine

