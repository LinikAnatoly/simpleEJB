
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSheets4SOItems;

  /**
  * Filter for ENSheets4SOItems;  
  * 	
  */

public class ENSheets4SOItemsFilter extends  ENSheets4SOItems {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSheets4SOItemsFilter()
   {
    code = Integer.MIN_VALUE; 
    contentValue = null; 
    additionalContent = null; 
    sheet4soRef.code = Integer.MIN_VALUE;
    sheetItemTemplateRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSheets4SOItems

