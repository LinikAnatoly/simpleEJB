
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSealNames;

  /**
  * Filter for ENSealNames;  
  * 	
  */

public class ENSealNamesFilter extends  ENSealNames {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSealNamesFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    materialRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSealNames

