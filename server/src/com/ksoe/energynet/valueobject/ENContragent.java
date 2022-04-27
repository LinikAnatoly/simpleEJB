
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENContragent;  	
  */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef;

public class ENContragent implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  contragentName; 
    public String  contragentAddress; 
    public String  contragentAddressWork; 
    public String  contragentPosition; 
    public String  contragentOkpo; 
    public String  contragentBankAccount; 
    public String  contragentBankName; 
    public String  contragentBankMfo; 
    public String  contragentBossName; 
    public String  contragentPassport; 
    public Date warrantDate ;
    public String  warrantNumber; 
    public String  warrantFIO; 
    public String  warrantPassport; 
    public String  warrantAddress; 
    public String  techConditionsItem; 
    public ENTechConditionsObjects techConObjects = new ENTechConditionsObjects();
    public ENBasisType basisType = new ENBasisType();
    public ENTechConditionsServicesRef techCondServicesRef = new ENTechConditionsServicesRef();
    public ENServicesContragentType contragentType = new ENServicesContragentType();
    public static final String tableName = "ENCONTRAGENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONTRAGENT.CODE";
    public static final String contragentName_Attr = "contragentName";
    public static final String contragentName_Field = "CONTRAGENTNAME";
    public static final String contragentName_QFielld = "ENCONTRAGENT.CONTRAGENTNAME";
    public static final String contragentAddress_Attr = "contragentAddress";
    public static final String contragentAddress_Field = "CONTRAGENTADDRESS";
    public static final String contragentAddress_QFielld = "ENCONTRAGENT.CONTRAGENTADDRESS";
    public static final String contragentAddressWork_Attr = "contragentAddressWork";
    public static final String contragentAddressWork_Field = "CONTRAGENTADDRESSWORK";
    public static final String contragentAddressWork_QFielld = "ENCONTRAGENT.CONTRAGENTADDRESSWORK";
    public static final String contragentPosition_Attr = "contragentPosition";
    public static final String contragentPosition_Field = "CONTRAGENTPOSITION";
    public static final String contragentPosition_QFielld = "ENCONTRAGENT.CONTRAGENTPOSITION";
    public static final String contragentOkpo_Attr = "contragentOkpo";
    public static final String contragentOkpo_Field = "CONTRAGENTOKPO";
    public static final String contragentOkpo_QFielld = "ENCONTRAGENT.CONTRAGENTOKPO";
    public static final String contragentBankAccount_Attr = "contragentBankAccount";
    public static final String contragentBankAccount_Field = "CONTRAGENTBANKACCOUNT";
    public static final String contragentBankAccount_QFielld = "ENCONTRAGENT.CONTRAGENTBANKACCOUNT";
    public static final String contragentBankName_Attr = "contragentBankName";
    public static final String contragentBankName_Field = "CONTRAGENTBANKNAME";
    public static final String contragentBankName_QFielld = "ENCONTRAGENT.CONTRAGENTBANKNAME";
    public static final String contragentBankMfo_Attr = "contragentBankMfo";
    public static final String contragentBankMfo_Field = "CONTRAGENTBANKMFO";
    public static final String contragentBankMfo_QFielld = "ENCONTRAGENT.CONTRAGENTBANKMFO";
    public static final String contragentBossName_Attr = "contragentBossName";
    public static final String contragentBossName_Field = "CONTRAGENTBOSSNAME";
    public static final String contragentBossName_QFielld = "ENCONTRAGENT.CONTRAGENTBOSSNAME";
    public static final String contragentPassport_Attr = "contragentPassport";
    public static final String contragentPassport_Field = "CONTRAGENTPASSPORT";
    public static final String contragentPassport_QFielld = "ENCONTRAGENT.CONTRAGENTPASSPORT";
    public static final String warrantDate_Attr = "warrantDate";
    public static final String warrantDate_Field = "WARRANTDATE";
    public static final String warrantDate_QFielld = "ENCONTRAGENT.WARRANTDATE";
    public static final String warrantNumber_Attr = "warrantNumber";
    public static final String warrantNumber_Field = "WARRANTNUMBER";
    public static final String warrantNumber_QFielld = "ENCONTRAGENT.WARRANTNUMBER";
    public static final String warrantFIO_Attr = "warrantFIO";
    public static final String warrantFIO_Field = "WARRANTFIO";
    public static final String warrantFIO_QFielld = "ENCONTRAGENT.WARRANTFIO";
    public static final String warrantPassport_Attr = "warrantPassport";
    public static final String warrantPassport_Field = "WARRANTPASSPORT";
    public static final String warrantPassport_QFielld = "ENCONTRAGENT.WARRANTPASSPORT";
    public static final String warrantAddress_Attr = "warrantAddress";
    public static final String warrantAddress_Field = "WARRANTADDRESS";
    public static final String warrantAddress_QFielld = "ENCONTRAGENT.WARRANTADDRESS";
    public static final String techConditionsItem_Attr = "techConditionsItem";
    public static final String techConditionsItem_Field = "TECHCONDITIONSITEM";
    public static final String techConditionsItem_QFielld = "ENCONTRAGENT.TECHCONDITIONSITEM";
    public static final String techConObjects_Attr = "techConObjects";
    public static final String techConObjects_Field = "TECHCONOBJECTSCODE";
    public static final String  techConObjects_QFielld = "ENCONTRAGENT.TECHCONOBJECTSCODE";
    public static final String basisType_Attr = "basisType";
    public static final String basisType_Field = "BASISTYPECODE";
    public static final String  basisType_QFielld = "ENCONTRAGENT.BASISTYPECODE";
    public static final String techCondServicesRef_Attr = "techCondServicesRef";
    public static final String techCondServicesRef_Field = "TECHCONDSERVICESREFCOD";
    public static final String  techCondServicesRef_QFielld = "ENCONTRAGENT.TECHCONDSERVICESREFCOD";
    public static final String contragentType_Attr = "contragentType";
    public static final String contragentType_Field = "CONTRAGENTTYPECODE";
    public static final String  contragentType_QFielld = "ENCONTRAGENT.CONTRAGENTTYPECODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setContragentName(String aValue){
       contragentName = aValue;
    }

    public String getContragentName(){
       return contragentName;
    }

    public void setContragentAddress(String aValue){
       contragentAddress = aValue;
    }

    public String getContragentAddress(){
       return contragentAddress;
    }

    public void setContragentAddressWork(String aValue){
       contragentAddressWork = aValue;
    }

    public String getContragentAddressWork(){
       return contragentAddressWork;
    }

    public void setContragentPosition(String aValue){
       contragentPosition = aValue;
    }

    public String getContragentPosition(){
       return contragentPosition;
    }

    public void setContragentOkpo(String aValue){
       contragentOkpo = aValue;
    }

    public String getContragentOkpo(){
       return contragentOkpo;
    }

    public void setContragentBankAccount(String aValue){
       contragentBankAccount = aValue;
    }

    public String getContragentBankAccount(){
       return contragentBankAccount;
    }

    public void setContragentBankName(String aValue){
       contragentBankName = aValue;
    }

    public String getContragentBankName(){
       return contragentBankName;
    }

    public void setContragentBankMfo(String aValue){
       contragentBankMfo = aValue;
    }

    public String getContragentBankMfo(){
       return contragentBankMfo;
    }

    public void setContragentBossName(String aValue){
       contragentBossName = aValue;
    }

    public String getContragentBossName(){
       return contragentBossName;
    }

    public void setContragentPassport(String aValue){
       contragentPassport = aValue;
    }

    public String getContragentPassport(){
       return contragentPassport;
    }


    public void setWarrantDate(Date aValue){
       warrantDate = aValue;
    }

    public Date getWarrantDate(){
       return warrantDate;
    }

    public void setWarrantNumber(String aValue){
       warrantNumber = aValue;
    }

    public String getWarrantNumber(){
       return warrantNumber;
    }

    public void setWarrantFIO(String aValue){
       warrantFIO = aValue;
    }

    public String getWarrantFIO(){
       return warrantFIO;
    }

    public void setWarrantPassport(String aValue){
       warrantPassport = aValue;
    }

    public String getWarrantPassport(){
       return warrantPassport;
    }

    public void setWarrantAddress(String aValue){
       warrantAddress = aValue;
    }

    public String getWarrantAddress(){
       return warrantAddress;
    }

    public void setTechConditionsItem(String aValue){
       techConditionsItem = aValue;
    }

    public String getTechConditionsItem(){
       return techConditionsItem;
    }

    public void setTechConObjects(ENTechConditionsObjects aValue){
       techConObjects = aValue;
    }

    public ENTechConditionsObjects getTechConObjects(){
       return techConObjects;
    }
    public void setBasisType(ENBasisType aValue){
       basisType = aValue;
    }

    public ENBasisType getBasisType(){
       return basisType;
    }
    public void setTechCondServicesRef(ENTechConditionsServicesRef aValue){
       techCondServicesRef = aValue;
    }

    public ENTechConditionsServicesRef getTechCondServicesRef(){
       return techCondServicesRef;
    }
    public void setContragentType(ENServicesContragentType aValue){
       contragentType = aValue;
    }

    public ENServicesContragentType getContragentType(){
       return contragentType;
    }

} // end of ENContragentValueObject

