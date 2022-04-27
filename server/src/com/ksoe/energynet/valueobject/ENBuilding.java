
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilding;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENBuildingStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENInvestProgramGroupsRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENBuilding implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numbergen; 
    public Date dateGen;
    public Date dateEdit;
    public BigDecimal  summaGen; 
    public BigDecimal  summaNDS; 
    public String  characteristic; 
    public String  executedPosition; 
    public String  executedName; 
    public String  acceptedPosition; 
    public String  acceptedName; 
    public BigDecimal  contractPrice; 
    public String  codeMol; 
    public String  codePodr; 
    public String  invNumberOZ; 
    public String  nameOZ; 
    public String  finContractNumber; 
    public Date finContractDate;
    public String  partnerName; 
    public String  partnerCode; 
    public int  isInvestProgram = Integer.MIN_VALUE;
    public String  yearInvestProgram; 
    public String  itemInvestProgram; 
    public String  buildingAddress; 
    public String  decreeNumber; 
    public Date decreeDate;
    public int  exploitationTerm = Integer.MIN_VALUE;
    public Date dateLoadExpl;
    public Date dateBuild;
    public String  userGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;

    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENBuildingStatusRef statusRef = new ENBuildingStatusRef();
    public ENInvestProgramGroupsRef invgroupRef = new ENInvestProgramGroupsRef();
    public ENElementRef elementRef = new ENElementRef();
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();

    public static final String tableName = "ENBUILDING";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDING.CODE";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENBUILDING.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENBUILDING.DATEGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENBUILDING.DATEEDIT";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENBUILDING.SUMMAGEN";
    public static final String summaNDS_Attr = "summaNDS";
    public static final String summaNDS_Field = "SUMMANDS";
    public static final String summaNDS_QFielld = "ENBUILDING.SUMMANDS";
    public static final String characteristic_Attr = "characteristic";
    public static final String characteristic_Field = "CHARACTERISTIC";
    public static final String characteristic_QFielld = "ENBUILDING.CHARACTERISTIC";
    public static final String executedPosition_Attr = "executedPosition";
    public static final String executedPosition_Field = "EXECUTEDPOSITION";
    public static final String executedPosition_QFielld = "ENBUILDING.EXECUTEDPOSITION";
    public static final String executedName_Attr = "executedName";
    public static final String executedName_Field = "EXECUTEDNAME";
    public static final String executedName_QFielld = "ENBUILDING.EXECUTEDNAME";
    public static final String acceptedPosition_Attr = "acceptedPosition";
    public static final String acceptedPosition_Field = "ACCEPTEDPOSITION";
    public static final String acceptedPosition_QFielld = "ENBUILDING.ACCEPTEDPOSITION";
    public static final String acceptedName_Attr = "acceptedName";
    public static final String acceptedName_Field = "ACCEPTEDNAME";
    public static final String acceptedName_QFielld = "ENBUILDING.ACCEPTEDNAME";
    public static final String contractPrice_Attr = "contractPrice";
    public static final String contractPrice_Field = "CONTRACTPRICE";
    public static final String contractPrice_QFielld = "ENBUILDING.CONTRACTPRICE";
    public static final String codeMol_Attr = "codeMol";
    public static final String codeMol_Field = "CODEMOL";
    public static final String codeMol_QFielld = "ENBUILDING.CODEMOL";
    public static final String codePodr_Attr = "codePodr";
    public static final String codePodr_Field = "CODEPODR";
    public static final String codePodr_QFielld = "ENBUILDING.CODEPODR";
    public static final String invNumberOZ_Attr = "invNumberOZ";
    public static final String invNumberOZ_Field = "INVNUMBEROZ";
    public static final String invNumberOZ_QFielld = "ENBUILDING.INVNUMBEROZ";
    public static final String nameOZ_Attr = "nameOZ";
    public static final String nameOZ_Field = "NAMEOZ";
    public static final String nameOZ_QFielld = "ENBUILDING.NAMEOZ";
    public static final String finContractNumber_Attr = "finContractNumber";
    public static final String finContractNumber_Field = "FINCONTRACTNUMBER";
    public static final String finContractNumber_QFielld = "ENBUILDING.FINCONTRACTNUMBER";
    public static final String finContractDate_Attr = "finContractDate";
    public static final String finContractDate_Field = "FINCONTRACTDATE";
    public static final String finContractDate_QFielld = "ENBUILDING.FINCONTRACTDATE";
    public static final String partnerName_Attr = "partnerName";
    public static final String partnerName_Field = "PARTNERNAME";
    public static final String partnerName_QFielld = "ENBUILDING.PARTNERNAME";
    public static final String partnerCode_Attr = "partnerCode";
    public static final String partnerCode_Field = "PARTNERCODE";
    public static final String partnerCode_QFielld = "ENBUILDING.PARTNERCODE";
    public static final String isInvestProgram_Attr = "isInvestProgram";
    public static final String isInvestProgram_Field = "ISINVESTPROGRAM";
    public static final String isInvestProgram_QFielld = "ENBUILDING.ISINVESTPROGRAM";
    public static final String yearInvestProgram_Attr = "yearInvestProgram";
    public static final String yearInvestProgram_Field = "YEARINVESTPROGRAM";
    public static final String yearInvestProgram_QFielld = "ENBUILDING.YEARINVESTPROGRAM";
    public static final String itemInvestProgram_Attr = "itemInvestProgram";
    public static final String itemInvestProgram_Field = "ITEMINVESTPROGRAM";
    public static final String itemInvestProgram_QFielld = "ENBUILDING.ITEMINVESTPROGRAM";
    public static final String buildingAddress_Attr = "buildingAddress";
    public static final String buildingAddress_Field = "BUILDINGADDRESS";
    public static final String buildingAddress_QFielld = "ENBUILDING.BUILDINGADDRESS";
    public static final String decreeNumber_Attr = "decreeNumber";
    public static final String decreeNumber_Field = "DECREENUMBER";
    public static final String decreeNumber_QFielld = "ENBUILDING.DECREENUMBER";
    public static final String decreeDate_Attr = "decreeDate";
    public static final String decreeDate_Field = "DECREEDATE";
    public static final String decreeDate_QFielld = "ENBUILDING.DECREEDATE";
    public static final String exploitationTerm_Attr = "exploitationTerm";
    public static final String exploitationTerm_Field = "EXPLOITATIONTERM";
    public static final String exploitationTerm_QFielld = "ENBUILDING.EXPLOITATIONTERM";
    public static final String dateLoadExpl_Attr = "dateLoadExpl";
    public static final String dateLoadExpl_Field = "DATELOADEXPL";
    public static final String dateLoadExpl_QFielld = "ENBUILDING.DATELOADEXPL";
    public static final String dateBuild_Attr = "dateBuild";
    public static final String dateBuild_Field = "DATEBUILD";
    public static final String dateBuild_QFielld = "ENBUILDING.DATEBUILD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENBUILDING.USERGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENBUILDING.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBUILDING.MODIFY_TIME";

    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENBUILDING.DEPARTMENTREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENBUILDING.STATUSREFCODE";
    public static final String invgroupRef_Attr = "invgroupRef";
    public static final String invgroupRef_Field = "INVGROUPREFCODE";
    public static final String  invgroupRef_QFielld = "ENBUILDING.INVGROUPREFCODE";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENBUILDING.ELEMENTREFCODE";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENBUILDING.SERVICESOBJECTCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumbergen(){
       return numbergen;
    }
    
    public void setNumbergen(String numbergen){
       this.numbergen = numbergen;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public BigDecimal getSummaGen(){
       return summaGen;
    }
    
    public void setSummaGen(BigDecimal summaGen){
       this.summaGen = summaGen;
    }


    public BigDecimal getSummaNDS(){
       return summaNDS;
    }
    
    public void setSummaNDS(BigDecimal summaNDS){
       this.summaNDS = summaNDS;
    }


    public String getCharacteristic(){
       return characteristic;
    }
    
    public void setCharacteristic(String characteristic){
       this.characteristic = characteristic;
    }


    public String getExecutedPosition(){
       return executedPosition;
    }
    
    public void setExecutedPosition(String executedPosition){
       this.executedPosition = executedPosition;
    }


    public String getExecutedName(){
       return executedName;
    }
    
    public void setExecutedName(String executedName){
       this.executedName = executedName;
    }


    public String getAcceptedPosition(){
       return acceptedPosition;
    }
    
    public void setAcceptedPosition(String acceptedPosition){
       this.acceptedPosition = acceptedPosition;
    }


    public String getAcceptedName(){
       return acceptedName;
    }
    
    public void setAcceptedName(String acceptedName){
       this.acceptedName = acceptedName;
    }


    public BigDecimal getContractPrice(){
       return contractPrice;
    }
    
    public void setContractPrice(BigDecimal contractPrice){
       this.contractPrice = contractPrice;
    }


    public String getCodeMol(){
       return codeMol;
    }
    
    public void setCodeMol(String codeMol){
       this.codeMol = codeMol;
    }


    public String getCodePodr(){
       return codePodr;
    }
    
    public void setCodePodr(String codePodr){
       this.codePodr = codePodr;
    }


    public String getInvNumberOZ(){
       return invNumberOZ;
    }
    
    public void setInvNumberOZ(String invNumberOZ){
       this.invNumberOZ = invNumberOZ;
    }


    public String getNameOZ(){
       return nameOZ;
    }
    
    public void setNameOZ(String nameOZ){
       this.nameOZ = nameOZ;
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


    public int getIsInvestProgram(){
       return isInvestProgram;
    }
    
    public void setIsInvestProgram(int isInvestProgram){
       this.isInvestProgram = isInvestProgram;
    }


    public String getYearInvestProgram(){
       return yearInvestProgram;
    }
    
    public void setYearInvestProgram(String yearInvestProgram){
       this.yearInvestProgram = yearInvestProgram;
    }


    public String getItemInvestProgram(){
       return itemInvestProgram;
    }
    
    public void setItemInvestProgram(String itemInvestProgram){
       this.itemInvestProgram = itemInvestProgram;
    }


    public String getBuildingAddress(){
       return buildingAddress;
    }
    
    public void setBuildingAddress(String buildingAddress){
       this.buildingAddress = buildingAddress;
    }


    public String getDecreeNumber(){
       return decreeNumber;
    }
    
    public void setDecreeNumber(String decreeNumber){
       this.decreeNumber = decreeNumber;
    }


    public Date getDecreeDate(){
       return decreeDate;
    }

    public void setDecreeDate(Date decreeDate){
       this.decreeDate = decreeDate;
    }


    public int getExploitationTerm(){
       return exploitationTerm;
    }
    
    public void setExploitationTerm(int exploitationTerm){
       this.exploitationTerm = exploitationTerm;
    }


    public Date getDateLoadExpl(){
       return dateLoadExpl;
    }

    public void setDateLoadExpl(Date dateLoadExpl){
       this.dateLoadExpl = dateLoadExpl;
    }


    public Date getDateBuild(){
       return dateBuild;
    }

    public void setDateBuild(Date dateBuild){
       this.dateBuild = dateBuild;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public String getDomain_info(){
       return domain_info;
    }
    
    public void setDomain_info(String domain_info){
       this.domain_info = domain_info;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    
    public void setDepartmentRef(ENDepartmentRef departmentRef){
       this.departmentRef = departmentRef;
    }
    public ENBuildingStatusRef getStatusRef(){
       return statusRef;
    }
    
    public void setStatusRef(ENBuildingStatusRef statusRef){
       this.statusRef = statusRef;
    }
    public ENInvestProgramGroupsRef getInvgroupRef(){
       return invgroupRef;
    }
    
    public void setInvgroupRef(ENInvestProgramGroupsRef invgroupRef){
       this.invgroupRef = invgroupRef;
    }
    public ENElementRef getElementRef(){
       return elementRef;
    }
    
    public void setElementRef(ENElementRef elementRef){
       this.elementRef = elementRef;
    }
    public ENServicesObjectRef getServicesobject(){
       return servicesobject;
    }
    
    public void setServicesobject(ENServicesObjectRef servicesobject){
       this.servicesobject = servicesobject;
    }

} // end of ENBuildingValueObject

