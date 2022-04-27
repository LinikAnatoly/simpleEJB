
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSOProj2SOConn;

  /**
  * Filter for ENSOProj2SOConn;  
  * 	
  */

public class ENSOProj2SOConnFilter extends  ENSOProj2SOConn {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSOProj2SOConnFilter()
   {
    code = Integer.MIN_VALUE; 
    SOProjRef.code = Integer.MIN_VALUE;
    SOConnRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSOProj2SOConn

