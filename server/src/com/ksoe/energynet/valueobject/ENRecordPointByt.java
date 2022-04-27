
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRecordPointByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENElement;
import  com.ksoe.energynet.valueobject.references.ENSiteRef;

public class ENRecordPointByt implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  accountNumber; 
    public Date contractDate;
    public String  name; 
    public String  address; 
    public String  commentGen; 
    public int  rpCode = Integer.MIN_VALUE;
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public String  invNumber; 
    public String  serialNumber; 
    public Date dateCounterInst;
    public Date dateCounterCheck;
    public String  counterType; 
    public BigDecimal  classAccuracy; 
    public BigDecimal  checkperiod; 
    public int  statuscode = Integer.MIN_VALUE;
    public BigDecimal  phasity; 
    public Date datecheck;
    public BigDecimal  checkperiod1; 
    public String  phone; 
    public String  seal; 
    public String  placecounter; 
    public int  isworking = Integer.MIN_VALUE;
    public int  counterCapacity = Integer.MIN_VALUE;
    public BigDecimal  counterVoltageNominal; 
    public Date counterDateProduct;
    public int  areaType = Integer.MIN_VALUE;
    public int  fiderCode = Integer.MIN_VALUE;
    public String  fiderName; 
    public int  disablePlan = Integer.MIN_VALUE;
    public String  codeEIC; 
    public String  tower; 
    public String  feeder04; 
    public Date dateFirstConsumption;

    public ENElement element = new ENElement();
    public ENSiteRef siteRef = new ENSiteRef();
    
    public Date prevCounterCheck;
    
    public int prevCheckPeriod = Integer.MIN_VALUE;
    
    public static final String tableName = "ENRECORDPOINTBYT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRECORDPOINTBYT.CODE";
    public static final String accountNumber_Attr = "accountNumber";
    public static final String accountNumber_Field = "ACCOUNTNUMBER";
    public static final String accountNumber_QFielld = "ENRECORDPOINTBYT.ACCOUNTNUMBER";
    public static final String contractDate_Attr = "contractDate";
    public static final String contractDate_Field = "CONTRACTDATE";
    public static final String contractDate_QFielld = "ENRECORDPOINTBYT.CONTRACTDATE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENRECORDPOINTBYT.NAME";
    public static final String address_Attr = "address";
    public static final String address_Field = "ADDRESS";
    public static final String address_QFielld = "ENRECORDPOINTBYT.ADDRESS";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENRECORDPOINTBYT.COMMENTGEN";
    public static final String rpCode_Attr = "rpCode";
    public static final String rpCode_Field = "RPCODE";
    public static final String rpCode_QFielld = "ENRECORDPOINTBYT.RPCODE";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENRECORDPOINTBYT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENRECORDPOINTBYT.MODIFY_TIME";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENRECORDPOINTBYT.INVNUMBER";
    public static final String serialNumber_Attr = "serialNumber";
    public static final String serialNumber_Field = "SERIALNUMBER";
    public static final String serialNumber_QFielld = "ENRECORDPOINTBYT.SERIALNUMBER";
    public static final String dateCounterInst_Attr = "dateCounterInst";
    public static final String dateCounterInst_Field = "DATECOUNTERINST";
    public static final String dateCounterInst_QFielld = "ENRECORDPOINTBYT.DATECOUNTERINST";
    public static final String dateCounterCheck_Attr = "dateCounterCheck";
    public static final String dateCounterCheck_Field = "DATECOUNTERCHECK";
    public static final String dateCounterCheck_QFielld = "ENRECORDPOINTBYT.DATECOUNTERCHECK";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "ENRECORDPOINTBYT.COUNTERTYPE";
    public static final String classAccuracy_Attr = "classAccuracy";
    public static final String classAccuracy_Field = "CLASSACCURACY";
    public static final String classAccuracy_QFielld = "ENRECORDPOINTBYT.CLASSACCURACY";
    public static final String checkperiod_Attr = "checkperiod";
    public static final String checkperiod_Field = "CHECKPERIOD";
    public static final String checkperiod_QFielld = "ENRECORDPOINTBYT.CHECKPERIOD";
    public static final String statuscode_Attr = "statuscode";
    public static final String statuscode_Field = "STATUSCODE";
    public static final String statuscode_QFielld = "ENRECORDPOINTBYT.STATUSCODE";
    public static final String phasity_Attr = "phasity";
    public static final String phasity_Field = "PHASITY";
    public static final String phasity_QFielld = "ENRECORDPOINTBYT.PHASITY";
    public static final String datecheck_Attr = "datecheck";
    public static final String datecheck_Field = "DATECHECK";
    public static final String datecheck_QFielld = "ENRECORDPOINTBYT.DATECHECK";
    public static final String checkperiod1_Attr = "checkperiod1";
    public static final String checkperiod1_Field = "CHECKPERIOD1";
    public static final String checkperiod1_QFielld = "ENRECORDPOINTBYT.CHECKPERIOD1";
    public static final String phone_Attr = "phone";
    public static final String phone_Field = "PHONE";
    public static final String phone_QFielld = "ENRECORDPOINTBYT.PHONE";
    public static final String seal_Attr = "seal";
    public static final String seal_Field = "SEAL";
    public static final String seal_QFielld = "ENRECORDPOINTBYT.SEAL";
    public static final String placecounter_Attr = "placecounter";
    public static final String placecounter_Field = "PLACECOUNTER";
    public static final String placecounter_QFielld = "ENRECORDPOINTBYT.PLACECOUNTER";
    public static final String isworking_Attr = "isworking";
    public static final String isworking_Field = "ISWORKING";
    public static final String isworking_QFielld = "ENRECORDPOINTBYT.ISWORKING";
    public static final String counterCapacity_Attr = "counterCapacity";
    public static final String counterCapacity_Field = "COUNTERCAPACITY";
    public static final String counterCapacity_QFielld = "ENRECORDPOINTBYT.COUNTERCAPACITY";
    public static final String counterVoltageNominal_Attr = "counterVoltageNominal";
    public static final String counterVoltageNominal_Field = "COUNTERVOLTAGENOMINAL";
    public static final String counterVoltageNominal_QFielld = "ENRECORDPOINTBYT.COUNTERVOLTAGENOMINAL";
    public static final String counterDateProduct_Attr = "counterDateProduct";
    public static final String counterDateProduct_Field = "COUNTERDATEPRODUCT";
    public static final String counterDateProduct_QFielld = "ENRECORDPOINTBYT.COUNTERDATEPRODUCT";
    public static final String areaType_Attr = "areaType";
    public static final String areaType_Field = "AREATYPE";
    public static final String areaType_QFielld = "ENRECORDPOINTBYT.AREATYPE";
    public static final String fiderCode_Attr = "fiderCode";
    public static final String fiderCode_Field = "FIDERCODE";
    public static final String fiderCode_QFielld = "ENRECORDPOINTBYT.FIDERCODE";
    public static final String fiderName_Attr = "fiderName";
    public static final String fiderName_Field = "FIDERNAME";
    public static final String fiderName_QFielld = "ENRECORDPOINTBYT.FIDERNAME";
    public static final String disablePlan_Attr = "disablePlan";
    public static final String disablePlan_Field = "DISABLEPLAN";
    public static final String disablePlan_QFielld = "ENRECORDPOINTBYT.DISABLEPLAN";
    public static final String codeEIC_Attr = "codeEIC";
    public static final String codeEIC_Field = "CODEEIC";
    public static final String codeEIC_QFielld = "ENRECORDPOINTBYT.CODEEIC";
    public static final String tower_Attr = "tower";
    public static final String tower_Field = "TOWER";
    public static final String tower_QFielld = "ENRECORDPOINTBYT.TOWER";
    public static final String feeder04_Attr = "feeder04";
    public static final String feeder04_Field = "FEEDER04";
    public static final String feeder04_QFielld = "ENRECORDPOINTBYT.FEEDER04";
    public static final String dateFirstConsumption_Attr = "dateFirstConsumption";
    public static final String dateFirstConsumption_Field = "DATEFIRSTCONSUMPTION";
    public static final String dateFirstConsumption_QFielld = "ENRECORDPOINTBYT.DATEFIRSTCONSUMPTION";

    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENRECORDPOINTBYT.ELEMENTCODE";
    public static final String siteRef_Attr = "siteRef";
    public static final String siteRef_Field = "SITEREFCODE";
    public static final String  siteRef_QFielld = "ENRECORDPOINTBYT.SITEREFCODE";
    public static final String prevCounterCheck_QFielld = "ENRECORDPOINTBYT.PREVCOUNTERCHECK";
    public static final String  prevCheckPeriod_QFielld = "ENRECORDPOINTBYT.PREVCHECKPERIOD";


    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getAccountNumber(){
       return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber){
       this.accountNumber = accountNumber;
    }


    public Date getContractDate(){
       return contractDate;
    }

    public void setContractDate(Date contractDate){
       this.contractDate = contractDate;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public String getAddress(){
       return address;
    }
    
    public void setAddress(String address){
       this.address = address;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }


    public int getRpCode(){
       return rpCode;
    }
    
    public void setRpCode(int rpCode){
       this.rpCode = rpCode;
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


    public String getInvNumber(){
       return invNumber;
    }
    
    public void setInvNumber(String invNumber){
       this.invNumber = invNumber;
    }


    public String getSerialNumber(){
       return serialNumber;
    }
    
    public void setSerialNumber(String serialNumber){
       this.serialNumber = serialNumber;
    }


    public Date getDateCounterInst(){
       return dateCounterInst;
    }

    public void setDateCounterInst(Date dateCounterInst){
       this.dateCounterInst = dateCounterInst;
    }


    public Date getDateCounterCheck(){
       return dateCounterCheck;
    }

    public void setDateCounterCheck(Date dateCounterCheck){
       this.dateCounterCheck = dateCounterCheck;
    }


    public String getCounterType(){
       return counterType;
    }
    
    public void setCounterType(String counterType){
       this.counterType = counterType;
    }


    public BigDecimal getClassAccuracy(){
       return classAccuracy;
    }
    
    public void setClassAccuracy(BigDecimal classAccuracy){
       this.classAccuracy = classAccuracy;
    }


    public BigDecimal getCheckperiod(){
       return checkperiod;
    }
    
    public void setCheckperiod(BigDecimal checkperiod){
       this.checkperiod = checkperiod;
    }


    public int getStatuscode(){
       return statuscode;
    }
    
    public void setStatuscode(int statuscode){
       this.statuscode = statuscode;
    }


    public BigDecimal getPhasity(){
       return phasity;
    }
    
    public void setPhasity(BigDecimal phasity){
       this.phasity = phasity;
    }


    public Date getDatecheck(){
       return datecheck;
    }

    public void setDatecheck(Date datecheck){
       this.datecheck = datecheck;
    }


    public BigDecimal getCheckperiod1(){
       return checkperiod1;
    }
    
    public void setCheckperiod1(BigDecimal checkperiod1){
       this.checkperiod1 = checkperiod1;
    }


    public String getPhone(){
       return phone;
    }
    
    public void setPhone(String phone){
       this.phone = phone;
    }


    public String getSeal(){
       return seal;
    }
    
    public void setSeal(String seal){
       this.seal = seal;
    }


    public String getPlacecounter(){
       return placecounter;
    }
    
    public void setPlacecounter(String placecounter){
       this.placecounter = placecounter;
    }


    public int getIsworking(){
       return isworking;
    }
    
    public void setIsworking(int isworking){
       this.isworking = isworking;
    }


    public int getCounterCapacity(){
       return counterCapacity;
    }
    
    public void setCounterCapacity(int counterCapacity){
       this.counterCapacity = counterCapacity;
    }


    public BigDecimal getCounterVoltageNominal(){
       return counterVoltageNominal;
    }
    
    public void setCounterVoltageNominal(BigDecimal counterVoltageNominal){
       this.counterVoltageNominal = counterVoltageNominal;
    }


    public Date getCounterDateProduct(){
       return counterDateProduct;
    }

    public void setCounterDateProduct(Date counterDateProduct){
       this.counterDateProduct = counterDateProduct;
    }


    public int getAreaType(){
       return areaType;
    }
    
    public void setAreaType(int areaType){
       this.areaType = areaType;
    }


    public int getFiderCode(){
       return fiderCode;
    }
    
    public void setFiderCode(int fiderCode){
       this.fiderCode = fiderCode;
    }


    public String getFiderName(){
       return fiderName;
    }
    
    public void setFiderName(String fiderName){
       this.fiderName = fiderName;
    }


    public int getDisablePlan(){
       return disablePlan;
    }
    
    public void setDisablePlan(int disablePlan){
       this.disablePlan = disablePlan;
    }


    public String getCodeEIC(){
       return codeEIC;
    }
    
    public void setCodeEIC(String codeEIC){
       this.codeEIC = codeEIC;
    }


    public String getTower(){
       return tower;
    }
    
    public void setTower(String tower){
       this.tower = tower;
    }


    public String getFeeder04(){
       return feeder04;
    }
    
    public void setFeeder04(String feeder04){
       this.feeder04 = feeder04;
    }


    public Date getDateFirstConsumption(){
       return dateFirstConsumption;
    }

    public void setDateFirstConsumption(Date dateFirstConsumption){
       this.dateFirstConsumption = dateFirstConsumption;
    }

    public ENElement getElement(){
       return element;
    }
    
    public void setElement(ENElement element){
       this.element = element;
    }
    public ENSiteRef getSiteRef(){
       return siteRef;
    }
    
    public void setSiteRef(ENSiteRef siteRef){
       this.siteRef = siteRef;
    }

	public Date getPrevCounterCheck() {
		return prevCounterCheck;
	}

	public void setPrevCounterCheck(Date prevCounterCheck) {
		this.prevCounterCheck = prevCounterCheck;
	}

	public int getPrevCheckPeriod() {
		return prevCheckPeriod;
	}

	public void setPrevCheckPeriod(int prevCheckPeriod) {
		this.prevCheckPeriod = prevCheckPeriod;
	}

	
    
} // end of ENRecordPointBytValueObject

