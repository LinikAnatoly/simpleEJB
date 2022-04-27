
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTechCondResponsibles2Dep;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTechCondResponsiblesRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENTechCondResponsibles2Dep implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTechCondResponsiblesRef techCondResponsiblesRef = new ENTechCondResponsiblesRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "ENTECHCONDRESPNSBLS2DP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTECHCONDRESPNSBLS2DP.CODE";
    public static final String techCondResponsiblesRef_Attr = "techCondResponsiblesRef";
    public static final String techCondResponsiblesRef_Field = "TECHCONDRESPONSBLSRFCD";
    public static final String  techCondResponsiblesRef_QFielld = "ENTECHCONDRESPNSBLS2DP.TECHCONDRESPONSBLSRFCD";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENTECHCONDRESPNSBLS2DP.DEPARTMENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTechCondResponsiblesRef(ENTechCondResponsiblesRef aValue){
       techCondResponsiblesRef = aValue;
    }

    public ENTechCondResponsiblesRef getTechCondResponsiblesRef(){
       return techCondResponsiblesRef;
    }
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of ENTechCondResponsibles2DepValueObject

