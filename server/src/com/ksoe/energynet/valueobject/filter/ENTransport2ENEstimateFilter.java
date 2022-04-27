
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransport2ENEstimate;

  /**
  * Filter for ENTransport2ENEstimate;  
  * 	
  */

public class ENTransport2ENEstimateFilter extends  ENTransport2ENEstimate {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransport2ENEstimateFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    transportRef.code = Integer.MIN_VALUE;;
    estimateRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENTransport2ENEstimate

