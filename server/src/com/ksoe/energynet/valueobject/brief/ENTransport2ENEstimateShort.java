
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransport2ENEstimate;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransport2ENEstimateShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int transportRefCode = Integer.MIN_VALUE; 
    public int estimateRefCode = Integer.MIN_VALUE; 
    public BigDecimal estimateRefCountGen; 
    public BigDecimal estimateRefCountFact; 
    public BigDecimal estimateRefPrice; 
    public BigDecimal estimateRefCost; 
    public String estimateRefUserGen; 
    public Date estimateRefDateEdit; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setTransportRefCode(int aValue){
       transportRefCode = aValue;
    }
    public int getTransportRefCode(){
       return transportRefCode;
    }
	
    public void setEstimateRefCode(int aValue){
       estimateRefCode = aValue;
    }
    public int getEstimateRefCode(){
       return estimateRefCode;
    }
	
    public void setEstimateRefCountGen(BigDecimal aValue){
       estimateRefCountGen = aValue;
    }
    public BigDecimal getEstimateRefCountGen(){
       return estimateRefCountGen;
    }
	
    public void setEstimateRefCountFact(BigDecimal aValue){
       estimateRefCountFact = aValue;
    }
    public BigDecimal getEstimateRefCountFact(){
       return estimateRefCountFact;
    }
	
    public void setEstimateRefPrice(BigDecimal aValue){
       estimateRefPrice = aValue;
    }
    public BigDecimal getEstimateRefPrice(){
       return estimateRefPrice;
    }
	
    public void setEstimateRefCost(BigDecimal aValue){
       estimateRefCost = aValue;
    }
    public BigDecimal getEstimateRefCost(){
       return estimateRefCost;
    }
	
    public void setEstimateRefUserGen(String aValue){
       estimateRefUserGen = aValue;
    }
    public String getEstimateRefUserGen(){
       return estimateRefUserGen;
    }
	
    public void setEstimateRefDateEdit(Date aValue){
       estimateRefDateEdit = aValue;
    }
    public Date getEstimateRefDateEdit(){
       return estimateRefDateEdit;
    }
	



}