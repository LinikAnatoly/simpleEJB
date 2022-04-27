
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInputItemOZ2ENAct;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class SCUsageInputItemOZ2ENActShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int usageInputItemOZRefCode = Integer.MIN_VALUE;
    public String usageInputItemOZRefNumberDoc;
    public String usageInputItemOZRefCounterType;
    public String usageInputItemOZRefAccount;
    public BigDecimal usageInputItemOZRefCost;
    public int usageInputItemOZRefCountGen = Integer.MIN_VALUE;
    public int usageInputItemOZRefScCode = Integer.MIN_VALUE;
    public int enActRefCode = Integer.MIN_VALUE;
    public String enActRefNumberGen;
    public Date enActRefDateGen;
    public int enActRefFinDocCode = Integer.MIN_VALUE;
    public int enActRefFinDocMechanicCode = Integer.MIN_VALUE;
    public String enActRefFinMolName;
    public String enActRefFinMechanicName;
    public String enActRefInvNumber;
    public String enActRefUserGen;
    public Date enActRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setUsageInputItemOZRefCode(int aValue){
       usageInputItemOZRefCode = aValue;
    }
    public int getUsageInputItemOZRefCode(){
       return usageInputItemOZRefCode;
    }

    public void setUsageInputItemOZRefNumberDoc(String aValue){
       usageInputItemOZRefNumberDoc = aValue;
    }
    public String getUsageInputItemOZRefNumberDoc(){
       return usageInputItemOZRefNumberDoc;
    }

    public void setUsageInputItemOZRefCounterType(String aValue){
       usageInputItemOZRefCounterType = aValue;
    }
    public String getUsageInputItemOZRefCounterType(){
       return usageInputItemOZRefCounterType;
    }

    public void setUsageInputItemOZRefAccount(String aValue){
       usageInputItemOZRefAccount = aValue;
    }
    public String getUsageInputItemOZRefAccount(){
       return usageInputItemOZRefAccount;
    }

    public void setUsageInputItemOZRefCost(BigDecimal aValue){
       usageInputItemOZRefCost = aValue;
    }
    public BigDecimal getUsageInputItemOZRefCost(){
       return usageInputItemOZRefCost;
    }

    public void setUsageInputItemOZRefCountGen(int aValue){
       usageInputItemOZRefCountGen = aValue;
    }
    public int getUsageInputItemOZRefCountGen(){
       return usageInputItemOZRefCountGen;
    }

    public void setUsageInputItemOZRefScCode(int aValue){
       usageInputItemOZRefScCode = aValue;
    }
    public int getUsageInputItemOZRefScCode(){
       return usageInputItemOZRefScCode;
    }

    public void setEnActRefCode(int aValue){
       enActRefCode = aValue;
    }
    public int getEnActRefCode(){
       return enActRefCode;
    }

    public void setEnActRefNumberGen(String aValue){
       enActRefNumberGen = aValue;
    }
    public String getEnActRefNumberGen(){
       return enActRefNumberGen;
    }


    public void setEnActRefDateGen(Date aValue){
       enActRefDateGen = aValue;
    }
    public Date getEnActRefDateGen(){
       return enActRefDateGen;
    }

    public void setEnActRefFinDocCode(int aValue){
       enActRefFinDocCode = aValue;
    }
    public int getEnActRefFinDocCode(){
       return enActRefFinDocCode;
    }

    public void setEnActRefFinDocMechanicCode(int aValue){
       enActRefFinDocMechanicCode = aValue;
    }
    public int getEnActRefFinDocMechanicCode(){
       return enActRefFinDocMechanicCode;
    }

    public void setEnActRefFinMolName(String aValue){
       enActRefFinMolName = aValue;
    }
    public String getEnActRefFinMolName(){
       return enActRefFinMolName;
    }

    public void setEnActRefFinMechanicName(String aValue){
       enActRefFinMechanicName = aValue;
    }
    public String getEnActRefFinMechanicName(){
       return enActRefFinMechanicName;
    }

    public void setEnActRefInvNumber(String aValue){
       enActRefInvNumber = aValue;
    }
    public String getEnActRefInvNumber(){
       return enActRefInvNumber;
    }

    public void setEnActRefUserGen(String aValue){
       enActRefUserGen = aValue;
    }
    public String getEnActRefUserGen(){
       return enActRefUserGen;
    }


    public void setEnActRefDateEdit(Date aValue){
       enActRefDateEdit = aValue;
    }
    public Date getEnActRefDateEdit(){
       return enActRefDateEdit;
    }



}