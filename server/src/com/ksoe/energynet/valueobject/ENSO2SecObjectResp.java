
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSO2SecObjectResp;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSO2SecObjectResp implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  responsibleName; 
    public String  responsiblePosition; 
    public String  responsibleContactInfo; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSO2SECOBJECTRESP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSO2SECOBJECTRESP.CODE";
    public static final String responsibleName_Attr = "responsibleName";
    public static final String responsibleName_Field = "RESPONSIBLENAME";
    public static final String responsibleName_QFielld = "ENSO2SECOBJECTRESP.RESPONSIBLENAME";
    public static final String responsiblePosition_Attr = "responsiblePosition";
    public static final String responsiblePosition_Field = "RESPONSIBLEPOSITION";
    public static final String responsiblePosition_QFielld = "ENSO2SECOBJECTRESP.RESPONSIBLEPOSITION";
    public static final String responsibleContactInfo_Attr = "responsibleContactInfo";
    public static final String responsibleContactInfo_Field = "RESPONSIBLECONTACTINFO";
    public static final String responsibleContactInfo_QFielld = "ENSO2SECOBJECTRESP.RESPONSIBLECONTACTINFO";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSO2SECOBJECTRESP.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSO2SECOBJECTRESP.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSO2SECOBJECTRESP.MODIFY_TIME";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSO2SECOBJECTRESP.SERVICESOBJECTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setResponsibleName(String aValue){
       responsibleName = aValue;
    }

    public String getResponsibleName(){
       return responsibleName;
    }


    public void setResponsiblePosition(String aValue){
       responsiblePosition = aValue;
    }

    public String getResponsiblePosition(){
       return responsiblePosition;
    }


    public void setResponsibleContactInfo(String aValue){
       responsibleContactInfo = aValue;
    }

    public String getResponsibleContactInfo(){
       return responsibleContactInfo;
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

} // end of ENSO2SecObjectRespValueObject

