
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENGeneralContracts;

  /**
  * Filter for ENGeneralContracts;  
  * 	
  */

public class ENGeneralContractsFilter extends  ENGeneralContracts {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENGeneralContractsFilter()
   {
    code = Integer.MIN_VALUE; 
    finDocID = Integer.MIN_VALUE; 
    finDocCode = null; 
    contractNumber = null; 
    contractDate = null; 
    commentGen = null; 
    partnerId = Integer.MIN_VALUE; 
    partnerCode = null; 
    partnerName = null; 
    contractRegDate = null; 
    contractStartDate = null; 
    contractEndDate = null; 
    axContractId = null; 
    axContractCode = null; 
    axContractNumber = null; 
    axContractAccount = null; 
    axContractDate = null; 
    axContractCommentGen = null; 
    axContractGroupCode = null; 
    axPartnerCode = null; 
    axPartnerName = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENGeneralContracts

