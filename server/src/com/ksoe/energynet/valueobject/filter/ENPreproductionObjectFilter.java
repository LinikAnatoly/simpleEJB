
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPreproductionObject;

  /**
  * Filter for ENPreproductionObject;  
  * 	
  */

public class ENPreproductionObjectFilter extends  ENPreproductionObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPreproductionObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
    buhName = null; 
    invNumber = null; 
    userGen = null; 
    dateEdit = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    element.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENPreproductionObject

