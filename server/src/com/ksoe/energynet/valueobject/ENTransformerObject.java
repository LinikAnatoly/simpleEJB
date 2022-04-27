
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransformerObjectENTransformerObject;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.netobjects.valueobject.ENTransformerType;

public class ENTransformerObject implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  buildNumber; 
    public int  buildYear = Integer.MIN_VALUE; 
    public BigDecimal  voltageHi; 
    public BigDecimal  voltageLow; 
    public BigDecimal  nomPower; 
    public String  buhName; 
    public String  invNumber; 
    public String  commentGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENTransformerType transformerType = new ENTransformerType();
    public ENElement element = new ENElement();
    public static final String tableName = "ENTRANSFORMEROBJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSFORMEROBJECT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTRANSFORMEROBJECT.NAME";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "ENTRANSFORMEROBJECT.BUILDNUMBER";
    public static final String buildYear_Attr = "buildYear";
    public static final String buildYear_Field = "BUILDYEAR";
    public static final String buildYear_QFielld = "ENTRANSFORMEROBJECT.BUILDYEAR";
    public static final String voltageHi_Attr = "voltageHi";
    public static final String voltageHi_Field = "VOLTAGEHI";
    public static final String voltageHi_QFielld = "ENTRANSFORMEROBJECT.VOLTAGEHI";
    public static final String voltageLow_Attr = "voltageLow";
    public static final String voltageLow_Field = "VOLTAGELOW";
    public static final String voltageLow_QFielld = "ENTRANSFORMEROBJECT.VOLTAGELOW";
    public static final String nomPower_Attr = "nomPower";
    public static final String nomPower_Field = "NOMPOWER";
    public static final String nomPower_QFielld = "ENTRANSFORMEROBJECT.NOMPOWER";
    public static final String buhName_Attr = "buhName";
    public static final String buhName_Field = "BUHNAME";
    public static final String buhName_QFielld = "ENTRANSFORMEROBJECT.BUHNAME";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENTRANSFORMEROBJECT.INVNUMBER";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRANSFORMEROBJECT.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENTRANSFORMEROBJECT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSFORMEROBJECT.MODIFY_TIME";
    public static final String transformerType_Attr = "transformerType";
    public static final String transformerType_Field = "TRANSFORMERTYPECODE";
    public static final String  transformerType_QFielld = "ENTRANSFORMEROBJECT.TRANSFORMERTYPECODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENTRANSFORMEROBJECT.ELEMENTCODE";


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

    public void setBuildYear(int aValue){
       buildYear = aValue;
    }

    public int getBuildYear(){
       return buildYear;
    }

    public void setVoltageHi(BigDecimal aValue){
       voltageHi = aValue;
    }

    public BigDecimal getVoltageHi(){
       return voltageHi;
    }

    public void setVoltageLow(BigDecimal aValue){
       voltageLow = aValue;
    }

    public BigDecimal getVoltageLow(){
       return voltageLow;
    }

    public void setNomPower(BigDecimal aValue){
       nomPower = aValue;
    }

    public BigDecimal getNomPower(){
       return nomPower;
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
    public void setTransformerType(ENTransformerType aValue){
       transformerType = aValue;
    }

    public ENTransformerType getTransformerType(){
       return transformerType;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }

} // end of ENTransformerObjectValueObject

