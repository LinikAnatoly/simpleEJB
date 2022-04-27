
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMolFuelMotion;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENMolFuelMotionShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String molcode;
    public String molname;
    public Date dateGen ;
    public String nn;
    public String mat_name;
    public BigDecimal countGen;
    public String userGen;
    public Date dateEdit ;
    public int motionTypeRefCode = Integer.MIN_VALUE;
    public String motionTypeRefName;
    public int fuelTypeRefCode = Integer.MIN_VALUE;
    public String fuelTypeRefName;
    public int fkorderRefCode = Integer.MIN_VALUE;
    public String fkorderRefNumberDoc;
    public Date fkorderRefDateGen;
    public Date fkorderRefDateShipment;
    public String fkorderRefMolOutCode;
    public String fkorderRefMolOutName;
    public String fkorderRefMolInCode;
    public String fkorderRefMolInName;
    public String fkorderRefExpeditorCode;
    public String fkorderRefExpeditorName;
    public String fkorderRefWarrantNumber;
    public Date fkorderRefWarrantDate;
    public String fkorderRefWarrantFIO;
    public BigDecimal fkorderRefSumWithoutNds;
    public BigDecimal fkorderRefSumNds;
    public int fkorderRefNdsPercent = Integer.MIN_VALUE;
    public Date fkorderRefDateAdd;
    public String fkorderRefUserAdd;
    public Date fkorderRefDateEdit;
    public String fkorderRefUserGen;
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
    public void setMolcode(String aValue){
       molcode = aValue;
    }

    public String getMolcode(){
       return molcode;
    }
    public void setMolname(String aValue){
       molname = aValue;
    }

    public String getMolname(){
       return molname;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }
    public void setNn(String aValue){
       nn = aValue;
    }

    public String getNn(){
       return nn;
    }
    public void setMat_name(String aValue){
       mat_name = aValue;
    }

    public String getMat_name(){
       return mat_name;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
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


    public void setMotionTypeRefCode(int aValue){
       motionTypeRefCode = aValue;
    }
    public int getMotionTypeRefCode(){
       return motionTypeRefCode;
    }

    public void setMotionTypeRefName(String aValue){
       motionTypeRefName = aValue;
    }
    public String getMotionTypeRefName(){
       return motionTypeRefName;
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

    public void setFkorderRefCode(int aValue){
       fkorderRefCode = aValue;
    }
    public int getFkorderRefCode(){
       return fkorderRefCode;
    }

    public void setFkorderRefNumberDoc(String aValue){
       fkorderRefNumberDoc = aValue;
    }
    public String getFkorderRefNumberDoc(){
       return fkorderRefNumberDoc;
    }


    public void setFkorderRefDateGen(Date aValue){
       fkorderRefDateGen = aValue;
    }
    public Date getFkorderRefDateGen(){
       return fkorderRefDateGen;
    }


    public void setFkorderRefDateShipment(Date aValue){
       fkorderRefDateShipment = aValue;
    }
    public Date getFkorderRefDateShipment(){
       return fkorderRefDateShipment;
    }

    public void setFkorderRefMolOutCode(String aValue){
       fkorderRefMolOutCode = aValue;
    }
    public String getFkorderRefMolOutCode(){
       return fkorderRefMolOutCode;
    }

    public void setFkorderRefMolOutName(String aValue){
       fkorderRefMolOutName = aValue;
    }
    public String getFkorderRefMolOutName(){
       return fkorderRefMolOutName;
    }

    public void setFkorderRefMolInCode(String aValue){
       fkorderRefMolInCode = aValue;
    }
    public String getFkorderRefMolInCode(){
       return fkorderRefMolInCode;
    }

    public void setFkorderRefMolInName(String aValue){
       fkorderRefMolInName = aValue;
    }
    public String getFkorderRefMolInName(){
       return fkorderRefMolInName;
    }

    public void setFkorderRefExpeditorCode(String aValue){
       fkorderRefExpeditorCode = aValue;
    }
    public String getFkorderRefExpeditorCode(){
       return fkorderRefExpeditorCode;
    }

    public void setFkorderRefExpeditorName(String aValue){
       fkorderRefExpeditorName = aValue;
    }
    public String getFkorderRefExpeditorName(){
       return fkorderRefExpeditorName;
    }

    public void setFkorderRefWarrantNumber(String aValue){
       fkorderRefWarrantNumber = aValue;
    }
    public String getFkorderRefWarrantNumber(){
       return fkorderRefWarrantNumber;
    }


    public void setFkorderRefWarrantDate(Date aValue){
       fkorderRefWarrantDate = aValue;
    }
    public Date getFkorderRefWarrantDate(){
       return fkorderRefWarrantDate;
    }

    public void setFkorderRefWarrantFIO(String aValue){
       fkorderRefWarrantFIO = aValue;
    }
    public String getFkorderRefWarrantFIO(){
       return fkorderRefWarrantFIO;
    }

    public void setFkorderRefSumWithoutNds(BigDecimal aValue){
       fkorderRefSumWithoutNds = aValue;
    }
    public BigDecimal getFkorderRefSumWithoutNds(){
       return fkorderRefSumWithoutNds;
    }

    public void setFkorderRefSumNds(BigDecimal aValue){
       fkorderRefSumNds = aValue;
    }
    public BigDecimal getFkorderRefSumNds(){
       return fkorderRefSumNds;
    }

    public void setFkorderRefNdsPercent(int aValue){
       fkorderRefNdsPercent = aValue;
    }
    public int getFkorderRefNdsPercent(){
       return fkorderRefNdsPercent;
    }


    public void setFkorderRefDateAdd(Date aValue){
       fkorderRefDateAdd = aValue;
    }
    public Date getFkorderRefDateAdd(){
       return fkorderRefDateAdd;
    }

    public void setFkorderRefUserAdd(String aValue){
       fkorderRefUserAdd = aValue;
    }
    public String getFkorderRefUserAdd(){
       return fkorderRefUserAdd;
    }


    public void setFkorderRefDateEdit(Date aValue){
       fkorderRefDateEdit = aValue;
    }
    public Date getFkorderRefDateEdit(){
       return fkorderRefDateEdit;
    }

    public void setFkorderRefUserGen(String aValue){
       fkorderRefUserGen = aValue;
    }
    public String getFkorderRefUserGen(){
       return fkorderRefUserGen;
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