
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimateItemPlanPay;

  /**
  * Filter for ENEstimateItemPlanPay;  
  * 	
  */

public class ENEstimateItemPlanPayFilter extends  ENEstimateItemPlanPay {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENEstimateItemPlanPayFilter()
   {
    code = Integer.MIN_VALUE; 
    percentPay = null; 
    datePay = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    typePayRef.code = Integer.MIN_VALUE;
    estimateItemRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENEstimateItemPlanPay

