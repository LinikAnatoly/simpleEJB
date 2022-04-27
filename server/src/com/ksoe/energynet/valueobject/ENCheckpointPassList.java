
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCheckpointPassList;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENCheckpointRef;
    import  com.ksoe.energynet.valueobject.references.ENTransportDepartmentRef;

public class ENCheckpointPassList implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateStart ;
    public Date dateFinal ;
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public ENCheckpointRef checkpointRef = new ENCheckpointRef();
    public ENTransportDepartmentRef transportDepartmentRef = new ENTransportDepartmentRef();
    public static final String tableName = "ENCHECKPOINTPASSLIST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCHECKPOINTPASSLIST.CODE";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENCHECKPOINTPASSLIST.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENCHECKPOINTPASSLIST.DATEFINAL";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCHECKPOINTPASSLIST.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCHECKPOINTPASSLIST.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCHECKPOINTPASSLIST.DATEEDIT";
    public static final String checkpointRef_Attr = "checkpointRef";
    public static final String checkpointRef_Field = "CHECKPOINTREFCODE";
    public static final String  checkpointRef_QFielld = "ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE";
    public static final String transportDepartmentRef_Attr = "transportDepartmentRef";
    public static final String transportDepartmentRef_Field = "TRANSPORTDEPARTMNTRFCD";
    public static final String  transportDepartmentRef_QFielld = "ENCHECKPOINTPASSLIST.TRANSPORTDEPARTMNTRFCD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
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

    public void setCheckpointRef(ENCheckpointRef aValue){
       checkpointRef = aValue;
    }

    public ENCheckpointRef getCheckpointRef(){
       return checkpointRef;
    }
    public void setTransportDepartmentRef(ENTransportDepartmentRef aValue){
       transportDepartmentRef = aValue;
    }

    public ENTransportDepartmentRef getTransportDepartmentRef(){
       return transportDepartmentRef;
    }

} // end of ENCheckpointPassListValueObject

