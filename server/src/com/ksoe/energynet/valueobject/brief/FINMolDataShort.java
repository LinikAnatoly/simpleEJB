
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINMolData;  	
  */

import java.io.Serializable;
import java.util.Date;


public class FINMolDataShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String finMolCode; 
    public String finMolName; 
    public int molTypeRefCode = Integer.MIN_VALUE; 
    public String molTypeRefName; 
    public int actCode = Integer.MIN_VALUE; 
    public String actNumberGen; 
    public Date actDateGen; 
    public int actFinDocCode = Integer.MIN_VALUE; 
    public int actFinDocMechanicCode = Integer.MIN_VALUE; 
    public String actFinMolName; 
    public String actFinMechanicName; 
    public String actUserGen; 
    public Date actDateEdit; 
    public int workOrderCode = Integer.MIN_VALUE; 
    public String workOrderWorkOrderNumber; 
    public Date workOrderDateGen; 
    public String workOrderFinMolCode; 
    public String workOrderFinMolName; 
    public String workOrderFinMechanicCode; 
    public String workOrderFinMechanicName; 
    public String workOrderUserGen; 
    public Date workOrderDateEdit;
    public String phoneNumber;


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setFinMolCode(String aValue){
       finMolCode = aValue;
    }
    public String getFinMolCode(){
       return finMolCode;
    }
	
    public void setFinMolName(String aValue){
       finMolName = aValue;
    }
    public String getFinMolName(){
       return finMolName;
    }
	

    public void setMolTypeRefCode(int aValue){
       molTypeRefCode = aValue;
    }
    public int getMolTypeRefCode(){
       return molTypeRefCode;
    }
	
    public void setMolTypeRefName(String aValue){
       molTypeRefName = aValue;
    }
    public String getMolTypeRefName(){
       return molTypeRefName;
    }
	
    public void setActCode(int aValue){
       actCode = aValue;
    }
    public int getActCode(){
       return actCode;
    }
	
    public void setActNumberGen(String aValue){
       actNumberGen = aValue;
    }
    public String getActNumberGen(){
       return actNumberGen;
    }
	
    public void setActDateGen(Date aValue){
       actDateGen = aValue;
    }
    public Date getActDateGen(){
       return actDateGen;
    }
	
    public void setActFinDocCode(int aValue){
       actFinDocCode = aValue;
    }
    public int getActFinDocCode(){
       return actFinDocCode;
    }
	
    public void setActFinDocMechanicCode(int aValue){
       actFinDocMechanicCode = aValue;
    }
    public int getActFinDocMechanicCode(){
       return actFinDocMechanicCode;
    }
	
    public void setActFinMolName(String aValue){
       actFinMolName = aValue;
    }
    public String getActFinMolName(){
       return actFinMolName;
    }
	
    public void setActFinMechanicName(String aValue){
       actFinMechanicName = aValue;
    }
    public String getActFinMechanicName(){
       return actFinMechanicName;
    }
	
    public void setActUserGen(String aValue){
       actUserGen = aValue;
    }
    public String getActUserGen(){
       return actUserGen;
    }
	
    public void setActDateEdit(Date aValue){
       actDateEdit = aValue;
    }
    public Date getActDateEdit(){
       return actDateEdit;
    }
	
    public void setWorkOrderCode(int aValue){
       workOrderCode = aValue;
    }
    public int getWorkOrderCode(){
       return workOrderCode;
    }
	
    public void setWorkOrderWorkOrderNumber(String aValue){
       workOrderWorkOrderNumber = aValue;
    }
    public String getWorkOrderWorkOrderNumber(){
       return workOrderWorkOrderNumber;
    }
	
    public void setWorkOrderDateGen(Date aValue){
       workOrderDateGen = aValue;
    }
    public Date getWorkOrderDateGen(){
       return workOrderDateGen;
    }
	
    public void setWorkOrderFinMolCode(String aValue){
       workOrderFinMolCode = aValue;
    }
    public String getWorkOrderFinMolCode(){
       return workOrderFinMolCode;
    }
	
    public void setWorkOrderFinMolName(String aValue){
       workOrderFinMolName = aValue;
    }
    public String getWorkOrderFinMolName(){
       return workOrderFinMolName;
    }
	
    public void setWorkOrderFinMechanicCode(String aValue){
       workOrderFinMechanicCode = aValue;
    }
    public String getWorkOrderFinMechanicCode(){
       return workOrderFinMechanicCode;
    }
	
    public void setWorkOrderFinMechanicName(String aValue){
       workOrderFinMechanicName = aValue;
    }
    public String getWorkOrderFinMechanicName(){
       return workOrderFinMechanicName;
    }
	
    public void setWorkOrderUserGen(String aValue){
       workOrderUserGen = aValue;
    }
    public String getWorkOrderUserGen(){
       return workOrderUserGen;
    }
	
    public void setWorkOrderDateEdit(Date aValue){
       workOrderDateEdit = aValue;
    }
    public Date getWorkOrderDateEdit(){
       return workOrderDateEdit;
    }
    
    public void setPhoneNumber(String aValue){
        phoneNumber = aValue;
     }
     public String getPhoneNumber(){
        return phoneNumber;
     }
	



}