
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSO2SecObject;

  /**
  * Filter for ENSO2SecObject;  
  * 	
  */

public class ENSO2SecObjectFilter extends  ENSO2SecObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSO2SecObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    securityObj = null; 
    securityObjAddress = null; 
    securityPeriod = null; 
    guardPost = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSO2SecObject

