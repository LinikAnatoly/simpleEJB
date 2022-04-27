
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINDoc2WorkOrderFINDoc2WorkOrder;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENWorkOrderRef;
import com.ksoe.energynet.valueobject.references.FINDocTypeRef;

public class FINDoc2WorkOrder implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  finDocMOLCode = Integer.MIN_VALUE; 
    public int  finDocMechanicCode = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public FINDocTypeRef typeRef = new FINDocTypeRef();
    public ENWorkOrderRef workOrderRef = new ENWorkOrderRef();
    public static final String tableName = "FINDOC2WORKORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINDOC2WORKORDER.CODE";
    public static final String finDocMOLCode_Attr = "finDocMOLCode";
    public static final String finDocMOLCode_Field = "FINDOCMOLCODE";
    public static final String finDocMOLCode_QFielld = "FINDOC2WORKORDER.FINDOCMOLCODE";
    public static final String finDocMechanicCode_Attr = "finDocMechanicCode";
    public static final String finDocMechanicCode_Field = "FINDOCMECHANICCODE";
    public static final String finDocMechanicCode_QFielld = "FINDOC2WORKORDER.FINDOCMECHANICCODE";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "FINDOC2WORKORDER.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINDOC2WORKORDER.MODIFY_TIME";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "FINDOC2WORKORDER.TYPEREFCODE";
    public static final String workOrderRef_Attr = "workOrderRef";
    public static final String workOrderRef_Field = "WORKORDERREFCODE";
    public static final String  workOrderRef_QFielld = "FINDOC2WORKORDER.WORKORDERREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setFinDocMOLCode(int aValue){
       finDocMOLCode = aValue;
    }

    public int getFinDocMOLCode(){
       return finDocMOLCode;
    }

    public void setFinDocMechanicCode(int aValue){
       finDocMechanicCode = aValue;
    }

    public int getFinDocMechanicCode(){
       return finDocMechanicCode;
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
    public void setTypeRef(FINDocTypeRef aValue){
       typeRef = aValue;
    }

    public FINDocTypeRef getTypeRef(){
       return typeRef;
    }
    public void setWorkOrderRef(ENWorkOrderRef aValue){
       workOrderRef = aValue;
    }

    public ENWorkOrderRef getWorkOrderRef(){
       return workOrderRef;
    }

} // end of FINDoc2WorkOrderValueObject

