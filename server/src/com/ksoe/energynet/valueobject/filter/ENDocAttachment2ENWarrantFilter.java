
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttachment2ENWarrant;

  /**
  * Filter for ENDocAttachment2ENWarrant;  
  * 	
  */

public class ENDocAttachment2ENWarrantFilter extends  ENDocAttachment2ENWarrant {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDocAttachment2ENWarrantFilter()
   {
    code = Integer.MIN_VALUE; 
    docAttachmentRef.code = Integer.MIN_VALUE;
    warrantRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDocAttachment2ENWarrant

