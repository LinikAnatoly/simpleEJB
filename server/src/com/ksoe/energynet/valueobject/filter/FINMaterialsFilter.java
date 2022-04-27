
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINMaterials;

  /**
  * Filter for FINMaterials;  
  * 	
  */

public class FINMaterialsFilter extends  FINMaterials {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINMaterialsFilter()
   {
    code = Integer.MIN_VALUE; 
    mat_id = Integer.MIN_VALUE; 
    nn = null; 
    mat_name = null; 
    mu_id = Integer.MIN_VALUE; 
    mu_name = null; 
    div_code = null; 
    div_name = null; 
    party_id = Integer.MIN_VALUE; 
    doc_num = null; 
    partner = null; 
    partner_name = null; 
    doc_date = null; 
    party_discription = null; 
    rest_purpose_id = Integer.MIN_VALUE; 
    rest_purpose_name = null; 
    rest_purpose_type_id = Integer.MIN_VALUE; 
    budget_core_id = Integer.MIN_VALUE; 
    frc_code = Integer.MIN_VALUE; 
    frc_name = null; 
    calc_price = null; 
    quantity = null; 
    price = null; 
    cost = null; 
    bal_sch = null; 
    fullQuantity = null; 
    fullCost = null; 
    finDocItemCode = Integer.MIN_VALUE; 
    wear_date = null; 
    modify_time = Long.MIN_VALUE;
    userGen = null; 
    dateEdit = null; 
    oldCode = Integer.MIN_VALUE; 
    extra_cargo = null; 
    cost_ext = null; 
    extra_cargo_nds = null; 
    cost_ext_nds = null; 
    ax_party_id = null; 
    ax_rest_purpose_id = null; 
    ax_rest_purpose_typeid = null; 
    ax_frc_code = null; 
    ax_inv_posted_qty_unit = null; 
    ax_inv_deducted_unit = null; 
    ax_inv_received_unit = null; 
    ax_inv_reserv_phys_unit = null; 
    ax_inv_avail_phys_unit = null; 
    ax_inv_physical_value = null; 
    ax_inv_posted_value = null; 
    axInventTransferLinesCode = null; 
    axInventDimFinId = null; 
    axFactor = null; 
    estimateItemRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    molDataRef.code = Integer.MIN_VALUE;
    parentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for FINMaterials

