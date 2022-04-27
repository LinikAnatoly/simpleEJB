
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNActsPack;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
    import  com.ksoe.docflow.valueobject.references.DFPackRef;

public class CNActsPack implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  address; 
    public String  address_jur; 
    public String  purpose; 
    public String  business_type; 
    public String  blank_number; 
    public String  act_number; 
    public Date act_date ;
    public BigDecimal  act_sum; 
    public Date pay_date ;
    public BigDecimal  pay_sum; 
    public int  is_ksoe = Integer.MIN_VALUE; 
    public int  status = Integer.MIN_VALUE; 
    public int  id_ren = Integer.MIN_VALUE; 
    public String  renName; 
    public int  id_pack_status = Integer.MIN_VALUE; 
    public String  statusName; 
    public int  id_waiting_status = Integer.MIN_VALUE; 
    public String  waitingStatus; 
    public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();
    public DFPackRef dfPackRef = new DFPackRef();
    public static final String tableName = "CNACTSPACK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNACTSPACK.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "CNACTSPACK.NAME";
    public static final String address_Attr = "address";
    public static final String address_Field = "ADDRESS";
    public static final String address_QFielld = "CNACTSPACK.ADDRESS";
    public static final String address_jur_Attr = "address_jur";
    public static final String address_jur_Field = "ADDRESS_JUR";
    public static final String address_jur_QFielld = "CNACTSPACK.ADDRESS_JUR";
    public static final String purpose_Attr = "purpose";
    public static final String purpose_Field = "PURPOSE";
    public static final String purpose_QFielld = "CNACTSPACK.PURPOSE";
    public static final String business_type_Attr = "business_type";
    public static final String business_type_Field = "BUSINESS_TYPE";
    public static final String business_type_QFielld = "CNACTSPACK.BUSINESS_TYPE";
    public static final String blank_number_Attr = "blank_number";
    public static final String blank_number_Field = "BLANK_NUMBER";
    public static final String blank_number_QFielld = "CNACTSPACK.BLANK_NUMBER";
    public static final String act_number_Attr = "act_number";
    public static final String act_number_Field = "ACT_NUMBER";
    public static final String act_number_QFielld = "CNACTSPACK.ACT_NUMBER";
    public static final String act_date_Attr = "act_date";
    public static final String act_date_Field = "ACT_DATE";
    public static final String act_date_QFielld = "CNACTSPACK.ACT_DATE";
    public static final String act_sum_Attr = "act_sum";
    public static final String act_sum_Field = "ACT_SUM";
    public static final String act_sum_QFielld = "CNACTSPACK.ACT_SUM";
    public static final String pay_date_Attr = "pay_date";
    public static final String pay_date_Field = "PAY_DATE";
    public static final String pay_date_QFielld = "CNACTSPACK.PAY_DATE";
    public static final String pay_sum_Attr = "pay_sum";
    public static final String pay_sum_Field = "PAY_SUM";
    public static final String pay_sum_QFielld = "CNACTSPACK.PAY_SUM";
    public static final String is_ksoe_Attr = "is_ksoe";
    public static final String is_ksoe_Field = "IS_KSOE";
    public static final String is_ksoe_QFielld = "CNACTSPACK.IS_KSOE";
    public static final String status_Attr = "status";
    public static final String status_Field = "STATUS";
    public static final String status_QFielld = "CNACTSPACK.STATUS";
    public static final String id_ren_Attr = "id_ren";
    public static final String id_ren_Field = "ID_REN";
    public static final String id_ren_QFielld = "CNACTSPACK.ID_REN";
    public static final String renName_Attr = "renName";
    public static final String renName_Field = "RENNAME";
    public static final String renName_QFielld = "CNACTSPACK.RENNAME";
    public static final String id_pack_status_Attr = "id_pack_status";
    public static final String id_pack_status_Field = "ID_PACK_STATUS";
    public static final String id_pack_status_QFielld = "CNACTSPACK.ID_PACK_STATUS";
    public static final String statusName_Attr = "statusName";
    public static final String statusName_Field = "STATUSNAME";
    public static final String statusName_QFielld = "CNACTSPACK.STATUSNAME";
    public static final String id_waiting_status_Attr = "id_waiting_status";
    public static final String id_waiting_status_Field = "ID_WAITING_STATUS";
    public static final String id_waiting_status_QFielld = "CNACTSPACK.ID_WAITING_STATUS";
    public static final String waitingStatus_Attr = "waitingStatus";
    public static final String waitingStatus_Field = "WAITINGSTATUS";
    public static final String waitingStatus_QFielld = "CNACTSPACK.WAITINGSTATUS";
    public static final String subsystemRef_Attr = "subsystemRef";
    public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
    public static final String  subsystemRef_QFielld = "CNACTSPACK.SUBSYSTEMREFCODE";
    public static final String dfPackRef_Attr = "dfPackRef";
    public static final String dfPackRef_Field = "DFPACKREFCODE";
    public static final String  dfPackRef_QFielld = "CNACTSPACK.DFPACKREFCODE";


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

    public void setSubsystemRef(CNSubsystemTypeRef aValue){
       subsystemRef = aValue;
    }

    public CNSubsystemTypeRef getSubsystemRef(){
       return subsystemRef;
    }
    public void setDfPackRef(DFPackRef aValue){
       dfPackRef = aValue;
    }

    public DFPackRef getDfPackRef(){
       return dfPackRef;
    }

} // end of CNActsPackValueObject

