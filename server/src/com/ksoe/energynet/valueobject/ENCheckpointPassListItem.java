
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCheckpointPassListItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKTransportRealRef;
    import  com.ksoe.energynet.valueobject.references.ENCheckpointPassListRef;
    import  com.ksoe.energynet.valueobject.references.ENCheckpointEventTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetRef;

public class ENCheckpointPassListItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateEvent ;
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public TKTransportRealRef transportRealRef = new TKTransportRealRef();
    public ENCheckpointPassListRef checkpointPassListRef = new ENCheckpointPassListRef();
    public ENCheckpointEventTypeRef eventTypeRef = new ENCheckpointEventTypeRef();
    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public static final String tableName = "ENCHECKPOINTPASSLISTTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCHECKPOINTPASSLISTTM.CODE";
    public static final String dateEvent_Attr = "dateEvent";
    public static final String dateEvent_Field = "DATEEVENT";
    public static final String dateEvent_QFielld = "ENCHECKPOINTPASSLISTTM.DATEEVENT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCHECKPOINTPASSLISTTM.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCHECKPOINTPASSLISTTM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCHECKPOINTPASSLISTTM.DATEEDIT";
    public static final String transportRealRef_Attr = "transportRealRef";
    public static final String transportRealRef_Field = "TRANSPORTREALREFCODE";
    public static final String  transportRealRef_QFielld = "ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE";
    public static final String checkpointPassListRef_Attr = "checkpointPassListRef";
    public static final String checkpointPassListRef_Field = "CHECKPOINTPASSLISTRFCD";
    public static final String  checkpointPassListRef_QFielld = "ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD";
    public static final String eventTypeRef_Attr = "eventTypeRef";
    public static final String eventTypeRef_Field = "EVENTTYPEREFCODE";
    public static final String  eventTypeRef_QFielld = "ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE";
    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateEvent(Date aValue){
       dateEvent = aValue;
    }

    public Date getDateEvent(){
       return dateEvent;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setTransportRealRef(TKTransportRealRef aValue){
       transportRealRef = aValue;
    }

    public TKTransportRealRef getTransportRealRef(){
       return transportRealRef;
    }
    public void setCheckpointPassListRef(ENCheckpointPassListRef aValue){
       checkpointPassListRef = aValue;
    }

    public ENCheckpointPassListRef getCheckpointPassListRef(){
       return checkpointPassListRef;
    }
    public void setEventTypeRef(ENCheckpointEventTypeRef aValue){
       eventTypeRef = aValue;
    }

    public ENCheckpointEventTypeRef getEventTypeRef(){
       return eventTypeRef;
    }
    public void setTravelSheetRef(ENTravelSheetRef aValue){
       travelSheetRef = aValue;
    }

    public ENTravelSheetRef getTravelSheetRef(){
       return travelSheetRef;
    }

} // end of ENCheckpointPassListItemValueObject

