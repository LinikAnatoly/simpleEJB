
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMol2Department;

  /**
  * Filter for ENMol2Department;  
  * 	
  */

public class ENMol2DepartmentFilter extends  ENMol2Department {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMol2DepartmentFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    mol.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMol2Department

