
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSO2SecObjectResp;

  /**
  * Filter for ENSO2SecObjectResp;  
  * 	
  */

public class ENSO2SecObjectRespFilter extends  ENSO2SecObjectResp {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSO2SecObjectRespFilter()
   {
    code = Integer.MIN_VALUE; 
    responsibleName = null; 
    responsiblePosition = null; 
    responsibleContactInfo = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSO2SecObjectResp

