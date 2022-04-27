
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENOtherObject;  	
  */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENOtherObjectTypeRef;

public class ENOtherObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  commentGen; 
    public String  buhName; 
    public String  invNumber; 
    public String  buildNumber; 
    public String  userGen; 
    public Date dateEdit ;
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElement element = new ENElement();
    public ENOtherObjectTypeRef typeRef = new ENOtherObjectTypeRef();
    public static final String tableName = "ENOTHEROBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENOTHEROBJECT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENOTHEROBJECT.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENOTHEROBJECT.COMMENTGEN";
    public static final String buhName_Attr = "buhName";
    public static final String buhName_Field = "BUHNAME";
    public static final String buhName_QFielld = "ENOTHEROBJECT.BUHNAME";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENOTHEROBJECT.INVNUMBER";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "ENOTHEROBJECT.BUILDNUMBER";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENOTHEROBJECT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENOTHEROBJECT.DATEEDIT";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENOTHEROBJECT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENOTHEROBJECT.MODIFY_TIME";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENOTHEROBJECT.ELEMENTCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENOTHEROBJECT.TYPEREFCODE";


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

    public void setBuhName(String aValue){
       buhName = aValue;
    }

    public String getBuhName(){
       return buhName;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }

    public void setBuildNumber(String aValue){
       buildNumber = aValue;
    }

    public String getBuildNumber(){
       return buildNumber;
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

    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }
    public void setTypeRef(ENOtherObjectTypeRef aValue){
       typeRef = aValue;
    }

    public ENOtherObjectTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENOtherObjectValueObject

