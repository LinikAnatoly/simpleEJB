
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAutoTires;
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;
import com.ksoe.energynet.valueobject.references.ENTiresInstallStatusRef;
import com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENAutoTires implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String typeName;
    public String garageNumber;
    public String serialNumber;
    public String factory;
    public BigDecimal potencial;
    public BigDecimal distanceAll;
    public String nominal;
    public String domain_info;
    public long modify_time = Long.MIN_VALUE;
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENTiresInstallStatusRef installStatusRef = new ENTiresInstallStatusRef();
    public static final String tableName = "ENAUTOTIRES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENAUTOTIRES.CODE";
    public static final String typeName_Attr = "typeName";
    public static final String typeName_Field = "TYPENAME";
    public static final String typeName_QFielld = "ENAUTOTIRES.TYPENAME";
    public static final String garageNumber_Attr = "garageNumber";
    public static final String garageNumber_Field = "GARAGENUMBER";
    public static final String garageNumber_QFielld = "ENAUTOTIRES.GARAGENUMBER";
    public static final String serialNumber_Attr = "serialNumber";
    public static final String serialNumber_Field = "SERIALNUMBER";
    public static final String serialNumber_QFielld = "ENAUTOTIRES.SERIALNUMBER";
    public static final String factory_Attr = "factory";
    public static final String factory_Field = "FACTORY";
    public static final String factory_QFielld = "ENAUTOTIRES.FACTORY";
    public static final String potencial_Attr = "potencial";
    public static final String potencial_Field = "POTENCIAL";
    public static final String potencial_QFielld = "ENAUTOTIRES.POTENCIAL";
    public static final String distanceAll_Attr = "distanceAll";
    public static final String distanceAll_Field = "DISTANCEALL";
    public static final String distanceAll_QFielld = "ENAUTOTIRES.DISTANCEALL";
    public static final String nominal_Attr = "nominal";
    public static final String nominal_Field = "NOMINAL";
    public static final String nominal_QFielld = "ENAUTOTIRES.NOMINAL";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENAUTOTIRES.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENAUTOTIRES.MODIFY_TIME";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENAUTOTIRES.MATERIALREFCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENAUTOTIRES.DEPARTMENTREFCODE";
    public static final String installStatusRef_Attr = "installStatusRef";
    public static final String installStatusRef_Field = "INSTALLSTATUSREFCODE";
    public static final String  installStatusRef_QFielld = "ENAUTOTIRES.INSTALLSTATUSREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTypeName(String aValue){
       typeName = aValue;
    }

    public String getTypeName(){
       return typeName;
    }

    public void setGarageNumber(String aValue){
       garageNumber = aValue;
    }

    public String getGarageNumber(){
       return garageNumber;
    }

    public void setSerialNumber(String aValue){
       serialNumber = aValue;
    }

    public String getSerialNumber(){
       return serialNumber;
    }

    public void setFactory(String aValue){
       factory = aValue;
    }

    public String getFactory(){
       return factory;
    }

    public void setPotencial(BigDecimal aValue){
       potencial = aValue;
    }

    public BigDecimal getPotencial(){
       return potencial;
    }

    public void setDistanceAll(BigDecimal aValue){
       distanceAll = aValue;
    }

    public BigDecimal getDistanceAll(){
       return distanceAll;
    }

    public void setNominal(String aValue){
       nominal = aValue;
    }

    public String getNominal(){
       return nominal;
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
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setInstallStatusRef(ENTiresInstallStatusRef aValue){
       installStatusRef = aValue;
    }

    public ENTiresInstallStatusRef getInstallStatusRef(){
       return installStatusRef;
    }

} // end of ENAutoTiresValueObject