
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSITEquipment;

  /**
  * Filter for ENSITEquipment;  
  * 	
  */

public class ENSITEquipmentFilter extends  ENSITEquipment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSITEquipmentFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    serialnumber = null; 
    suppliername = null; 
    isserver = Integer.MIN_VALUE; 
    num = null; 
    supplierdate = null; 
    warranty = Integer.MIN_VALUE; 
    isliquidation = Integer.MIN_VALUE; 
    technum1 = Integer.MIN_VALUE; 
    lisencepack = null; 
    technum2 = Integer.MIN_VALUE; 
    batch = Integer.MIN_VALUE; 
    descr = null; 
    location = null; 
    installdate = null; 
    inputdate = null; 
    commentGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    objectType.code = Integer.MIN_VALUE;;
    element.code = Integer.MIN_VALUE;;
    finworker.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENSITEquipment

