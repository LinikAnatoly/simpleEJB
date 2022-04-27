
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMetrologyObjectENMetrologyObject;  	
  */

import java.io.Serializable;

public class ENMetrologyObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  commentGen; 
    public int  is3phase = Integer.MIN_VALUE; 
    public int  isElectron = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElement element = new ENElement();
    public static final String tableName = "ENMETROLOGYOBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMETROLOGYOBJECT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENMETROLOGYOBJECT.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENMETROLOGYOBJECT.COMMENTGEN";
    public static final String is3phase_Attr = "is3phase";
    public static final String is3phase_Field = "IS3PHASE";
    public static final String is3phase_QFielld = "ENMETROLOGYOBJECT.IS3PHASE";
    public static final String isElectron_Attr = "isElectron";
    public static final String isElectron_Field = "ISELECTRON";
    public static final String isElectron_QFielld = "ENMETROLOGYOBJECT.ISELECTRON";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENMETROLOGYOBJECT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMETROLOGYOBJECT.MODIFY_TIME";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENMETROLOGYOBJECT.ELEMENTCODE";


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

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setIs3phase(int aValue){
       is3phase = aValue;
    }

    public int getIs3phase(){
       return is3phase;
    }

    public void setIsElectron(int aValue){
       isElectron = aValue;
    }

    public int getIsElectron(){
       return isElectron;
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
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }

} // end of ENMetrologyObjectValueObject

