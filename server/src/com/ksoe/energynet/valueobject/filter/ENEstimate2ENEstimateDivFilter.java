
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimate2ENEstimateDiv;

  /**
  * Filter for ENEstimate2ENEstimateDiv;  
  * 	
  */

public class ENEstimate2ENEstimateDivFilter extends  ENEstimate2ENEstimateDiv {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENEstimate2ENEstimateDivFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    modify_time = Long.MIN_VALUE;
    estimateItemInRef.code = Integer.MIN_VALUE;
    estimateItemOutRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENEstimate2ENEstimateDiv

