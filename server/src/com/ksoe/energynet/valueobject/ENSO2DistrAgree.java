
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSO2DistrAgree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENDistributionAgreeRef;

public class ENSO2DistrAgree implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();
    public ENDistributionAgreeRef distrAgree = new ENDistributionAgreeRef();
    public static final String tableName = "ENSO2DISTRAGREE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSO2DISTRAGREE.CODE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSO2DISTRAGREE.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSO2DISTRAGREE.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSO2DISTRAGREE.MODIFY_TIME";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENSO2DISTRAGREE.SERVICESOBJECTCODE";
    public static final String distrAgree_Attr = "distrAgree";
    public static final String distrAgree_Field = "DISTRAGREECODE";
    public static final String  distrAgree_QFielld = "ENSO2DISTRAGREE.DISTRAGREECODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setServicesobject(ENServicesObjectRef aValue){
       servicesobject = aValue;
    }

    public ENServicesObjectRef getServicesobject(){
       return servicesobject;
    }
    public void setDistrAgree(ENDistributionAgreeRef aValue){
       distrAgree = aValue;
    }

    public ENDistributionAgreeRef getDistrAgree(){
       return distrAgree;
    }

} // end of ENSO2DistrAgreeValueObject

