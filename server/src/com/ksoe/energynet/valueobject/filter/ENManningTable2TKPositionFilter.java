
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENManningTable2TKPosition;

  /**
  * Filter for ENManningTable2TKPosition;  
  * 	
  */

public class ENManningTable2TKPositionFilter extends  ENManningTable2TKPosition {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENManningTable2TKPositionFilter()
   {
    code = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    manningTableRef.code = Integer.MIN_VALUE;;
    tkpositionRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENManningTable2TKPosition

