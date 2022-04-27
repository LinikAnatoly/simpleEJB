
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENNormativeVolumeAVZ;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENNormativeVolumeAVZ implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public int  rest_purpose_type_id = Integer.MIN_VALUE;
    public String  rest_purpose_type_name; 
    public ENDepartmentRef budgetRef = new ENDepartmentRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "ENNORMATIVEVOLUMEAVZ";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENNORMATIVEVOLUMEAVZ.CODE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENNORMATIVEVOLUMEAVZ.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENNORMATIVEVOLUMEAVZ.DATEEDIT";
    public static final String rest_purpose_type_id_Attr = "rest_purpose_type_id";
    public static final String rest_purpose_type_id_Field = "REST_PURPOSE_TYPE_ID";
    public static final String rest_purpose_type_id_QFielld = "ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_ID";
    public static final String rest_purpose_type_name_Attr = "rest_purpose_type_name";
    public static final String rest_purpose_type_name_Field = "REST_PURPOSE_TYPE_NAME";
    public static final String rest_purpose_type_name_QFielld = "ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_NAME";
    public static final String budgetRef_Attr = "budgetRef";
    public static final String budgetRef_Field = "BUDGETREFCODE";
    public static final String  budgetRef_QFielld = "ENNORMATIVEVOLUMEAVZ.BUDGETREFCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENNORMATIVEVOLUMEAVZ.DEPARTMENTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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


    public void setRest_purpose_type_id(int aValue){
       rest_purpose_type_id = aValue;
    }

    public int getRest_purpose_type_id(){
       return rest_purpose_type_id;
    }


    public void setRest_purpose_type_name(String aValue){
       rest_purpose_type_name = aValue;
    }

    public String getRest_purpose_type_name(){
       return rest_purpose_type_name;
    }

    public void setBudgetRef(ENDepartmentRef aValue){
       budgetRef = aValue;
    }

    public ENDepartmentRef getBudgetRef(){
       return budgetRef;
    }
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of ENNormativeVolumeAVZValueObject

