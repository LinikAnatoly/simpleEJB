
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWorkOrderByt;

  /**
  * Filter for ENWorkOrderByt;  
  * 	
  */

public class ENWorkOrderBytFilter extends  ENWorkOrderByt {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENWorkOrderBytFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    commentGen = null; 
    dateAdd = null; 
    dateEdit = null; 
    userAdd = null; 
    userEdit = null; 
    modify_time = Long.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
    siteRef.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENWorkOrderByt

