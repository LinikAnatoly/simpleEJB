
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENReconstrModern2OSData;

  /**
  * Filter for ENReconstrModern2OSData;  
  * 	
  */

public class ENReconstrModern2OSDataFilter extends  ENReconstrModern2OSData {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENReconstrModern2OSDataFilter()
   {
    code = Integer.MIN_VALUE; 
    num_un = Integer.MIN_VALUE; 
    num_dovvod = Integer.MIN_VALUE; 
    date_dovvod = null; 
    kod_inv = null; 
    kod_ist = null; 
    name_ist = null; 
    sum_dovvod_n = null; 
    sum_dovvod_b = null; 
    sum_nds = null; 
    sum_dovvod_nds_b = null; 
    sum_dovvod_izn_n = null; 
    sum_dovvod_izn_b = null; 
    name_dovvod = null; 
    userGen = null; 
    dateEdit = null; 
    kod_nakl = null; 
    dt_nakl = null; 
    kod_nal_nakl = null; 
    kod_postav = null; 
    kod_dogovor = null; 
    dateBuh = null; 
    modify_time = Long.MIN_VALUE;
    ENReconstrModernOZRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENReconstrModern2OSData

