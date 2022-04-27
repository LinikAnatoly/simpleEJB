
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilding2ENact;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.ENBuildingRef;
    import  com.ksoe.energynet.valueobject.references.ENBuilding2ActTypeWorkRef;

public class ENBuilding2ENact implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  sumGen; 
    public BigDecimal  sumNds; 
    public int  isCalculationDate = Integer.MIN_VALUE;
    public String  finContractNumber; 
    public Date finContractDate;
    public String  partnerName; 
    public String  partnerCode; 
    public Boolean  isActFromEnergyNET = null;
    public String  actNumber; 
    public Date actDate;

    public ENActRef actRef = new ENActRef();
    public ENBuildingRef ENBuildingRef = new ENBuildingRef();
    public ENBuilding2ActTypeWorkRef ENBuilding2ActTypeWorkRef = new ENBuilding2ActTypeWorkRef();

    public static final String tableName = "ENBUILDING2ENACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDING2ENACT.CODE";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENBUILDING2ENACT.SUMGEN";
    public static final String sumNds_Attr = "sumNds";
    public static final String sumNds_Field = "SUMNDS";
    public static final String sumNds_QFielld = "ENBUILDING2ENACT.SUMNDS";
    public static final String isCalculationDate_Attr = "isCalculationDate";
    public static final String isCalculationDate_Field = "ISCALCULATIONDATE";
    public static final String isCalculationDate_QFielld = "ENBUILDING2ENACT.ISCALCULATIONDATE";
    public static final String finContractNumber_Attr = "finContractNumber";
    public static final String finContractNumber_Field = "FINCONTRACTNUMBER";
    public static final String finContractNumber_QFielld = "ENBUILDING2ENACT.FINCONTRACTNUMBER";
    public static final String finContractDate_Attr = "finContractDate";
    public static final String finContractDate_Field = "FINCONTRACTDATE";
    public static final String finContractDate_QFielld = "ENBUILDING2ENACT.FINCONTRACTDATE";
    public static final String partnerName_Attr = "partnerName";
    public static final String partnerName_Field = "PARTNERNAME";
    public static final String partnerName_QFielld = "ENBUILDING2ENACT.PARTNERNAME";
    public static final String partnerCode_Attr = "partnerCode";
    public static final String partnerCode_Field = "PARTNERCODE";
    public static final String partnerCode_QFielld = "ENBUILDING2ENACT.PARTNERCODE";
    public static final String isActFromEnergyNET_Attr = "isActFromEnergyNET";
    public static final String isActFromEnergyNET_Field = "ISACTFROMENERGYNET";
    public static final String isActFromEnergyNET_QFielld = "ENBUILDING2ENACT.ISACTFROMENERGYNET";
    public static final String actNumber_Attr = "actNumber";
    public static final String actNumber_Field = "ACTNUMBER";
    public static final String actNumber_QFielld = "ENBUILDING2ENACT.ACTNUMBER";
    public static final String actDate_Attr = "actDate";
    public static final String actDate_Field = "ACTDATE";
    public static final String actDate_QFielld = "ENBUILDING2ENACT.ACTDATE";

    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENBUILDING2ENACT.ACTREFCODE";
    public static final String ENBuildingRef_Attr = "ENBuildingRef";
    public static final String ENBuildingRef_Field = "ENBUILDINGREFCODE";
    public static final String  ENBuildingRef_QFielld = "ENBUILDING2ENACT.ENBUILDINGREFCODE";
    public static final String ENBuilding2ActTypeWorkRef_Attr = "ENBuilding2ActTypeWorkRef";
    public static final String ENBuilding2ActTypeWorkRef_Field = "ENBUILDING2CTTPWRKRFCD";
    public static final String  ENBuilding2ActTypeWorkRef_QFielld = "ENBUILDING2ENACT.ENBUILDING2CTTPWRKRFCD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public BigDecimal getSumGen(){
       return sumGen;
    }
    
    public void setSumGen(BigDecimal sumGen){
       this.sumGen = sumGen;
    }


    public BigDecimal getSumNds(){
       return sumNds;
    }
    
    public void setSumNds(BigDecimal sumNds){
       this.sumNds = sumNds;
    }


    public int getIsCalculationDate(){
       return isCalculationDate;
    }
    
    public void setIsCalculationDate(int isCalculationDate){
       this.isCalculationDate = isCalculationDate;
    }


    public String getFinContractNumber(){
       return finContractNumber;
    }
    
    public void setFinContractNumber(String finContractNumber){
       this.finContractNumber = finContractNumber;
    }


    public Date getFinContractDate(){
       return finContractDate;
    }

    public void setFinContractDate(Date finContractDate){
       this.finContractDate = finContractDate;
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


    public Boolean getIsActFromEnergyNET(){
       return isActFromEnergyNET;
    }

    public void setIsActFromEnergyNET(Boolean isActFromEnergyNET){
       this.isActFromEnergyNET = isActFromEnergyNET;
    }


    public String getActNumber(){
       return actNumber;
    }
    
    public void setActNumber(String actNumber){
       this.actNumber = actNumber;
    }


    public Date getActDate(){
       return actDate;
    }

    public void setActDate(Date actDate){
       this.actDate = actDate;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    
    public void setActRef(ENActRef actRef){
       this.actRef = actRef;
    }
    public ENBuildingRef getENBuildingRef(){
       return ENBuildingRef;
    }
    
    public void setENBuildingRef(ENBuildingRef ENBuildingRef){
       this.ENBuildingRef = ENBuildingRef;
    }
    public ENBuilding2ActTypeWorkRef getENBuilding2ActTypeWorkRef(){
       return ENBuilding2ActTypeWorkRef;
    }
    
    public void setENBuilding2ActTypeWorkRef(ENBuilding2ActTypeWorkRef ENBuilding2ActTypeWorkRef){
       this.ENBuilding2ActTypeWorkRef = ENBuilding2ActTypeWorkRef;
    }

} // end of ENBuilding2ENactValueObject

