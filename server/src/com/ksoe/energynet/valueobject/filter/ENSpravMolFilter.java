
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSpravMol;

  /**
  * Filter for ENSpravMol;  
  * 	
  */

public class ENSpravMolFilter extends  ENSpravMol {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSpravMolFilter()
   {
    code = Integer.MIN_VALUE; 
    molkod = null; 
    molname = null; 
    department.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSpravMol

