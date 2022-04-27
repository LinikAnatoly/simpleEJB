
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSOPayBillProv;

  /**
  * Filter for ENSOPayBillProv;  
  * 	
  */

public class ENSOPayBillProvFilter extends  ENSOPayBillProv {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSOPayBillProvFilter()
   {
    code = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    soRef.code = Integer.MIN_VALUE;
    payment2soRef.code = Integer.MIN_VALUE;
    soBillRef.code = Integer.MIN_VALUE;
    so2ProvRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSOPayBillProv

