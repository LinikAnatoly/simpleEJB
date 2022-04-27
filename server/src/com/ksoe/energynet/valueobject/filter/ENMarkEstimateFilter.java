
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMarkEstimate;

  /**
  * Filter for ENMarkEstimate;
  *
  */

public class ENMarkEstimateFilter extends  ENMarkEstimate {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMarkEstimateFilter()
   {
    code = Integer.MIN_VALUE;
    userName = null;
    mark.code = Integer.MIN_VALUE;
    estimateItem.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMarkEstimate