
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENIP;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENIPStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENIPRef;

public class ENIP implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public int  yearGen = Integer.MIN_VALUE; 
    public int  version = Integer.MIN_VALUE; 
    public String  commentGen; 
    public Date dateAdd ;
    public Date dateEdit ;
    public String  userAdd; 
    public String  userEdit; 
    public long  modify_time = Long.MIN_VALUE;
    public ENIPStatusRef statusRef = new ENIPStatusRef();
    public ENIPRef parentRef = new ENIPRef();
    public static final String tableName = "ENIP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENIP.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENIP.NAME";
    public static final String yearGen_Attr = "yearGen";
    public static final String yearGen_Field = "YEARGEN";
    public static final String yearGen_QFielld = "ENIP.YEARGEN";
    public static final String version_Attr = "version";
    public static final String version_Field = "VERSION";
    public static final String version_QFielld = "ENIP.VERSION";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENIP.COMMENTGEN";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENIP.DATEADD";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENIP.DATEEDIT";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENIP.USERADD";
    public static final String userEdit_Attr = "userEdit";
    public static final String userEdit_Field = "USEREDIT";
    public static final String userEdit_QFielld = "ENIP.USEREDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENIP.MODIFY_TIME";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENIP.STATUSREFCODE";
    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "ENIP.PARENTREFCODE";


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

    public void setYearGen(int aValue){
       yearGen = aValue;
    }

    public int getYearGen(){
       return yearGen;
    }

    public void setVersion(int aValue){
       version = aValue;
    }

    public int getVersion(){
       return version;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setUserEdit(String aValue){
       userEdit = aValue;
    }

    public String getUserEdit(){
       return userEdit;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setStatusRef(ENIPStatusRef aValue){
       statusRef = aValue;
    }

    public ENIPStatusRef getStatusRef(){
       return statusRef;
    }
    public void setParentRef(ENIPRef aValue){
       parentRef = aValue;
    }

    public ENIPRef getParentRef(){
       return parentRef;
    }

} // end of ENIPValueObject

