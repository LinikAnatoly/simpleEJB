
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSITEquipType;

  /**
  * Filter for ENSITEquipType;  
  * 	
  */

public class ENSITEquipTypeFilter extends  ENSITEquipType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSITEquipTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    description = null; 
   }

} // end of Filter for ENSITEquipType

