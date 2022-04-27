
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttachment2TKClassification;

  /**
  * Filter for ENDocAttachment2TKClassification;  
  * 	
  */

public class ENDocAttachment2TKClassificationFilter extends  ENDocAttachment2TKClassification {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDocAttachment2TKClassificationFilter()
   {
    code = Integer.MIN_VALUE; 
    docAttachmentRef.code = Integer.MIN_VALUE;
    classificationTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDocAttachment2TKClassification

