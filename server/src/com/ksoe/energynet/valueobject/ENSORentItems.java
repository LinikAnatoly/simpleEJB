
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSORentItems;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSORentItems implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  localityName; 
    public String  address; 
    public int  streetCode = Integer.MIN_VALUE; 
    public int  renCode = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSORENTITEMS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSORENTITEMS.CODE";
    public static final String localityName_Attr = "localityName";
    public static final String localityName_Field = "LOCALITYNAME";
    public static final String localityName_QFielld = "ENSORENTITEMS.LOCALITYNAME";
    public static final String address_Attr = "address";
    public static final String address_Field = "ADDRESS";
    public static final String address_QFielld = "ENSORENTITEMS.ADDRESS";
    public static final String streetCode_Attr = "streetCode";
    public static final String streetCode_Field = "STREETCODE";
    public static final String streetCode_QFielld = "ENSORENTITEMS.STREETCODE";
    public static final String renCode_Attr = "renCode";
    public static final String renCode_Field = "RENCODE";
    public static final String renCode_QFielld = "ENSORENTITEMS.RENCODE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSORENTITEMS.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSORENTITEMS.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSORENTITEMS.MODIFY_TIME";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSORENTITEMS.SERVICESOBJECTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setLocalityName(String aValue){
       localityName = aValue;
    }

    public String getLocalityName(){
       return localityName;
    }


    public void setAddress(String aValue){
       address = aValue;
    }

    public String getAddress(){
       return address;
    }


    public void setStreetCode(int aValue){
       streetCode = aValue;
    }

    public int getStreetCode(){
       return streetCode;
    }


    public void setRenCode(int aValue){
       renCode = aValue;
    }

    public int getRenCode(){
       return renCode;
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

} // end of ENSORentItemsValueObject

