
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNPack2PlanWork;

  /**
  * Filter for CNPack2PlanWork;  
  * 	
  */

public class CNPack2PlanWorkFilter extends  CNPack2PlanWork {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNPack2PlanWorkFilter()
   {
    code = Integer.MIN_VALUE; 
    packCode = Integer.MIN_VALUE; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    packTypeRef.code = Integer.MIN_VALUE;;
    planRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for CNPack2PlanWork

