
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCountersStateVerification;

  /**
  * Filter for ENCountersStateVerification;  
  * 	
  */

public class ENCountersStateVerificationFilter extends  ENCountersStateVerification {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCountersStateVerificationFilter()
   {
    code = Integer.MIN_VALUE; 
    invNumber = null; 
    name = null; 
    buildNumber = null; 
    priceGen = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    planRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
    fkOrderRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCountersStateVerification

