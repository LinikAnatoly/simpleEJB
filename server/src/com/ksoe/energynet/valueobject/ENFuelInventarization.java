
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelInventarization;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENFuelInventarizationStatusRef;

public class ENFuelInventarization implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date dateGen ;
    public String  molCode; 
    public String  molName; 
    public String  commentGen; 
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENFuelInventarizationStatusRef statusRef = new ENFuelInventarizationStatusRef();
    public static final String tableName = "ENFUELINVENTARIZATION";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELINVENTARIZATION.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENFUELINVENTARIZATION.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENFUELINVENTARIZATION.DATEGEN";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "ENFUELINVENTARIZATION.MOLCODE";
    public static final String molName_Attr = "molName";
    public static final String molName_Field = "MOLNAME";
    public static final String molName_QFielld = "ENFUELINVENTARIZATION.MOLNAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENFUELINVENTARIZATION.COMMENTGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENFUELINVENTARIZATION.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENFUELINVENTARIZATION.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELINVENTARIZATION.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELINVENTARIZATION.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENFUELINVENTARIZATION.MODIFY_TIME";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENFUELINVENTARIZATION.STATUSREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }

    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setStatusRef(ENFuelInventarizationStatusRef aValue){
       statusRef = aValue;
    }

    public ENFuelInventarizationStatusRef getStatusRef(){
       return statusRef;
    }

} // end of ENFuelInventarizationValueObject

