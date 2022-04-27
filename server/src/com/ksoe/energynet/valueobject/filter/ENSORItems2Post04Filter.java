
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSORItems2Post04;

  /**
  * Filter for ENSORItems2Post04;  
  * 	
  */

public class ENSORItems2Post04Filter extends  ENSORItems2Post04 {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSORItems2Post04Filter()
   {
    code = Integer.MIN_VALUE; 
    post04Ref.code = Integer.MIN_VALUE;
    sorItemRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSORItems2Post04

