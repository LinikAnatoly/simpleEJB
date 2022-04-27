
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncomServ2Prov;

  /**
  * Filter for ENActIncomServ2Prov;  
  * 	
  */

public class ENActIncomServ2ProvFilter extends  ENActIncomServ2Prov {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActIncomServ2ProvFilter()
   {
    code = Integer.MIN_VALUE; 
    partId = Integer.MIN_VALUE; 
    datePosting = null; 
    voucher = null; 
    dateEdit = null; 
    userGen = null; 
    actIncomeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActIncomServ2Prov

