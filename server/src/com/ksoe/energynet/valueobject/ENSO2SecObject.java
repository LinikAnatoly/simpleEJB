
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSO2SecObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSO2SecObject implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  securityObj; 
    public String  securityObjAddress; 
    public BigDecimal  securityPeriod; 
    public int  guardPost = Integer.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSO2SECOBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSO2SECOBJECT.CODE";
    public static final String securityObj_Attr = "securityObj";
    public static final String securityObj_Field = "SECURITYOBJ";
    public static final String securityObj_QFielld = "ENSO2SECOBJECT.SECURITYOBJ";
    public static final String securityObjAddress_Attr = "securityObjAddress";
    public static final String securityObjAddress_Field = "SECURITYOBJADDRESS";
    public static final String securityObjAddress_QFielld = "ENSO2SECOBJECT.SECURITYOBJADDRESS";
    public static final String securityPeriod_Attr = "securityPeriod";
    public static final String securityPeriod_Field = "SECURITYPERIOD";
    public static final String securityPeriod_QFielld = "ENSO2SECOBJECT.SECURITYPERIOD";
    public static final String guardPost_Attr = "guardPost";
    public static final String guardPost_Field = "GUARDPOST";
    public static final String guardPost_QFielld = "ENSO2SECOBJECT.GUARDPOST";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSO2SECOBJECT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSO2SECOBJECT.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSO2SECOBJECT.MODIFY_TIME";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSO2SECOBJECT.SERVICESOBJECTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setSecurityObj(String aValue){
       securityObj = aValue;
    }

    public String getSecurityObj(){
       return securityObj;
    }


    public void setSecurityObjAddress(String aValue){
       securityObjAddress = aValue;
    }

    public String getSecurityObjAddress(){
       return securityObjAddress;
    }


    public void setSecurityPeriod(BigDecimal aValue){
       securityPeriod = aValue;
    }

    public BigDecimal getSecurityPeriod(){
       return securityPeriod;
    }


    public void setGuardPost(int aValue){
       guardPost = aValue;
    }

    public int getGuardPost(){
       return guardPost;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
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

} // end of ENSO2SecObjectValueObject

