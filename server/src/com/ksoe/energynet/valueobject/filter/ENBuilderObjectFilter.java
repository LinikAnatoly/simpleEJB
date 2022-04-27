
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilderObject;

  /**
  * Filter for ENBuilderObject;  
  * 	
  */

public class ENBuilderObjectFilter extends  ENBuilderObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuilderObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    invNumber = null; 
    name = null; 
    buhName = null; 
    yearBuild = Integer.MIN_VALUE; 
    yearWorkingStart = Integer.MIN_VALUE; 
    commentGen = null; 
    dateGen = null; 
    userGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    objectType.code = Integer.MIN_VALUE;;
    element.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENBuilderObject

