
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSite;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSite implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  siteaddress; 
    public String  sitephone; 
    public long  modify_time = Long.MIN_VALUE;
    public static final String tableName = "ENSITE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSITE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSITE.NAME";
    public static final String siteaddress_Attr = "siteaddress";
    public static final String siteaddress_Field = "SITEADDRESS";
    public static final String siteaddress_QFielld = "ENSITE.SITEADDRESS";
    public static final String sitephone_Attr = "sitephone";
    public static final String sitephone_Field = "SITEPHONE";
    public static final String sitephone_QFielld = "ENSITE.SITEPHONE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSITE.MODIFY_TIME";


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

    public void setSiteaddress(String aValue){
       siteaddress = aValue;
    }

    public String getSiteaddress(){
       return siteaddress;
    }

    public void setSitephone(String aValue){
       sitephone = aValue;
    }

    public String getSitephone(){
       return sitephone;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


} // end of ENSiteValueObject

