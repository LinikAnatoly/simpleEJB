
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2RQFKOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2RQFKOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
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
    public int fkOrderRefCode = Integer.MIN_VALUE;
    public String fkOrderRefNumberDoc;
    public Date fkOrderRefDateGen;
    public Date fkOrderRefDateShipment;
    public String fkOrderRefMolOutCode;
    public String fkOrderRefMolOutName;
    public String fkOrderRefMolInCode;
    public String fkOrderRefMolInName;
    public String fkOrderRefExpeditorCode;
    public String fkOrderRefExpeditorName;
    public String fkOrderRefWarrantNumber;
    public Date fkOrderRefWarrantDate;
    public String fkOrderRefWarrantFIO;
    public BigDecimal fkOrderRefSumWithoutNds;
    public BigDecimal fkOrderRefSumNds;
    public int fkOrderRefNdsPercent = Integer.MIN_VALUE;
    public Date fkOrderRefDateAdd;
    public String fkOrderRefUserAdd;
    public Date fkOrderRefDateEdit;
    public String fkOrderRefUserGen;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setFkOrderRefCode(int aValue){
       fkOrderRefCode = aValue;
    }
    public int getFkOrderRefCode(){
       return fkOrderRefCode;
    }

    public void setFkOrderRefNumberDoc(String aValue){
       fkOrderRefNumberDoc = aValue;
    }
    public String getFkOrderRefNumberDoc(){
       return fkOrderRefNumberDoc;
    }


    public void setFkOrderRefDateGen(Date aValue){
       fkOrderRefDateGen = aValue;
    }
    public Date getFkOrderRefDateGen(){
       return fkOrderRefDateGen;
    }


    public void setFkOrderRefDateShipment(Date aValue){
       fkOrderRefDateShipment = aValue;
    }
    public Date getFkOrderRefDateShipment(){
       return fkOrderRefDateShipment;
    }

    public void setFkOrderRefMolOutCode(String aValue){
       fkOrderRefMolOutCode = aValue;
    }
    public String getFkOrderRefMolOutCode(){
       return fkOrderRefMolOutCode;
    }

    public void setFkOrderRefMolOutName(String aValue){
       fkOrderRefMolOutName = aValue;
    }
    public String getFkOrderRefMolOutName(){
       return fkOrderRefMolOutName;
    }

    public void setFkOrderRefMolInCode(String aValue){
       fkOrderRefMolInCode = aValue;
    }
    public String getFkOrderRefMolInCode(){
       return fkOrderRefMolInCode;
    }

    public void setFkOrderRefMolInName(String aValue){
       fkOrderRefMolInName = aValue;
    }
    public String getFkOrderRefMolInName(){
       return fkOrderRefMolInName;
    }

    public void setFkOrderRefExpeditorCode(String aValue){
       fkOrderRefExpeditorCode = aValue;
    }
    public String getFkOrderRefExpeditorCode(){
       return fkOrderRefExpeditorCode;
    }

    public void setFkOrderRefExpeditorName(String aValue){
       fkOrderRefExpeditorName = aValue;
    }
    public String getFkOrderRefExpeditorName(){
       return fkOrderRefExpeditorName;
    }

    public void setFkOrderRefWarrantNumber(String aValue){
       fkOrderRefWarrantNumber = aValue;
    }
    public String getFkOrderRefWarrantNumber(){
       return fkOrderRefWarrantNumber;
    }


    public void setFkOrderRefWarrantDate(Date aValue){
       fkOrderRefWarrantDate = aValue;
    }
    public Date getFkOrderRefWarrantDate(){
       return fkOrderRefWarrantDate;
    }

    public void setFkOrderRefWarrantFIO(String aValue){
       fkOrderRefWarrantFIO = aValue;
    }
    public String getFkOrderRefWarrantFIO(){
       return fkOrderRefWarrantFIO;
    }

    public void setFkOrderRefSumWithoutNds(BigDecimal aValue){
       fkOrderRefSumWithoutNds = aValue;
    }
    public BigDecimal getFkOrderRefSumWithoutNds(){
       return fkOrderRefSumWithoutNds;
    }

    public void setFkOrderRefSumNds(BigDecimal aValue){
       fkOrderRefSumNds = aValue;
    }
    public BigDecimal getFkOrderRefSumNds(){
       return fkOrderRefSumNds;
    }

    public void setFkOrderRefNdsPercent(int aValue){
       fkOrderRefNdsPercent = aValue;
    }
    public int getFkOrderRefNdsPercent(){
       return fkOrderRefNdsPercent;
    }


    public void setFkOrderRefDateAdd(Date aValue){
       fkOrderRefDateAdd = aValue;
    }
    public Date getFkOrderRefDateAdd(){
       return fkOrderRefDateAdd;
    }

    public void setFkOrderRefUserAdd(String aValue){
       fkOrderRefUserAdd = aValue;
    }
    public String getFkOrderRefUserAdd(){
       return fkOrderRefUserAdd;
    }


    public void setFkOrderRefDateEdit(Date aValue){
       fkOrderRefDateEdit = aValue;
    }
    public Date getFkOrderRefDateEdit(){
       return fkOrderRefDateEdit;
    }

    public void setFkOrderRefUserGen(String aValue){
       fkOrderRefUserGen = aValue;
    }
    public String getFkOrderRefUserGen(){
       return fkOrderRefUserGen;
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