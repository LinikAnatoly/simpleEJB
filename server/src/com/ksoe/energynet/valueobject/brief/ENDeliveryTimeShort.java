
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDeliveryTime;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENDeliveryTimeShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public BigDecimal deliveryTimePlan; 
    public BigDecimal deliveryTimeFact; 
    public int deliveryKindCode = Integer.MIN_VALUE; 
    public String deliveryKindName; 
    public int humenItemRefCode = Integer.MIN_VALUE; 
    public BigDecimal humenItemRefCountGen; 
    public BigDecimal humenItemRefCountFact; 
    public BigDecimal humenItemRefPrice; 
    public BigDecimal humenItemRefCost; 
    public String humenItemRefUserGen; 
    public Date humenItemRefDateEdit; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setDeliveryTimePlan(BigDecimal aValue){
       deliveryTimePlan = aValue;
    }
    public BigDecimal getDeliveryTimePlan(){
       return deliveryTimePlan;
    }
	
    public void setDeliveryTimeFact(BigDecimal aValue){
       deliveryTimeFact = aValue;
    }
    public BigDecimal getDeliveryTimeFact(){
       return deliveryTimeFact;
    }
	

    public void setDeliveryKindCode(int aValue){
       deliveryKindCode = aValue;
    }
    public int getDeliveryKindCode(){
       return deliveryKindCode;
    }
	
    public void setDeliveryKindName(String aValue){
       deliveryKindName = aValue;
    }
    public String getDeliveryKindName(){
       return deliveryKindName;
    }
	
    public void setHumenItemRefCode(int aValue){
       humenItemRefCode = aValue;
    }
    public int getHumenItemRefCode(){
       return humenItemRefCode;
    }
	
    public void setHumenItemRefCountGen(BigDecimal aValue){
       humenItemRefCountGen = aValue;
    }
    public BigDecimal getHumenItemRefCountGen(){
       return humenItemRefCountGen;
    }
	
    public void setHumenItemRefCountFact(BigDecimal aValue){
       humenItemRefCountFact = aValue;
    }
    public BigDecimal getHumenItemRefCountFact(){
       return humenItemRefCountFact;
    }
	
    public void setHumenItemRefPrice(BigDecimal aValue){
       humenItemRefPrice = aValue;
    }
    public BigDecimal getHumenItemRefPrice(){
       return humenItemRefPrice;
    }
	
    public void setHumenItemRefCost(BigDecimal aValue){
       humenItemRefCost = aValue;
    }
    public BigDecimal getHumenItemRefCost(){
       return humenItemRefCost;
    }
	
    public void setHumenItemRefUserGen(String aValue){
       humenItemRefUserGen = aValue;
    }
    public String getHumenItemRefUserGen(){
       return humenItemRefUserGen;
    }
	
    public void setHumenItemRefDateEdit(Date aValue){
       humenItemRefDateEdit = aValue;
    }
    public Date getHumenItemRefDateEdit(){
       return humenItemRefDateEdit;
    }
	



}