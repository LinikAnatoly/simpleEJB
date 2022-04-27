
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimateItem;

  /**
  * Filter for ENEstimateItem;  
  * 	
  */

public class ENEstimateItemFilter extends  ENEstimateItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENEstimateItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    countFact = null; 
    price = null; 
    priceVRTU = null; 
    cost = null; 
    isUseVAT = Integer.MIN_VALUE; 
    deliveryTime = Integer.MIN_VALUE; 
    useWorkTime = Integer.MIN_VALUE; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    planItemRef.code = Integer.MIN_VALUE;
    materialRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    kindRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    oldStatusRef.code = Integer.MIN_VALUE;
    accountingTypeRef.code = Integer.MIN_VALUE;
    purchaseItemRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENEstimateItem

