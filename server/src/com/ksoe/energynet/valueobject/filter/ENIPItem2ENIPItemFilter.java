
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENIPItem2ENIPItem;

  /**
  * Filter for ENIPItem2ENIPItem;  
  * 	
  */

public class ENIPItem2ENIPItemFilter extends  ENIPItem2ENIPItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENIPItem2ENIPItemFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    ipItemInRef.code = Integer.MIN_VALUE;
    ipItemOutRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENIPItem2ENIPItem

