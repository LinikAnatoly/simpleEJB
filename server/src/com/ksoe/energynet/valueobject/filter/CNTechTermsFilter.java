
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNTechTerms;

  /**
  * Filter for CNTechTerms;  
  * 	
  */

public class CNTechTermsFilter extends  CNTechTerms {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNTechTermsFilter()
   {
    code = Integer.MIN_VALUE; 
    id_proposal = Integer.MIN_VALUE; 
    proposalName = null; 
    power1 = null; 
    power1prosp = null; 
    power1heat = null; 
    power2 = null; 
    power2prosp = null; 
    power2heat = null; 
    power3 = null; 
    power3prosp = null; 
    power3heat = null; 
    pow_stove = null; 
    pow_water_heat = null; 
    pow_house_heat = null; 
    tension_point = null; 
    current_automat = null; 
    pow_exist = null; 
    tension_exist = null; 
    is_realized = Integer.MIN_VALUE; 
    reason = null; 
    source = null; 
    source_num = null; 
    ensur_point = null; 
    ensur_point_num = null; 
    connect_point = null; 
    connect_point_num = null; 
    exploit_year = Integer.MIN_VALUE; 
    baseStation = Integer.MIN_VALUE; 
    subsystemRef.code = Integer.MIN_VALUE;
    cnPackRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for CNTechTerms

