
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActPostingKind;

  /**
  * Filter for ENActPostingKind;  
  * 	
  */

public class ENActPostingKindFilter extends  ENActPostingKind {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActPostingKindFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    name = null; 
    dateTemplate = null; 
    account_expense = null; 
    kau_expense = null; 
    account_closing = null; 
    kau_closing = null; 
    typeOperMatetialsAct = null; 
    typeOperMatetialsOrder = null; 
    typeOperCountersAct = null; 
   }

} // end of Filter for ENActPostingKind

