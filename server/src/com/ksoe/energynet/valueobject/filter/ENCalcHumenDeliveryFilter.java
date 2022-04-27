
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcHumenDelivery;

  /**
  * Filter for ENCalcHumenDelivery;  
  * 	
  */

public class ENCalcHumenDeliveryFilter extends  ENCalcHumenDelivery {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcHumenDeliveryFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = Integer.MIN_VALUE; 
    classificationTypeNumber = null; 
    priceHour = null; 
    timeGen = null; 
    costGen = null; 
    chargeCostGen = null; 
    costTotal = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    plan2CTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcHumenDelivery

