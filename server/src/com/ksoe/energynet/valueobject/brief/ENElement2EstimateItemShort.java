
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENElement2EstimateItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENElement2EstimateItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int elementRefCode = Integer.MIN_VALUE;
    public int elementTypeRefCode = Integer.MIN_VALUE;
    public String elementTypeRefName;
    public int estimateItemRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemRefCountGen;
    public BigDecimal estimateItemRefCountFact;
    public BigDecimal estimateItemRefPrice;
    public BigDecimal estimateItemRefCost;
    public int estimateItemRefDeliveryTime = Integer.MIN_VALUE;
    public int estimateItemRefUseWorkTime = Integer.MIN_VALUE;
    public String estimateItemRefUserGen;
    public Date estimateItemRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setElementRefCode(int aValue){
       elementRefCode = aValue;
    }
    public int getElementRefCode(){
       return elementRefCode;
    }

    public void setElementTypeRefCode(int aValue){
       elementTypeRefCode = aValue;
    }
    public int getElementTypeRefCode(){
       return elementTypeRefCode;
    }

    public void setElementTypeRefName(String aValue){
       elementTypeRefName = aValue;
    }
    public String getElementTypeRefName(){
       return elementTypeRefName;
    }

    public void setEstimateItemRefCode(int aValue){
       estimateItemRefCode = aValue;
    }
    public int getEstimateItemRefCode(){
       return estimateItemRefCode;
    }

    public void setEstimateItemRefCountGen(BigDecimal aValue){
       estimateItemRefCountGen = aValue;
    }
    public BigDecimal getEstimateItemRefCountGen(){
       return estimateItemRefCountGen;
    }

    public void setEstimateItemRefCountFact(BigDecimal aValue){
       estimateItemRefCountFact = aValue;
    }
    public BigDecimal getEstimateItemRefCountFact(){
       return estimateItemRefCountFact;
    }

    public void setEstimateItemRefPrice(BigDecimal aValue){
       estimateItemRefPrice = aValue;
    }
    public BigDecimal getEstimateItemRefPrice(){
       return estimateItemRefPrice;
    }

    public void setEstimateItemRefCost(BigDecimal aValue){
       estimateItemRefCost = aValue;
    }
    public BigDecimal getEstimateItemRefCost(){
       return estimateItemRefCost;
    }

    public void setEstimateItemRefDeliveryTime(int aValue){
       estimateItemRefDeliveryTime = aValue;
    }
    public int getEstimateItemRefDeliveryTime(){
       return estimateItemRefDeliveryTime;
    }

    public void setEstimateItemRefUseWorkTime(int aValue){
       estimateItemRefUseWorkTime = aValue;
    }
    public int getEstimateItemRefUseWorkTime(){
       return estimateItemRefUseWorkTime;
    }

    public void setEstimateItemRefUserGen(String aValue){
       estimateItemRefUserGen = aValue;
    }
    public String getEstimateItemRefUserGen(){
       return estimateItemRefUserGen;
    }


    public void setEstimateItemRefDateEdit(Date aValue){
       estimateItemRefDateEdit = aValue;
    }
    public Date getEstimateItemRefDateEdit(){
       return estimateItemRefDateEdit;
    }



}