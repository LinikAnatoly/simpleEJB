
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENReconstrModernOZ;

  /**
  * Filter for ENReconstrModernOZ;  
  * 	
  */

public class ENReconstrModernOZFilter extends  ENReconstrModernOZ {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENReconstrModernOZFilter()
   {
    code = Integer.MIN_VALUE; 
    numbergen = null; 
    dateGen = null; 
    dateEdit = null; 
    summaGen = null; 
    summaNDS = null; 
    characteristic = null; 
    executedPosition = null; 
    executedName = null; 
    acceptedPosition = null; 
    acceptedName = null; 
    contractPrice = null; 
    codeMol = null; 
    codePodr = null; 
    invNumberOZ = null; 
    nameOZ = null; 
    finContractNumber = null; 
    finContractDate = null; 
    partnerName = null; 
    partnerCode = null; 
    characteristicOS = null; 
    isInvestProgram = Integer.MIN_VALUE; 
    yearInvestProgram = null; 
    itemInvestProgram = null; 
    typeRM = Integer.MIN_VALUE; 
    userGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    termUseful = Integer.MIN_VALUE; 
    use_limit_before = Integer.MIN_VALUE; 
    use_limit_n_before = Integer.MIN_VALUE; 
    dateExploitationIn = null; 
    dateExploitationOut = null; 
    departmentRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    invgroupRef.code = Integer.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENReconstrModernOZ

