
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENReconstrModernOZ2DFDoc;

  /**
  * Filter for ENReconstrModernOZ2DFDoc;  
  * 	
  */

public class ENReconstrModernOZ2DFDocFilter extends  ENReconstrModernOZ2DFDoc {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENReconstrModernOZ2DFDocFilter()
   {
    code = Integer.MIN_VALUE; 
    dfDocCode = Integer.MIN_VALUE; 
    dfDocTypeCode = Integer.MIN_VALUE; 
    dfDocSubtypeCode = Integer.MIN_VALUE; 
    dfDocNumber = null; 
    dfDocDate = null; 
    dfDocDescription = null; 
    commentgen = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    enReconstrModernOzRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENReconstrModernOZ2DFDoc

