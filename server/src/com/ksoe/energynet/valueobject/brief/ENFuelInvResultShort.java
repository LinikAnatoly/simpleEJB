
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENFuelInvResult;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelInvResultShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal deltaCount;
    public String userGen;
    public Date dateEdit ;
    public int inventarizationRefCode = Integer.MIN_VALUE;
    public String inventarizationRefNumberGen;
    public Date inventarizationRefDateGen;
    public String inventarizationRefMolCode;
    public String inventarizationRefMolName;
    public String inventarizationRefCommentGen;
    public String inventarizationRefUserAdd;
    public Date inventarizationRefDateAdd;
    public String inventarizationRefUserGen;
    public Date inventarizationRefDateEdit;
    public int fuelTypeRefCode = Integer.MIN_VALUE;
    public String fuelTypeRefName;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int fkorderitemRefCode = Integer.MIN_VALUE;
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
    public void setDeltaCount(BigDecimal aValue){
       deltaCount = aValue;
    }

    public BigDecimal getDeltaCount(){
       return deltaCount;
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


    public void setInventarizationRefCode(int aValue){
       inventarizationRefCode = aValue;
    }
    public int getInventarizationRefCode(){
       return inventarizationRefCode;
    }

    public void setInventarizationRefNumberGen(String aValue){
       inventarizationRefNumberGen = aValue;
    }
    public String getInventarizationRefNumberGen(){
       return inventarizationRefNumberGen;
    }


    public void setInventarizationRefDateGen(Date aValue){
       inventarizationRefDateGen = aValue;
    }
    public Date getInventarizationRefDateGen(){
       return inventarizationRefDateGen;
    }

    public void setInventarizationRefMolCode(String aValue){
       inventarizationRefMolCode = aValue;
    }
    public String getInventarizationRefMolCode(){
       return inventarizationRefMolCode;
    }

    public void setInventarizationRefMolName(String aValue){
       inventarizationRefMolName = aValue;
    }
    public String getInventarizationRefMolName(){
       return inventarizationRefMolName;
    }

    public void setInventarizationRefCommentGen(String aValue){
       inventarizationRefCommentGen = aValue;
    }
    public String getInventarizationRefCommentGen(){
       return inventarizationRefCommentGen;
    }

    public void setInventarizationRefUserAdd(String aValue){
       inventarizationRefUserAdd = aValue;
    }
    public String getInventarizationRefUserAdd(){
       return inventarizationRefUserAdd;
    }


    public void setInventarizationRefDateAdd(Date aValue){
       inventarizationRefDateAdd = aValue;
    }
    public Date getInventarizationRefDateAdd(){
       return inventarizationRefDateAdd;
    }

    public void setInventarizationRefUserGen(String aValue){
       inventarizationRefUserGen = aValue;
    }
    public String getInventarizationRefUserGen(){
       return inventarizationRefUserGen;
    }


    public void setInventarizationRefDateEdit(Date aValue){
       inventarizationRefDateEdit = aValue;
    }
    public Date getInventarizationRefDateEdit(){
       return inventarizationRefDateEdit;
    }

    public void setFuelTypeRefCode(int aValue){
       fuelTypeRefCode = aValue;
    }
    public int getFuelTypeRefCode(){
       return fuelTypeRefCode;
    }

    public void setFuelTypeRefName(String aValue){
       fuelTypeRefName = aValue;
    }
    public String getFuelTypeRefName(){
       return fuelTypeRefName;
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
    public void setFkorderitemRefCode(int aValue){
       fkorderitemRefCode = aValue;
    }
    public int getFkorderitemRefCode(){
       return fkorderitemRefCode;
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