
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINExecutor;

  /**
  * Filter for FINExecutor;  
  * 	
  */

public class FINExecutorFilter extends  FINExecutor {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINExecutorFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    finCode = Integer.MIN_VALUE; 
    finTypeName = null; 
    finTypeCode = Integer.MIN_VALUE; 
    finKindName = null; 
    finKindCode = Integer.MIN_VALUE; 
    finCehName = null; 
    finCehCode = Integer.MIN_VALUE; 
    axOrgId = null; 
    axParentOrgId = null; 
    axParentOrgName = null; 
    axOrgTypeId = Integer.MIN_VALUE; 
    axOrgTypeName = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for FINExecutor

