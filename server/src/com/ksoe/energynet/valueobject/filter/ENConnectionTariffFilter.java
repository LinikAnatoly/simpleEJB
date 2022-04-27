
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENConnectionTariff;

  /**
  * Filter for ENConnectionTariff;  
  * 	
  */

public class ENConnectionTariffFilter extends  ENConnectionTariff {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENConnectionTariffFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    shortname = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    levelRef.code = Integer.MIN_VALUE;
    categoryRef.code = Integer.MIN_VALUE;
    powerPointRef.code = Integer.MIN_VALUE;
    phasityRef.code = Integer.MIN_VALUE;
    lineTypeRef.code = Integer.MIN_VALUE;
    installationTypeRef.code = Integer.MIN_VALUE;
    locationTypeRef.code = Integer.MIN_VALUE;
    tarifTypeRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENConnectionTariff

