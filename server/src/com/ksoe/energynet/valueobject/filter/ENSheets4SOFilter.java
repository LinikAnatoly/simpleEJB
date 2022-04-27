
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSheets4SO;

  /**
  * Filter for ENSheets4SO;  
  * 	
  */

public class ENSheets4SOFilter extends  ENSheets4SO {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSheets4SOFilter()
   {
    code = Integer.MIN_VALUE; 
    numbergen = null; 
    name = null; 
    dateGen = null; 
    dayscnt = Integer.MIN_VALUE; 
    nextSheetDate = null; 
    isLast = Integer.MIN_VALUE; 
    recipient = null; 
    recipientAddress = null; 
    postCode = null; 
    signerPosition = null; 
    signerFio = null; 
    executorFio = null; 
    executorPhone = null; 
    executorEmail = null; 
    additionalText = null; 
    isWithSignature = Integer.MIN_VALUE; 
    commentgen = null; 
    dfDocCode = Integer.MIN_VALUE; 
    dfDocTypeCode = Integer.MIN_VALUE; 
    dfDocNumber = null; 
    dfDocDate = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    wfPackCode = Integer.MIN_VALUE; 
    sheet4sotype.code = Integer.MIN_VALUE;
    attachment.code = Integer.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSheets4SO

