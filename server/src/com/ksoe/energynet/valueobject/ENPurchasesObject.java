
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPurchasesObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENPurchasesObjectReason;
    import  com.ksoe.energynet.valueobject.references.ENElementTypeRef;
    import  com.ksoe.energynet.valueobject.ENDepartment;
    import  com.ksoe.energynet.valueobject.ENDepartment;
    import  com.ksoe.energynet.valueobject.ENElement;

public class ENPurchasesObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  commentGen; 
    public int  expandMaterialsIP = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPurchasesObjectReason purchasesReason = new ENPurchasesObjectReason();
    public ENElementTypeRef elementTypeRef = new ENElementTypeRef();
    public ENDepartment budget = new ENDepartment();
    public ENDepartment department = new ENDepartment();
    public ENElement element = new ENElement();
    public static final String tableName = "ENPURCHASESOBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPURCHASESOBJECT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPURCHASESOBJECT.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENPURCHASESOBJECT.COMMENTGEN";
    public static final String expandMaterialsIP_Attr = "expandMaterialsIP";
    public static final String expandMaterialsIP_Field = "EXPANDMATERIALSIP";
    public static final String expandMaterialsIP_QFielld = "ENPURCHASESOBJECT.EXPANDMATERIALSIP";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENPURCHASESOBJECT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPURCHASESOBJECT.MODIFY_TIME";
    public static final String purchasesReason_Attr = "purchasesReason";
    public static final String purchasesReason_Field = "PURCHASESREASONCODE";
    public static final String  purchasesReason_QFielld = "ENPURCHASESOBJECT.PURCHASESREASONCODE";
    public static final String elementTypeRef_Attr = "elementTypeRef";
    public static final String elementTypeRef_Field = "ELEMENTTYPEREFCODE";
    public static final String  elementTypeRef_QFielld = "ENPURCHASESOBJECT.ELEMENTTYPEREFCODE";
    public static final String budget_Attr = "budget";
    public static final String budget_Field = "BUDGETCODE";
    public static final String  budget_QFielld = "ENPURCHASESOBJECT.BUDGETCODE";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENPURCHASESOBJECT.DEPARTMENTCODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENPURCHASESOBJECT.ELEMENTCODE";


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

    public void setExpandMaterialsIP(int aValue){
       expandMaterialsIP = aValue;
    }

    public int getExpandMaterialsIP(){
       return expandMaterialsIP;
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

    public void setPurchasesReason(ENPurchasesObjectReason aValue){
       purchasesReason = aValue;
    }

    public ENPurchasesObjectReason getPurchasesReason(){
       return purchasesReason;
    }
    public void setElementTypeRef(ENElementTypeRef aValue){
       elementTypeRef = aValue;
    }

    public ENElementTypeRef getElementTypeRef(){
       return elementTypeRef;
    }
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

} // end of ENPurchasesObjectValueObject

