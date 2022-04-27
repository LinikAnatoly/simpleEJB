
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems;

  /**
  * Filter for ENServices2CalcAdditionalItems;  
  * 	
  */

public class ENServices2CalcAdditionalItemsFilter extends  ENServices2CalcAdditionalItems {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServices2CalcAdditionalItemsFilter()
   {
    code = Integer.MIN_VALUE; 
    summa = null; 
    countgen = null; 
    comment = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    calcAdditionalItemTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServices2CalcAdditionalItems

