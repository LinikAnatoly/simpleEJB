
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMOLSTOREKEEPER2PlanWork;

  /**
  * Filter for ENMOLSTOREKEEPER2PlanWork;  
  * 	
  */

public class ENMOLSTOREKEEPER2PlanWorkFilter extends  ENMOLSTOREKEEPER2PlanWork {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMOLSTOREKEEPER2PlanWorkFilter()
   {
    code = Integer.MIN_VALUE; 
    molName = null; 
    molCode = null; 
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMOLSTOREKEEPER2PlanWork

