
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINDoc2WorkOrder;  	
  */

import java.io.Serializable;
import java.util.Date;


public class FINDoc2WorkOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int finDocMOLCode = Integer.MIN_VALUE; 
    public int finDocMechanicCode = Integer.MIN_VALUE; 
    public int typeRefCode = Integer.MIN_VALUE; 
    public String typeRefName; 
    public int workOrderRefCode = Integer.MIN_VALUE; 
    public String workOrderRefWorkOrderNumber; 
    public Date workOrderRefDateGen; 
    public String workOrderRefFinMolName; 
    public String workOrderRefFinMechanicName; 
    public String workOrderRefUserGen; 
    public Date workOrderRefDateEdit; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setFinDocMOLCode(int aValue){
       finDocMOLCode = aValue;
    }
    public int getFinDocMOLCode(){
       return finDocMOLCode;
    }
	
    public void setFinDocMechanicCode(int aValue){
       finDocMechanicCode = aValue;
    }
    public int getFinDocMechanicCode(){
       return finDocMechanicCode;
    }
	

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }
	
    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
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
	
    public void setWorkOrderRefFinMolName(String aValue){
       workOrderRefFinMolName = aValue;
    }
    public String getWorkOrderRefFinMolName(){
       return workOrderRefFinMolName;
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