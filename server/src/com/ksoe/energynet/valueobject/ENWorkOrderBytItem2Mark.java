
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrderBytItem2Mark;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytItemRef;

public class ENWorkOrderBytItem2Mark implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  markCode = Integer.MIN_VALUE; 
    public String  markName; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENWorkOrderBytItemRef workOrderBytItemRef = new ENWorkOrderBytItemRef();
    public static final String tableName = "ENWORKORDERBYTITEM2MRK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDERBYTITEM2MRK.CODE";
    public static final String markCode_Attr = "markCode";
    public static final String markCode_Field = "MARKCODE";
    public static final String markCode_QFielld = "ENWORKORDERBYTITEM2MRK.MARKCODE";
    public static final String markName_Attr = "markName";
    public static final String markName_Field = "MARKNAME";
    public static final String markName_QFielld = "ENWORKORDERBYTITEM2MRK.MARKNAME";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENWORKORDERBYTITEM2MRK.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENWORKORDERBYTITEM2MRK.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENWORKORDERBYTITEM2MRK.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENWORKORDERBYTITEM2MRK.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENWORKORDERBYTITEM2MRK.DATEEDIT";
    public static final String workOrderBytItemRef_Attr = "workOrderBytItemRef";
    public static final String workOrderBytItemRef_Field = "WORKORDERBYTITEMREFCOD";
    public static final String  workOrderBytItemRef_QFielld = "ENWORKORDERBYTITEM2MRK.WORKORDERBYTITEMREFCOD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setMarkCode(int aValue){
       markCode = aValue;
    }

    public int getMarkCode(){
       return markCode;
    }

    public void setMarkName(String aValue){
       markName = aValue;
    }

    public String getMarkName(){
       return markName;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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

    public void setWorkOrderBytItemRef(ENWorkOrderBytItemRef aValue){
       workOrderBytItemRef = aValue;
    }

    public ENWorkOrderBytItemRef getWorkOrderBytItemRef(){
       return workOrderBytItemRef;
    }

} // end of ENWorkOrderBytItem2MarkValueObject

