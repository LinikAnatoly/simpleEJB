
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBudgets2Nomenclatures;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENBudgets2Nomenclatures implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public int  mat_id = Integer.MIN_VALUE; 
    public String  nn; 
    public String  mat_name; 
    public ENDepartmentRef budgetRef = new ENDepartmentRef();
    public static final String tableName = "ENBUDGETS2NOMENCLATURS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUDGETS2NOMENCLATURS.CODE";
    public static final String mat_id_Attr = "mat_id";
    public static final String mat_id_Field = "MAT_ID";
    public static final String mat_id_QFielld = "ENBUDGETS2NOMENCLATURS.MAT_ID";
    public static final String nn_Attr = "nn";
    public static final String nn_Field = "NN";
    public static final String nn_QFielld = "ENBUDGETS2NOMENCLATURS.NN";
    public static final String mat_name_Attr = "mat_name";
    public static final String mat_name_Field = "MAT_NAME";
    public static final String mat_name_QFielld = "ENBUDGETS2NOMENCLATURS.MAT_NAME";
    public static final String budgetRef_Attr = "budgetRef";
    public static final String budgetRef_Field = "BUDGETREFCODE";
    public static final String  budgetRef_QFielld = "ENBUDGETS2NOMENCLATURS.BUDGETREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setMat_id(int aValue){
       mat_id = aValue;
    }

    public int getMat_id(){
       return mat_id;
    }


    public void setNn(String aValue){
       nn = aValue;
    }

    public String getNn(){
       return nn;
    }


    public void setMat_name(String aValue){
       mat_name = aValue;
    }

    public String getMat_name(){
       return mat_name;
    }

    public void setBudgetRef(ENDepartmentRef aValue){
       budgetRef = aValue;
    }

    public ENDepartmentRef getBudgetRef(){
       return budgetRef;
    }

} // end of ENBudgets2NomenclaturesValueObject

