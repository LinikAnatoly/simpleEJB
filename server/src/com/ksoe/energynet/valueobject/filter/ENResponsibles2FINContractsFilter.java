
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENResponsibles2FINContracts;

  /**
  * Filter for ENResponsibles2FINContracts;  
  * 	
  */

public class ENResponsibles2FINContractsFilter extends  ENResponsibles2FINContracts {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENResponsibles2FINContractsFilter()
   {
    code = Integer.MIN_VALUE; 
    responsiblesRef.code = Integer.MIN_VALUE;
    finContracts.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENResponsibles2FINContracts

