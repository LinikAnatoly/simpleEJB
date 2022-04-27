
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSealColors;

  /**
  * Filter for ENSealColors;  
  * 	
  */

public class ENSealColorsFilter extends  ENSealColors {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSealColorsFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    materialRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSealColors

