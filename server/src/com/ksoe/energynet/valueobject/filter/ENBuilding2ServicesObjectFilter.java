
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilding2ServicesObject;

  /**
  * Filter for ENBuilding2ServicesObject;  
  * 	
  */

public class ENBuilding2ServicesObjectFilter extends  ENBuilding2ServicesObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuilding2ServicesObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    contractNumber = null; 
    contractDate = null; 
    partnerName = null; 
    partnerCode = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    ENBuildingRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBuilding2ServicesObject

