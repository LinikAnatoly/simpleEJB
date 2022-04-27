
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSITEquipment;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENSITEquipmentShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String serialnumber; 
    public String suppliername; 
    public String num; 
    public Date supplierdate; 
    public String lisencepack; 
    public String descr; 
    public String location; 
    public Date installdate; 
    public Date inputdate; 
    public int objectTypeCode = Integer.MIN_VALUE; 
    public String objectTypeName; 
    public String objectTypeDescription; 
    public String ren;
    public int elementCode = Integer.MIN_VALUE; 
    public int finworkerCode = Integer.MIN_VALUE; 


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
	
    public void setLisencepack(String aValue){
       lisencepack = aValue;
    }
    public String getLisencepack(){
       return lisencepack;
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
	

    public void setObjectTypeCode(int aValue){
       objectTypeCode = aValue;
    }
    public int getObjectTypeCode(){
       return objectTypeCode;
    }
	
    public void setObjectTypeName(String aValue){
       objectTypeName = aValue;
    }
    public String getObjectTypeName(){
       return objectTypeName;
    }
	
    public void setObjectTypeDescription(String aValue){
       objectTypeDescription = aValue;
    }
    public String getObjectTypeDescription(){
       return objectTypeDescription;
    }
	
    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }
	
    public void setFinworkerCode(int aValue){
       finworkerCode = aValue;
    }
    public int getFinworkerCode(){
       return finworkerCode;
    }
	public String getRen() {
		return ren;
	}
	public void setRen(String ren) {
		this.ren = ren;
	}
	



}