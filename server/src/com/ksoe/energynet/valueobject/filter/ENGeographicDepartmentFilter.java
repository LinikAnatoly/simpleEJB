
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENGeographicDepartment;

  /**
  * Filter for ENGeographicDepartment;  
  * 	
  */

public class ENGeographicDepartmentFilter extends  ENGeographicDepartment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENGeographicDepartmentFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentgen = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENGeographicDepartment

