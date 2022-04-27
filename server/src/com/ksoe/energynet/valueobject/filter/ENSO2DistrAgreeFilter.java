
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSO2DistrAgree;

  /**
  * Filter for ENSO2DistrAgree;  
  * 	
  */

public class ENSO2DistrAgreeFilter extends  ENSO2DistrAgree {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSO2DistrAgreeFilter()
   {
    code = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
    distrAgree.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSO2DistrAgree

