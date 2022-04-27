
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINDoc2Act2WorkOrder;  	
  */

import java.io.Serializable;
import java.util.Date;


public class FINDoc2Act2WorkOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int finDocCode300 = Integer.MIN_VALUE; 
	public String axJournalId;
    public int actRefCode = Integer.MIN_VALUE; 
    public String actRefNumberGen; 
    public Date actRefDateGen; 
    public int actRefFinDocCode = Integer.MIN_VALUE; 
    public int actRefFinDocMechanicCode = Integer.MIN_VALUE; 
    public String actRefFinMolName; 
    public String actRefFinMechanicName; 
    public String actRefInvNumber; 
    public String actRefBuhName; 
    public String actRefUserGen; 
    public Date actRefDateEdit; 
    public Date actRefDateAct;
    public int workOrderRefCode = Integer.MIN_VALUE; 
    public String workOrderRefWorkOrderNumber; 
    public Date workOrderRefDateGen; 
    public String workOrderRefFinMolCode; 
    public String workOrderRefFinMolName; 
    public String workOrderRefFinMechanicCode; 
    public String workOrderRefFinMechanicName; 
    public String workOrderRefUserGen; 
    public Date workOrderRefDateEdit; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setFinDocCode300(int aValue){
       finDocCode300 = aValue;
    }
    public int getFinDocCode300(){
       return finDocCode300;
    }
	
public void setAxJournalId(String aValue){
		axJournalId = aValue;
	}

	public String getAxJournalId(){
		return axJournalId;
	}


    public void setActRefCode(int aValue){
       actRefCode = aValue;
    }
    public int getActRefCode(){
       return actRefCode;
    }
	
    public void setActRefNumberGen(String aValue){
       actRefNumberGen = aValue;
    }
    public String getActRefNumberGen(){
       return actRefNumberGen;
    }
	
    public void setActRefDateGen(Date aValue){
       actRefDateGen = aValue;
    }
    public Date getActRefDateGen(){
       return actRefDateGen;
    }
	
    public void setActRefFinDocCode(int aValue){
       actRefFinDocCode = aValue;
    }
    public int getActRefFinDocCode(){
       return actRefFinDocCode;
    }
	
    public void setActRefFinDocMechanicCode(int aValue){
       actRefFinDocMechanicCode = aValue;
    }
    public int getActRefFinDocMechanicCode(){
       return actRefFinDocMechanicCode;
    }
	
    public void setActRefFinMolName(String aValue){
       actRefFinMolName = aValue;
    }
    public String getActRefFinMolName(){
       return actRefFinMolName;
    }
	
    public void setActRefFinMechanicName(String aValue){
       actRefFinMechanicName = aValue;
    }
    public String getActRefFinMechanicName(){
       return actRefFinMechanicName;
    }
	
    public void setActRefInvNumber(String aValue){
       actRefInvNumber = aValue;
    }
    public String getActRefInvNumber(){
       return actRefInvNumber;
    }
	
    public void setActRefBuhName(String aValue){
       actRefBuhName = aValue;
    }
    public String getActRefBuhName(){
       return actRefBuhName;
    }
	
    public void setActRefUserGen(String aValue){
       actRefUserGen = aValue;
    }
    public String getActRefUserGen(){
       return actRefUserGen;
    }
	
    public void setActRefDateEdit(Date aValue){
       actRefDateEdit = aValue;
    }
    public Date getActRefDateEdit(){
       return actRefDateEdit;
    }
	
    public void setActRefDateAct(Date aValue){
		actRefDateAct = aValue;
	}
	public Date getActRefDateAct(){
		return actRefDateAct;
	}
    public void setWorkOrderRefCode(int aValue){
       workOrderRefCode = aValue;
    }
    public int getWorkOrderRefCode(){
       return workOrderRefCode;
    }
	
    public void setWorkOrderRefWorkOrderNumber(String aValue){
       workOrderRefWorkOrderNumber = aValue;
    }
    public String getWorkOrderRefWorkOrderNumber(){
       return workOrderRefWorkOrderNumber;
    }
	
    public void setWorkOrderRefDateGen(Date aValue){
       workOrderRefDateGen = aValue;
    }
    public Date getWorkOrderRefDateGen(){
       return workOrderRefDateGen;
    }
	
    public void setWorkOrderRefFinMolCode(String aValue){
       workOrderRefFinMolCode = aValue;
    }
    public String getWorkOrderRefFinMolCode(){
       return workOrderRefFinMolCode;
    }
	
    public void setWorkOrderRefFinMolName(String aValue){
       workOrderRefFinMolName = aValue;
    }
    public String getWorkOrderRefFinMolName(){
       return workOrderRefFinMolName;
    }
	
    public void setWorkOrderRefFinMechanicCode(String aValue){
       workOrderRefFinMechanicCode = aValue;
    }
    public String getWorkOrderRefFinMechanicCode(){
       return workOrderRefFinMechanicCode;
    }
	
    public void setWorkOrderRefFinMechanicName(String aValue){
       workOrderRefFinMechanicName = aValue;
    }
    public String getWorkOrderRefFinMechanicName(){
       return workOrderRefFinMechanicName;
    }
	
    public void setWorkOrderRefUserGen(String aValue){
       workOrderRefUserGen = aValue;
    }
    public String getWorkOrderRefUserGen(){
       return workOrderRefUserGen;
    }
	
    public void setWorkOrderRefDateEdit(Date aValue){
       workOrderRefDateEdit = aValue;
    }
    public Date getWorkOrderRefDateEdit(){
       return workOrderRefDateEdit;
    }
	



}