
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPurchasesNoObjectENPurchasesNoObject;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENPurchasesNoObjectTypeRef;

public class ENPurchasesNoObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  commentGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENDepartment budget = new ENDepartment();
    public ENDepartment department = new ENDepartment();
    public ENElement element = new ENElement();
    public ENPurchasesNoObjectTypeRef typeRef = new ENPurchasesNoObjectTypeRef();
    public static final String tableName = "ENPURCHASESNOOBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPURCHASESNOOBJECT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPURCHASESNOOBJECT.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENPURCHASESNOOBJECT.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENPURCHASESNOOBJECT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPURCHASESNOOBJECT.MODIFY_TIME";
    public static final String budget_Attr = "budget";
    public static final String budget_Field = "BUDGETCODE";
    public static final String  budget_QFielld = "ENPURCHASESNOOBJECT.BUDGETCODE";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENPURCHASESNOOBJECT.DEPARTMENTCODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENPURCHASESNOOBJECT.ELEMENTCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENPURCHASESNOOBJECT.TYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setBudget(ENDepartment aValue){
       budget = aValue;
    }

    public ENDepartment getBudget(){
       return budget;
    }
    public void setDepartment(ENDepartment aValue){
       department = aValue;
    }

    public ENDepartment getDepartment(){
       return department;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }
    public void setTypeRef(ENPurchasesNoObjectTypeRef aValue){
       typeRef = aValue;
    }

    public ENPurchasesNoObjectTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENPurchasesNoObjectValueObject

