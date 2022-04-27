
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSOValuesType;

  /**
  * Filter for ENSOValuesType;  
  * 	
  */

public class ENSOValuesTypeFilter extends  ENSOValuesType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSOValuesTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    sortField = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    categoryRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSOValuesType

