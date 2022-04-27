
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNActsMovement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNActsMovementShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int id_state = Integer.MIN_VALUE;
    public String state_name;
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
    public int read_status = Integer.MIN_VALUE;
    public int id_user_read = Integer.MIN_VALUE;
    public Date read_date ;
    public int id_user_created = Integer.MIN_VALUE;
    public Date modifytime ;
    public Date pastdate ;
    public int subsystemRefCode = Integer.MIN_VALUE;
    public String subsystemRefName;
    public int actsPackRefCode = Integer.MIN_VALUE;
    public String actsPackRefName;
    public String actsPackRefAddress;
    public String actsPackRefAddress_jur;
    public String actsPackRefPurpose;
    public String actsPackRefBusiness_type;
    public String actsPackRefBlank_number;
    public String actsPackRefAct_number;
    public Date actsPackRefAct_date;
    public BigDecimal actsPackRefAct_sum;
    public Date actsPackRefPay_date;
    public BigDecimal actsPackRefPay_sum;
    public int actsPackRefIs_ksoe = Integer.MIN_VALUE;
    public int actsPackRefStatus = Integer.MIN_VALUE;
    public int actsPackRefId_ren = Integer.MIN_VALUE;
    public String actsPackRefRenName;
    public int actsPackRefId_pack_status = Integer.MIN_VALUE;
    public String actsPackRefStatusName;
    public int actsPackRefId_waiting_status = Integer.MIN_VALUE;
    public String actsPackRefWaitingStatus;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setId_state(int aValue){
       id_state = aValue;
    }

    public int getId_state(){
       return id_state;
    }
    public void setState_name(String aValue){
       state_name = aValue;
    }

    public String getState_name(){
       return state_name;
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

    public void setActsPackRefCode(int aValue){
       actsPackRefCode = aValue;
    }
    public int getActsPackRefCode(){
       return actsPackRefCode;
    }

    public void setActsPackRefName(String aValue){
       actsPackRefName = aValue;
    }
    public String getActsPackRefName(){
       return actsPackRefName;
    }

    public void setActsPackRefAddress(String aValue){
       actsPackRefAddress = aValue;
    }
    public String getActsPackRefAddress(){
       return actsPackRefAddress;
    }

    public void setActsPackRefAddress_jur(String aValue){
       actsPackRefAddress_jur = aValue;
    }
    public String getActsPackRefAddress_jur(){
       return actsPackRefAddress_jur;
    }

    public void setActsPackRefPurpose(String aValue){
       actsPackRefPurpose = aValue;
    }
    public String getActsPackRefPurpose(){
       return actsPackRefPurpose;
    }

    public void setActsPackRefBusiness_type(String aValue){
       actsPackRefBusiness_type = aValue;
    }
    public String getActsPackRefBusiness_type(){
       return actsPackRefBusiness_type;
    }

    public void setActsPackRefBlank_number(String aValue){
       actsPackRefBlank_number = aValue;
    }
    public String getActsPackRefBlank_number(){
       return actsPackRefBlank_number;
    }

    public void setActsPackRefAct_number(String aValue){
       actsPackRefAct_number = aValue;
    }
    public String getActsPackRefAct_number(){
       return actsPackRefAct_number;
    }


    public void setActsPackRefAct_date(Date aValue){
       actsPackRefAct_date = aValue;
    }
    public Date getActsPackRefAct_date(){
       return actsPackRefAct_date;
    }

    public void setActsPackRefAct_sum(BigDecimal aValue){
       actsPackRefAct_sum = aValue;
    }
    public BigDecimal getActsPackRefAct_sum(){
       return actsPackRefAct_sum;
    }


    public void setActsPackRefPay_date(Date aValue){
       actsPackRefPay_date = aValue;
    }
    public Date getActsPackRefPay_date(){
       return actsPackRefPay_date;
    }

    public void setActsPackRefPay_sum(BigDecimal aValue){
       actsPackRefPay_sum = aValue;
    }
    public BigDecimal getActsPackRefPay_sum(){
       return actsPackRefPay_sum;
    }

    public void setActsPackRefIs_ksoe(int aValue){
       actsPackRefIs_ksoe = aValue;
    }
    public int getActsPackRefIs_ksoe(){
       return actsPackRefIs_ksoe;
    }

    public void setActsPackRefStatus(int aValue){
       actsPackRefStatus = aValue;
    }
    public int getActsPackRefStatus(){
       return actsPackRefStatus;
    }

    public void setActsPackRefId_ren(int aValue){
       actsPackRefId_ren = aValue;
    }
    public int getActsPackRefId_ren(){
       return actsPackRefId_ren;
    }

    public void setActsPackRefRenName(String aValue){
       actsPackRefRenName = aValue;
    }
    public String getActsPackRefRenName(){
       return actsPackRefRenName;
    }

    public void setActsPackRefId_pack_status(int aValue){
       actsPackRefId_pack_status = aValue;
    }
    public int getActsPackRefId_pack_status(){
       return actsPackRefId_pack_status;
    }

    public void setActsPackRefStatusName(String aValue){
       actsPackRefStatusName = aValue;
    }
    public String getActsPackRefStatusName(){
       return actsPackRefStatusName;
    }

    public void setActsPackRefId_waiting_status(int aValue){
       actsPackRefId_waiting_status = aValue;
    }
    public int getActsPackRefId_waiting_status(){
       return actsPackRefId_waiting_status;
    }

    public void setActsPackRefWaitingStatus(String aValue){
       actsPackRefWaitingStatus = aValue;
    }
    public String getActsPackRefWaitingStatus(){
       return actsPackRefWaitingStatus;
    }



}