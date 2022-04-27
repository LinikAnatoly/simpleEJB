
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrderBytItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytRef;
    import  com.ksoe.energynet.valueobject.references.ENHumenItemRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
    import  com.ksoe.energynet.valueobject.FINWorker;
    import  com.ksoe.energynet.valueobject.references.ENRecordPointBytRef;
    import  com.ksoe.energynet.valueobject.references.ENRecordPointPromRef;
    import  com.ksoe.energynet.valueobject.references.ENRouteBytRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.SCCounterRef;

public class ENWorkOrderBytItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  contractNumberServices; 
    public String  accountNumber; 
    public String  name; 
    public String  customerName; 
    public String  address; 
    public String  invNumber; 
    public String  serialNumber; 
    public String  seal; 
    public String  phone; 
    public int  statuscode = Integer.MIN_VALUE; 
    public int  rpCode = Integer.MIN_VALUE; 
    public Date dateCounterInst ;
    public Date dateCounterCheck ;
    public String  counterType; 
    public BigDecimal  classAccuracy; 
    public BigDecimal  checkperiod; 
    public int  rpStatusCode = Integer.MIN_VALUE; 
    public BigDecimal  phasity; 
    public Date datecheck ;
    public BigDecimal  checkperiod1; 
    public String  placecounter; 
    public int  rpIsWorking = Integer.MIN_VALUE; 
    public String  recordPointName; 
    public String  routeBytName; 
    public String  routeBytNumbergen; 
    public String  commentGen; 
    public Date dateAdd ;
    public Date dateEdit ;
    public String  userAdd; 
    public String  userEdit; 
    public long  modify_time = Long.MIN_VALUE;
    public int  factCode = Integer.MIN_VALUE; 
    public int  counterCapacity = Integer.MIN_VALUE; 
    public BigDecimal  counterVoltageNominal; 
    public Date counterDateProduct ;
    public ENWorkOrderBytRef workOrderBytRef = new ENWorkOrderBytRef();
    public ENHumenItemRef humenItemRef = new ENHumenItemRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWorkItemRef planItemRef = new ENPlanWorkItemRef();
    public FINWorker finWorker = new FINWorker();
    public ENRecordPointBytRef recordPointBytRef = new ENRecordPointBytRef();
    public ENRecordPointPromRef recordPointPromRef = new ENRecordPointPromRef();
    public ENRouteBytRef routeBytRef = new ENRouteBytRef();
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public SCCounterRef scCounterRef = new SCCounterRef();
    public static final String tableName = "ENWORKORDERBYTITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDERBYTITEM.CODE";
    public static final String contractNumberServices_Attr = "contractNumberServices";
    public static final String contractNumberServices_Field = "CONTRACTNUMBERSERVICES";
    public static final String contractNumberServices_QFielld = "ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES";
    public static final String accountNumber_Attr = "accountNumber";
    public static final String accountNumber_Field = "ACCOUNTNUMBER";
    public static final String accountNumber_QFielld = "ENWORKORDERBYTITEM.ACCOUNTNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENWORKORDERBYTITEM.NAME";
    public static final String customerName_Attr = "customerName";
    public static final String customerName_Field = "CUSTOMERNAME";
    public static final String customerName_QFielld = "ENWORKORDERBYTITEM.CUSTOMERNAME";
    public static final String address_Attr = "address";
    public static final String address_Field = "ADDRESS";
    public static final String address_QFielld = "ENWORKORDERBYTITEM.ADDRESS";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENWORKORDERBYTITEM.INVNUMBER";
    public static final String serialNumber_Attr = "serialNumber";
    public static final String serialNumber_Field = "SERIALNUMBER";
    public static final String serialNumber_QFielld = "ENWORKORDERBYTITEM.SERIALNUMBER";
    public static final String seal_Attr = "seal";
    public static final String seal_Field = "SEAL";
    public static final String seal_QFielld = "ENWORKORDERBYTITEM.SEAL";
    public static final String phone_Attr = "phone";
    public static final String phone_Field = "PHONE";
    public static final String phone_QFielld = "ENWORKORDERBYTITEM.PHONE";
    public static final String statuscode_Attr = "statuscode";
    public static final String statuscode_Field = "STATUSCODE";
    public static final String statuscode_QFielld = "ENWORKORDERBYTITEM.STATUSCODE";
    public static final String rpCode_Attr = "rpCode";
    public static final String rpCode_Field = "RPCODE";
    public static final String rpCode_QFielld = "ENWORKORDERBYTITEM.RPCODE";
    public static final String dateCounterInst_Attr = "dateCounterInst";
    public static final String dateCounterInst_Field = "DATECOUNTERINST";
    public static final String dateCounterInst_QFielld = "ENWORKORDERBYTITEM.DATECOUNTERINST";
    public static final String dateCounterCheck_Attr = "dateCounterCheck";
    public static final String dateCounterCheck_Field = "DATECOUNTERCHECK";
    public static final String dateCounterCheck_QFielld = "ENWORKORDERBYTITEM.DATECOUNTERCHECK";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "ENWORKORDERBYTITEM.COUNTERTYPE";
    public static final String classAccuracy_Attr = "classAccuracy";
    public static final String classAccuracy_Field = "CLASSACCURACY";
    public static final String classAccuracy_QFielld = "ENWORKORDERBYTITEM.CLASSACCURACY";
    public static final String checkperiod_Attr = "checkperiod";
    public static final String checkperiod_Field = "CHECKPERIOD";
    public static final String checkperiod_QFielld = "ENWORKORDERBYTITEM.CHECKPERIOD";
    public static final String rpStatusCode_Attr = "rpStatusCode";
    public static final String rpStatusCode_Field = "RPSTATUSCODE";
    public static final String rpStatusCode_QFielld = "ENWORKORDERBYTITEM.RPSTATUSCODE";
    public static final String phasity_Attr = "phasity";
    public static final String phasity_Field = "PHASITY";
    public static final String phasity_QFielld = "ENWORKORDERBYTITEM.PHASITY";
    public static final String datecheck_Attr = "datecheck";
    public static final String datecheck_Field = "DATECHECK";
    public static final String datecheck_QFielld = "ENWORKORDERBYTITEM.DATECHECK";
    public static final String checkperiod1_Attr = "checkperiod1";
    public static final String checkperiod1_Field = "CHECKPERIOD1";
    public static final String checkperiod1_QFielld = "ENWORKORDERBYTITEM.CHECKPERIOD1";
    public static final String placecounter_Attr = "placecounter";
    public static final String placecounter_Field = "PLACECOUNTER";
    public static final String placecounter_QFielld = "ENWORKORDERBYTITEM.PLACECOUNTER";
    public static final String rpIsWorking_Attr = "rpIsWorking";
    public static final String rpIsWorking_Field = "RPISWORKING";
    public static final String rpIsWorking_QFielld = "ENWORKORDERBYTITEM.RPISWORKING";
    public static final String recordPointName_Attr = "recordPointName";
    public static final String recordPointName_Field = "RECORDPOINTNAME";
    public static final String recordPointName_QFielld = "ENWORKORDERBYTITEM.RECORDPOINTNAME";
    public static final String routeBytName_Attr = "routeBytName";
    public static final String routeBytName_Field = "ROUTEBYTNAME";
    public static final String routeBytName_QFielld = "ENWORKORDERBYTITEM.ROUTEBYTNAME";
    public static final String routeBytNumbergen_Attr = "routeBytNumbergen";
    public static final String routeBytNumbergen_Field = "ROUTEBYTNUMBERGEN";
    public static final String routeBytNumbergen_QFielld = "ENWORKORDERBYTITEM.ROUTEBYTNUMBERGEN";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENWORKORDERBYTITEM.COMMENTGEN";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENWORKORDERBYTITEM.DATEADD";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENWORKORDERBYTITEM.DATEEDIT";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENWORKORDERBYTITEM.USERADD";
    public static final String userEdit_Attr = "userEdit";
    public static final String userEdit_Field = "USEREDIT";
    public static final String userEdit_QFielld = "ENWORKORDERBYTITEM.USEREDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENWORKORDERBYTITEM.MODIFY_TIME";
    public static final String factCode_Attr = "factCode";
    public static final String factCode_Field = "FACTCODE";
    public static final String factCode_QFielld = "ENWORKORDERBYTITEM.FACTCODE";
    public static final String counterCapacity_Attr = "counterCapacity";
    public static final String counterCapacity_Field = "COUNTERCAPACITY";
    public static final String counterCapacity_QFielld = "ENWORKORDERBYTITEM.COUNTERCAPACITY";
    public static final String counterVoltageNominal_Attr = "counterVoltageNominal";
    public static final String counterVoltageNominal_Field = "COUNTERVOLTAGENOMINAL";
    public static final String counterVoltageNominal_QFielld = "ENWORKORDERBYTITEM.COUNTERVOLTAGENOMINAL";
    public static final String counterDateProduct_Attr = "counterDateProduct";
    public static final String counterDateProduct_Field = "COUNTERDATEPRODUCT";
    public static final String counterDateProduct_QFielld = "ENWORKORDERBYTITEM.COUNTERDATEPRODUCT";
    public static final String workOrderBytRef_Attr = "workOrderBytRef";
    public static final String workOrderBytRef_Field = "WORKORDERBYTREFCODE";
    public static final String  workOrderBytRef_QFielld = "ENWORKORDERBYTITEM.WORKORDERBYTREFCODE";
    public static final String humenItemRef_Attr = "humenItemRef";
    public static final String humenItemRef_Field = "HUMENITEMREFCODE";
    public static final String  humenItemRef_QFielld = "ENWORKORDERBYTITEM.HUMENITEMREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENWORKORDERBYTITEM.PLANREFCODE";
    public static final String planItemRef_Attr = "planItemRef";
    public static final String planItemRef_Field = "PLANITEMREFCODE";
    public static final String  planItemRef_QFielld = "ENWORKORDERBYTITEM.PLANITEMREFCODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENWORKORDERBYTITEM.FINWORKERCODE";
    public static final String recordPointBytRef_Attr = "recordPointBytRef";
    public static final String recordPointBytRef_Field = "RECORDPOINTBYTREFCODE";
    public static final String  recordPointBytRef_QFielld = "ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE";
    public static final String recordPointPromRef_Attr = "recordPointPromRef";
    public static final String recordPointPromRef_Field = "RECORDPOINTPROMREFCODE";
    public static final String  recordPointPromRef_QFielld = "ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE";
    public static final String routeBytRef_Attr = "routeBytRef";
    public static final String routeBytRef_Field = "ROUTEBYTREFCODE";
    public static final String  routeBytRef_QFielld = "ENWORKORDERBYTITEM.ROUTEBYTREFCODE";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE";
    public static final String scCounterRef_Attr = "scCounterRef";
    public static final String scCounterRef_Field = "SCCOUNTERREFCODE";
    public static final String  scCounterRef_QFielld = "ENWORKORDERBYTITEM.SCCOUNTERREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setContractNumberServices(String aValue){
       contractNumberServices = aValue;
    }

    public String getContractNumberServices(){
       return contractNumberServices;
    }


    public void setAccountNumber(String aValue){
       accountNumber = aValue;
    }

    public String getAccountNumber(){
       return accountNumber;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setCustomerName(String aValue){
       customerName = aValue;
    }

    public String getCustomerName(){
       return customerName;
    }


    public void setAddress(String aValue){
       address = aValue;
    }

    public String getAddress(){
       return address;
    }


    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }


    public void setSerialNumber(String aValue){
       serialNumber = aValue;
    }

    public String getSerialNumber(){
       return serialNumber;
    }


    public void setSeal(String aValue){
       seal = aValue;
    }

    public String getSeal(){
       return seal;
    }


    public void setPhone(String aValue){
       phone = aValue;
    }

    public String getPhone(){
       return phone;
    }


    public void setStatuscode(int aValue){
       statuscode = aValue;
    }

    public int getStatuscode(){
       return statuscode;
    }


    public void setRpCode(int aValue){
       rpCode = aValue;
    }

    public int getRpCode(){
       return rpCode;
    }


    public void setDateCounterInst(Date aValue){
       dateCounterInst = aValue;
    }

    public Date getDateCounterInst(){
       return dateCounterInst;
    }


    public void setDateCounterCheck(Date aValue){
       dateCounterCheck = aValue;
    }

    public Date getDateCounterCheck(){
       return dateCounterCheck;
    }


    public void setCounterType(String aValue){
       counterType = aValue;
    }

    public String getCounterType(){
       return counterType;
    }


    public void setClassAccuracy(BigDecimal aValue){
       classAccuracy = aValue;
    }

    public BigDecimal getClassAccuracy(){
       return classAccuracy;
    }


    public void setCheckperiod(BigDecimal aValue){
       checkperiod = aValue;
    }

    public BigDecimal getCheckperiod(){
       return checkperiod;
    }


    public void setRpStatusCode(int aValue){
       rpStatusCode = aValue;
    }

    public int getRpStatusCode(){
       return rpStatusCode;
    }


    public void setPhasity(BigDecimal aValue){
       phasity = aValue;
    }

    public BigDecimal getPhasity(){
       return phasity;
    }


    public void setDatecheck(Date aValue){
       datecheck = aValue;
    }

    public Date getDatecheck(){
       return datecheck;
    }


    public void setCheckperiod1(BigDecimal aValue){
       checkperiod1 = aValue;
    }

    public BigDecimal getCheckperiod1(){
       return checkperiod1;
    }


    public void setPlacecounter(String aValue){
       placecounter = aValue;
    }

    public String getPlacecounter(){
       return placecounter;
    }


    public void setRpIsWorking(int aValue){
       rpIsWorking = aValue;
    }

    public int getRpIsWorking(){
       return rpIsWorking;
    }


    public void setRecordPointName(String aValue){
       recordPointName = aValue;
    }

    public String getRecordPointName(){
       return recordPointName;
    }


    public void setRouteBytName(String aValue){
       routeBytName = aValue;
    }

    public String getRouteBytName(){
       return routeBytName;
    }


    public void setRouteBytNumbergen(String aValue){
       routeBytNumbergen = aValue;
    }

    public String getRouteBytNumbergen(){
       return routeBytNumbergen;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setUserEdit(String aValue){
       userEdit = aValue;
    }

    public String getUserEdit(){
       return userEdit;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setFactCode(int aValue){
       factCode = aValue;
    }

    public int getFactCode(){
       return factCode;
    }


    public void setCounterCapacity(int aValue){
       counterCapacity = aValue;
    }

    public int getCounterCapacity(){
       return counterCapacity;
    }


    public void setCounterVoltageNominal(BigDecimal aValue){
       counterVoltageNominal = aValue;
    }

    public BigDecimal getCounterVoltageNominal(){
       return counterVoltageNominal;
    }


    public void setCounterDateProduct(Date aValue){
       counterDateProduct = aValue;
    }

    public Date getCounterDateProduct(){
       return counterDateProduct;
    }

    public void setWorkOrderBytRef(ENWorkOrderBytRef aValue){
       workOrderBytRef = aValue;
    }

    public ENWorkOrderBytRef getWorkOrderBytRef(){
       return workOrderBytRef;
    }
    public void setHumenItemRef(ENHumenItemRef aValue){
       humenItemRef = aValue;
    }

    public ENHumenItemRef getHumenItemRef(){
       return humenItemRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setPlanItemRef(ENPlanWorkItemRef aValue){
       planItemRef = aValue;
    }

    public ENPlanWorkItemRef getPlanItemRef(){
       return planItemRef;
    }
    public void setFinWorker(FINWorker aValue){
       finWorker = aValue;
    }

    public FINWorker getFinWorker(){
       return finWorker;
    }
    public void setRecordPointBytRef(ENRecordPointBytRef aValue){
       recordPointBytRef = aValue;
    }

    public ENRecordPointBytRef getRecordPointBytRef(){
       return recordPointBytRef;
    }
    public void setRecordPointPromRef(ENRecordPointPromRef aValue){
       recordPointPromRef = aValue;
    }

    public ENRecordPointPromRef getRecordPointPromRef(){
       return recordPointPromRef;
    }
    public void setRouteBytRef(ENRouteBytRef aValue){
       routeBytRef = aValue;
    }

    public ENRouteBytRef getRouteBytRef(){
       return routeBytRef;
    }
    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setScCounterRef(SCCounterRef aValue){
       scCounterRef = aValue;
    }

    public SCCounterRef getScCounterRef(){
       return scCounterRef;
    }

} // end of ENWorkOrderBytItemValueObject

