
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportTemperature;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTransportDepartmentRef;

public class ENTransportTemperature implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public Date dateGen ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENTransportDepartmentRef transportDepartmentRef = new ENTransportDepartmentRef();
    public static final String tableName = "ENTRANSPORTTEMPERATURE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTTEMPERATURE.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENTRANSPORTTEMPERATURE.COUNTGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENTRANSPORTTEMPERATURE.DATEGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRANSPORTTEMPERATURE.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRANSPORTTEMPERATURE.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPORTTEMPERATURE.MODIFY_TIME";
    public static final String transportDepartmentRef_Attr = "transportDepartmentRef";
    public static final String transportDepartmentRef_Field = "TRANSPORTDEPARTMNTRFCD";
    public static final String  transportDepartmentRef_QFielld = "ENTRANSPORTTEMPERATURE.TRANSPORTDEPARTMNTRFCD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
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

    public void setTransportDepartmentRef(ENTransportDepartmentRef aValue){
       transportDepartmentRef = aValue;
    }

    public ENTransportDepartmentRef getTransportDepartmentRef(){
       return transportDepartmentRef;
    }

} // end of ENTransportTemperatureValueObject

