
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWork2ActFailure;

  /**
  * Filter for ENPlanWork2ActFailure;  
  * 	
  */

public class ENPlanWork2ActFailureFilter extends  ENPlanWork2ActFailure {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWork2ActFailureFilter()
   {
    code = Integer.MIN_VALUE; 
    planRef.code = Integer.MIN_VALUE;
    actFailureRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanWork2ActFailure

