
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENReconstrModernOZ;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENReconstrModernOZStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENRecoModTypeWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENInvestProgramGroupsRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENReconstrModernOZ implements Serializable {

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
    public String  characteristicOS; 
    public int  isInvestProgram = Integer.MIN_VALUE;
    public String  yearInvestProgram; 
    public String  itemInvestProgram; 
    public int  typeRM = Integer.MIN_VALUE;
    public String  userGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public int  termUseful = Integer.MIN_VALUE;
    public int  use_limit_before = Integer.MIN_VALUE;
    public int  use_limit_n_before = Integer.MIN_VALUE;
    public Date dateExploitationIn;
    public Date dateExploitationOut;

    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENReconstrModernOZStatusRef statusRef = new ENReconstrModernOZStatusRef();
    public ENRecoModTypeWorkRef typeRef = new ENRecoModTypeWorkRef();
    public ENInvestProgramGroupsRef invgroupRef = new ENInvestProgramGroupsRef();
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();

    public static final String tableName = "ENRECONSTRMODERNOZ";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRECONSTRMODERNOZ.CODE";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENRECONSTRMODERNOZ.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENRECONSTRMODERNOZ.DATEGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENRECONSTRMODERNOZ.DATEEDIT";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENRECONSTRMODERNOZ.SUMMAGEN";
    public static final String summaNDS_Attr = "summaNDS";
    public static final String summaNDS_Field = "SUMMANDS";
    public static final String summaNDS_QFielld = "ENRECONSTRMODERNOZ.SUMMANDS";
    public static final String characteristic_Attr = "characteristic";
    public static final String characteristic_Field = "CHARACTERISTIC";
    public static final String characteristic_QFielld = "ENRECONSTRMODERNOZ.CHARACTERISTIC";
    public static final String executedPosition_Attr = "executedPosition";
    public static final String executedPosition_Field = "EXECUTEDPOSITION";
    public static final String executedPosition_QFielld = "ENRECONSTRMODERNOZ.EXECUTEDPOSITION";
    public static final String executedName_Attr = "executedName";
    public static final String executedName_Field = "EXECUTEDNAME";
    public static final String executedName_QFielld = "ENRECONSTRMODERNOZ.EXECUTEDNAME";
    public static final String acceptedPosition_Attr = "acceptedPosition";
    public static final String acceptedPosition_Field = "ACCEPTEDPOSITION";
    public static final String acceptedPosition_QFielld = "ENRECONSTRMODERNOZ.ACCEPTEDPOSITION";
    public static final String acceptedName_Attr = "acceptedName";
    public static final String acceptedName_Field = "ACCEPTEDNAME";
    public static final String acceptedName_QFielld = "ENRECONSTRMODERNOZ.ACCEPTEDNAME";
    public static final String contractPrice_Attr = "contractPrice";
    public static final String contractPrice_Field = "CONTRACTPRICE";
    public static final String contractPrice_QFielld = "ENRECONSTRMODERNOZ.CONTRACTPRICE";
    public static final String codeMol_Attr = "codeMol";
    public static final String codeMol_Field = "CODEMOL";
    public static final String codeMol_QFielld = "ENRECONSTRMODERNOZ.CODEMOL";
    public static final String codePodr_Attr = "codePodr";
    public static final String codePodr_Field = "CODEPODR";
    public static final String codePodr_QFielld = "ENRECONSTRMODERNOZ.CODEPODR";
    public static final String invNumberOZ_Attr = "invNumberOZ";
    public static final String invNumberOZ_Field = "INVNUMBEROZ";
    public static final String invNumberOZ_QFielld = "ENRECONSTRMODERNOZ.INVNUMBEROZ";
    public static final String nameOZ_Attr = "nameOZ";
    public static final String nameOZ_Field = "NAMEOZ";
    public static final String nameOZ_QFielld = "ENRECONSTRMODERNOZ.NAMEOZ";
    public static final String finContractNumber_Attr = "finContractNumber";
    public static final String finContractNumber_Field = "FINCONTRACTNUMBER";
    public static final String finContractNumber_QFielld = "ENRECONSTRMODERNOZ.FINCONTRACTNUMBER";
    public static final String finContractDate_Attr = "finContractDate";
    public static final String finContractDate_Field = "FINCONTRACTDATE";
    public static final String finContractDate_QFielld = "ENRECONSTRMODERNOZ.FINCONTRACTDATE";
    public static final String partnerName_Attr = "partnerName";
    public static final String partnerName_Field = "PARTNERNAME";
    public static final String partnerName_QFielld = "ENRECONSTRMODERNOZ.PARTNERNAME";
    public static final String partnerCode_Attr = "partnerCode";
    public static final String partnerCode_Field = "PARTNERCODE";
    public static final String partnerCode_QFielld = "ENRECONSTRMODERNOZ.PARTNERCODE";
    public static final String characteristicOS_Attr = "characteristicOS";
    public static final String characteristicOS_Field = "CHARACTERISTICOS";
    public static final String characteristicOS_QFielld = "ENRECONSTRMODERNOZ.CHARACTERISTICOS";
    public static final String isInvestProgram_Attr = "isInvestProgram";
    public static final String isInvestProgram_Field = "ISINVESTPROGRAM";
    public static final String isInvestProgram_QFielld = "ENRECONSTRMODERNOZ.ISINVESTPROGRAM";
    public static final String yearInvestProgram_Attr = "yearInvestProgram";
    public static final String yearInvestProgram_Field = "YEARINVESTPROGRAM";
    public static final String yearInvestProgram_QFielld = "ENRECONSTRMODERNOZ.YEARINVESTPROGRAM";
    public static final String itemInvestProgram_Attr = "itemInvestProgram";
    public static final String itemInvestProgram_Field = "ITEMINVESTPROGRAM";
    public static final String itemInvestProgram_QFielld = "ENRECONSTRMODERNOZ.ITEMINVESTPROGRAM";
    public static final String typeRM_Attr = "typeRM";
    public static final String typeRM_Field = "TYPERM";
    public static final String typeRM_QFielld = "ENRECONSTRMODERNOZ.TYPERM";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENRECONSTRMODERNOZ.USERGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENRECONSTRMODERNOZ.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENRECONSTRMODERNOZ.MODIFY_TIME";
    public static final String termUseful_Attr = "termUseful";
    public static final String termUseful_Field = "TERMUSEFUL";
    public static final String termUseful_QFielld = "ENRECONSTRMODERNOZ.TERMUSEFUL";
    public static final String use_limit_before_Attr = "use_limit_before";
    public static final String use_limit_before_Field = "USE_LIMIT_BEFORE";
    public static final String use_limit_before_QFielld = "ENRECONSTRMODERNOZ.USE_LIMIT_BEFORE";
    public static final String use_limit_n_before_Attr = "use_limit_n_before";
    public static final String use_limit_n_before_Field = "USE_LIMIT_N_BEFORE";
    public static final String use_limit_n_before_QFielld = "ENRECONSTRMODERNOZ.USE_LIMIT_N_BEFORE";
    public static final String dateExploitationIn_Attr = "dateExploitationIn";
    public static final String dateExploitationIn_Field = "DATEEXPLOITATIONIN";
    public static final String dateExploitationIn_QFielld = "ENRECONSTRMODERNOZ.DATEEXPLOITATIONIN";
    public static final String dateExploitationOut_Attr = "dateExploitationOut";
    public static final String dateExploitationOut_Field = "DATEEXPLOITATIONOUT";
    public static final String dateExploitationOut_QFielld = "ENRECONSTRMODERNOZ.DATEEXPLOITATIONOUT";

    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENRECONSTRMODERNOZ.DEPARTMENTREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENRECONSTRMODERNOZ.STATUSREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENRECONSTRMODERNOZ.TYPEREFCODE";
    public static final String invgroupRef_Attr = "invgroupRef";
    public static final String invgroupRef_Field = "INVGROUPREFCODE";
    public static final String  invgroupRef_QFielld = "ENRECONSTRMODERNOZ.INVGROUPREFCODE";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENRECONSTRMODERNOZ.SERVICESOBJECTCODE";



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


    public String getCharacteristicOS(){
       return characteristicOS;
    }
    
    public void setCharacteristicOS(String characteristicOS){
       this.characteristicOS = characteristicOS;
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


    public int getTypeRM(){
       return typeRM;
    }
    
    public void setTypeRM(int typeRM){
       this.typeRM = typeRM;
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


    public int getTermUseful(){
       return termUseful;
    }
    
    public void setTermUseful(int termUseful){
       this.termUseful = termUseful;
    }


    public int getUse_limit_before(){
       return use_limit_before;
    }
    
    public void setUse_limit_before(int use_limit_before){
       this.use_limit_before = use_limit_before;
    }


    public int getUse_limit_n_before(){
       return use_limit_n_before;
    }
    
    public void setUse_limit_n_before(int use_limit_n_before){
       this.use_limit_n_before = use_limit_n_before;
    }


    public Date getDateExploitationIn(){
       return dateExploitationIn;
    }

    public void setDateExploitationIn(Date dateExploitationIn){
       this.dateExploitationIn = dateExploitationIn;
    }


    public Date getDateExploitationOut(){
       return dateExploitationOut;
    }

    public void setDateExploitationOut(Date dateExploitationOut){
       this.dateExploitationOut = dateExploitationOut;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    
    public void setDepartmentRef(ENDepartmentRef departmentRef){
       this.departmentRef = departmentRef;
    }
    public ENReconstrModernOZStatusRef getStatusRef(){
       return statusRef;
    }
    
    public void setStatusRef(ENReconstrModernOZStatusRef statusRef){
       this.statusRef = statusRef;
    }
    public ENRecoModTypeWorkRef getTypeRef(){
       return typeRef;
    }
    
    public void setTypeRef(ENRecoModTypeWorkRef typeRef){
       this.typeRef = typeRef;
    }
    public ENInvestProgramGroupsRef getInvgroupRef(){
       return invgroupRef;
    }
    
    public void setInvgroupRef(ENInvestProgramGroupsRef invgroupRef){
       this.invgroupRef = invgroupRef;
    }
    public ENServicesObjectRef getServicesobject(){
       return servicesobject;
    }
    
    public void setServicesobject(ENServicesObjectRef servicesobject){
       this.servicesobject = servicesobject;
    }

} // end of ENReconstrModernOZValueObject

