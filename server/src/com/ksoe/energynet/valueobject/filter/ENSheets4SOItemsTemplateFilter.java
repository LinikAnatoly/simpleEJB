
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSheets4SOItemsTemplate;

  /**
  * Filter for ENSheets4SOItemsTemplate;  
  * 	
  */

public class ENSheets4SOItemsTemplateFilter extends  ENSheets4SOItemsTemplate {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSheets4SOItemsTemplateFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    templateValue = null; 
   }

} // end of Filter for ENSheets4SOItemsTemplate

