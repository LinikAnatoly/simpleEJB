
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttachment2ENElement;

  /**
  * Filter for ENDocAttachment2ENElement;  
  * 	
  */

public class ENDocAttachment2ENElementFilter extends  ENDocAttachment2ENElement {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDocAttachment2ENElementFilter()
   {
    code = Integer.MIN_VALUE; 
    docAttachmentRef.code = Integer.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDocAttachment2ENElement

