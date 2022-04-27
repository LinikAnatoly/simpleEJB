
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCSeal;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCSealShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String invNumber;
    public String name;
    public String buildNumber;
    public String account;
    public String departmetFKCode;
    public String molCode;
    public String molName;
    public Date dateIn ;
    public Date dateBuild ;
    public BigDecimal cost;
    public int scCode = Integer.MIN_VALUE;
    public String installOrderNumber;
    public BigDecimal costOld;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;
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
    public int lockTypeRefCode = Integer.MIN_VALUE;
    public String lockTypeRefName;
    public int zoneRefCode = Integer.MIN_VALUE;
    public String zoneRefName;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setBuildNumber(String aValue){
       buildNumber = aValue;
    }

    public String getBuildNumber(){
       return buildNumber;
    }

    public void setAccount(String aValue){
       account = aValue;
    }

    public String getAccount(){
       return account;
    }

    public void setDepartmetFKCode(String aValue){
       departmetFKCode = aValue;
    }

    public String getDepartmetFKCode(){
       return departmetFKCode;
    }

    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }

    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }

    public void setDateIn(Date aValue){
       dateIn = aValue;
    }

    public Date getDateIn(){
       return dateIn;
    }

    public void setDateBuild(Date aValue){
       dateBuild = aValue;
    }

    public Date getDateBuild(){
       return dateBuild;
    }

    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }

    public void setScCode(int aValue){
       scCode = aValue;
    }

    public int getScCode(){
       return scCode;
    }

    public void setInstallOrderNumber(String aValue){
       installOrderNumber = aValue;
    }

    public String getInstallOrderNumber(){
       return installOrderNumber;
    }

    public void setCostOld(BigDecimal aValue){
       costOld = aValue;
    }

    public BigDecimal getCostOld(){
       return costOld;
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

    public void setLockTypeRefCode(int aValue){
       lockTypeRefCode = aValue;
    }
    public int getLockTypeRefCode(){
       return lockTypeRefCode;
    }

    public void setLockTypeRefName(String aValue){
       lockTypeRefName = aValue;
    }
    public String getLockTypeRefName(){
       return lockTypeRefName;
    }

    public void setZoneRefCode(int aValue){
       zoneRefCode = aValue;
    }
    public int getZoneRefCode(){
       return zoneRefCode;
    }

    public void setZoneRefName(String aValue){
       zoneRefName = aValue;
    }
    public String getZoneRefName(){
       return zoneRefName;
    }



}