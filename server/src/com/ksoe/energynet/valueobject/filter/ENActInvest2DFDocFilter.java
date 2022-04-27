
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActInvest2DFDoc;

  /**
  * Filter for ENActInvest2DFDoc;  
  * 	
  */

public class ENActInvest2DFDocFilter extends  ENActInvest2DFDoc {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActInvest2DFDocFilter()
   {
    code = Integer.MIN_VALUE; 
    dfDocCode = Integer.MIN_VALUE; 
    dfDocTypeCode = Integer.MIN_VALUE; 
    dfDocNumber = null; 
    dfDocDate = null; 
    dfDocDescription = null; 
    commentgen = null; 
    necessary = Integer.MIN_VALUE; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActInvest2DFDoc

