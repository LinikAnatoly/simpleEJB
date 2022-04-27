
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNRole2DomainInfoCNRole2DomainInfo;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;

public class CNRole2DomainInfo implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  domainCode = Integer.MIN_VALUE; 
    public int  cnRoleCode = Integer.MIN_VALUE; 
    public int  cnStartStateCode = Integer.MIN_VALUE; 
    public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();
    public static final String tableName = "CNROLE2DOMAININFO";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNROLE2DOMAININFO.CODE";
    public static final String domainCode_Attr = "domainCode";
    public static final String domainCode_Field = "DOMAINCODE";
    public static final String domainCode_QFielld = "CNROLE2DOMAININFO.DOMAINCODE";
    public static final String cnRoleCode_Attr = "cnRoleCode";
    public static final String cnRoleCode_Field = "CNROLECODE";
    public static final String cnRoleCode_QFielld = "CNROLE2DOMAININFO.CNROLECODE";
    public static final String cnStartStateCode_Attr = "cnStartStateCode";
    public static final String cnStartStateCode_Field = "CNSTARTSTATECODE";
    public static final String cnStartStateCode_QFielld = "CNROLE2DOMAININFO.CNSTARTSTATECODE";
    public static final String subsystemRef_Attr = "subsystemRef";
    public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
    public static final String  subsystemRef_QFielld = "CNROLE2DOMAININFO.SUBSYSTEMREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDomainCode(int aValue){
       domainCode = aValue;
    }

    public int getDomainCode(){
       return domainCode;
    }

    public void setCnRoleCode(int aValue){
       cnRoleCode = aValue;
    }

    public int getCnRoleCode(){
       return cnRoleCode;
    }

    public void setCnStartStateCode(int aValue){
       cnStartStateCode = aValue;
    }

    public int getCnStartStateCode(){
       return cnStartStateCode;
    }

;
    public void setSubsystemRef(CNSubsystemTypeRef aValue){
       subsystemRef = aValue;
    }

    public CNSubsystemTypeRef getSubsystemRef(){
       return subsystemRef;
    }

} // end of CNRole2DomainInfoValueObject

