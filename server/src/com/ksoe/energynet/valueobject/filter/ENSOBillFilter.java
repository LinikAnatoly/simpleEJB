
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSOBill;

  /**
  * Filter for ENSOBill;  
  * 	
  */

public class ENSOBillFilter extends  ENSOBill {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSOBillFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    sumTotal = null; 
    sumGen = null; 
    sumVat = null; 
    userGen = null; 
    dateEdit = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSOBill

