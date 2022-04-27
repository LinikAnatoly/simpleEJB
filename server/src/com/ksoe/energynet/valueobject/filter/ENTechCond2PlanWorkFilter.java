
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTechCond2PlanWork;

  /**
  * Filter for ENTechCond2PlanWork;  
  * 	
  */

public class ENTechCond2PlanWorkFilter extends  ENTechCond2PlanWork {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTechCond2PlanWorkFilter()
   {
    code = Integer.MIN_VALUE; 
    techConServicesRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTechCond2PlanWork

