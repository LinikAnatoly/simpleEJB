
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDamageRecovery2ENAct;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDamageRecovery2ENActShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userGen;
    public Date dateEdit ;
    public int damageRecoveryRefCode = Integer.MIN_VALUE;
    public String damageRecoveryRefNumberGen;
    public Date damageRecoveryRefDateGen;
    public String damageRecoveryRefFKcontractCode;
    public String damageRecoveryRefFKpartnerCode;
    public String damageRecoveryRefFKdocCode;
    public int damageRecoveryRefFKdocID = Integer.MIN_VALUE;
    public String damageRecoveryRefCommentGen;
    public String damageRecoveryRefContragentName;
    public String damageRecoveryRefContragentAddress;
    public String damageRecoveryRefContragentPassport;
    public BigDecimal damageRecoveryRefDamageAmmount;
    public String damageRecoveryRefUserGen;
    public Date damageRecoveryRefDateEdit;
    public int actRefCode = Integer.MIN_VALUE;
    public String actRefNumberGen;
    public Date actRefDateGen;
    public int actRefFinDocCode = Integer.MIN_VALUE;
    public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
    public String actRefFinMolName;
    public String actRefFinMechanicName;
    public String actRefInvNumber;
    public String actRefUserGen;
    public Date actRefDateEdit;
    public Date actRefDateAct;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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


    public void setDamageRecoveryRefCode(int aValue){
       damageRecoveryRefCode = aValue;
    }
    public int getDamageRecoveryRefCode(){
       return damageRecoveryRefCode;
    }

    public void setDamageRecoveryRefNumberGen(String aValue){
       damageRecoveryRefNumberGen = aValue;
    }
    public String getDamageRecoveryRefNumberGen(){
       return damageRecoveryRefNumberGen;
    }


    public void setDamageRecoveryRefDateGen(Date aValue){
       damageRecoveryRefDateGen = aValue;
    }
    public Date getDamageRecoveryRefDateGen(){
       return damageRecoveryRefDateGen;
    }

    public void setDamageRecoveryRefFKcontractCode(String aValue){
       damageRecoveryRefFKcontractCode = aValue;
    }
    public String getDamageRecoveryRefFKcontractCode(){
       return damageRecoveryRefFKcontractCode;
    }

    public void setDamageRecoveryRefFKpartnerCode(String aValue){
       damageRecoveryRefFKpartnerCode = aValue;
    }
    public String getDamageRecoveryRefFKpartnerCode(){
       return damageRecoveryRefFKpartnerCode;
    }

    public void setDamageRecoveryRefFKdocCode(String aValue){
       damageRecoveryRefFKdocCode = aValue;
    }
    public String getDamageRecoveryRefFKdocCode(){
       return damageRecoveryRefFKdocCode;
    }

    public void setDamageRecoveryRefFKdocID(int aValue){
       damageRecoveryRefFKdocID = aValue;
    }
    public int getDamageRecoveryRefFKdocID(){
       return damageRecoveryRefFKdocID;
    }

    public void setDamageRecoveryRefCommentGen(String aValue){
       damageRecoveryRefCommentGen = aValue;
    }
    public String getDamageRecoveryRefCommentGen(){
       return damageRecoveryRefCommentGen;
    }

    public void setDamageRecoveryRefContragentName(String aValue){
       damageRecoveryRefContragentName = aValue;
    }
    public String getDamageRecoveryRefContragentName(){
       return damageRecoveryRefContragentName;
    }

    public void setDamageRecoveryRefContragentAddress(String aValue){
       damageRecoveryRefContragentAddress = aValue;
    }
    public String getDamageRecoveryRefContragentAddress(){
       return damageRecoveryRefContragentAddress;
    }

    public void setDamageRecoveryRefContragentPassport(String aValue){
       damageRecoveryRefContragentPassport = aValue;
    }
    public String getDamageRecoveryRefContragentPassport(){
       return damageRecoveryRefContragentPassport;
    }

    public void setDamageRecoveryRefDamageAmmount(BigDecimal aValue){
       damageRecoveryRefDamageAmmount = aValue;
    }
    public BigDecimal getDamageRecoveryRefDamageAmmount(){
       return damageRecoveryRefDamageAmmount;
    }

    public void setDamageRecoveryRefUserGen(String aValue){
       damageRecoveryRefUserGen = aValue;
    }
    public String getDamageRecoveryRefUserGen(){
       return damageRecoveryRefUserGen;
    }


    public void setDamageRecoveryRefDateEdit(Date aValue){
       damageRecoveryRefDateEdit = aValue;
    }
    public Date getDamageRecoveryRefDateEdit(){
       return damageRecoveryRefDateEdit;
    }

    public void setActRefCode(int aValue){
       actRefCode = aValue;
    }
    public int getActRefCode(){
       return actRefCode;
    }

    public void setActRefNumberGen(String aValue){
       actRefNumberGen = aValue;
    }
    public String getActRefNumberGen(){
       return actRefNumberGen;
    }


    public void setActRefDateGen(Date aValue){
       actRefDateGen = aValue;
    }
    public Date getActRefDateGen(){
       return actRefDateGen;
    }

    public void setActRefFinDocCode(int aValue){
       actRefFinDocCode = aValue;
    }
    public int getActRefFinDocCode(){
       return actRefFinDocCode;
    }

    public void setActRefFinDocMechanicCode(int aValue){
       actRefFinDocMechanicCode = aValue;
    }
    public int getActRefFinDocMechanicCode(){
       return actRefFinDocMechanicCode;
    }

    public void setActRefFinMolName(String aValue){
       actRefFinMolName = aValue;
    }
    public String getActRefFinMolName(){
       return actRefFinMolName;
    }

    public void setActRefFinMechanicName(String aValue){
       actRefFinMechanicName = aValue;
    }
    public String getActRefFinMechanicName(){
       return actRefFinMechanicName;
    }

    public void setActRefInvNumber(String aValue){
       actRefInvNumber = aValue;
    }
    public String getActRefInvNumber(){
       return actRefInvNumber;
    }

    public void setActRefUserGen(String aValue){
       actRefUserGen = aValue;
    }
    public String getActRefUserGen(){
       return actRefUserGen;
    }


    public void setActRefDateEdit(Date aValue){
       actRefDateEdit = aValue;
    }
    public Date getActRefDateEdit(){
       return actRefDateEdit;
    }


    public void setActRefDateAct(Date aValue){
       actRefDateAct = aValue;
    }
    public Date getActRefDateAct(){
       return actRefDateAct;
    }



}