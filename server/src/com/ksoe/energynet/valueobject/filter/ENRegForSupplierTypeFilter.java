
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRegForSupplierType;

  /**
  * Filter for ENRegForSupplierType;  
  * 	
  */

public class ENRegForSupplierTypeFilter extends  ENRegForSupplierType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRegForSupplierTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    description = null; 
   }

} // end of Filter for ENRegForSupplierType

