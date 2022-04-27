
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINDoc2ActFINDoc2Act;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENActRef;
import com.ksoe.energynet.valueobject.references.FINDocTypeRef;

public class FINDoc2Act implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  finDocMOLCode = Integer.MIN_VALUE; 
    public int  finDocMechanicCode = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public FINDocTypeRef typeRef = new FINDocTypeRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "FINDOC2ACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINDOC2ACT.CODE";
    public static final String finDocMOLCode_Attr = "finDocMOLCode";
    public static final String finDocMOLCode_Field = "FINDOCMOLCODE";
    public static final String finDocMOLCode_QFielld = "FINDOC2ACT.FINDOCMOLCODE";
    public static final String finDocMechanicCode_Attr = "finDocMechanicCode";
    public static final String finDocMechanicCode_Field = "FINDOCMECHANICCODE";
    public static final String finDocMechanicCode_QFielld = "FINDOC2ACT.FINDOCMECHANICCODE";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "FINDOC2ACT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINDOC2ACT.MODIFY_TIME";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "FINDOC2ACT.TYPEREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "FINDOC2ACT.ACTREFCODE";


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
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of FINDoc2ActValueObject

