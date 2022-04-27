
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActInTechCond2ENAct;

  /**
  * Filter for ENActInTechCond2ENAct;  
  * 	
  */

public class ENActInTechCond2ENActFilter extends  ENActInTechCond2ENAct {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActInTechCond2ENActFilter()
   {
    code = Integer.MIN_VALUE; 
    summaGen = null; 
    actIncomeRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActInTechCond2ENAct

