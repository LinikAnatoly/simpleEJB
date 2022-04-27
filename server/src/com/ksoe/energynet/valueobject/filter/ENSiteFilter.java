
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSite;

  /**
  * Filter for ENSite;  
  * 	
  */

public class ENSiteFilter extends  ENSite {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSiteFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    siteaddress = null; 
    sitephone = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENSite

