
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2RQFKOrder;

  /**
  * Filter for ENAct2RQFKOrder;  
  * 	
  */

public class ENAct2RQFKOrderFilter extends  ENAct2RQFKOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2RQFKOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    actRef.code = Integer.MIN_VALUE;
    fkOrderRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2RQFKOrder

