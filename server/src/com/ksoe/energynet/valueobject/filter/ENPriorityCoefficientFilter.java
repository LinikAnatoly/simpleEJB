
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPriorityCoefficient;

  /**
  * Filter for ENPriorityCoefficient;  
  * 	
  */

public class ENPriorityCoefficientFilter extends  ENPriorityCoefficient {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPriorityCoefficientFilter()
   {
    code = Integer.MIN_VALUE; 
    value6 = null; 
    value35 = null; 
    value150 = null; 
    modify_time = Long.MIN_VALUE;
    userGen = null; 
    dateEdit = null; 
    elementTypeRef.code = Integer.MIN_VALUE;
    coeffTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPriorityCoefficient

