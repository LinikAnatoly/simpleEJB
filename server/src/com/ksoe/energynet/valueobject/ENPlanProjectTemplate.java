
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanProjectTemplate;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlanProjectTemplate implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  tag; 
    public String  elementName; 
    public int  elementcode = Integer.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENPLANPROJECTTEMPLATE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANPROJECTTEMPLATE.CODE";
    public static final String tag_Attr = "tag";
    public static final String tag_Field = "TAG";
    public static final String tag_QFielld = "ENPLANPROJECTTEMPLATE.TAG";
    public static final String elementName_Attr = "elementName";
    public static final String elementName_Field = "ELEMENTNAME";
    public static final String elementName_QFielld = "ENPLANPROJECTTEMPLATE.ELEMENTNAME";
    public static final String elementcode_Attr = "elementcode";
    public static final String elementcode_Field = "ELEMENTCODE";
    public static final String elementcode_QFielld = "ENPLANPROJECTTEMPLATE.ELEMENTCODE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANPROJECTTEMPLATE.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANPROJECTTEMPLATE.DATEEDIT";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENPLANPROJECTTEMPLATE.PLANREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTag(String aValue){
       tag = aValue;
    }

    public String getTag(){
       return tag;
    }


    public void setElementName(String aValue){
       elementName = aValue;
    }

    public String getElementName(){
       return elementName;
    }


    public void setElementcode(int aValue){
       elementcode = aValue;
    }

    public int getElementcode(){
       return elementcode;
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

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENPlanProjectTemplateValueObject

