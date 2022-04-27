
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINMol;

  /**
  * Filter for FINMol;  
  * 	
  */

public class FINMolFilter extends  FINMol {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINMolFilter()
   {
    id = null; 
    text = null; 
    obj_id = Integer.MIN_VALUE; 
    state = Integer.MIN_VALUE; 
    axReceiptBlocking = null; 
    axIssueBlocking = null; 
   }

} // end of Filter for FINMol

