
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNActsPack;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNActsPackShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String address;
    public String address_jur;
    public String purpose;
    public String business_type;
    public String blank_number;
    public String act_number;
    public Date act_date ;
    public BigDecimal act_sum;
    public Date pay_date ;
    public BigDecimal pay_sum;
    public int is_ksoe = Integer.MIN_VALUE;
    public int status = Integer.MIN_VALUE;
    public int id_ren = Integer.MIN_VALUE;
    public String renName;
    public int id_pack_status = Integer.MIN_VALUE;
    public String statusName;
    public int id_waiting_status = Integer.MIN_VALUE;
    public String waitingStatus;
    public int subsystemRefCode = Integer.MIN_VALUE;
    public String subsystemRefName;
    public int dfPackRefCode = Integer.MIN_VALUE;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }
    public void setAddress(String aValue){
       address = aValue;
    }

    public String getAddress(){
       return address;
    }
    public void setAddress_jur(String aValue){
       address_jur = aValue;
    }

    public String getAddress_jur(){
       return address_jur;
    }
    public void setPurpose(String aValue){
       purpose = aValue;
    }

    public String getPurpose(){
       return purpose;
    }
    public void setBusiness_type(String aValue){
       business_type = aValue;
    }

    public String getBusiness_type(){
       return business_type;
    }
    public void setBlank_number(String aValue){
       blank_number = aValue;
    }

    public String getBlank_number(){
       return blank_number;
    }
    public void setAct_number(String aValue){
       act_number = aValue;
    }

    public String getAct_number(){
       return act_number;
    }

    public void setAct_date(Date aValue){
       act_date = aValue;
    }

    public Date getAct_date(){
       return act_date;
    }
    public void setAct_sum(BigDecimal aValue){
       act_sum = aValue;
    }

    public BigDecimal getAct_sum(){
       return act_sum;
    }

    public void setPay_date(Date aValue){
       pay_date = aValue;
    }

    public Date getPay_date(){
       return pay_date;
    }
    public void setPay_sum(BigDecimal aValue){
       pay_sum = aValue;
    }

    public BigDecimal getPay_sum(){
       return pay_sum;
    }
    public void setIs_ksoe(int aValue){
       is_ksoe = aValue;
    }

    public int getIs_ksoe(){
       return is_ksoe;
    }
    public void setStatus(int aValue){
       status = aValue;
    }

    public int getStatus(){
       return status;
    }
    public void setId_ren(int aValue){
       id_ren = aValue;
    }

    public int getId_ren(){
       return id_ren;
    }
    public void setRenName(String aValue){
       renName = aValue;
    }

    public String getRenName(){
       return renName;
    }
    public void setId_pack_status(int aValue){
       id_pack_status = aValue;
    }

    public int getId_pack_status(){
       return id_pack_status;
    }
    public void setStatusName(String aValue){
       statusName = aValue;
    }

    public String getStatusName(){
       return statusName;
    }
    public void setId_waiting_status(int aValue){
       id_waiting_status = aValue;
    }

    public int getId_waiting_status(){
       return id_waiting_status;
    }
    public void setWaitingStatus(String aValue){
       waitingStatus = aValue;
    }

    public String getWaitingStatus(){
       return waitingStatus;
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
    public void setDfPackRefCode(int aValue){
       dfPackRefCode = aValue;
    }
    public int getDfPackRefCode(){
       return dfPackRefCode;
    }




}