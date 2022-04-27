
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAgreementKind;

  /**
  * Filter for ENAgreementKind;  
  * 	
  */

public class ENAgreementKindFilter extends  ENAgreementKind {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAgreementKindFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENAgreementKind

