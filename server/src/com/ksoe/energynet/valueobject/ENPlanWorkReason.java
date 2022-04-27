
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkReason;  	
  */

import java.io.Serializable;
import java.util.Date;

public class ENPlanWorkReason implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateGen ;
    public String  numberGen; 
    public String  name; 
    public String  commentGen; 
    public Date dateEdit ;
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENManagement management = new ENManagement();
    public ENPlanWorkReasonType reasonType = new ENPlanWorkReasonType();
    public static final String tableName = "ENPLANWORKREASON";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKREASON.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENPLANWORKREASON.DATEGEN";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENPLANWORKREASON.NUMBERGEN";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANWORKREASON.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENPLANWORKREASON.COMMENTGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANWORKREASON.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANWORKREASON.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKREASON.MODIFY_TIME";
    public static final String management_Attr = "management";
    public static final String management_Field = "MANAGEMENTCODE";
    public static final String  management_QFielld = "ENPLANWORKREASON.MANAGEMENTCODE";
    public static final String reasonType_Attr = "reasonType";
    public static final String reasonType_Field = "REASONTYPECODE";
    public static final String  reasonType_QFielld = "ENPLANWORKREASON.REASONTYPECODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setManagement(ENManagement aValue){
       management = aValue;
    }

    public ENManagement getManagement(){
       return management;
    }
    public void setReasonType(ENPlanWorkReasonType aValue){
       reasonType = aValue;
    }

    public ENPlanWorkReasonType getReasonType(){
       return reasonType;
    }

} // end of ENPlanWorkReasonValueObject

