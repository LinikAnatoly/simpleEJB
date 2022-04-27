
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesFromSideObject;

  /**
  * Filter for ENServicesFromSideObject;  
  * 	
  */

public class ENServicesFromSideObjectFilter extends  ENServicesFromSideObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesFromSideObjectFilter()
   {
    code = Integer.MIN_VALUE; 
    numberProject = null; 
    contractNumber = null; 
    contractDate = null; 
    name = null; 
    partnerCode = null; 
    finDocCode = null; 
    finDocID = Integer.MIN_VALUE; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    department.code = Integer.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
    generalContractRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesFromSideObject

