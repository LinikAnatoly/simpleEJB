
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilding2OSData;

  /**
  * Filter for ENBuilding2OSData;  
  * 	
  */

public class ENBuilding2OSDataFilter extends  ENBuilding2OSData {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuilding2OSDataFilter()
   {
    code = Integer.MIN_VALUE; 
    num_un = Integer.MIN_VALUE; 
    kod_inv = null; 
    kod_nal_nakl = null; 
    kod_ist = null; 
    name_ist = null; 
    kod_subsch = null; 
    name_subsch = null; 
    kod_vid = null; 
    name_vid = null; 
    kod_privat = null; 
    name_privat = null; 
    kod_gr = null; 
    name_gr = null; 
    num_klass = Integer.MIN_VALUE; 
    name_klass = null; 
    f_amort = null; 
    dt_vypusk = null; 
    sum_izn_perv = null; 
    sum_izn_perv_n = null; 
    sum_st_perv_n = null; 
    kod_zatr = null; 
    kod_oborud = null; 
    primechan = null; 
    characters = null; 
    id_amort = Integer.MIN_VALUE; 
    kod_amort = null; 
    name_amort = null; 
    kod_am = Integer.MIN_VALUE; 
    name_am = null; 
    kod_am_n = Integer.MIN_VALUE; 
    name_am_n = null; 
    use_limit = Integer.MIN_VALUE; 
    use_limit_n = Integer.MIN_VALUE; 
    primechan_vyb = null; 
    kod_prizn = null; 
    datePosting = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    ENBuildingRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBuilding2OSData

