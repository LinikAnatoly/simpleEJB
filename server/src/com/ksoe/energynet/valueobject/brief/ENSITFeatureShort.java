
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSITFeature;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENSITFeatureShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String value; 
    public int equipmentCode = Integer.MIN_VALUE; 
    public String equipmentName; 
    public String equipmentSerialnumber; 
    public String equipmentSuppliername; 
    public String equipmentNum; 
    public Date equipmentSupplierdate; 
    public String equipmentLisencepack; 
    public String equipmentDescr; 
    public String equipmentLocation; 
    public Date equipmentInstalldate; 
    public Date equipmentInputdate; 
    public int featureTypeCode = Integer.MIN_VALUE; 
    public String featureTypeName; 
    public String featureTypeDesc; 


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
	
    public void setValue(String aValue){
       value = aValue;
    }
    public String getValue(){
       return value;
    }
	

    public void setEquipmentCode(int aValue){
       equipmentCode = aValue;
    }
    public int getEquipmentCode(){
       return equipmentCode;
    }
	
    public void setEquipmentName(String aValue){
       equipmentName = aValue;
    }
    public String getEquipmentName(){
       return equipmentName;
    }
	
    public void setEquipmentSerialnumber(String aValue){
       equipmentSerialnumber = aValue;
    }
    public String getEquipmentSerialnumber(){
       return equipmentSerialnumber;
    }
	
    public void setEquipmentSuppliername(String aValue){
       equipmentSuppliername = aValue;
    }
    public String getEquipmentSuppliername(){
       return equipmentSuppliername;
    }
	
    public void setEquipmentNum(String aValue){
       equipmentNum = aValue;
    }
    public String getEquipmentNum(){
       return equipmentNum;
    }
	
    public void setEquipmentSupplierdate(Date aValue){
       equipmentSupplierdate = aValue;
    }
    public Date getEquipmentSupplierdate(){
       return equipmentSupplierdate;
    }
	
    public void setEquipmentLisencepack(String aValue){
       equipmentLisencepack = aValue;
    }
    public String getEquipmentLisencepack(){
       return equipmentLisencepack;
    }
	
    public void setEquipmentDescr(String aValue){
       equipmentDescr = aValue;
    }
    public String getEquipmentDescr(){
       return equipmentDescr;
    }
	
    public void setEquipmentLocation(String aValue){
       equipmentLocation = aValue;
    }
    public String getEquipmentLocation(){
       return equipmentLocation;
    }
	
    public void setEquipmentInstalldate(Date aValue){
       equipmentInstalldate = aValue;
    }
    public Date getEquipmentInstalldate(){
       return equipmentInstalldate;
    }
	
    public void setEquipmentInputdate(Date aValue){
       equipmentInputdate = aValue;
    }
    public Date getEquipmentInputdate(){
       return equipmentInputdate;
    }
	
    public void setFeatureTypeCode(int aValue){
       featureTypeCode = aValue;
    }
    public int getFeatureTypeCode(){
       return featureTypeCode;
    }
	
    public void setFeatureTypeName(String aValue){
       featureTypeName = aValue;
    }
    public String getFeatureTypeName(){
       return featureTypeName;
    }
	
    public void setFeatureTypeDesc(String aValue){
       featureTypeDesc = aValue;
    }
    public String getFeatureTypeDesc(){
       return featureTypeDesc;
    }
	



}