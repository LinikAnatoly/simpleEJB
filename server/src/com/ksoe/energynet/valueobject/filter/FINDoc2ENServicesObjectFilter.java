
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINDoc2ENServicesObject;

  /**
  * Filter for FINDoc2ENServicesObject;  
  * 	
  */

public class FINDoc2ENServicesObjectFilter extends  FINDoc2ENServicesObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINDoc2ENServicesObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    finDocCode = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
    finDocTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for FINDoc2ENServicesObject

