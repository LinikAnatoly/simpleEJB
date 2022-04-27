
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDepartment2CCExecutor;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENDepartment2CCExecutor implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  ccExecutorCode = Integer.MIN_VALUE; 
    public ENDepartmentRef budgetRef = new ENDepartmentRef();
    public ENDepartmentRef responsibilityRef = new ENDepartmentRef();
    public static final String tableName = "ENDEPARTMENT2CCEXECUTR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDEPARTMENT2CCEXECUTR.CODE";
    public static final String ccExecutorCode_Attr = "ccExecutorCode";
    public static final String ccExecutorCode_Field = "CCEXECUTORCODE";
    public static final String ccExecutorCode_QFielld = "ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE";
    public static final String budgetRef_Attr = "budgetRef";
    public static final String budgetRef_Field = "BUDGETREFCODE";
    public static final String  budgetRef_QFielld = "ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE";
    public static final String responsibilityRef_Attr = "responsibilityRef";
    public static final String responsibilityRef_Field = "RESPONSIBILITYREFCODE";
    public static final String  responsibilityRef_QFielld = "ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCcExecutorCode(int aValue){
       ccExecutorCode = aValue;
    }

    public int getCcExecutorCode(){
       return ccExecutorCode;
    }

    public void setBudgetRef(ENDepartmentRef aValue){
       budgetRef = aValue;
    }

    public ENDepartmentRef getBudgetRef(){
       return budgetRef;
    }
    public void setResponsibilityRef(ENDepartmentRef aValue){
       responsibilityRef = aValue;
    }

    public ENDepartmentRef getResponsibilityRef(){
       return responsibilityRef;
    }

} // end of ENDepartment2CCExecutorValueObject

