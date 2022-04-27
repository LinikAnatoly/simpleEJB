
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAgreeData2ServicesObject;

  /**
  * Filter for ENAgreeData2ServicesObject;  
  * 	
  */

public class ENAgreeData2ServicesObjectFilter extends  ENAgreeData2ServicesObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAgreeData2ServicesObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    numberDoc = null; 
    rights = null; 
    connectionObj = null; 
    buildersArea = Integer.MIN_VALUE; 
    voltage = null; 
    amperage = null; 
    add1_1 = null; 
    add1_2 = null; 
    add2 = null; 
    add3 = null; 
    add4 = null; 
    userGen = null; 
    dateEdit = null; 
    printHolder = Integer.MIN_VALUE; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    warrantRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAgreeData2ServicesObject

