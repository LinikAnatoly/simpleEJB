
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcTransportUsage;

  /**
  * Filter for ENCalcTransportUsage;  
  * 	
  */

public class ENCalcTransportUsageFilter extends  ENCalcTransportUsage {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcTransportUsageFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = Integer.MIN_VALUE; 
    classificationTypeNumber = null; 
    transportName = null; 
    normMachineHours = null; 
    normDistance = null; 
    priceMachineHours = null; 
    priceDistance = null; 
    costMachineHours = null; 
    costDistance = null; 
    costTotal = null; 
    commentPriceDistance = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    tkTransportRef.code = Integer.MIN_VALUE;
    plan2CTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcTransportUsage

