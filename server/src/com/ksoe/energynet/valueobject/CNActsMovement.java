
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNActsMovement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
    import  com.ksoe.energynet.valueobject.references.CNActsPackRef;

public class CNActsMovement implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  id_state = Integer.MIN_VALUE; 
    public String  state_name; 
    public Date startdate ;
    public String  note; 
    public int  id_parent = Integer.MIN_VALUE; 
    public int  id_user = Integer.MIN_VALUE; 
    public Date realdate ;
    public int  canceled = Integer.MIN_VALUE; 
    public int  id_user_canceled = Integer.MIN_VALUE; 
    public Date canceleddate ;
    public String  cancelednote; 
    public int  is_completed = Integer.MIN_VALUE; 
    public int  id_movement_status = Integer.MIN_VALUE; 
    public int  read_status = Integer.MIN_VALUE; 
    public int  id_user_read = Integer.MIN_VALUE; 
    public Date read_date ;
    public int  id_user_created = Integer.MIN_VALUE; 
    public Date modifytime ;
    public Date pastdate ;
    public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();
    public CNActsPackRef actsPackRef = new CNActsPackRef();
    public static final String tableName = "CNACTSMOVEMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNACTSMOVEMENT.CODE";
    public static final String id_state_Attr = "id_state";
    public static final String id_state_Field = "ID_STATE";
    public static final String id_state_QFielld = "CNACTSMOVEMENT.ID_STATE";
    public static final String state_name_Attr = "state_name";
    public static final String state_name_Field = "STATE_NAME";
    public static final String state_name_QFielld = "CNACTSMOVEMENT.STATE_NAME";
    public static final String startdate_Attr = "startdate";
    public static final String startdate_Field = "STARTDATE";
    public static final String startdate_QFielld = "CNACTSMOVEMENT.STARTDATE";
    public static final String note_Attr = "note";
    public static final String note_Field = "NOTE";
    public static final String note_QFielld = "CNACTSMOVEMENT.NOTE";
    public static final String id_parent_Attr = "id_parent";
    public static final String id_parent_Field = "ID_PARENT";
    public static final String id_parent_QFielld = "CNACTSMOVEMENT.ID_PARENT";
    public static final String id_user_Attr = "id_user";
    public static final String id_user_Field = "ID_USER";
    public static final String id_user_QFielld = "CNACTSMOVEMENT.ID_USER";
    public static final String realdate_Attr = "realdate";
    public static final String realdate_Field = "REALDATE";
    public static final String realdate_QFielld = "CNACTSMOVEMENT.REALDATE";
    public static final String canceled_Attr = "canceled";
    public static final String canceled_Field = "CANCELED";
    public static final String canceled_QFielld = "CNACTSMOVEMENT.CANCELED";
    public static final String id_user_canceled_Attr = "id_user_canceled";
    public static final String id_user_canceled_Field = "ID_USER_CANCELED";
    public static final String id_user_canceled_QFielld = "CNACTSMOVEMENT.ID_USER_CANCELED";
    public static final String canceleddate_Attr = "canceleddate";
    public static final String canceleddate_Field = "CANCELEDDATE";
    public static final String canceleddate_QFielld = "CNACTSMOVEMENT.CANCELEDDATE";
    public static final String cancelednote_Attr = "cancelednote";
    public static final String cancelednote_Field = "CANCELEDNOTE";
    public static final String cancelednote_QFielld = "CNACTSMOVEMENT.CANCELEDNOTE";
    public static final String is_completed_Attr = "is_completed";
    public static final String is_completed_Field = "IS_COMPLETED";
    public static final String is_completed_QFielld = "CNACTSMOVEMENT.IS_COMPLETED";
    public static final String id_movement_status_Attr = "id_movement_status";
    public static final String id_movement_status_Field = "ID_MOVEMENT_STATUS";
    public static final String id_movement_status_QFielld = "CNACTSMOVEMENT.ID_MOVEMENT_STATUS";
    public static final String read_status_Attr = "read_status";
    public static final String read_status_Field = "READ_STATUS";
    public static final String read_status_QFielld = "CNACTSMOVEMENT.READ_STATUS";
    public static final String id_user_read_Attr = "id_user_read";
    public static final String id_user_read_Field = "ID_USER_READ";
    public static final String id_user_read_QFielld = "CNACTSMOVEMENT.ID_USER_READ";
    public static final String read_date_Attr = "read_date";
    public static final String read_date_Field = "READ_DATE";
    public static final String read_date_QFielld = "CNACTSMOVEMENT.READ_DATE";
    public static final String id_user_created_Attr = "id_user_created";
    public static final String id_user_created_Field = "ID_USER_CREATED";
    public static final String id_user_created_QFielld = "CNACTSMOVEMENT.ID_USER_CREATED";
    public static final String modifytime_Attr = "modifytime";
    public static final String modifytime_Field = "MODIFYTIME";
    public static final String modifytime_QFielld = "CNACTSMOVEMENT.MODIFYTIME";
    public static final String pastdate_Attr = "pastdate";
    public static final String pastdate_Field = "PASTDATE";
    public static final String pastdate_QFielld = "CNACTSMOVEMENT.PASTDATE";
    public static final String subsystemRef_Attr = "subsystemRef";
    public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
    public static final String  subsystemRef_QFielld = "CNACTSMOVEMENT.SUBSYSTEMREFCODE";
    public static final String actsPackRef_Attr = "actsPackRef";
    public static final String actsPackRef_Field = "ACTSPACKREFCODE";
    public static final String  actsPackRef_QFielld = "CNACTSMOVEMENT.ACTSPACKREFCODE";


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

    public void setSubsystemRef(CNSubsystemTypeRef aValue){
       subsystemRef = aValue;
    }

    public CNSubsystemTypeRef getSubsystemRef(){
       return subsystemRef;
    }
    public void setActsPackRef(CNActsPackRef aValue){
       actsPackRef = aValue;
    }

    public CNActsPackRef getActsPackRef(){
       return actsPackRef;
    }

} // end of CNActsMovementValueObject

