
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActProj2OZ2Date;

  /**
  * Filter for ENActProj2OZ2Date;  
  * 	
  */

public class ENActProj2OZ2DateFilter extends  ENActProj2OZ2Date {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActProj2OZ2DateFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    ENActProjRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActProj2OZ2Date

