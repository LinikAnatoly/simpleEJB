
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for EPRen2FINExecutor;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energypro.valueobject.references.EPRenRef;
    import  com.ksoe.energynet.valueobject.references.FINExecutorRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class EPRen2FINExecutor implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public EPRenRef renRef = new EPRenRef();
    public FINExecutorRef finExecutorRef = new FINExecutorRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "EPREN2FINEXECUTOR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "EPREN2FINEXECUTOR.CODE";
    public static final String renRef_Attr = "renRef";
    public static final String renRef_Field = "RENREFCODE";
    public static final String  renRef_QFielld = "EPREN2FINEXECUTOR.RENREFCODE";
    public static final String finExecutorRef_Attr = "finExecutorRef";
    public static final String finExecutorRef_Field = "FINEXECUTORREFCODE";
    public static final String  finExecutorRef_QFielld = "EPREN2FINEXECUTOR.FINEXECUTORREFCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "EPREN2FINEXECUTOR.DEPARTMENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setRenRef(EPRenRef aValue){
       renRef = aValue;
    }

    public EPRenRef getRenRef(){
       return renRef;
    }
    public void setFinExecutorRef(FINExecutorRef aValue){
       finExecutorRef = aValue;
    }

    public FINExecutorRef getFinExecutorRef(){
       return finExecutorRef;
    }
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of EPRen2FINExecutorValueObject

