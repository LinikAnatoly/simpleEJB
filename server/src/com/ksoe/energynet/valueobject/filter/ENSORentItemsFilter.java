
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSORentItems;

  /**
  * Filter for ENSORentItems;  
  * 	
  */

public class ENSORentItemsFilter extends  ENSORentItems {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSORentItemsFilter()
   {
    code = Integer.MIN_VALUE; 
    localityName = null; 
    address = null; 
    streetCode = Integer.MIN_VALUE; 
    renCode = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSORentItems

