
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Fri Oct 02 10:29:01 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENElement;

  /**
  * Filter for ENElement;  
  * 	
  */

public class ENElementFilter extends  ENElement {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENElementFilter()
   {
    code = Integer.MIN_VALUE; 
    orderField = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    elementInRef.code = Integer.MIN_VALUE;
    elementOutRef.code = Integer.MIN_VALUE;
    renRef.code = Integer.MIN_VALUE;
    finExecutor.code = Integer.MIN_VALUE;
    geoDepartmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENElement

