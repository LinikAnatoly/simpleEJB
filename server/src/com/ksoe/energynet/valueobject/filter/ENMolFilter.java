
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMol;

  /**
  * Filter for ENMol;  
  * 	
  */

public class ENMolFilter extends  ENMol {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMolFilter()
   {
    code = Integer.MIN_VALUE; 
    finCode = null; 
    name = null; 
    phoneNumber = null; 
    tabNumber = null; 
    storage = null; 
    modify_time = Long.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMol

