
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENInvestProgramItem;

  /**
  * Filter for ENInvestProgramItem;  
  * 	
  */

public class ENInvestProgramItemFilter extends  ENInvestProgramItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENInvestProgramItemFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
    countGen = null; 
    price = null; 
    sumGen = null; 
    quarter1count = null; 
    quarter1sum = null; 
    quarter2count = null; 
    quarter2sum = null; 
    quarter3count = null; 
    quarter3sum = null; 
    quarter4count = null; 
    quarter4sum = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    investProgramRef.code = Integer.MIN_VALUE;
    materialRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENInvestProgramItem

