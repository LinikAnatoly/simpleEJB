
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENManningTable;

  /**
  * Filter for ENManningTable;  
  * 	
  */

public class ENManningTableFilter extends  ENManningTable {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENManningTableFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    dateStart = null; 
    dateFinal = null; 
    finCode = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    position.code = Integer.MIN_VALUE;;
    department.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENManningTable

