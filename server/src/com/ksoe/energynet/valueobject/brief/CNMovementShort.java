
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNMovement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNMovementShort implements Serializable {

    public int id = Integer.MIN_VALUE;
    public int id_state = Integer.MIN_VALUE;
    public Date startdate ;
    public String note;
    public int id_parent = Integer.MIN_VALUE;
    public int id_user = Integer.MIN_VALUE;
    public Date realdate ;
    public int canceled = Integer.MIN_VALUE;
    public int id_user_canceled = Integer.MIN_VALUE;
    public Date canceleddate ;
    public String cancelednote;
    public int is_completed = Integer.MIN_VALUE;
    public int id_movement_status = Integer.MIN_VALUE;
    public String addnote;
    public int read_status = Integer.MIN_VALUE;
    public int id_user_read = Integer.MIN_VALUE;
    public Date read_date ;
    public int id_user_created = Integer.MIN_VALUE;
    public Date modifytime ;
    public Date pastdate ;
    public int subsystemRefCode = Integer.MIN_VALUE;
    public String subsystemRefName;
    public int cnPackRefCode = Integer.MIN_VALUE;
    public int cnPackRefPackCode = Integer.MIN_VALUE;
    public String cnPackRefName;
    public int cnPackRefId_ren = Integer.MIN_VALUE;
    public String cnPackRefRenName;
    public int cnPackRefId_district = Integer.MIN_VALUE;
    public String cnPackRefDistrictName;
    public int cnPackRefId_pack_status = Integer.MIN_VALUE;
    public String cnPackRefStatusName;
    public String cnPackRefDescription;
    public BigDecimal cnPackRefPower;
    public String cnPackRefAddress;
    public String cnPackRefAddress_jur;
    public String cnPackRefReg_num_cn_contract;
    public Date cnPackRefDate_cn_contract;
    public String cnPackRefReg_num_spl_pp_contract;
    public Date cnPackRefDate_spl_pp_contract;
    public String cnPackRefReg_num_tu_contract;
    public Date cnPackRefDate_tu_contract;
    public String cnPackRefReg_num_tu_cr_contract;
    public Date cnPackRefDate_tu_cr_contract;
    public String cnPackRefProject_num;
    public Date cnPackRefProject_date;
    public int cnPackRefOver5 = Integer.MIN_VALUE;
    public int cnPackRefStatus = Integer.MIN_VALUE;
    public String cnPackRefLetter_num_customer;
    public Date cnPackRefDate_letter_customer;
    public String cnPackRefLetter_num;
    public Date cnPackRefDate_letter;
    public String cnPackRefReliability_class;
    public int cnPackRefId_waiting_status = Integer.MIN_VALUE;
    public String cnPackRefWaitingStatus;
    public int cnPackRefIs_payable = Integer.MIN_VALUE;
    public String cnPackRefWorksize;
    public String cnPackRefWork_inc_net;
    public String cnPackRefBusiness_type;
    public int cnPackRefEstimateterm = Integer.MIN_VALUE;
    public Date cnPackRefEstimatedate;
    public int cnPackRefBuildingterm = Integer.MIN_VALUE;
    public Date cnPackRefBuildingdate;
    public int cnPackRefBuyingterm = Integer.MIN_VALUE;
    public Date cnPackRefBuyingdate;
    public String cnPackRefEstimate_num;
    public Date cnPackRefEstimate_contract_date;
    public int cnPackRefIs_reserv = Integer.MIN_VALUE;

    public void setId(int aValue){
       id = aValue;
    }

    public int getId(){
       return id;
    }
    public void setId_state(int aValue){
       id_state = aValue;
    }

    public int getId_state(){
       return id_state;
    }

    public void setStartdate(Date aValue){
       startdate = aValue;
    }

    public Date getStartdate(){
       return startdate;
    }
    public void setNote(String aValue){
       note = aValue;
    }

    public String getNote(){
       return note;
    }
    public void setId_parent(int aValue){
       id_parent = aValue;
    }

    public int getId_parent(){
       return id_parent;
    }
    public void setId_user(int aValue){
       id_user = aValue;
    }

    public int getId_user(){
       return id_user;
    }

    public void setRealdate(Date aValue){
       realdate = aValue;
    }

    public Date getRealdate(){
       return realdate;
    }
    public void setCanceled(int aValue){
       canceled = aValue;
    }

    public int getCanceled(){
       return canceled;
    }
    public void setId_user_canceled(int aValue){
       id_user_canceled = aValue;
    }

    public int getId_user_canceled(){
       return id_user_canceled;
    }

    public void setCanceleddate(Date aValue){
       canceleddate = aValue;
    }

    public Date getCanceleddate(){
       return canceleddate;
    }
    public void setCancelednote(String aValue){
       cancelednote = aValue;
    }

    public String getCancelednote(){
       return cancelednote;
    }
    public void setIs_completed(int aValue){
       is_completed = aValue;
    }

    public int getIs_completed(){
       return is_completed;
    }
    public void setId_movement_status(int aValue){
       id_movement_status = aValue;
    }

    public int getId_movement_status(){
       return id_movement_status;
    }
    public void setAddnote(String aValue){
       addnote = aValue;
    }

    public String getAddnote(){
       return addnote;
    }
    public void setRead_status(int aValue){
       read_status = aValue;
    }

    public int getRead_status(){
       return read_status;
    }
    public void setId_user_read(int aValue){
       id_user_read = aValue;
    }

    public int getId_user_read(){
       return id_user_read;
    }

    public void setRead_date(Date aValue){
       read_date = aValue;
    }

    public Date getRead_date(){
       return read_date;
    }
    public void setId_user_created(int aValue){
       id_user_created = aValue;
    }

    public int getId_user_created(){
       return id_user_created;
    }

    public void setModifytime(Date aValue){
       modifytime = aValue;
    }

    public Date getModifytime(){
       return modifytime;
    }

    public void setPastdate(Date aValue){
       pastdate = aValue;
    }

    public Date getPastdate(){
       return pastdate;
    }


    public void setSubsystemRefCode(int aValue){
       subsystemRefCode = aValue;
    }
    public int getSubsystemRefCode(){
       return subsystemRefCode;
    }

    public void setSubsystemRefName(String aValue){
       subsystemRefName = aValue;
    }
    public String getSubsystemRefName(){
       return subsystemRefName;
    }

    public void setCnPackRefCode(int aValue){
       cnPackRefCode = aValue;
    }
    public int getCnPackRefCode(){
       return cnPackRefCode;
    }

    public void setCnPackRefPackCode(int aValue){
       cnPackRefPackCode = aValue;
    }
    public int getCnPackRefPackCode(){
       return cnPackRefPackCode;
    }

    public void setCnPackRefName(String aValue){
       cnPackRefName = aValue;
    }
    public String getCnPackRefName(){
       return cnPackRefName;
    }

    public void setCnPackRefId_ren(int aValue){
       cnPackRefId_ren = aValue;
    }
    public int getCnPackRefId_ren(){
       return cnPackRefId_ren;
    }

    public void setCnPackRefRenName(String aValue){
       cnPackRefRenName = aValue;
    }
    public String getCnPackRefRenName(){
       return cnPackRefRenName;
    }

    public void setCnPackRefId_district(int aValue){
       cnPackRefId_district = aValue;
    }
    public int getCnPackRefId_district(){
       return cnPackRefId_district;
    }

    public void setCnPackRefDistrictName(String aValue){
       cnPackRefDistrictName = aValue;
    }
    public String getCnPackRefDistrictName(){
       return cnPackRefDistrictName;
    }

    public void setCnPackRefId_pack_status(int aValue){
       cnPackRefId_pack_status = aValue;
    }
    public int getCnPackRefId_pack_status(){
       return cnPackRefId_pack_status;
    }

    public void setCnPackRefStatusName(String aValue){
       cnPackRefStatusName = aValue;
    }
    public String getCnPackRefStatusName(){
       return cnPackRefStatusName;
    }

    public void setCnPackRefDescription(String aValue){
       cnPackRefDescription = aValue;
    }
    public String getCnPackRefDescription(){
       return cnPackRefDescription;
    }

    public void setCnPackRefPower(BigDecimal aValue){
       cnPackRefPower = aValue;
    }
    public BigDecimal getCnPackRefPower(){
       return cnPackRefPower;
    }

    public void setCnPackRefAddress(String aValue){
       cnPackRefAddress = aValue;
    }
    public String getCnPackRefAddress(){
       return cnPackRefAddress;
    }

    public void setCnPackRefAddress_jur(String aValue){
       cnPackRefAddress_jur = aValue;
    }
    public String getCnPackRefAddress_jur(){
       return cnPackRefAddress_jur;
    }

    public void setCnPackRefReg_num_cn_contract(String aValue){
       cnPackRefReg_num_cn_contract = aValue;
    }
    public String getCnPackRefReg_num_cn_contract(){
       return cnPackRefReg_num_cn_contract;
    }


    public void setCnPackRefDate_cn_contract(Date aValue){
       cnPackRefDate_cn_contract = aValue;
    }
    public Date getCnPackRefDate_cn_contract(){
       return cnPackRefDate_cn_contract;
    }

    public void setCnPackRefReg_num_spl_pp_contract(String aValue){
       cnPackRefReg_num_spl_pp_contract = aValue;
    }
    public String getCnPackRefReg_num_spl_pp_contract(){
       return cnPackRefReg_num_spl_pp_contract;
    }


    public void setCnPackRefDate_spl_pp_contract(Date aValue){
       cnPackRefDate_spl_pp_contract = aValue;
    }
    public Date getCnPackRefDate_spl_pp_contract(){
       return cnPackRefDate_spl_pp_contract;
    }

    public void setCnPackRefReg_num_tu_contract(String aValue){
       cnPackRefReg_num_tu_contract = aValue;
    }
    public String getCnPackRefReg_num_tu_contract(){
       return cnPackRefReg_num_tu_contract;
    }


    public void setCnPackRefDate_tu_contract(Date aValue){
       cnPackRefDate_tu_contract = aValue;
    }
    public Date getCnPackRefDate_tu_contract(){
       return cnPackRefDate_tu_contract;
    }

    public void setCnPackRefReg_num_tu_cr_contract(String aValue){
       cnPackRefReg_num_tu_cr_contract = aValue;
    }
    public String getCnPackRefReg_num_tu_cr_contract(){
       return cnPackRefReg_num_tu_cr_contract;
    }


    public void setCnPackRefDate_tu_cr_contract(Date aValue){
       cnPackRefDate_tu_cr_contract = aValue;
    }
    public Date getCnPackRefDate_tu_cr_contract(){
       return cnPackRefDate_tu_cr_contract;
    }

    public void setCnPackRefProject_num(String aValue){
       cnPackRefProject_num = aValue;
    }
    public String getCnPackRefProject_num(){
       return cnPackRefProject_num;
    }


    public void setCnPackRefProject_date(Date aValue){
       cnPackRefProject_date = aValue;
    }
    public Date getCnPackRefProject_date(){
       return cnPackRefProject_date;
    }

    public void setCnPackRefOver5(int aValue){
       cnPackRefOver5 = aValue;
    }
    public int getCnPackRefOver5(){
       return cnPackRefOver5;
    }

    public void setCnPackRefStatus(int aValue){
       cnPackRefStatus = aValue;
    }
    public int getCnPackRefStatus(){
       return cnPackRefStatus;
    }

    public void setCnPackRefLetter_num_customer(String aValue){
       cnPackRefLetter_num_customer = aValue;
    }
    public String getCnPackRefLetter_num_customer(){
       return cnPackRefLetter_num_customer;
    }


    public void setCnPackRefDate_letter_customer(Date aValue){
       cnPackRefDate_letter_customer = aValue;
    }
    public Date getCnPackRefDate_letter_customer(){
       return cnPackRefDate_letter_customer;
    }

    public void setCnPackRefLetter_num(String aValue){
       cnPackRefLetter_num = aValue;
    }
    public String getCnPackRefLetter_num(){
       return cnPackRefLetter_num;
    }


    public void setCnPackRefDate_letter(Date aValue){
       cnPackRefDate_letter = aValue;
    }
    public Date getCnPackRefDate_letter(){
       return cnPackRefDate_letter;
    }

    public void setCnPackRefReliability_class(String aValue){
       cnPackRefReliability_class = aValue;
    }
    public String getCnPackRefReliability_class(){
       return cnPackRefReliability_class;
    }

    public void setCnPackRefId_waiting_status(int aValue){
       cnPackRefId_waiting_status = aValue;
    }
    public int getCnPackRefId_waiting_status(){
       return cnPackRefId_waiting_status;
    }

    public void setCnPackRefWaitingStatus(String aValue){
       cnPackRefWaitingStatus = aValue;
    }
    public String getCnPackRefWaitingStatus(){
       return cnPackRefWaitingStatus;
    }

    public void setCnPackRefIs_payable(int aValue){
       cnPackRefIs_payable = aValue;
    }
    public int getCnPackRefIs_payable(){
       return cnPackRefIs_payable;
    }

    public void setCnPackRefWorksize(String aValue){
       cnPackRefWorksize = aValue;
    }
    public String getCnPackRefWorksize(){
       return cnPackRefWorksize;
    }

    public void setCnPackRefWork_inc_net(String aValue){
       cnPackRefWork_inc_net = aValue;
    }
    public String getCnPackRefWork_inc_net(){
       return cnPackRefWork_inc_net;
    }

    public void setCnPackRefBusiness_type(String aValue){
       cnPackRefBusiness_type = aValue;
    }
    public String getCnPackRefBusiness_type(){
       return cnPackRefBusiness_type;
    }

    public void setCnPackRefEstimateterm(int aValue){
       cnPackRefEstimateterm = aValue;
    }
    public int getCnPackRefEstimateterm(){
       return cnPackRefEstimateterm;
    }


    public void setCnPackRefEstimatedate(Date aValue){
       cnPackRefEstimatedate = aValue;
    }
    public Date getCnPackRefEstimatedate(){
       return cnPackRefEstimatedate;
    }

    public void setCnPackRefBuildingterm(int aValue){
       cnPackRefBuildingterm = aValue;
    }
    public int getCnPackRefBuildingterm(){
       return cnPackRefBuildingterm;
    }


    public void setCnPackRefBuildingdate(Date aValue){
       cnPackRefBuildingdate = aValue;
    }
    public Date getCnPackRefBuildingdate(){
       return cnPackRefBuildingdate;
    }

    public void setCnPackRefBuyingterm(int aValue){
       cnPackRefBuyingterm = aValue;
    }
    public int getCnPackRefBuyingterm(){
       return cnPackRefBuyingterm;
    }


    public void setCnPackRefBuyingdate(Date aValue){
       cnPackRefBuyingdate = aValue;
    }
    public Date getCnPackRefBuyingdate(){
       return cnPackRefBuyingdate;
    }

    public void setCnPackRefEstimate_num(String aValue){
       cnPackRefEstimate_num = aValue;
    }
    public String getCnPackRefEstimate_num(){
       return cnPackRefEstimate_num;
    }


    public void setCnPackRefEstimate_contract_date(Date aValue){
       cnPackRefEstimate_contract_date = aValue;
    }
    public Date getCnPackRefEstimate_contract_date(){
       return cnPackRefEstimate_contract_date;
    }

    public void setCnPackRefIs_reserv(int aValue){
       cnPackRefIs_reserv = aValue;
    }
    public int getCnPackRefIs_reserv(){
       return cnPackRefIs_reserv;
    }



}