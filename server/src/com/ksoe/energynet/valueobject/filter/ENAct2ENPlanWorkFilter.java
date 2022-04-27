
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;

  /**
  * Filter for ENAct2ENPlanWork;  
  * 	
  */

public class ENAct2ENPlanWorkFilter extends  ENAct2ENPlanWork {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2ENPlanWorkFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;;
    plan.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENAct2ENPlanWork

