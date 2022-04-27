
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENGiveCounter;

  /**
  * Filter for ENGiveCounter;  
  * 	
  */

public class ENGiveCounterFilter extends  ENGiveCounter {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENGiveCounterFilter()
   {
    code = Integer.MIN_VALUE; 
    counterType = null; 
    serialNumber = null; 
    cost = null; 
    vat = null; 
    molCode = null; 
    molName = null; 
    dateBuild = null; 
    phasity = Integer.MIN_VALUE; 
    commentGen = null; 
    plan2ClTypeRef.code = Integer.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENGiveCounter

