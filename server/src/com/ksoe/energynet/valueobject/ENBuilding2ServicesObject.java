
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilding2ServicesObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENBuildingRef;

public class ENBuilding2ServicesObject implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  contractNumber; 
    public Date contractDate;
    public String  partnerName; 
    public String  partnerCode; 

    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENBuildingRef ENBuildingRef = new ENBuildingRef();

    public static final String tableName = "ENBUILDING2SERVICSBJCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDING2SERVICSBJCT.CODE";
    public static final String contractNumber_Attr = "contractNumber";
    public static final String contractNumber_Field = "CONTRACTNUMBER";
    public static final String contractNumber_QFielld = "ENBUILDING2SERVICSBJCT.CONTRACTNUMBER";
    public static final String contractDate_Attr = "contractDate";
    public static final String contractDate_Field = "CONTRACTDATE";
    public static final String contractDate_QFielld = "ENBUILDING2SERVICSBJCT.CONTRACTDATE";
    public static final String partnerName_Attr = "partnerName";
    public static final String partnerName_Field = "PARTNERNAME";
    public static final String partnerName_QFielld = "ENBUILDING2SERVICSBJCT.PARTNERNAME";
    public static final String partnerCode_Attr = "partnerCode";
    public static final String partnerCode_Field = "PARTNERCODE";
    public static final String partnerCode_QFielld = "ENBUILDING2SERVICSBJCT.PARTNERCODE";

    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENBUILDING2SERVICSBJCT.SERVICESOBJECTREFCODE";
    public static final String ENBuildingRef_Attr = "ENBuildingRef";
    public static final String ENBuildingRef_Field = "ENBUILDINGREFCODE";
    public static final String  ENBuildingRef_QFielld = "ENBUILDING2SERVICSBJCT.ENBUILDINGREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getContractNumber(){
       return contractNumber;
    }
    
    public void setContractNumber(String contractNumber){
       this.contractNumber = contractNumber;
    }


    public Date getContractDate(){
       return contractDate;
    }

    public void setContractDate(Date contractDate){
       this.contractDate = contractDate;
    }


    public String getPartnerName(){
       return partnerName;
    }
    
    public void setPartnerName(String partnerName){
       this.partnerName = partnerName;
    }


    public String getPartnerCode(){
       return partnerCode;
    }
    
    public void setPartnerCode(String partnerCode){
       this.partnerCode = partnerCode;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    
    public void setServicesObjectRef(ENServicesObjectRef servicesObjectRef){
       this.servicesObjectRef = servicesObjectRef;
    }
    public ENBuildingRef getENBuildingRef(){
       return ENBuildingRef;
    }
    
    public void setENBuildingRef(ENBuildingRef ENBuildingRef){
       this.ENBuildingRef = ENBuildingRef;
    }

} // end of ENBuilding2ServicesObjectValueObject

