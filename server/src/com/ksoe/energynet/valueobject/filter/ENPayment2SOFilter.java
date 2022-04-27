
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPayment2SO;

  /**
  * Filter for ENPayment2SO;  
  * 	
  */

public class ENPayment2SOFilter extends  ENPayment2SO {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPayment2SOFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    sumTotal = null; 
    sumGen = null; 
    sumVat = null; 
    userGen = null; 
    dateEdit = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    paymentTypeRef.code = Integer.MIN_VALUE;
    soBillRef.code = Integer.MIN_VALUE;
    orderRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPayment2SO

