
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCheckpoint;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTransportDepartmentRef;

public class ENCheckpoint implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public ENTransportDepartmentRef transportDepartmentRef = new ENTransportDepartmentRef();
    public static final String tableName = "ENCHECKPOINT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCHECKPOINT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCHECKPOINT.NAME";
    public static final String transportDepartmentRef_Attr = "transportDepartmentRef";
    public static final String transportDepartmentRef_Field = "TRANSPORTDEPARTMNTRFCD";
    public static final String  transportDepartmentRef_QFielld = "ENCHECKPOINT.TRANSPORTDEPARTMNTRFCD";


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

    public void setTransportDepartmentRef(ENTransportDepartmentRef aValue){
       transportDepartmentRef = aValue;
    }

    public ENTransportDepartmentRef getTransportDepartmentRef(){
       return transportDepartmentRef;
    }

} // end of ENCheckpointValueObject

