
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMetrologyDeviceENMetrologyDevice;  	
  */

import java.io.Serializable;

public class ENMetrologyDevice implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  buildNumber; 
    public String  invNumber; 
    public String  buhName; 
    public String  commentGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENMetrologyDeviceType deviceType = new ENMetrologyDeviceType();
    public ENElement element = new ENElement();
    public static final String tableName = "ENMETROLOGYDEVICE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMETROLOGYDEVICE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENMETROLOGYDEVICE.NAME";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "ENMETROLOGYDEVICE.BUILDNUMBER";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENMETROLOGYDEVICE.INVNUMBER";
    public static final String buhName_Attr = "buhName";
    public static final String buhName_Field = "BUHNAME";
    public static final String buhName_QFielld = "ENMETROLOGYDEVICE.BUHNAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENMETROLOGYDEVICE.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENMETROLOGYDEVICE.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMETROLOGYDEVICE.MODIFY_TIME";
    public static final String deviceType_Attr = "deviceType";
    public static final String deviceType_Field = "DEVICETYPECODE";
    public static final String  deviceType_QFielld = "ENMETROLOGYDEVICE.DEVICETYPECODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENMETROLOGYDEVICE.ELEMENTCODE";


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

    public void setBuildNumber(String aValue){
       buildNumber = aValue;
    }

    public String getBuildNumber(){
       return buildNumber;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }

    public void setBuhName(String aValue){
       buhName = aValue;
    }

    public String getBuhName(){
       return buhName;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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
    public void setDeviceType(ENMetrologyDeviceType aValue){
       deviceType = aValue;
    }

    public ENMetrologyDeviceType getDeviceType(){
       return deviceType;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }

} // end of ENMetrologyDeviceValueObject

