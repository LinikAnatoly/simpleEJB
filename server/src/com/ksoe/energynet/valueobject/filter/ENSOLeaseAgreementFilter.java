
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSOLeaseAgreement;

  /**
  * Filter for ENSOLeaseAgreement;  
  * 	
  */

public class ENSOLeaseAgreementFilter extends  ENSOLeaseAgreement {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSOLeaseAgreementFilter()
   {
    code = Integer.MIN_VALUE; 
    numContract = null; 
    dateContract = null; 
    namePartner = null; 
    finDocID = Integer.MIN_VALUE; 
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSOLeaseAgreement

