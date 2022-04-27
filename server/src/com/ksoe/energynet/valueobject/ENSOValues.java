
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOValues;  	
  */
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENSOValuesTypeRef;

public class ENSOValues implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public Date dateVal ;
    public String  strVal; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();
    public ENSOValuesTypeRef soValuesType = new ENSOValuesTypeRef();
    public static final String tableName = "ENSOVALUES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOVALUES.CODE";
    public static final String dateVal_Attr = "dateVal";
    public static final String dateVal_Field = "DATEVAL";
    public static final String dateVal_QFielld = "ENSOVALUES.DATEVAL";
    public static final String strVal_Attr = "strVal";
    public static final String strVal_Field = "STRVAL";
    public static final String strVal_QFielld = "ENSOVALUES.STRVAL";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSOVALUES.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSOVALUES.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSOVALUES.MODIFY_TIME";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENSOVALUES.SERVICESOBJECTCODE";
    public static final String soValuesType_Attr = "soValuesType";
    public static final String soValuesType_Field = "SOVALUESTYPECODE";
    public static final String  soValuesType_QFielld = "ENSOVALUES.SOVALUESTYPECODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateVal(Date aValue){
       dateVal = aValue;
    }

    public Date getDateVal(){
       return dateVal;
    }


    public void setStrVal(String aValue){
       strVal = aValue;
    }

    public String getStrVal(){
       return strVal;
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
    public void setSoValuesType(ENSOValuesTypeRef aValue){
       soValuesType = aValue;
    }

    public ENSOValuesTypeRef getSoValuesType(){
       return soValuesType;
    }

} // end of ENSOValuesValueObject

