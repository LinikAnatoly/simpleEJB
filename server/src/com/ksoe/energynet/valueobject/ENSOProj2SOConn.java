
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOProj2SOConn;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSOProj2SOConn implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENServicesObjectRef SOProjRef = new ENServicesObjectRef();
    public ENServicesObjectRef SOConnRef = new ENServicesObjectRef();
    public static final String tableName = "ENSOPROJ2SOCONN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOPROJ2SOCONN.CODE";
    public static final String SOProjRef_Attr = "SOProjRef";
    public static final String SOProjRef_Field = "SOPROJREFCODE";
    public static final String  SOProjRef_QFielld = "ENSOPROJ2SOCONN.SOPROJREFCODE";
    public static final String SOConnRef_Attr = "SOConnRef";
    public static final String SOConnRef_Field = "SOCONNREFCODE";
    public static final String  SOConnRef_QFielld = "ENSOPROJ2SOCONN.SOCONNREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setSOProjRef(ENServicesObjectRef aValue){
       SOProjRef = aValue;
    }

    public ENServicesObjectRef getSOProjRef(){
       return SOProjRef;
    }
    public void setSOConnRef(ENServicesObjectRef aValue){
       SOConnRef = aValue;
    }

    public ENServicesObjectRef getSOConnRef(){
       return SOConnRef;
    }

} // end of ENSOProj2SOConnValueObject

