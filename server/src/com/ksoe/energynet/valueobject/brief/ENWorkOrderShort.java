
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENWorkOrder;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENWorkOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String workOrderNumber; 
    public Date dateGen; 
	public String finMolCode;
    public String finMolName; 
	public String finMechanicCode;
    public String finMechanicName; 
    public String userGen; 
    public Date dateEdit; 
    public int departmentCode = Integer.MIN_VALUE; 
    public String departmentShortName; 
    public Date departmentDateStart; 
    public Date departmentDateFinal; 
    public int statusWorkOrderCode = Integer.MIN_VALUE; 
    public String statusWorkOrderName; 

    public int planRefCode = Integer.MIN_VALUE;
    

    public int getPlanRefCode() {
		return planRefCode;
	}
	public void setPlanRefCode(int planRefCode) {
		this.planRefCode = planRefCode;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setWorkOrderNumber(String aValue){
       workOrderNumber = aValue;
    }
    public String getWorkOrderNumber(){
       return workOrderNumber;
    }
	
    public void setDateGen(Date aValue){
       dateGen = aValue;
    }
    public Date getDateGen(){
       return dateGen;
    }
	
    public void setFinMolCode(String aValue){
       finMolCode = aValue;
    }

    public String getFinMolCode(){
       return finMolCode;
    }

    public void setFinMechanicCode(String aValue){
       finMechanicCode = aValue;
    }

    public String getFinMechanicCode(){
       return finMechanicCode;
    }
	
    public void setFinMolName(String aValue){
       finMolName = aValue;
    }
    public String getFinMolName(){
       return finMolName;
    }
	
    public void setFinMechanicName(String aValue){
       finMechanicName = aValue;
    }
    public String getFinMechanicName(){
       return finMechanicName;
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
	
    public void setStatusWorkOrderCode(int aValue){
       statusWorkOrderCode = aValue;
    }
    public int getStatusWorkOrderCode(){
       return statusWorkOrderCode;
    }
	
    public void setStatusWorkOrderName(String aValue){
       statusWorkOrderName = aValue;
    }
    public String getStatusWorkOrderName(){
       return statusWorkOrderName;
    }
	



}