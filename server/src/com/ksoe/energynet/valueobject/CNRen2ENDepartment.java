
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNRen2ENDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class CNRen2ENDepartment implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  cnRenCode = Integer.MIN_VALUE; 
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "CNREN2ENDEPARTMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNREN2ENDEPARTMENT.CODE";
    public static final String cnRenCode_Attr = "cnRenCode";
    public static final String cnRenCode_Field = "CNRENCODE";
    public static final String cnRenCode_QFielld = "CNREN2ENDEPARTMENT.CNRENCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "CNREN2ENDEPARTMENT.DEPARTMENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCnRenCode(int aValue){
       cnRenCode = aValue;
    }

    public int getCnRenCode(){
       return cnRenCode;
    }

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of CNRen2ENDepartmentValueObject

