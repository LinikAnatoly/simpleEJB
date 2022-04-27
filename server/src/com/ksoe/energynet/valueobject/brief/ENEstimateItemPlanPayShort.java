
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimateItemPlanPay;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENEstimateItemPlanPayShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal percentPay;
    public Date datePay ;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int typePayRefCode = Integer.MIN_VALUE;
    public String typePayRefName;
    public int estimateItemRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemRefCountGen;
    public BigDecimal estimateItemRefCountFact;
    public BigDecimal estimateItemRefPrice;
    public BigDecimal estimateItemRefCost;
    public int estimateItemRefIsUseVAT = Integer.MIN_VALUE;
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
    public void setPercentPay(BigDecimal aValue){
       percentPay = aValue;
    }

    public BigDecimal getPercentPay(){
       return percentPay;
    }

    public void setDatePay(Date aValue){
       datePay = aValue;
    }

    public Date getDatePay(){
       return datePay;
    }
    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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


    public void setTypePayRefCode(int aValue){
       typePayRefCode = aValue;
    }
    public int getTypePayRefCode(){
       return typePayRefCode;
    }

    public void setTypePayRefName(String aValue){
       typePayRefName = aValue;
    }
    public String getTypePayRefName(){
       return typePayRefName;
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

    public void setEstimateItemRefIsUseVAT(int aValue){
       estimateItemRefIsUseVAT = aValue;
    }
    public int getEstimateItemRefIsUseVAT(){
       return estimateItemRefIsUseVAT;
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