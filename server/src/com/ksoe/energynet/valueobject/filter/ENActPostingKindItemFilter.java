
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActPostingKindItem;

  /**
  * Filter for ENActPostingKindItem;  
  * 	
  */

public class ENActPostingKindItemFilter extends  ENActPostingKindItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActPostingKindItemFilter()
   {
    code = Integer.MIN_VALUE; 
    cehKt = null; 
    accountKt = null; 
    kauKt = null; 
    cehDt = null; 
    accountDt = null; 
    kauDt = null; 
    summaGen = null; 
    plusMinus = null; 
    description = null; 
    ENActPostingKind.code = Integer.MIN_VALUE;
    ENActPostingTypeSum.code = Integer.MIN_VALUE;
    ENActPostingForm.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActPostingKindItem

