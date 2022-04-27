
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FKTrans2AXTransItem;

  /**
  * Filter for FKTrans2AXTransItem;  
  * 	
  */

public class FKTrans2AXTransItemFilter extends  FKTrans2AXTransItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FKTrans2AXTransItemFilter()
   {
    code = Integer.MIN_VALUE; 
    numUnFKStr = null; 
    partId = Integer.MIN_VALUE; 
    isPrihod = Integer.MIN_VALUE; 
    transDate = null; 
    balCeh = null; 
    balSch = null; 
    balKau = null; 
    korCeh = null; 
    korSch = null; 
    korKau = null; 
    amountCur = null; 
    currency = null; 
    amountMST = null; 
    accountNum = null; 
    offsetAccountNum = null; 
    accountDimension1 = null; 
    accountDimension2 = null; 
    accountDimension3 = null; 
    accountDimension4 = null; 
    accountDimension5 = null; 
    accountDimension6 = null; 
    accountDimension7 = null; 
    accountDimension8 = null; 
    accountDimension9 = null; 
    accountDimension10 = null; 
    accountDimension11 = null; 
    accountDimension12 = null; 
    accountDimension13 = null; 
    corAccountDimension1 = null; 
    corAccountDimension2 = null; 
    corAccountDimension3 = null; 
    corAccountDimension4 = null; 
    corAccountDimension5 = null; 
    corAccountDimension6 = null; 
    corAccountDimension7 = null; 
    corAccountDimension8 = null; 
    corAccountDimension9 = null; 
    corAccountDimension10 = null; 
    corAccountDimension11 = null; 
    corAccountDimension12 = null; 
    corAccountDimension13 = null; 
    ledgerTxt = null; 
    voucher = null; 
    status = Integer.MIN_VALUE; 
    errorStr = null; 
    FKTrans2AXTrans.code = Integer.MIN_VALUE;
   }

} // end of Filter for FKTrans2AXTransItem

