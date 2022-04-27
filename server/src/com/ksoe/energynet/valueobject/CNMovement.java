
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNMovement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
    import  com.ksoe.energynet.valueobject.references.CNPackRef;

public class CNMovement implements Serializable {

    public int  id = Integer.MIN_VALUE;
    public int id_pack = Integer.MIN_VALUE;
    public int  id_state = Integer.MIN_VALUE; 
    public Date startdate ;
    public String  note; 
    public int  id_parent = Integer.MIN_VALUE; 
    public int  id_user = 1005; 
    public Date realdate ;
    public int  canceled = Integer.MIN_VALUE; 
    public int  id_user_canceled = Integer.MIN_VALUE; 
    public Date canceleddate ;
    public String  cancelednote; 
    public int  is_completed = Integer.MIN_VALUE; 
    public int  id_movement_status = Integer.MIN_VALUE; 
    public String  addnote; 
    public int  read_status = Integer.MIN_VALUE; 
    public int  id_user_read = Integer.MIN_VALUE; 
    public Date read_date ;
    public int  id_user_created = Integer.MIN_VALUE; 
    public Date modifytime ;
    public Date pastdate ;
    public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();
    public CNPackRef cnPackRef = new CNPackRef();
    public static final String tableName = "CNMOVEMENT";
    public static final String id_Attr = "id";
    public static final String id_Field = "ID";
    public static final String id_QFielld = "CNMOVEMENT.ID";
    public static final String id_state_Attr = "id_state";
    public static final String id_state_Field = "ID_STATE";
    public static final String id_state_QFielld = "CNMOVEMENT.ID_STATE";
    public static final String startdate_Attr = "startdate";
    public static final String startdate_Field = "STARTDATE";
    public static final String startdate_QFielld = "CNMOVEMENT.STARTDATE";
    public static final String note_Attr = "note";
    public static final String note_Field = "NOTE";
    public static final String note_QFielld = "CNMOVEMENT.NOTE";
    public static final String id_parent_Attr = "id_parent";
    public static final String id_parent_Field = "ID_PARENT";
    public static final String id_parent_QFielld = "CNMOVEMENT.ID_PARENT";
    public static final String id_user_Attr = "id_user";
    public static final String id_user_Field = "ID_USER";
    public static final String id_user_QFielld = "CNMOVEMENT.ID_USER";
    public static final String realdate_Attr = "realdate";
    public static final String realdate_Field = "REALDATE";
    public static final String realdate_QFielld = "CNMOVEMENT.REALDATE";
    public static final String canceled_Attr = "canceled";
    public static final String canceled_Field = "CANCELED";
    public static final String canceled_QFielld = "CNMOVEMENT.CANCELED";
    public static final String id_user_canceled_Attr = "id_user_canceled";
    public static final String id_user_canceled_Field = "ID_USER_CANCELED";
    public static final String id_user_canceled_QFielld = "CNMOVEMENT.ID_USER_CANCELED";
    public static final String canceleddate_Attr = "canceleddate";
    public static final String canceleddate_Field = "CANCELEDDATE";
    public static final String canceleddate_QFielld = "CNMOVEMENT.CANCELEDDATE";
    public static final String cancelednote_Attr = "cancelednote";
    public static final String cancelednote_Field = "CANCELEDNOTE";
    public static final String cancelednote_QFielld = "CNMOVEMENT.CANCELEDNOTE";
    public static final String is_completed_Attr = "is_completed";
    public static final String is_completed_Field = "IS_COMPLETED";
    public static final String is_completed_QFielld = "CNMOVEMENT.IS_COMPLETED";
    public static final String id_movement_status_Attr = "id_movement_status";
    public static final String id_movement_status_Field = "ID_MOVEMENT_STATUS";
    public static final String id_movement_status_QFielld = "CNMOVEMENT.ID_MOVEMENT_STATUS";
    public static final String addnote_Attr = "addnote";
    public static final String addnote_Field = "ADDNOTE";
    public static final String addnote_QFielld = "CNMOVEMENT.ADDNOTE";
    public static final String read_status_Attr = "read_status";
    public static final String read_status_Field = "READ_STATUS";
    public static final String read_status_QFielld = "CNMOVEMENT.READ_STATUS";
    public static final String id_user_read_Attr = "id_user_read";
    public static final String id_user_read_Field = "ID_USER_READ";
    public static final String id_user_read_QFielld = "CNMOVEMENT.ID_USER_READ";
    public static final String read_date_Attr = "read_date";
    public static final String read_date_Field = "READ_DATE";
    public static final String read_date_QFielld = "CNMOVEMENT.READ_DATE";
    public static final String id_user_created_Attr = "id_user_created";
    public static final String id_user_created_Field = "ID_USER_CREATED";
    public static final String id_user_created_QFielld = "CNMOVEMENT.ID_USER_CREATED";
    public static final String modifytime_Attr = "modifytime";
    public static final String modifytime_Field = "MODIFYTIME";
    public static final String modifytime_QFielld = "CNMOVEMENT.MODIFYTIME";
    public static final String pastdate_Attr = "pastdate";
    public static final String pastdate_Field = "PASTDATE";
    public static final String pastdate_QFielld = "CNMOVEMENT.PASTDATE";
    public static final String subsystemRef_Attr = "subsystemRef";
    public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
    public static final String  subsystemRef_QFielld = "CNMOVEMENT.SUBSYSTEMREFCODE";
    public static final String cnPackRef_Attr = "cnPackRef";
    public static final String cnPackRef_Field = "CNPACKREFCODE";
    public static final String  cnPackRef_QFielld = "CNMOVEMENT.CNPACKREFCODE";


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

    public void setSubsystemRef(CNSubsystemTypeRef aValue){
       subsystemRef = aValue;
    }

    public CNSubsystemTypeRef getSubsystemRef(){
       return subsystemRef;
    }
    public void setCnPackRef(CNPackRef aValue){
       cnPackRef = aValue;
    }

    public CNPackRef getCnPackRef(){
       return cnPackRef;
    }

	public int getId_pack() {
		return id_pack;
	}

	public void setId_pack(int id_pack) {
		this.id_pack = id_pack;
	}

} // end of CNMovementValueObject

