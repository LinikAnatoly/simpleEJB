
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMol2GeoDepartment;

  /**
  * Filter for ENMol2GeoDepartment;  
  * 	
  */

public class ENMol2GeoDepartmentFilter extends  ENMol2GeoDepartment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMol2GeoDepartmentFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    mol.code = Integer.MIN_VALUE;
    geoDepartment.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMol2GeoDepartment

