
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncomeServices2SOBill;

  /**
  * Filter for ENActIncomeServices2SOBill;  
  * 	
  */

public class ENActIncomeServices2SOBillFilter extends  ENActIncomeServices2SOBill {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActIncomeServices2SOBillFilter()
   {
    code = Integer.MIN_VALUE; 
    actIncomeRef.code = Integer.MIN_VALUE;
    soBillRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActIncomeServices2SOBill

