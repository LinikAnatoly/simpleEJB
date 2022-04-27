
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2FinInfoProv;

  /**
  * Filter for ENAct2FinInfoProv;  
  * 	
  */

public class ENAct2FinInfoProvFilter extends  ENAct2FinInfoProv {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2FinInfoProvFilter()
   {
    code = Integer.MIN_VALUE; 
    kau_card_object_id = Integer.MIN_VALUE; 
    kau_card_object_kod = null; 
    kau_card_object_name = null; 
    kau_element_expenses_id = Integer.MIN_VALUE; 
    kau_element_expenses_kod = null; 
    kau_element_expenses_name = null; 
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2FinInfoProv

