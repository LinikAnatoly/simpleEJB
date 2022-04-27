
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENReconstrModernOZ2ENact;

  /**
  * Filter for ENReconstrModernOZ2ENact;  
  * 	
  */

public class ENReconstrModernOZ2ENactFilter extends  ENReconstrModernOZ2ENact {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENReconstrModernOZ2ENactFilter()
   {
    code = Integer.MIN_VALUE; 
    sumGen = null; 
    sumNds = null; 
    isCalculationDate = Integer.MIN_VALUE; 
    actRef.code = Integer.MIN_VALUE;
    ENReconstrModernOZRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENReconstrModernOZ2ENact

