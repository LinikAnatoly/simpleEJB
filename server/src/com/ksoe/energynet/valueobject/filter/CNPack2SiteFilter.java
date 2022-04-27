
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNPack2Site;

  /**
  * Filter for CNPack2Site;  
  * 	
  */

public class CNPack2SiteFilter extends  CNPack2Site {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNPack2SiteFilter()
   {
    code = Integer.MIN_VALUE; 
    is_reg = Integer.MIN_VALUE; 
    customeremail = null; 
    phone = null; 
    customertype = Integer.MIN_VALUE; 
    subsystemRef.code = Integer.MIN_VALUE;
    cnPackRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for CNPack2Site

