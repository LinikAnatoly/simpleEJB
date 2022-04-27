
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportDep2Dep;  	
  */

import java.io.Serializable;

public class ENTransportDep2Dep implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTransportDepartment transportDepartment = new ENTransportDepartment();
    public ENDepartment department = new ENDepartment();
    public static final String tableName = "ENTRANSPORTDEP2DEP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTDEP2DEP.CODE";
    public static final String transportDepartment_Attr = "transportDepartment";
    public static final String transportDepartment_Field = "TRANSPORTDEPARTMENTCOD";
    public static final String  transportDepartment_QFielld = "ENTRANSPORTDEP2DEP.TRANSPORTDEPARTMENTCOD";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENTRANSPORTDEP2DEP.DEPARTMENTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTransportDepartment(ENTransportDepartment aValue){
       transportDepartment = aValue;
    }

    public ENTransportDepartment getTransportDepartment(){
       return transportDepartment;
    }
    public void setDepartment(ENDepartment aValue){
       department = aValue;
    }

    public ENDepartment getDepartment(){
       return department;
    }

} // end of ENTransportDep2DepValueObject

