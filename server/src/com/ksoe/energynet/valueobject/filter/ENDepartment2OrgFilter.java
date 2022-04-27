
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDepartment2Org;

  /**
  * Filter for ENDepartment2Org;  
  * 	
  */

public class ENDepartment2OrgFilter extends  ENDepartment2Org {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDepartment2OrgFilter()
   {
    code = Integer.MIN_VALUE; 
    org_id = Integer.MIN_VALUE; 
    axOrgId = Integer.MIN_VALUE; 
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDepartment2Org

