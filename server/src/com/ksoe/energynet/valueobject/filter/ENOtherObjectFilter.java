
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENOtherObject;

  /**
  * Filter for ENOtherObject;  
  * 	
  */

public class ENOtherObjectFilter extends  ENOtherObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENOtherObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
    buhName = null; 
    invNumber = null; 
    buildNumber = null; 
    userGen = null; 
    dateEdit = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENOtherObject

