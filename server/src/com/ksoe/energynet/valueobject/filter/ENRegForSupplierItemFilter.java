
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRegForSupplierItem;

  /**
  * Filter for ENRegForSupplierItem;  
  * 	
  */

public class ENRegForSupplierItemFilter extends  ENRegForSupplierItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRegForSupplierItemFilter()
   {
    code = Integer.MIN_VALUE; 
    recordpointEic = null; 
    customerUid = null; 
    datePlanned = null; 
    dateComplete = null; 
    description = null; 
    calcNumber = null; 
    calcName = null; 
    costWithoutVAT = null; 
    costVAT = null; 
    costWithVAT = null; 
    dhDisconnectionCode = Integer.MIN_VALUE; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    registryRef.code = Integer.MIN_VALUE;
    registryTypeRef.code = Integer.MIN_VALUE;
    initiatorRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    factRef.code = Integer.MIN_VALUE;
    classificationTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENRegForSupplierItem

