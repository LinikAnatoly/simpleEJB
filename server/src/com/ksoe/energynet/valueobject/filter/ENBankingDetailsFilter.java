
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBankingDetails;

  /**
  * Filter for ENBankingDetails;  
  * 	
  */

public class ENBankingDetailsFilter extends  ENBankingDetails {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBankingDetailsFilter()
   {
    code = Integer.MIN_VALUE; 
    bankname = null; 
    bankokpo = null; 
    bankmfo = Integer.MIN_VALUE; 
    bankaccount = null; 
    partnercode = null; 
    contract = null; 
    useDefault = Integer.MIN_VALUE; 
    departmentRef.code = Integer.MIN_VALUE;
    billTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBankingDetails

