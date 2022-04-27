
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNAttachment;

  /**
  * Filter for CNAttachment;  
  * 	
  */

public class CNAttachmentFilter extends  CNAttachment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNAttachmentFilter()
   {
    code = Integer.MIN_VALUE; 
    soCode = Integer.MIN_VALUE; 
    name = null; 
    date_doc = null; 
    filename = null; 
    filelink = null; 
   }

} // end of Filter for CNAttachment

