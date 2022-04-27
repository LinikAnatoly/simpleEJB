
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2OSTable;

  /**
  * Filter for ENAct2OSTable;  
  * 	
  */

public class ENAct2OSTableFilter extends  ENAct2OSTable {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2OSTableFilter()
   {
    code = Integer.MIN_VALUE; 
    num_un = Integer.MIN_VALUE; 
    invNumber = null; 
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2OSTable

