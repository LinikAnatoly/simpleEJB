
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimateItem2ENEstimateItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENEstimateItem2ENEstimateItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public int estimateItemInRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemInRefCountGen;
    public BigDecimal estimateItemInRefCountFact;
    public BigDecimal estimateItemInRefPrice;
    public BigDecimal estimateItemInRefCost;
    public int estimateItemInRefDeliveryTime = Integer.MIN_VALUE;
    public String estimateItemInRefUserGen;
    public Date estimateItemInRefDateEdit;
    public int estimateItemOutRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemOutRefCountGen;
    public BigDecimal estimateItemOutRefCountFact;
    public BigDecimal estimateItemOutRefPrice;
    public BigDecimal estimateItemOutRefCost;
    public int estimateItemOutRefDeliveryTime = Integer.MIN_VALUE;
    public String estimateItemOutRefUserGen;
    public Date estimateItemOutRefDateEdit;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;


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

    public void setEstimateItemInRefDeliveryTime(int aValue){
       estimateItemInRefDeliveryTime = aValue;
    }
    public int getEstimateItemInRefDeliveryTime(){
       return estimateItemInRefDeliveryTime;
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

    public void setEstimateItemOutRefDeliveryTime(int aValue){
       estimateItemOutRefDeliveryTime = aValue;
    }
    public int getEstimateItemOutRefDeliveryTime(){
       return estimateItemOutRefDeliveryTime;
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




}