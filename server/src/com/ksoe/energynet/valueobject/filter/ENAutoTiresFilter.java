
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAutoTires;

  /**
  * Filter for ENAutoTires;  
  * 	
  */

public class ENAutoTiresFilter extends  ENAutoTires {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAutoTiresFilter()
   {
    code = Integer.MIN_VALUE; 
    typeName = null; 
    garageNumber = null; 
    serialNumber = null; 
    factory = null; 
    potencial = null; 
    distanceAll = null; 
    nominal = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    materialRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
    installStatusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAutoTires

