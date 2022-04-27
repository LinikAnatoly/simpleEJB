
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENContragent;

  /**
  * Filter for ENContragent;  
  * 	
  */

public class ENContragentFilter extends  ENContragent {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENContragentFilter()
   {
    code = Integer.MIN_VALUE; 
    contragentName = null; 
    contragentAddress = null; 
    contragentAddressWork = null; 
    contragentPosition = null; 
    contragentOkpo = null; 
    contragentBankAccount = null; 
    contragentBankName = null; 
    contragentBankMfo = null; 
    contragentBossName = null; 
    contragentPassport = null; 
    warrantDate = null; 
    warrantNumber = null; 
    warrantFIO = null; 
    warrantPassport = null; 
    warrantAddress = null; 
    techConditionsItem = null; 
    techConObjects.code = Integer.MIN_VALUE;
    basisType.code = Integer.MIN_VALUE;
    techCondServicesRef.code = Integer.MIN_VALUE;
    contragentType.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENContragent

