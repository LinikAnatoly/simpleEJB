
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAccumulators;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENAccumulatorStatusRef;
import com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENAccumulators implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String typeName;
    public String factory;
    public String garageNumber;
    public String yearProduction;
    public String serialNumber;
    public Date receiptDate ;
    public BigDecimal mileage;
    public BigDecimal mileageAll;
    public BigDecimal potencial;
    public String domain_info;
    public long modify_time = Long.MIN_VALUE;
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public ENAccumulatorStatusRef installStatusRef = new ENAccumulatorStatusRef();
    public static final String tableName = "ENACCUMULATORS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACCUMULATORS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACCUMULATORS.NAME";
    public static final String typeName_Attr = "typeName";
    public static final String typeName_Field = "TYPENAME";
    public static final String typeName_QFielld = "ENACCUMULATORS.TYPENAME";
    public static final String factory_Attr = "factory";
    public static final String factory_Field = "FACTORY";
    public static final String factory_QFielld = "ENACCUMULATORS.FACTORY";
    public static final String garageNumber_Attr = "garageNumber";
    public static final String garageNumber_Field = "GARAGENUMBER";
    public static final String garageNumber_QFielld = "ENACCUMULATORS.GARAGENUMBER";
    public static final String yearProduction_Attr = "yearProduction";
    public static final String yearProduction_Field = "YEARPRODUCTION";
    public static final String yearProduction_QFielld = "ENACCUMULATORS.YEARPRODUCTION";
    public static final String serialNumber_Attr = "serialNumber";
    public static final String serialNumber_Field = "SERIALNUMBER";
    public static final String serialNumber_QFielld = "ENACCUMULATORS.SERIALNUMBER";
    public static final String receiptDate_Attr = "receiptDate";
    public static final String receiptDate_Field = "RECEIPTDATE";
    public static final String receiptDate_QFielld = "ENACCUMULATORS.RECEIPTDATE";
    public static final String mileage_Attr = "mileage";
    public static final String mileage_Field = "MILEAGE";
    public static final String mileage_QFielld = "ENACCUMULATORS.MILEAGE";
    public static final String mileageAll_Attr = "mileageAll";
    public static final String mileageAll_Field = "MILEAGEALL";
    public static final String mileageAll_QFielld = "ENACCUMULATORS.MILEAGEALL";
    public static final String potencial_Attr = "potencial";
    public static final String potencial_Field = "POTENCIAL";
    public static final String potencial_QFielld = "ENACCUMULATORS.POTENCIAL";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENACCUMULATORS.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACCUMULATORS.MODIFY_TIME";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENACCUMULATORS.MATERIALREFCODE";
    public static final String installStatusRef_Attr = "installStatusRef";
    public static final String installStatusRef_Field = "INSTALLSTATUSREFCODE";
    public static final String  installStatusRef_QFielld = "ENACCUMULATORS.INSTALLSTATUSREFCODE";


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

    public void setTypeName(String aValue){
       typeName = aValue;
    }

    public String getTypeName(){
       return typeName;
    }

    public void setFactory(String aValue){
       factory = aValue;
    }

    public String getFactory(){
       return factory;
    }

    public void setGarageNumber(String aValue){
       garageNumber = aValue;
    }

    public String getGarageNumber(){
       return garageNumber;
    }

    public void setYearProduction(String aValue){
       yearProduction = aValue;
    }

    public String getYearProduction(){
       return yearProduction;
    }

    public void setSerialNumber(String aValue){
       serialNumber = aValue;
    }

    public String getSerialNumber(){
       return serialNumber;
    }


    public void setReceiptDate(Date aValue){
       receiptDate = aValue;
    }

    public Date getReceiptDate(){
       return receiptDate;
    }

    public void setMileage(BigDecimal aValue){
       mileage = aValue;
    }

    public BigDecimal getMileage(){
       return mileage;
    }

    public void setMileageAll(BigDecimal aValue){
       mileageAll = aValue;
    }

    public BigDecimal getMileageAll(){
       return mileageAll;
    }

    public void setPotencial(BigDecimal aValue){
       potencial = aValue;
    }

    public BigDecimal getPotencial(){
       return potencial;
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

    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }
    public void setInstallStatusRef(ENAccumulatorStatusRef aValue){
       installStatusRef = aValue;
    }

    public ENAccumulatorStatusRef getInstallStatusRef(){
       return installStatusRef;
    }

} // end of ENAccumulatorsValueObject