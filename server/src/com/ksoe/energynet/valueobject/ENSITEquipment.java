
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSITEquipmentENSITEquipment;  	
  */

import java.io.Serializable;
import java.util.Date;

public class ENSITEquipment implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  serialnumber; 
    public String  suppliername; 
    public int  isserver = Integer.MIN_VALUE; 
    public String  num; 
    public Date  supplierdate; 
    public int  warranty = Integer.MIN_VALUE; 
    public int  isliquidation = Integer.MIN_VALUE; 
    public int  technum1 = Integer.MIN_VALUE; 
    public String  lisencepack; 
    public int  technum2 = Integer.MIN_VALUE; 
    public int  batch = Integer.MIN_VALUE; 
    public String  descr; 
    public String  location; 
    public Date  installdate; 
    public Date  inputdate; 
    public String  commentGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENSITEquipType objectType = new ENSITEquipType();
    public ENElement element = new ENElement();
    public FINWorker finworker = new FINWorker();
    public static final String tableName = "ENSITEQUIPMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSITEQUIPMENT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSITEQUIPMENT.NAME";
    public static final String serialnumber_Attr = "serialnumber";
    public static final String serialnumber_Field = "SERIALNUMBER";
    public static final String serialnumber_QFielld = "ENSITEQUIPMENT.SERIALNUMBER";
    public static final String suppliername_Attr = "suppliername";
    public static final String suppliername_Field = "SUPPLIERNAME";
    public static final String suppliername_QFielld = "ENSITEQUIPMENT.SUPPLIERNAME";
    public static final String isserver_Attr = "isserver";
    public static final String isserver_Field = "ISSERVER";
    public static final String isserver_QFielld = "ENSITEQUIPMENT.ISSERVER";
    public static final String num_Attr = "num";
    public static final String num_Field = "NUM";
    public static final String num_QFielld = "ENSITEQUIPMENT.NUM";
    public static final String supplierdate_Attr = "supplierdate";
    public static final String supplierdate_Field = "SUPPLIERDATE";
    public static final String supplierdate_QFielld = "ENSITEQUIPMENT.SUPPLIERDATE";
    public static final String warranty_Attr = "warranty";
    public static final String warranty_Field = "WARRANTY";
    public static final String warranty_QFielld = "ENSITEQUIPMENT.WARRANTY";
    public static final String isliquidation_Attr = "isliquidation";
    public static final String isliquidation_Field = "ISLIQUIDATION";
    public static final String isliquidation_QFielld = "ENSITEQUIPMENT.ISLIQUIDATION";
    public static final String technum1_Attr = "technum1";
    public static final String technum1_Field = "TECHNUM1";
    public static final String technum1_QFielld = "ENSITEQUIPMENT.TECHNUM1";
    public static final String lisencepack_Attr = "lisencepack";
    public static final String lisencepack_Field = "LISENCEPACK";
    public static final String lisencepack_QFielld = "ENSITEQUIPMENT.LISENCEPACK";
    public static final String technum2_Attr = "technum2";
    public static final String technum2_Field = "TECHNUM2";
    public static final String technum2_QFielld = "ENSITEQUIPMENT.TECHNUM2";
    public static final String batch_Attr = "batch";
    public static final String batch_Field = "BATCH";
    public static final String batch_QFielld = "ENSITEQUIPMENT.BATCH";
    public static final String descr_Attr = "descr";
    public static final String descr_Field = "DESCR";
    public static final String descr_QFielld = "ENSITEQUIPMENT.DESCR";
    public static final String location_Attr = "location";
    public static final String location_Field = "LOCATION";
    public static final String location_QFielld = "ENSITEQUIPMENT.LOCATION";
    public static final String installdate_Attr = "installdate";
    public static final String installdate_Field = "INSTALLDATE";
    public static final String installdate_QFielld = "ENSITEQUIPMENT.INSTALLDATE";
    public static final String inputdate_Attr = "inputdate";
    public static final String inputdate_Field = "INPUTDATE";
    public static final String inputdate_QFielld = "ENSITEQUIPMENT.INPUTDATE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENSITEQUIPMENT.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENSITEQUIPMENT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSITEQUIPMENT.MODIFY_TIME";
    public static final String objectType_Attr = "objectType";
    public static final String objectType_Field = "OBJECTTYPECODE";
    public static final String  objectType_QFielld = "ENSITEQUIPMENT.OBJECTTYPECODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENSITEQUIPMENT.ELEMENTCODE";
    public static final String finworker_Attr = "finworker";
    public static final String finworker_Field = "FINWORKERCODE";
    public static final String  finworker_QFielld = "ENSITEQUIPMENT.FINWORKERCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setSerialnumber(String aValue){
       serialnumber = aValue;
    }

    public String getSerialnumber(){
       return serialnumber;
    }

    public void setSuppliername(String aValue){
       suppliername = aValue;
    }

    public String getSuppliername(){
       return suppliername;
    }

    public void setIsserver(int aValue){
       isserver = aValue;
    }

    public int getIsserver(){
       return isserver;
    }

    public void setNum(String aValue){
       num = aValue;
    }

    public String getNum(){
       return num;
    }

    public void setSupplierdate(Date aValue){
       supplierdate = aValue;
    }

    public Date getSupplierdate(){
       return supplierdate;
    }

    public void setWarranty(int aValue){
       warranty = aValue;
    }

    public int getWarranty(){
       return warranty;
    }

    public void setIsliquidation(int aValue){
       isliquidation = aValue;
    }

    public int getIsliquidation(){
       return isliquidation;
    }

    public void setTechnum1(int aValue){
       technum1 = aValue;
    }

    public int getTechnum1(){
       return technum1;
    }

    public void setLisencepack(String aValue){
       lisencepack = aValue;
    }

    public String getLisencepack(){
       return lisencepack;
    }

    public void setTechnum2(int aValue){
       technum2 = aValue;
    }

    public int getTechnum2(){
       return technum2;
    }

    public void setBatch(int aValue){
       batch = aValue;
    }

    public int getBatch(){
       return batch;
    }

    public void setDescr(String aValue){
       descr = aValue;
    }

    public String getDescr(){
       return descr;
    }

    public void setLocation(String aValue){
       location = aValue;
    }

    public String getLocation(){
       return location;
    }

    public void setInstalldate(Date aValue){
       installdate = aValue;
    }

    public Date getInstalldate(){
       return installdate;
    }

    public void setInputdate(Date aValue){
       inputdate = aValue;
    }

    public Date getInputdate(){
       return inputdate;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setObjectType(ENSITEquipType aValue){
       objectType = aValue;
    }

    public ENSITEquipType getObjectType(){
       return objectType;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }
    public void setFinworker(FINWorker aValue){
       finworker = aValue;
    }

    public FINWorker getFinworker(){
       return finworker;
    }

} // end of ENSITEquipmentValueObject

