
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDepartment2Org;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENDepartment2Org implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public int  org_id = Integer.MIN_VALUE; 
    public int  axOrgId = Integer.MIN_VALUE; 
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "ENDEPARTMENT2ORG";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDEPARTMENT2ORG.CODE";
    public static final String org_id_Attr = "org_id";
    public static final String org_id_Field = "ORG_ID";
    public static final String org_id_QFielld = "ENDEPARTMENT2ORG.ORG_ID";
    public static final String axOrgId_Attr = "axOrgId";
    public static final String axOrgId_Field = "AXORGID";
    public static final String axOrgId_QFielld = "ENDEPARTMENT2ORG.AXORGID";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENDEPARTMENT2ORG.DEPARTMENTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setOrg_id(int aValue){
       org_id = aValue;
    }

    public int getOrg_id(){
       return org_id;
    }


    public void setAxOrgId(int aValue){
       axOrgId = aValue;
    }

    public int getAxOrgId(){
       return axOrgId;
    }

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of ENDepartment2OrgValueObject

