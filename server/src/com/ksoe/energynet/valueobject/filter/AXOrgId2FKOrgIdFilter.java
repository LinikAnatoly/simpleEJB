
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.AXOrgId2FKOrgId;

  /**
  * Filter for AXOrgId2FKOrgId;  
  * 	
  */

public class AXOrgId2FKOrgIdFilter extends  AXOrgId2FKOrgId {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public AXOrgId2FKOrgIdFilter()
   {
    code = Integer.MIN_VALUE; 
    axOrgId = null; 
    axName = null; 
    fkOrgId = null; 
    fkName = null; 
   }

} // end of Filter for AXOrgId2FKOrgId

