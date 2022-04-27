
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;

  /**
  * Filter for ENServicesFactCalcByAct;  
  * 	
  */

public class ENServicesFactCalcByActFilter extends  ENServicesFactCalcByAct {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesFactCalcByActFilter()
   {
    code = Integer.MIN_VALUE; 
    materialsCost = null; 
    transportCost = null; 
    deliveryCost = null; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesFactCalcByAct

