
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDamageRecovery;

  /**
  * Filter for ENDamageRecovery;  
  * 	
  */

public class ENDamageRecoveryFilter extends  ENDamageRecovery {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDamageRecoveryFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    FKcontractCode = null; 
    FKpartnerCode = null; 
    FKdocCode = null; 
    FKdocID = Integer.MIN_VALUE; 
    commentGen = null; 
    contragentName = null; 
    contragentAddress = null; 
    contragentPassport = null; 
    damageAmmount = null; 
    partId = Integer.MIN_VALUE; 
    datePosting = null; 
    userGen = null; 
    dateEdit = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    department.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    warrantRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDamageRecovery

