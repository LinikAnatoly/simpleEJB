
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNRen2ENDepartment;

  /**
  * Filter for CNRen2ENDepartment;  
  * 	
  */

public class CNRen2ENDepartmentFilter extends  CNRen2ENDepartment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNRen2ENDepartmentFilter()
   {
    code = Integer.MIN_VALUE; 
    cnRenCode = Integer.MIN_VALUE; 
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for CNRen2ENDepartment

