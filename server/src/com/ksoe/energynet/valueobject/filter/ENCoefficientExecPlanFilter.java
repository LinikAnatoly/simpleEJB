
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCoefficientExecPlan;

  /**
  * Filter for ENCoefficientExecPlan;  
  * 	
  */

public class ENCoefficientExecPlanFilter extends  ENCoefficientExecPlan {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCoefficientExecPlanFilter()
   {
    code = Integer.MIN_VALUE; 
    coefficient = null; 
    dateGen = null; 
    finPodrCode = Integer.MIN_VALUE; 
    axOrgId = null; 
   }

} // end of Filter for ENCoefficientExecPlan

