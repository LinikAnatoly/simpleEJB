
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimateItemStatusHistory;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENEstimateItemStatusHistoryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int isLast = Integer.MIN_VALUE;
    public Date dateEdit ;
    public int estimateItemRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemRefCountGen;
    public BigDecimal estimateItemRefCountFact;
    public BigDecimal estimateItemRefPrice;
    public BigDecimal estimateItemRefCost;
    public int estimateItemRefDeliveryTime = Integer.MIN_VALUE;
    public String estimateItemRefUserGen;
    public Date estimateItemRefDateEdit;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setIsLast(int aValue){
       isLast = aValue;
    }

    public int getIsLast(){
       return isLast;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
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

    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
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