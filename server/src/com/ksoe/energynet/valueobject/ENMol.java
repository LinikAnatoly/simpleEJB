
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMol;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENMolStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENMolTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENMol implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  finCode; 
    public String  name; 
    public String  phoneNumber; 
    public String  tabNumber; 
    public String  storage; 
    public long  modify_time = Long.MIN_VALUE;

    public ENMolStatusRef statusRef = new ENMolStatusRef();
    public ENMolTypeRef typeRef = new ENMolTypeRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();

    public static final String tableName = "ENMOL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMOL.CODE";
    public static final String finCode_Attr = "finCode";
    public static final String finCode_Field = "FINCODE";
    public static final String finCode_QFielld = "ENMOL.FINCODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENMOL.NAME";
    public static final String phoneNumber_Attr = "phoneNumber";
    public static final String phoneNumber_Field = "PHONENUMBER";
    public static final String phoneNumber_QFielld = "ENMOL.PHONENUMBER";
    public static final String tabNumber_Attr = "tabNumber";
    public static final String tabNumber_Field = "TABNUMBER";
    public static final String tabNumber_QFielld = "ENMOL.TABNUMBER";
    public static final String storage_Attr = "storage";
    public static final String storage_Field = "STORAGE";
    public static final String storage_QFielld = "ENMOL.STORAGE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMOL.MODIFY_TIME";

    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENMOL.STATUSREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENMOL.TYPEREFCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENMOL.DEPARTMENTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getFinCode(){
       return finCode;
    }
    
    public void setFinCode(String finCode){
       this.finCode = finCode;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public String getPhoneNumber(){
       return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber){
       this.phoneNumber = phoneNumber;
    }


    public String getTabNumber(){
       return tabNumber;
    }
    
    public void setTabNumber(String tabNumber){
       this.tabNumber = tabNumber;
    }


    public String getStorage(){
       return storage;
    }
    
    public void setStorage(String storage){
       this.storage = storage;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENMolStatusRef getStatusRef(){
       return statusRef;
    }
    
    public void setStatusRef(ENMolStatusRef statusRef){
       this.statusRef = statusRef;
    }
    public ENMolTypeRef getTypeRef(){
       return typeRef;
    }
    
    public void setTypeRef(ENMolTypeRef typeRef){
       this.typeRef = typeRef;
    }
    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    
    public void setDepartmentRef(ENDepartmentRef departmentRef){
       this.departmentRef = departmentRef;
    }

} // end of ENMolValueObject

