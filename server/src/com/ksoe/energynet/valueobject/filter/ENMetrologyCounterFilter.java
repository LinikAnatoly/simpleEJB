
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMetrologyCounter;

  /**
  * Filter for ENMetrologyCounter;  
  * 	
  */

public class ENMetrologyCounterFilter extends  ENMetrologyCounter {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMetrologyCounterFilter()
   {
    code = Integer.MIN_VALUE; 
    invNumber = null; 
    name = null; 
    buildNumber = null; 
    account = null; 
    departmetFKCode = null; 
    molCode = null; 
    dateIn = null; 
    dateBuild = null; 
    cost = null; 
    scCode = Integer.MIN_VALUE; 
    counterType = null; 
    phasity = Integer.MIN_VALUE; 
    zones = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
    zoneRef.code = Integer.MIN_VALUE;
    accountingTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMetrologyCounter

