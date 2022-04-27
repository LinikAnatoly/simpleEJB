
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportDep2User;

  /**
  * Filter for ENTransportDep2User;  
  * 	
  */

public class ENTransportDep2UserFilter extends  ENTransportDep2User {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportDep2UserFilter()
   {
    code = Integer.MIN_VALUE; 
    userCode = Integer.MIN_VALUE; 
    transportDepartment.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportDep2User

