
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;

  /**
  * Filter for ENEstimateItem2ENEstimateItem;  
  * 	
  */

public class ENEstimateItem2ENEstimateItemFilter extends  ENEstimateItem2ENEstimateItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENEstimateItem2ENEstimateItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    modify_time = Long.MIN_VALUE;
    estimateItemInRef.code = Integer.MIN_VALUE;;
    estimateItemOutRef.code = Integer.MIN_VALUE;;
    typeRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENEstimateItem2ENEstimateItem

