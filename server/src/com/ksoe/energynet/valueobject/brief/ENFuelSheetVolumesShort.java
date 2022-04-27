
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENFuelSheetVolumes;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelSheetVolumesShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public Date dateGen ;
    public Date startDate ;
    public Date endDate ;
    public int fuelType = Integer.MIN_VALUE;
    /////
    public String fuelTypeName;
	/////
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;

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

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setStartDate(Date aValue){
       startDate = aValue;
    }

    public Date getStartDate(){
       return startDate;
    }

    public void setEndDate(Date aValue){
       endDate = aValue;
    }

    public Date getEndDate(){
       return endDate;
    }
    public void setFuelType(int aValue){
       fuelType = aValue;
    }

    public int getFuelType(){
       return fuelType;
    }
    
    /////
    public String getFuelTypeName() {
		return fuelTypeName;
	}

	public void setFuelTypeName(String fuelTypeName) {
		this.fuelTypeName = fuelTypeName;
	}
	/////
	
    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
    }



}