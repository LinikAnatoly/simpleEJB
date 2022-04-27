
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENConnectionTariffEntry;

  /**
  * Filter for ENConnectionTariffEntry;  
  * 	
  */

public class ENConnectionTariffEntryFilter extends  ENConnectionTariffEntry {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENConnectionTariffEntryFilter()
   {
    code = Integer.MIN_VALUE; 
    value = null; 
    startDate = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    tariffRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENConnectionTariffEntry

