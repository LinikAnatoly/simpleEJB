
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilderObjectENBuilderObject;  	
  */

import java.io.Serializable;
import java.util.Date;

public class ENBuilderObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  invNumber; 
    public String  name; 
    public String  buhName; 
    public int  yearBuild = Integer.MIN_VALUE; 
    public int  yearWorkingStart = Integer.MIN_VALUE; 
    public String  commentGen; 
    public Date  dateGen; 
    public String  userGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENBuilderObjectType objectType = new ENBuilderObjectType();
    public ENElement element = new ENElement();
    public static final String tableName = "ENBUILDEROBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDEROBJECT.CODE";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENBUILDEROBJECT.INVNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBUILDEROBJECT.NAME";
    public static final String buhName_Attr = "buhName";
    public static final String buhName_Field = "BUHNAME";
    public static final String buhName_QFielld = "ENBUILDEROBJECT.BUHNAME";
    public static final String yearBuild_Attr = "yearBuild";
    public static final String yearBuild_Field = "YEARBUILD";
    public static final String yearBuild_QFielld = "ENBUILDEROBJECT.YEARBUILD";
    public static final String yearWorkingStart_Attr = "yearWorkingStart";
    public static final String yearWorkingStart_Field = "YEARWORKINGSTART";
    public static final String yearWorkingStart_QFielld = "ENBUILDEROBJECT.YEARWORKINGSTART";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENBUILDEROBJECT.COMMENTGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENBUILDEROBJECT.DATEGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENBUILDEROBJECT.USERGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENBUILDEROBJECT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBUILDEROBJECT.MODIFY_TIME";
    public static final String objectType_Attr = "objectType";
    public static final String objectType_Field = "OBJECTTYPECODE";
    public static final String  objectType_QFielld = "ENBUILDEROBJECT.OBJECTTYPECODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENBUILDEROBJECT.ELEMENTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setBuhName(String aValue){
       buhName = aValue;
    }

    public String getBuhName(){
       return buhName;
    }

    public void setYearBuild(int aValue){
       yearBuild = aValue;
    }

    public int getYearBuild(){
       return yearBuild;
    }

    public void setYearWorkingStart(int aValue){
       yearWorkingStart = aValue;
    }

    public int getYearWorkingStart(){
       return yearWorkingStart;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
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
    public void setObjectType(ENBuilderObjectType aValue){
       objectType = aValue;
    }

    public ENBuilderObjectType getObjectType(){
       return objectType;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }

} // end of ENBuilderObjectValueObject

