
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOTechParams;  	
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
    import  com.ksoe.energynet.valueobject.references.ENConnectionCityTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSOTechParams implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  closestDistance = Integer.MIN_VALUE;
    public BigDecimal  substationBuildSum; 
    public BigDecimal  calculationSum; 
    public int  closestDistance2 = Integer.MIN_VALUE;
    public int  infoDistance2 = Integer.MIN_VALUE;
    public String  object4closestDistanceName; 
    public String  object4closestDistance2Name; 
    public String  cityTypeName; 
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;

    public ENConnectionLevelRef levelRef = new ENConnectionLevelRef();
    public ENPowerReliabilityCategoryRef categoryRef = new ENPowerReliabilityCategoryRef();
    public ENConnectionPowerPointRef powerPointRef = new ENConnectionPowerPointRef();
    public ENConnectionPhasityRef phasityRef = new ENConnectionPhasityRef();
    public ENConnectionLineTypeRef lineTypeRef = new ENConnectionLineTypeRef();
    public ENConnectionInstallationTypeRef installationTypeRef = new ENConnectionInstallationTypeRef();
    public ENConnectionLocationTypeRef locationTypeRef = new ENConnectionLocationTypeRef();
    public ENConnectionCityTypeRef cityTypeRef = new ENConnectionCityTypeRef();
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();

    public static final String tableName = "ENSOTECHPARAMS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOTECHPARAMS.CODE";
    public static final String closestDistance_Attr = "closestDistance";
    public static final String closestDistance_Field = "CLOSESTDISTANCE";
    public static final String closestDistance_QFielld = "ENSOTECHPARAMS.CLOSESTDISTANCE";
    public static final String substationBuildSum_Attr = "substationBuildSum";
    public static final String substationBuildSum_Field = "SUBSTATIONBUILDSUM";
    public static final String substationBuildSum_QFielld = "ENSOTECHPARAMS.SUBSTATIONBUILDSUM";
    public static final String calculationSum_Attr = "calculationSum";
    public static final String calculationSum_Field = "CALCULATIONSUM";
    public static final String calculationSum_QFielld = "ENSOTECHPARAMS.CALCULATIONSUM";
    public static final String closestDistance2_Attr = "closestDistance2";
    public static final String closestDistance2_Field = "CLOSESTDISTANCE2";
    public static final String closestDistance2_QFielld = "ENSOTECHPARAMS.CLOSESTDISTANCE2";
    public static final String infoDistance2_Attr = "infoDistance2";
    public static final String infoDistance2_Field = "INFODISTANCE2";
    public static final String infoDistance2_QFielld = "ENSOTECHPARAMS.INFODISTANCE2";
    public static final String object4closestDistanceName_Attr = "object4closestDistanceName";
    public static final String object4closestDistanceName_Field = "OBJECT4CLOSESTDISTANCENAME";
    public static final String object4closestDistanceName_QFielld = "ENSOTECHPARAMS.OBJECT4CLOSESTDISTNCNM";
    public static final String object4closestDistance2Name_Attr = "object4closestDistance2Name";
    public static final String object4closestDistance2Name_Field = "OBJECT4CLOSESTDISTANCE2NAME";
    public static final String object4closestDistance2Name_QFielld = "ENSOTECHPARAMS.OBJECT4CLOSESTDSTNC2NM";
    public static final String cityTypeName_Attr = "cityTypeName";
    public static final String cityTypeName_Field = "CITYTYPENAME";
    public static final String cityTypeName_QFielld = "ENSOTECHPARAMS.CITYTYPENAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSOTECHPARAMS.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSOTECHPARAMS.MODIFY_TIME";

    public static final String levelRef_Attr = "levelRef";
    public static final String levelRef_Field = "LEVELREFCODE";
    public static final String  levelRef_QFielld = "ENSOTECHPARAMS.LEVELREFCODE";
    public static final String categoryRef_Attr = "categoryRef";
    public static final String categoryRef_Field = "CATEGORYREFCODE";
    public static final String  categoryRef_QFielld = "ENSOTECHPARAMS.CATEGORYREFCODE";
    public static final String powerPointRef_Attr = "powerPointRef";
    public static final String powerPointRef_Field = "POWERPOINTREFCODE";
    public static final String  powerPointRef_QFielld = "ENSOTECHPARAMS.POWERPOINTREFCODE";
    public static final String phasityRef_Attr = "phasityRef";
    public static final String phasityRef_Field = "PHASITYREFCODE";
    public static final String  phasityRef_QFielld = "ENSOTECHPARAMS.PHASITYREFCODE";
    public static final String lineTypeRef_Attr = "lineTypeRef";
    public static final String lineTypeRef_Field = "LINETYPEREFCODE";
    public static final String  lineTypeRef_QFielld = "ENSOTECHPARAMS.LINETYPEREFCODE";
    public static final String installationTypeRef_Attr = "installationTypeRef";
    public static final String installationTypeRef_Field = "INSTALLATIONTYPEREFCOD";
    public static final String  installationTypeRef_QFielld = "ENSOTECHPARAMS.INSTALLATIONTYPEREFCOD";
    public static final String locationTypeRef_Attr = "locationTypeRef";
    public static final String locationTypeRef_Field = "LOCATIONTYPEREFCODE";
    public static final String  locationTypeRef_QFielld = "ENSOTECHPARAMS.LOCATIONTYPEREFCODE";
    public static final String cityTypeRef_Attr = "cityTypeRef";
    public static final String cityTypeRef_Field = "CITYTYPEREFCODE";
    public static final String  cityTypeRef_QFielld = "ENSOTECHPARAMS.CITYTYPEREFCODE";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENSOTECHPARAMS.SERVICESOBJECTCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public int getClosestDistance(){
       return closestDistance;
    }
    
    public void setClosestDistance(int closestDistance){
       this.closestDistance = closestDistance;
    }


    public BigDecimal getSubstationBuildSum(){
       return substationBuildSum;
    }
    
    public void setSubstationBuildSum(BigDecimal substationBuildSum){
       this.substationBuildSum = substationBuildSum;
    }


    public BigDecimal getCalculationSum(){
       return calculationSum;
    }
    
    public void setCalculationSum(BigDecimal calculationSum){
       this.calculationSum = calculationSum;
    }


    public int getClosestDistance2(){
       return closestDistance2;
    }
    
    public void setClosestDistance2(int closestDistance2){
       this.closestDistance2 = closestDistance2;
    }


    public int getInfoDistance2(){
       return infoDistance2;
    }
    
    public void setInfoDistance2(int infoDistance2){
       this.infoDistance2 = infoDistance2;
    }


    public String getObject4closestDistanceName(){
       return object4closestDistanceName;
    }
    
    public void setObject4closestDistanceName(String object4closestDistanceName){
       this.object4closestDistanceName = object4closestDistanceName;
    }


    public String getObject4closestDistance2Name(){
       return object4closestDistance2Name;
    }
    
    public void setObject4closestDistance2Name(String object4closestDistance2Name){
       this.object4closestDistance2Name = object4closestDistance2Name;
    }


    public String getCityTypeName(){
       return cityTypeName;
    }
    
    public void setCityTypeName(String cityTypeName){
       this.cityTypeName = cityTypeName;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENConnectionLevelRef getLevelRef(){
       return levelRef;
    }
    
    public void setLevelRef(ENConnectionLevelRef levelRef){
       this.levelRef = levelRef;
    }
    public ENPowerReliabilityCategoryRef getCategoryRef(){
       return categoryRef;
    }
    
    public void setCategoryRef(ENPowerReliabilityCategoryRef categoryRef){
       this.categoryRef = categoryRef;
    }
    public ENConnectionPowerPointRef getPowerPointRef(){
       return powerPointRef;
    }
    
    public void setPowerPointRef(ENConnectionPowerPointRef powerPointRef){
       this.powerPointRef = powerPointRef;
    }
    public ENConnectionPhasityRef getPhasityRef(){
       return phasityRef;
    }
    
    public void setPhasityRef(ENConnectionPhasityRef phasityRef){
       this.phasityRef = phasityRef;
    }
    public ENConnectionLineTypeRef getLineTypeRef(){
       return lineTypeRef;
    }
    
    public void setLineTypeRef(ENConnectionLineTypeRef lineTypeRef){
       this.lineTypeRef = lineTypeRef;
    }
    public ENConnectionInstallationTypeRef getInstallationTypeRef(){
       return installationTypeRef;
    }
    
    public void setInstallationTypeRef(ENConnectionInstallationTypeRef installationTypeRef){
       this.installationTypeRef = installationTypeRef;
    }
    public ENConnectionLocationTypeRef getLocationTypeRef(){
       return locationTypeRef;
    }
    
    public void setLocationTypeRef(ENConnectionLocationTypeRef locationTypeRef){
       this.locationTypeRef = locationTypeRef;
    }
    public ENConnectionCityTypeRef getCityTypeRef(){
       return cityTypeRef;
    }
    
    public void setCityTypeRef(ENConnectionCityTypeRef cityTypeRef){
       this.cityTypeRef = cityTypeRef;
    }
    public ENServicesObjectRef getServicesobject(){
       return servicesobject;
    }
    
    public void setServicesobject(ENServicesObjectRef servicesobject){
       this.servicesobject = servicesobject;
    }

} // end of ENSOTechParamsValueObject

