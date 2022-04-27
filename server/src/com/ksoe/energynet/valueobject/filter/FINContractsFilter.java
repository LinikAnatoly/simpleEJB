
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINContracts;

  /**
  * Filter for FINContracts;  
  * 	
  */

public class FINContractsFilter extends  FINContracts {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINContractsFilter()
   {
    code = Integer.MIN_VALUE; 
    contractNumber = null; 
    contractDate = null; 
    finDocCode = null; 
    finDocID = Integer.MIN_VALUE; 
    division_id = Integer.MIN_VALUE; 
    division_name = null; 
    agree_group_id = Integer.MIN_VALUE; 
    agree_group_name = null; 
    reg_num = null; 
    reg_date = null; 
    start_date = null; 
    end_date = null; 
    status = null; 
    status_name = null; 
    summa = null; 
    curr_summ = null; 
    csumm_start_date = null; 
    curr_end_date = null; 
    nums = null; 
    description = null; 
    close_date = null; 
    notes = null; 
    parent_id = Integer.MIN_VALUE; 
    edizm_id = Integer.MIN_VALUE; 
    edizm_name = null; 
    pay_after_event = null; 
    pay_period = Integer.MIN_VALUE; 
    pay_type = Integer.MIN_VALUE; 
    pay_type_name = null; 
    summ_note = null; 
    notlimited = null; 
    io_flag = null; 
    deal_flag = null; 
    gk_kategory = Integer.MIN_VALUE; 
    gk_kategory_name = null; 
    act_exists = null; 
    service_id = Integer.MIN_VALUE; 
    service_name = null; 
    id_buyconds = Integer.MIN_VALUE; 
    name_buyconds = null; 
    id_payform = Integer.MIN_VALUE; 
    name_payform = null; 
    summ_changemode = Integer.MIN_VALUE; 
    id_otvlico = Integer.MIN_VALUE; 
    tabn_otvlico = null; 
    fio_otvlico = null; 
    currency_code = null; 
    tender_date = null; 
    tender_no = null; 
    prolong_month = Integer.MIN_VALUE; 
    prolong_no = Integer.MIN_VALUE; 
    note1 = null; 
    note2 = null; 
    supervisoryDate = null; 
    supervisoryNumber = null; 
    axPaymTerm = null; 
    axVendPaymMode = null; 
    org.code = Integer.MIN_VALUE;
    generalContractRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for FINContracts

