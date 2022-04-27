
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRecordPointProm;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energypro.valueobject.EPRen;
    import  com.ksoe.energynet.valueobject.ENElement;

public class ENRecordPointProm implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  accountNumber; 
    public String  accountName; 
    public int  accountCode = Integer.MIN_VALUE;
    public String  counterNumber; 
    public String  recordPointName; 
    public String  recordPointAddr; 
    public String  recordPointKindName; 
    public int  recordPointCode = Integer.MIN_VALUE;
    public String  feeder; 
    public String  substation; 
    public String  invNumber; 
    public int  dayofcalculation = Integer.MIN_VALUE;
    public String  inspector; 
    public Date datecontrol;
    public Date datetp;
    public Date dateCounterInst;
    public Date dateCounterCheck;
    public String  counterType; 
    public BigDecimal  classAccuracy; 
    public BigDecimal  checkperiod; 
    public int  statuscode = Integer.MIN_VALUE;
    public BigDecimal  phasity; 
    public String  phone; 
    public String  seal; 
    public String  placecounter; 
    public int  isworking = Integer.MIN_VALUE;
    public int  fiderCode = Integer.MIN_VALUE;
    public String  fiderName; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public int  counterCapacity = Integer.MIN_VALUE;
    public BigDecimal  counterVoltageNominal; 
    public Date counterDateProduct;
    public int  disablePlan = Integer.MIN_VALUE;
    public String  codeEIC; 
    public String  tower; 
    public String  feeder04; 
    public Date dateFirstConsumption;
    public Date contractDate;

    public EPRen ren = new EPRen();
    public ENElement element = new ENElement();

    public static final String tableName = "ENRECORDPOINTPROM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRECORDPOINTPROM.CODE";
    public static final String accountNumber_Attr = "accountNumber";
    public static final String accountNumber_Field = "ACCOUNTNUMBER";
    public static final String accountNumber_QFielld = "ENRECORDPOINTPROM.ACCOUNTNUMBER";
    public static final String accountName_Attr = "accountName";
    public static final String accountName_Field = "ACCOUNTNAME";
    public static final String accountName_QFielld = "ENRECORDPOINTPROM.ACCOUNTNAME";
    public static final String accountCode_Attr = "accountCode";
    public static final String accountCode_Field = "ACCOUNTCODE";
    public static final String accountCode_QFielld = "ENRECORDPOINTPROM.ACCOUNTCODE";
    public static final String counterNumber_Attr = "counterNumber";
    public static final String counterNumber_Field = "COUNTERNUMBER";
    public static final String counterNumber_QFielld = "ENRECORDPOINTPROM.COUNTERNUMBER";
    public static final String recordPointName_Attr = "recordPointName";
    public static final String recordPointName_Field = "RECORDPOINTNAME";
    public static final String recordPointName_QFielld = "ENRECORDPOINTPROM.RECORDPOINTNAME";
    public static final String recordPointAddr_Attr = "recordPointAddr";
    public static final String recordPointAddr_Field = "RECORDPOINTADDR";
    public static final String recordPointAddr_QFielld = "ENRECORDPOINTPROM.RECORDPOINTADDR";
    public static final String recordPointKindName_Attr = "recordPointKindName";
    public static final String recordPointKindName_Field = "RECORDPOINTKINDNAME";
    public static final String recordPointKindName_QFielld = "ENRECORDPOINTPROM.RECORDPOINTKINDNAME";
    public static final String recordPointCode_Attr = "recordPointCode";
    public static final String recordPointCode_Field = "RECORDPOINTCODE";
    public static final String recordPointCode_QFielld = "ENRECORDPOINTPROM.RECORDPOINTCODE";
    public static final String feeder_Attr = "feeder";
    public static final String feeder_Field = "FEEDER";
    public static final String feeder_QFielld = "ENRECORDPOINTPROM.FEEDER";
    public static final String substation_Attr = "substation";
    public static final String substation_Field = "SUBSTATION";
    public static final String substation_QFielld = "ENRECORDPOINTPROM.SUBSTATION";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENRECORDPOINTPROM.INVNUMBER";
    public static final String dayofcalculation_Attr = "dayofcalculation";
    public static final String dayofcalculation_Field = "DAYOFCALCULATION";
    public static final String dayofcalculation_QFielld = "ENRECORDPOINTPROM.DAYOFCALCULATION";
    public static final String inspector_Attr = "inspector";
    public static final String inspector_Field = "INSPECTOR";
    public static final String inspector_QFielld = "ENRECORDPOINTPROM.INSPECTOR";
    public static final String datecontrol_Attr = "datecontrol";
    public static final String datecontrol_Field = "DATECONTROL";
    public static final String datecontrol_QFielld = "ENRECORDPOINTPROM.DATECONTROL";
    public static final String datetp_Attr = "datetp";
    public static final String datetp_Field = "DATETP";
    public static final String datetp_QFielld = "ENRECORDPOINTPROM.DATETP";
    public static final String dateCounterInst_Attr = "dateCounterInst";
    public static final String dateCounterInst_Field = "DATECOUNTERINST";
    public static final String dateCounterInst_QFielld = "ENRECORDPOINTPROM.DATECOUNTERINST";
    public static final String dateCounterCheck_Attr = "dateCounterCheck";
    public static final String dateCounterCheck_Field = "DATECOUNTERCHECK";
    public static final String dateCounterCheck_QFielld = "ENRECORDPOINTPROM.DATECOUNTERCHECK";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "ENRECORDPOINTPROM.COUNTERTYPE";
    public static final String classAccuracy_Attr = "classAccuracy";
    public static final String classAccuracy_Field = "CLASSACCURACY";
    public static final String classAccuracy_QFielld = "ENRECORDPOINTPROM.CLASSACCURACY";
    public static final String checkperiod_Attr = "checkperiod";
    public static final String checkperiod_Field = "CHECKPERIOD";
    public static final String checkperiod_QFielld = "ENRECORDPOINTPROM.CHECKPERIOD";
    public static final String statuscode_Attr = "statuscode";
    public static final String statuscode_Field = "STATUSCODE";
    public static final String statuscode_QFielld = "ENRECORDPOINTPROM.STATUSCODE";
    public static final String phasity_Attr = "phasity";
    public static final String phasity_Field = "PHASITY";
    public static final String phasity_QFielld = "ENRECORDPOINTPROM.PHASITY";
    public static final String phone_Attr = "phone";
    public static final String phone_Field = "PHONE";
    public static final String phone_QFielld = "ENRECORDPOINTPROM.PHONE";
    public static final String seal_Attr = "seal";
    public static final String seal_Field = "SEAL";
    public static final String seal_QFielld = "ENRECORDPOINTPROM.SEAL";
    public static final String placecounter_Attr = "placecounter";
    public static final String placecounter_Field = "PLACECOUNTER";
    public static final String placecounter_QFielld = "ENRECORDPOINTPROM.PLACECOUNTER";
    public static final String isworking_Attr = "isworking";
    public static final String isworking_Field = "ISWORKING";
    public static final String isworking_QFielld = "ENRECORDPOINTPROM.ISWORKING";
    public static final String fiderCode_Attr = "fiderCode";
    public static final String fiderCode_Field = "FIDERCODE";
    public static final String fiderCode_QFielld = "ENRECORDPOINTPROM.FIDERCODE";
    public static final String fiderName_Attr = "fiderName";
    public static final String fiderName_Field = "FIDERNAME";
    public static final String fiderName_QFielld = "ENRECORDPOINTPROM.FIDERNAME";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENRECORDPOINTPROM.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENRECORDPOINTPROM.MODIFY_TIME";
    public static final String counterCapacity_Attr = "counterCapacity";
    public static final String counterCapacity_Field = "COUNTERCAPACITY";
    public static final String counterCapacity_QFielld = "ENRECORDPOINTPROM.COUNTERCAPACITY";
    public static final String counterVoltageNominal_Attr = "counterVoltageNominal";
    public static final String counterVoltageNominal_Field = "COUNTERVOLTAGENOMINAL";
    public static final String counterVoltageNominal_QFielld = "ENRECORDPOINTPROM.COUNTERVOLTAGENOMINAL";
    public static final String counterDateProduct_Attr = "counterDateProduct";
    public static final String counterDateProduct_Field = "COUNTERDATEPRODUCT";
    public static final String counterDateProduct_QFielld = "ENRECORDPOINTPROM.COUNTERDATEPRODUCT";
    public static final String disablePlan_Attr = "disablePlan";
    public static final String disablePlan_Field = "DISABLEPLAN";
    public static final String disablePlan_QFielld = "ENRECORDPOINTPROM.DISABLEPLAN";
    public static final String codeEIC_Attr = "codeEIC";
    public static final String codeEIC_Field = "CODEEIC";
    public static final String codeEIC_QFielld = "ENRECORDPOINTPROM.CODEEIC";
    public static final String tower_Attr = "tower";
    public static final String tower_Field = "TOWER";
    public static final String tower_QFielld = "ENRECORDPOINTPROM.TOWER";
    public static final String feeder04_Attr = "feeder04";
    public static final String feeder04_Field = "FEEDER04";
    public static final String feeder04_QFielld = "ENRECORDPOINTPROM.FEEDER04";
    public static final String dateFirstConsumption_Attr = "dateFirstConsumption";
    public static final String dateFirstConsumption_Field = "DATEFIRSTCONSUMPTION";
    public static final String dateFirstConsumption_QFielld = "ENRECORDPOINTPROM.DATEFIRSTCONSUMPTION";
    public static final String contractDate_Attr = "contractDate";
    public static final String contractDate_Field = "CONTRACTDATE";
    public static final String contractDate_QFielld = "ENRECORDPOINTPROM.CONTRACTDATE";

    public static final String ren_Attr = "ren";
    public static final String ren_Field = "RENCODE";
    public static final String  ren_QFielld = "ENRECORDPOINTPROM.RENCODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENRECORDPOINTPROM.ELEMENTCODE";



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


    public String getAccountName(){
       return accountName;
    }
    
    public void setAccountName(String accountName){
       this.accountName = accountName;
    }


    public int getAccountCode(){
       return accountCode;
    }
    
    public void setAccountCode(int accountCode){
       this.accountCode = accountCode;
    }


    public String getCounterNumber(){
       return counterNumber;
    }
    
    public void setCounterNumber(String counterNumber){
       this.counterNumber = counterNumber;
    }


    public String getRecordPointName(){
       return recordPointName;
    }
    
    public void setRecordPointName(String recordPointName){
       this.recordPointName = recordPointName;
    }


    public String getRecordPointAddr(){
       return recordPointAddr;
    }
    
    public void setRecordPointAddr(String recordPointAddr){
       this.recordPointAddr = recordPointAddr;
    }


    public String getRecordPointKindName(){
       return recordPointKindName;
    }
    
    public void setRecordPointKindName(String recordPointKindName){
       this.recordPointKindName = recordPointKindName;
    }


    public int getRecordPointCode(){
       return recordPointCode;
    }
    
    public void setRecordPointCode(int recordPointCode){
       this.recordPointCode = recordPointCode;
    }


    public String getFeeder(){
       return feeder;
    }
    
    public void setFeeder(String feeder){
       this.feeder = feeder;
    }


    public String getSubstation(){
       return substation;
    }
    
    public void setSubstation(String substation){
       this.substation = substation;
    }


    public String getInvNumber(){
       return invNumber;
    }
    
    public void setInvNumber(String invNumber){
       this.invNumber = invNumber;
    }


    public int getDayofcalculation(){
       return dayofcalculation;
    }
    
    public void setDayofcalculation(int dayofcalculation){
       this.dayofcalculation = dayofcalculation;
    }


    public String getInspector(){
       return inspector;
    }
    
    public void setInspector(String inspector){
       this.inspector = inspector;
    }


    public Date getDatecontrol(){
       return datecontrol;
    }

    public void setDatecontrol(Date datecontrol){
       this.datecontrol = datecontrol;
    }


    public Date getDatetp(){
       return datetp;
    }

    public void setDatetp(Date datetp){
       this.datetp = datetp;
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


    public Date getContractDate(){
       return contractDate;
    }

    public void setContractDate(Date contractDate){
       this.contractDate = contractDate;
    }

    public EPRen getRen(){
       return ren;
    }
    
    public void setRen(EPRen ren){
       this.ren = ren;
    }
    public ENElement getElement(){
       return element;
    }
    
    public void setElement(ENElement element){
       this.element = element;
    }

} // end of ENRecordPointPromValueObject

