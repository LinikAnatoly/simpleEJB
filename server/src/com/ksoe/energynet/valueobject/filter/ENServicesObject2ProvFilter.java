
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesObject2Prov;

  /**
  * Filter for ENServicesObject2Prov;  
  * 	
  */

public class ENServicesObject2ProvFilter extends  ENServicesObject2Prov {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesObject2ProvFilter()
   {
    code = Integer.MIN_VALUE; 
    partId = Integer.MIN_VALUE; 
    userGen = null; 
    datePosting = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    voucher = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesObject2Prov

