
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSOTechParams;

  /**
  * Filter for ENSOTechParams;  
  * 	
  */

public class ENSOTechParamsFilter extends  ENSOTechParams {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSOTechParamsFilter()
   {
    code = Integer.MIN_VALUE; 
    closestDistance = Integer.MIN_VALUE; 
    substationBuildSum = null; 
    calculationSum = null; 
    closestDistance2 = Integer.MIN_VALUE; 
    infoDistance2 = Integer.MIN_VALUE; 
    object4closestDistanceName = null; 
    object4closestDistance2Name = null; 
    cityTypeName = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    levelRef.code = Integer.MIN_VALUE;
    categoryRef.code = Integer.MIN_VALUE;
    powerPointRef.code = Integer.MIN_VALUE;
    phasityRef.code = Integer.MIN_VALUE;
    lineTypeRef.code = Integer.MIN_VALUE;
    installationTypeRef.code = Integer.MIN_VALUE;
    locationTypeRef.code = Integer.MIN_VALUE;
    cityTypeRef.code = Integer.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSOTechParams

