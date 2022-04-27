
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINDoc2Act;  	
  */

import java.io.Serializable;
import java.util.Date;


public class FINDoc2ActShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int finDocMOLCode = Integer.MIN_VALUE; 
    public int finDocMechanicCode = Integer.MIN_VALUE; 
    public int typeRefCode = Integer.MIN_VALUE; 
    public String typeRefName; 
    public int actRefCode = Integer.MIN_VALUE; 
    public String actRefNumberGen; 
    public Date actRefDateGen; 
    public int actRefFinDocCode = Integer.MIN_VALUE; 
    public int actRefFinDocMechanicCode = Integer.MIN_VALUE; 
    public String actRefFinMolName; 
    public String actRefFinMechanicName; 
    public String actRefUserGen; 
    public Date actRefDateEdit; 


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
	



}