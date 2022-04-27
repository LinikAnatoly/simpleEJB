
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENInvestProgramGroups;

  /**
  * Filter for ENInvestProgramGroups;  
  * 	
  */

public class ENInvestProgramGroupsFilter extends  ENInvestProgramGroups {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENInvestProgramGroupsFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentgen = null; 
   }

} // end of Filter for ENInvestProgramGroups

