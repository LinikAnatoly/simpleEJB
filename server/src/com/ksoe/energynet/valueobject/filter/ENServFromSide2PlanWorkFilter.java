
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServFromSide2PlanWork;

  /**
  * Filter for ENServFromSide2PlanWork;  
  * 	
  */

public class ENServFromSide2PlanWorkFilter extends  ENServFromSide2PlanWork {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServFromSide2PlanWorkFilter()
   {
    code = Integer.MIN_VALUE; 
    servFromSideRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServFromSide2PlanWork

