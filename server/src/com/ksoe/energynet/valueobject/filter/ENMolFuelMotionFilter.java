
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMolFuelMotion;

  /**
  * Filter for ENMolFuelMotion;  
  * 	
  */

public class ENMolFuelMotionFilter extends  ENMolFuelMotion {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENMolFuelMotionFilter()
   {
    code = Integer.MIN_VALUE; 
    molcode = null; 
    molname = null; 
    dateGen = null; 
    nn = null; 
    mat_name = null; 
    countGen = null; 
    modify_time = Long.MIN_VALUE;
    userGen = null; 
    dateEdit = null; 
    motionTypeRef.code = Integer.MIN_VALUE;
    fuelTypeRef.code = Integer.MIN_VALUE;
    fkorderRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENMolFuelMotion

