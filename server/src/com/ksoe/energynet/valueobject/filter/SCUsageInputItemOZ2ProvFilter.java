
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2Prov;

  /**
  * Filter for SCUsageInputItemOZ2Prov;  
  * 	
  */

public class SCUsageInputItemOZ2ProvFilter extends  SCUsageInputItemOZ2Prov {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCUsageInputItemOZ2ProvFilter()
   {
    code = Integer.MIN_VALUE; 
    partId = Integer.MIN_VALUE; 
    userGen = null; 
    datePosting = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    voucher = null; 
    ozRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCUsageInputItemOZ2Prov

