
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINDoc2ENServicesObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.FINDocTypeRef;

public class FINDoc2ENServicesObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  finDocCode = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public FINDocTypeRef finDocTypeRef = new FINDocTypeRef();
    public static final String tableName = "FINDOC2ENSERVICESOBJCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINDOC2ENSERVICESOBJCT.CODE";
    public static final String finDocCode_Attr = "finDocCode";
    public static final String finDocCode_Field = "FINDOCCODE";
    public static final String finDocCode_QFielld = "FINDOC2ENSERVICESOBJCT.FINDOCCODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINDOC2ENSERVICESOBJCT.MODIFY_TIME";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "FINDOC2ENSERVICESOBJCT.SERVICESOBJECTREFCODE";
    public static final String finDocTypeRef_Attr = "finDocTypeRef";
    public static final String finDocTypeRef_Field = "FINDOCTYPEREFCODE";
    public static final String  finDocTypeRef_QFielld = "FINDOC2ENSERVICESOBJCT.FINDOCTYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setFinDocCode(int aValue){
       finDocCode = aValue;
    }

    public int getFinDocCode(){
       return finDocCode;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setFinDocTypeRef(FINDocTypeRef aValue){
       finDocTypeRef = aValue;
    }

    public FINDocTypeRef getFinDocTypeRef(){
       return finDocTypeRef;
    }

} // end of FINDoc2ENServicesObjectValueObject

