
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDepartment2EPRen;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energypro.valueobject.references.EPRenRef;

public class ENDepartment2EPRen implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  billingServerIp; 
    public String  billingServerJnpPort; 
    public String  billingServerPort; 
    public int  finRenCode = Integer.MIN_VALUE;
    public String  finCFOCode; 
    public String  finServicesCode; 
    public int  domainCode = Integer.MIN_VALUE;
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public EPRenRef renRef = new EPRenRef();
    public static final String tableName = "ENDEPARTMENT2EPREN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDEPARTMENT2EPREN.CODE";
    public static final String billingServerIp_Attr = "billingServerIp";
    public static final String billingServerIp_Field = "BILLINGSERVERIP";
    public static final String billingServerIp_QFielld = "ENDEPARTMENT2EPREN.BILLINGSERVERIP";
    public static final String billingServerJnpPort_Attr = "billingServerJnpPort";
    public static final String billingServerJnpPort_Field = "BILLINGSERVERJNPPORT";
    public static final String billingServerJnpPort_QFielld = "ENDEPARTMENT2EPREN.BILLINGSERVERJNPPORT";
    public static final String billingServerPort_Attr = "billingServerPort";
    public static final String billingServerPort_Field = "BILLINGSERVERPORT";
    public static final String billingServerPort_QFielld = "ENDEPARTMENT2EPREN.BILLINGSERVERPORT";
    public static final String finRenCode_Attr = "finRenCode";
    public static final String finRenCode_Field = "FINRENCODE";
    public static final String finRenCode_QFielld = "ENDEPARTMENT2EPREN.FINRENCODE";
    public static final String finCFOCode_Attr = "finCFOCode";
    public static final String finCFOCode_Field = "FINCFOCODE";
    public static final String finCFOCode_QFielld = "ENDEPARTMENT2EPREN.FINCFOCODE";
    public static final String finServicesCode_Attr = "finServicesCode";
    public static final String finServicesCode_Field = "FINSERVICESCODE";
    public static final String finServicesCode_QFielld = "ENDEPARTMENT2EPREN.FINSERVICESCODE";
    public static final String domainCode_Attr = "domainCode";
    public static final String domainCode_Field = "DOMAINCODE";
    public static final String domainCode_QFielld = "ENDEPARTMENT2EPREN.DOMAINCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENDEPARTMENT2EPREN.DEPARTMENTREFCODE";
    public static final String renRef_Attr = "renRef";
    public static final String renRef_Field = "RENREFCODE";
    public static final String  renRef_QFielld = "ENDEPARTMENT2EPREN.RENREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setBillingServerIp(String aValue){
       billingServerIp = aValue;
    }

    public String getBillingServerIp(){
       return billingServerIp;
    }


    public void setBillingServerJnpPort(String aValue){
       billingServerJnpPort = aValue;
    }

    public String getBillingServerJnpPort(){
       return billingServerJnpPort;
    }


    public void setBillingServerPort(String aValue){
       billingServerPort = aValue;
    }

    public String getBillingServerPort(){
       return billingServerPort;
    }


    public void setFinRenCode(int aValue){
       finRenCode = aValue;
    }

    public int getFinRenCode(){
       return finRenCode;
    }


    public void setFinCFOCode(String aValue){
       finCFOCode = aValue;
    }

    public String getFinCFOCode(){
       return finCFOCode;
    }


    public void setFinServicesCode(String aValue){
       finServicesCode = aValue;
    }

    public String getFinServicesCode(){
       return finServicesCode;
    }


    public void setDomainCode(int aValue){
       domainCode = aValue;
    }

    public int getDomainCode(){
       return domainCode;
    }

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setRenRef(EPRenRef aValue){
       renRef = aValue;
    }

    public EPRenRef getRenRef(){
       return renRef;
    }

} // end of ENDepartment2EPRenValueObject

