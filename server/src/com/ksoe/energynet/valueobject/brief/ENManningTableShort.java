
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENManningTable;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENManningTableShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public Date dateStart; 
    public Date dateFinal; 
    public int positionCode = Integer.MIN_VALUE; 
    public String positionName; 
    public int departmentCode = Integer.MIN_VALUE; 
    public String departmentShortName; 
    public Date departmentDateStart; 
    public Date departmentDateFinal; 


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
	
    public void setDateStart(Date aValue){
       dateStart = aValue;
    }
    public Date getDateStart(){
       return dateStart;
    }
	
    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }
    public Date getDateFinal(){
       return dateFinal;
    }
	

    public void setPositionCode(int aValue){
       positionCode = aValue;
    }
    public int getPositionCode(){
       return positionCode;
    }
	
    public void setPositionName(String aValue){
       positionName = aValue;
    }
    public String getPositionName(){
       return positionName;
    }
	
    public void setDepartmentCode(int aValue){
       departmentCode = aValue;
    }
    public int getDepartmentCode(){
       return departmentCode;
    }
	
    public void setDepartmentShortName(String aValue){
       departmentShortName = aValue;
    }
    public String getDepartmentShortName(){
       return departmentShortName;
    }
	
    public void setDepartmentDateStart(Date aValue){
       departmentDateStart = aValue;
    }
    public Date getDepartmentDateStart(){
       return departmentDateStart;
    }
	
    public void setDepartmentDateFinal(Date aValue){
       departmentDateFinal = aValue;
    }
    public Date getDepartmentDateFinal(){
       return departmentDateFinal;
    }
	



}