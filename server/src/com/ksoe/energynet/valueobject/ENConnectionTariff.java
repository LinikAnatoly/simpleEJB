
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENConnectionTariff;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENConnectionLevelRef;
    import  com.ksoe.energynet.valueobject.references.ENPowerReliabilityCategoryRef;
    import  com.ksoe.energynet.valueobject.references.ENConnectionPowerPointRef;
    import  com.ksoe.energynet.valueobject.references.ENConnectionPhasityRef;
    import  com.ksoe.energynet.valueobject.references.ENConnectionLineTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENConnectionInstallationTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENConnectionLocationTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENConnectionTariffTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENConnectionTariff implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  shortname; 
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENConnectionLevelRef levelRef = new ENConnectionLevelRef();
    public ENPowerReliabilityCategoryRef categoryRef = new ENPowerReliabilityCategoryRef();
    public ENConnectionPowerPointRef powerPointRef = new ENConnectionPowerPointRef();
    public ENConnectionPhasityRef phasityRef = new ENConnectionPhasityRef();
    public ENConnectionLineTypeRef lineTypeRef = new ENConnectionLineTypeRef();
    public ENConnectionInstallationTypeRef installationTypeRef = new ENConnectionInstallationTypeRef();
    public ENConnectionLocationTypeRef locationTypeRef = new ENConnectionLocationTypeRef();
    public ENConnectionTariffTypeRef tarifTypeRef = new ENConnectionTariffTypeRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "ENCONNECTIONTARIFF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONNECTIONTARIFF.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONNECTIONTARIFF.NAME";
    public static final String shortname_Attr = "shortname";
    public static final String shortname_Field = "SHORTNAME";
    public static final String shortname_QFielld = "ENCONNECTIONTARIFF.SHORTNAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCONNECTIONTARIFF.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCONNECTIONTARIFF.MODIFY_TIME";
    public static final String levelRef_Attr = "levelRef";
    public static final String levelRef_Field = "LEVELREFCODE";
    public static final String  levelRef_QFielld = "ENCONNECTIONTARIFF.LEVELREFCODE";
    public static final String categoryRef_Attr = "categoryRef";
    public static final String categoryRef_Field = "CATEGORYREFCODE";
    public static final String  categoryRef_QFielld = "ENCONNECTIONTARIFF.CATEGORYREFCODE";
    public static final String powerPointRef_Attr = "powerPointRef";
    public static final String powerPointRef_Field = "POWERPOINTREFCODE";
    public static final String  powerPointRef_QFielld = "ENCONNECTIONTARIFF.POWERPOINTREFCODE";
    public static final String phasityRef_Attr = "phasityRef";
    public static final String phasityRef_Field = "PHASITYREFCODE";
    public static final String  phasityRef_QFielld = "ENCONNECTIONTARIFF.PHASITYREFCODE";
    public static final String lineTypeRef_Attr = "lineTypeRef";
    public static final String lineTypeRef_Field = "LINETYPEREFCODE";
    public static final String  lineTypeRef_QFielld = "ENCONNECTIONTARIFF.LINETYPEREFCODE";
    public static final String installationTypeRef_Attr = "installationTypeRef";
    public static final String installationTypeRef_Field = "INSTALLATIONTYPEREFCOD";
    public static final String  installationTypeRef_QFielld = "ENCONNECTIONTARIFF.INSTALLATIONTYPEREFCOD";
    public static final String locationTypeRef_Attr = "locationTypeRef";
    public static final String locationTypeRef_Field = "LOCATIONTYPEREFCODE";
    public static final String  locationTypeRef_QFielld = "ENCONNECTIONTARIFF.LOCATIONTYPEREFCODE";
    public static final String tarifTypeRef_Attr = "tarifTypeRef";
    public static final String tarifTypeRef_Field = "TARIFTYPEREFCODE";
    public static final String  tarifTypeRef_QFielld = "ENCONNECTIONTARIFF.TARIFTYPEREFCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENCONNECTIONTARIFF.DEPARTMENTREFCODE";



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


    public void setShortname(String aValue){
       shortname = aValue;
    }

    public String getShortname(){
       return shortname;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setLevelRef(ENConnectionLevelRef aValue){
       levelRef = aValue;
    }

    public ENConnectionLevelRef getLevelRef(){
       return levelRef;
    }
    public void setCategoryRef(ENPowerReliabilityCategoryRef aValue){
       categoryRef = aValue;
    }

    public ENPowerReliabilityCategoryRef getCategoryRef(){
       return categoryRef;
    }
    public void setPowerPointRef(ENConnectionPowerPointRef aValue){
       powerPointRef = aValue;
    }

    public ENConnectionPowerPointRef getPowerPointRef(){
       return powerPointRef;
    }
    public void setPhasityRef(ENConnectionPhasityRef aValue){
       phasityRef = aValue;
    }

    public ENConnectionPhasityRef getPhasityRef(){
       return phasityRef;
    }
    public void setLineTypeRef(ENConnectionLineTypeRef aValue){
       lineTypeRef = aValue;
    }

    public ENConnectionLineTypeRef getLineTypeRef(){
       return lineTypeRef;
    }
    public void setInstallationTypeRef(ENConnectionInstallationTypeRef aValue){
       installationTypeRef = aValue;
    }

    public ENConnectionInstallationTypeRef getInstallationTypeRef(){
       return installationTypeRef;
    }
    public void setLocationTypeRef(ENConnectionLocationTypeRef aValue){
       locationTypeRef = aValue;
    }

    public ENConnectionLocationTypeRef getLocationTypeRef(){
       return locationTypeRef;
    }
    public void setTarifTypeRef(ENConnectionTariffTypeRef aValue){
       tarifTypeRef = aValue;
    }

    public ENConnectionTariffTypeRef getTarifTypeRef(){
       return tarifTypeRef;
    }
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of ENConnectionTariffValueObject

