
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimate2ENEstimateDiv;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENEstimate2ENEstimateDivShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public int estimateItemInRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemInRefCountGen;
    public BigDecimal estimateItemInRefCountFact;
    public BigDecimal estimateItemInRefPrice;
    public BigDecimal estimateItemInRefCost;
    public int estimateItemInRefIsUseVAT = Integer.MIN_VALUE;
    public int estimateItemInRefDeliveryTime = Integer.MIN_VALUE;
    public int estimateItemInRefUseWorkTime = Integer.MIN_VALUE;
    public String estimateItemInRefUserGen;
    public Date estimateItemInRefDateEdit;
    public int estimateItemOutRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemOutRefCountGen;
    public BigDecimal estimateItemOutRefCountFact;
    public BigDecimal estimateItemOutRefPrice;
    public BigDecimal estimateItemOutRefCost;
    public int estimateItemOutRefIsUseVAT = Integer.MIN_VALUE;
    public int estimateItemOutRefDeliveryTime = Integer.MIN_VALUE;
    public int estimateItemOutRefUseWorkTime = Integer.MIN_VALUE;
    public String estimateItemOutRefUserGen;
    public Date estimateItemOutRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }


    public void setEstimateItemInRefCode(int aValue){
       estimateItemInRefCode = aValue;
    }
    public int getEstimateItemInRefCode(){
       return estimateItemInRefCode;
    }

    public void setEstimateItemInRefCountGen(BigDecimal aValue){
       estimateItemInRefCountGen = aValue;
    }
    public BigDecimal getEstimateItemInRefCountGen(){
       return estimateItemInRefCountGen;
    }

    public void setEstimateItemInRefCountFact(BigDecimal aValue){
       estimateItemInRefCountFact = aValue;
    }
    public BigDecimal getEstimateItemInRefCountFact(){
       return estimateItemInRefCountFact;
    }

    public void setEstimateItemInRefPrice(BigDecimal aValue){
       estimateItemInRefPrice = aValue;
    }
    public BigDecimal getEstimateItemInRefPrice(){
       return estimateItemInRefPrice;
    }

    public void setEstimateItemInRefCost(BigDecimal aValue){
       estimateItemInRefCost = aValue;
    }
    public BigDecimal getEstimateItemInRefCost(){
       return estimateItemInRefCost;
    }

    public void setEstimateItemInRefIsUseVAT(int aValue){
       estimateItemInRefIsUseVAT = aValue;
    }
    public int getEstimateItemInRefIsUseVAT(){
       return estimateItemInRefIsUseVAT;
    }

    public void setEstimateItemInRefDeliveryTime(int aValue){
       estimateItemInRefDeliveryTime = aValue;
    }
    public int getEstimateItemInRefDeliveryTime(){
       return estimateItemInRefDeliveryTime;
    }

    public void setEstimateItemInRefUseWorkTime(int aValue){
       estimateItemInRefUseWorkTime = aValue;
    }
    public int getEstimateItemInRefUseWorkTime(){
       return estimateItemInRefUseWorkTime;
    }

    public void setEstimateItemInRefUserGen(String aValue){
       estimateItemInRefUserGen = aValue;
    }
    public String getEstimateItemInRefUserGen(){
       return estimateItemInRefUserGen;
    }


    public void setEstimateItemInRefDateEdit(Date aValue){
       estimateItemInRefDateEdit = aValue;
    }
    public Date getEstimateItemInRefDateEdit(){
       return estimateItemInRefDateEdit;
    }

    public void setEstimateItemOutRefCode(int aValue){
       estimateItemOutRefCode = aValue;
    }
    public int getEstimateItemOutRefCode(){
       return estimateItemOutRefCode;
    }

    public void setEstimateItemOutRefCountGen(BigDecimal aValue){
       estimateItemOutRefCountGen = aValue;
    }
    public BigDecimal getEstimateItemOutRefCountGen(){
       return estimateItemOutRefCountGen;
    }

    public void setEstimateItemOutRefCountFact(BigDecimal aValue){
       estimateItemOutRefCountFact = aValue;
    }
    public BigDecimal getEstimateItemOutRefCountFact(){
       return estimateItemOutRefCountFact;
    }

    public void setEstimateItemOutRefPrice(BigDecimal aValue){
       estimateItemOutRefPrice = aValue;
    }
    public BigDecimal getEstimateItemOutRefPrice(){
       return estimateItemOutRefPrice;
    }

    public void setEstimateItemOutRefCost(BigDecimal aValue){
       estimateItemOutRefCost = aValue;
    }
    public BigDecimal getEstimateItemOutRefCost(){
       return estimateItemOutRefCost;
    }

    public void setEstimateItemOutRefIsUseVAT(int aValue){
       estimateItemOutRefIsUseVAT = aValue;
    }
    public int getEstimateItemOutRefIsUseVAT(){
       return estimateItemOutRefIsUseVAT;
    }

    public void setEstimateItemOutRefDeliveryTime(int aValue){
       estimateItemOutRefDeliveryTime = aValue;
    }
    public int getEstimateItemOutRefDeliveryTime(){
       return estimateItemOutRefDeliveryTime;
    }

    public void setEstimateItemOutRefUseWorkTime(int aValue){
       estimateItemOutRefUseWorkTime = aValue;
    }
    public int getEstimateItemOutRefUseWorkTime(){
       return estimateItemOutRefUseWorkTime;
    }

    public void setEstimateItemOutRefUserGen(String aValue){
       estimateItemOutRefUserGen = aValue;
    }
    public String getEstimateItemOutRefUserGen(){
       return estimateItemOutRefUserGen;
    }


    public void setEstimateItemOutRefDateEdit(Date aValue){
       estimateItemOutRefDateEdit = aValue;
    }
    public Date getEstimateItemOutRefDateEdit(){
       return estimateItemOutRefDateEdit;
    }



}