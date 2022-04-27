
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanProjectCalculation;

  /**
  * Filter for ENPlanProjectCalculation;  
  * 	
  */

public class ENPlanProjectCalculationFilter extends  ENPlanProjectCalculation {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanProjectCalculationFilter()
   {
    code = Integer.MIN_VALUE; 
    tkProjWorkCalculation.code = Integer.MIN_VALUE;
    projectWorkRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanProjectCalculation

