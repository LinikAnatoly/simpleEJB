
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMol2Department;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENMol2Department implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENMol mol = new ENMol();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "ENMOL2DEPARTMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMOL2DEPARTMENT.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMOL2DEPARTMENT.MODIFY_TIME";
    public static final String mol_Attr = "mol";
    public static final String mol_Field = "MOLCODE";
    public static final String  mol_QFielld = "ENMOL2DEPARTMENT.MOLCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENMOL2DEPARTMENT.DEPARTMENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setMol(ENMol aValue){
       mol = aValue;
    }

    public ENMol getMol(){
       return mol;
    }
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of ENMol2DepartmentValueObject

