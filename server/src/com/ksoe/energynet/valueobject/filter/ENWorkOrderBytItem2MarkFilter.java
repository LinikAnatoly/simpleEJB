
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark;

  /**
  * Filter for ENWorkOrderBytItem2Mark;  
  * 	
  */

public class ENWorkOrderBytItem2MarkFilter extends  ENWorkOrderBytItem2Mark {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENWorkOrderBytItem2MarkFilter()
   {
    code = Integer.MIN_VALUE; 
    markCode = Integer.MIN_VALUE; 
    markName = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    workOrderBytItemRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENWorkOrderBytItem2Mark

