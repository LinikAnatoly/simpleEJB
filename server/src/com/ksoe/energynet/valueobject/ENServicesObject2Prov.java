
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesObject2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENServicesObject2Prov implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  partId = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date datePosting ;
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public String  voucher; 
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSERVICESOBJECT2PROV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESOBJECT2PROV.CODE";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "ENSERVICESOBJECT2PROV.PARTID";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSERVICESOBJECT2PROV.USERGEN";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "ENSERVICESOBJECT2PROV.DATEPOSTING";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSERVICESOBJECT2PROV.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSERVICESOBJECT2PROV.MODIFY_TIME";
    public static final String voucher_Attr = "voucher";
    public static final String voucher_Field = "VOUCHER";
    public static final String voucher_QFielld = "ENSERVICESOBJECT2PROV.VOUCHER";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICESOBJECT2PROV.SERVICESOBJECTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setPartId(int aValue){
       partId = aValue;
    }

    public int getPartId(){
       return partId;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDatePosting(Date aValue){
       datePosting = aValue;
    }

    public Date getDatePosting(){
       return datePosting;
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


    public void setVoucher(String aValue){
       voucher = aValue;
    }

    public String getVoucher(){
       return voucher;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }

} // end of ENServicesObject2ProvValueObject

