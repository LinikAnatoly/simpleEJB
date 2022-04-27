
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for AXOrgId2FKOrgId;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class AXOrgId2FKOrgId implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  axOrgId; 
    public String  axName; 
    public String  fkOrgId; 
    public String  fkName; 
    public static final String tableName = "AXORGID2FKORGID";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "AXORGID2FKORGID.CODE";
    public static final String axOrgId_Attr = "axOrgId";
    public static final String axOrgId_Field = "AXORGID";
    public static final String axOrgId_QFielld = "AXORGID2FKORGID.AXORGID";
    public static final String axName_Attr = "axName";
    public static final String axName_Field = "AXNAME";
    public static final String axName_QFielld = "AXORGID2FKORGID.AXNAME";
    public static final String fkOrgId_Attr = "fkOrgId";
    public static final String fkOrgId_Field = "FKORGID";
    public static final String fkOrgId_QFielld = "AXORGID2FKORGID.FKORGID";
    public static final String fkName_Attr = "fkName";
    public static final String fkName_Field = "FKNAME";
    public static final String fkName_QFielld = "AXORGID2FKORGID.FKNAME";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setAxOrgId(String aValue){
       axOrgId = aValue;
    }

    public String getAxOrgId(){
       return axOrgId;
    }


    public void setAxName(String aValue){
       axName = aValue;
    }

    public String getAxName(){
       return axName;
    }


    public void setFkOrgId(String aValue){
       fkOrgId = aValue;
    }

    public String getFkOrgId(){
       return fkOrgId;
    }


    public void setFkName(String aValue){
       fkName = aValue;
    }

    public String getFkName(){
       return fkName;
    }


} // end of AXOrgId2FKOrgIdValueObject

