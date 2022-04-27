
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENElement2EstimateItem;

  /**
  * Filter for ENElement2EstimateItem;  
  * 	
  */

public class ENElement2EstimateItemFilter extends  ENElement2EstimateItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENElement2EstimateItemFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
    elementTypeRef.code = Integer.MIN_VALUE;
    estimateItemRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENElement2EstimateItem

