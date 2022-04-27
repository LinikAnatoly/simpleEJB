
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNRole2DomainInfo;

  /**
  * Filter for CNRole2DomainInfo;  
  * 	
  */

public class CNRole2DomainInfoFilter extends  CNRole2DomainInfo {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNRole2DomainInfoFilter()
   {
    code = Integer.MIN_VALUE; 
    domainCode = Integer.MIN_VALUE; 
    cnRoleCode = Integer.MIN_VALUE; 
    cnStartStateCode = Integer.MIN_VALUE; 
    subsystemRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for CNRole2DomainInfo

