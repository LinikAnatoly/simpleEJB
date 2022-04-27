
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENGeoDep2ENDepartment;

  /**
  * Filter for ENGeoDep2ENDepartment;  
  * 	
  */

public class ENGeoDep2ENDepartmentFilter extends  ENGeoDep2ENDepartment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENGeoDep2ENDepartmentFilter()
   {
    code = Integer.MIN_VALUE; 
    commentgen = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
    geoDepartmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENGeoDep2ENDepartment

