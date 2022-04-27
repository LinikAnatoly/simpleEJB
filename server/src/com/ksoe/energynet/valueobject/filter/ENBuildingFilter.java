
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilding;

  /**
  * Filter for ENBuilding;  
  * 	
  */

public class ENBuildingFilter extends  ENBuilding {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuildingFilter()
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
    isInvestProgram = Integer.MIN_VALUE; 
    yearInvestProgram = null; 
    itemInvestProgram = null; 
    buildingAddress = null; 
    decreeNumber = null; 
    decreeDate = null; 
    exploitationTerm = Integer.MIN_VALUE; 
    dateLoadExpl = null; 
    dateBuild = null; 
    userGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    invgroupRef.code = Integer.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBuilding

