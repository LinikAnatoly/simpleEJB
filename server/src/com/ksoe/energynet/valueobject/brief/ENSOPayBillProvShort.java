
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSOPayBillProv;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSOPayBillProvShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userGen;
    public Date dateEdit ;
    public int soRefCode = Integer.MIN_VALUE;
    public String soRefContractNumber;
    public Date soRefContractDate;
    public String soRefName;
    public String soRefPartnerCode;
    public String soRefFinDocCode;
    public int soRefFinDocID = Integer.MIN_VALUE;
    public String soRefCommentGen;
    public String soRefContractNumberServices;
    public Date soRefContractDateServices;
    public String soRefContragentName;
    public String soRefContragentAddress;
    public String soRefContragentAddressWork;
    public String soRefContragentOkpo;
    public String soRefContragentBankAccount;
    public String soRefContragentBankName;
    public String soRefContragentBankMfo;
    public String soRefContragentBossName;
    public String soRefContragentPassport;
    public BigDecimal soRefContractServicesSumma;
    public BigDecimal soRefContractServicesPower;
    public String soRefCommentServicesGen;
    public BigDecimal soRefContractServicesDistance;
    public BigDecimal soRefContractServicesDay;
    public String soRefUserGen;
    public Date soRefDateEdit;
    public Date soRefWarrantDate;
    public String soRefWarrantNumber;
    public String soRefWarrantFIO;
    public int soRefRegionalType = Integer.MIN_VALUE;
    public BigDecimal soRefBasisType;
    public String soRefContragentPosition;
    public Date soRefExecuteWorkDate;
    public Date soRefTimeStart;
    public Date soRefTimeFinal;
    public String soRefContragentPhoneNumber;
    public String soRefExecutorPhoneNumber;
    public String soRefContragentObjectWork;
    public int soRefIsNoPay = Integer.MIN_VALUE;
    public int soRefIsCustomerMaterials = Integer.MIN_VALUE;
    public Date soRefPayDate;
    public int soRefFinPayFormCode = Integer.MIN_VALUE;
    public String soRefFinPayFormName;
    public int soRefPartnerId = Integer.MIN_VALUE;
    public String soRefPayDetail;
    public String soRefActTransferNumber;
    public Date soRefActTransferDate;
    public String soRefResposible;
    public String soRefResposiblePosition;
    public String soRefResposibleTabNumber;
    public int soRefPrevContractStatus = Integer.MIN_VALUE;
    public int soRefReconnectionTU = Integer.MIN_VALUE;
    public int soRefPersonalAccountCode = Integer.MIN_VALUE;
    public String soRefPersonalAccountNumber;
    public String soRefTabNumber;
    public int soRefCnPackCode = Integer.MIN_VALUE;
    public int soRefDfPackCode = Integer.MIN_VALUE;
    public int soRefCountersZoneType = Integer.MIN_VALUE;
    public int payment2soRefCode = Integer.MIN_VALUE;
    public Date payment2soRefDateGen;
    public BigDecimal payment2soRefSumTotal;
    public BigDecimal payment2soRefSumGen;
    public BigDecimal payment2soRefSumVat;
    public String payment2soRefUserGen;
    public Date payment2soRefDateEdit;
    public int soBillRefCode = Integer.MIN_VALUE;
    public Date soBillRefDateGen;
    public BigDecimal soBillRefSumTotal;
    public BigDecimal soBillRefSumGen;
    public BigDecimal soBillRefSumVat;
    public String soBillRefUserGen;
    public Date soBillRefDateEdit;
    public int so2ProvRefCode = Integer.MIN_VALUE;
    public int so2ProvRefPartId = Integer.MIN_VALUE;
    public String so2ProvRefUserGen;
    public Date so2ProvRefDatePosting;
    public Date so2ProvRefDateEdit;

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


    public void setSoRefCode(int aValue){
       soRefCode = aValue;
    }
    public int getSoRefCode(){
       return soRefCode;
    }

    public void setSoRefContractNumber(String aValue){
       soRefContractNumber = aValue;
    }
    public String getSoRefContractNumber(){
       return soRefContractNumber;
    }


    public void setSoRefContractDate(Date aValue){
       soRefContractDate = aValue;
    }
    public Date getSoRefContractDate(){
       return soRefContractDate;
    }

    public void setSoRefName(String aValue){
       soRefName = aValue;
    }
    public String getSoRefName(){
       return soRefName;
    }

    public void setSoRefPartnerCode(String aValue){
       soRefPartnerCode = aValue;
    }
    public String getSoRefPartnerCode(){
       return soRefPartnerCode;
    }

    public void setSoRefFinDocCode(String aValue){
       soRefFinDocCode = aValue;
    }
    public String getSoRefFinDocCode(){
       return soRefFinDocCode;
    }

    public void setSoRefFinDocID(int aValue){
       soRefFinDocID = aValue;
    }
    public int getSoRefFinDocID(){
       return soRefFinDocID;
    }

    public void setSoRefCommentGen(String aValue){
       soRefCommentGen = aValue;
    }
    public String getSoRefCommentGen(){
       return soRefCommentGen;
    }

    public void setSoRefContractNumberServices(String aValue){
       soRefContractNumberServices = aValue;
    }
    public String getSoRefContractNumberServices(){
       return soRefContractNumberServices;
    }


    public void setSoRefContractDateServices(Date aValue){
       soRefContractDateServices = aValue;
    }
    public Date getSoRefContractDateServices(){
       return soRefContractDateServices;
    }

    public void setSoRefContragentName(String aValue){
       soRefContragentName = aValue;
    }
    public String getSoRefContragentName(){
       return soRefContragentName;
    }

    public void setSoRefContragentAddress(String aValue){
       soRefContragentAddress = aValue;
    }
    public String getSoRefContragentAddress(){
       return soRefContragentAddress;
    }

    public void setSoRefContragentAddressWork(String aValue){
       soRefContragentAddressWork = aValue;
    }
    public String getSoRefContragentAddressWork(){
       return soRefContragentAddressWork;
    }

    public void setSoRefContragentOkpo(String aValue){
       soRefContragentOkpo = aValue;
    }
    public String getSoRefContragentOkpo(){
       return soRefContragentOkpo;
    }

    public void setSoRefContragentBankAccount(String aValue){
       soRefContragentBankAccount = aValue;
    }
    public String getSoRefContragentBankAccount(){
       return soRefContragentBankAccount;
    }

    public void setSoRefContragentBankName(String aValue){
       soRefContragentBankName = aValue;
    }
    public String getSoRefContragentBankName(){
       return soRefContragentBankName;
    }

    public void setSoRefContragentBankMfo(String aValue){
       soRefContragentBankMfo = aValue;
    }
    public String getSoRefContragentBankMfo(){
       return soRefContragentBankMfo;
    }

    public void setSoRefContragentBossName(String aValue){
       soRefContragentBossName = aValue;
    }
    public String getSoRefContragentBossName(){
       return soRefContragentBossName;
    }

    public void setSoRefContragentPassport(String aValue){
       soRefContragentPassport = aValue;
    }
    public String getSoRefContragentPassport(){
       return soRefContragentPassport;
    }

    public void setSoRefContractServicesSumma(BigDecimal aValue){
       soRefContractServicesSumma = aValue;
    }
    public BigDecimal getSoRefContractServicesSumma(){
       return soRefContractServicesSumma;
    }

    public void setSoRefContractServicesPower(BigDecimal aValue){
       soRefContractServicesPower = aValue;
    }
    public BigDecimal getSoRefContractServicesPower(){
       return soRefContractServicesPower;
    }

    public void setSoRefCommentServicesGen(String aValue){
       soRefCommentServicesGen = aValue;
    }
    public String getSoRefCommentServicesGen(){
       return soRefCommentServicesGen;
    }

    public void setSoRefContractServicesDistance(BigDecimal aValue){
       soRefContractServicesDistance = aValue;
    }
    public BigDecimal getSoRefContractServicesDistance(){
       return soRefContractServicesDistance;
    }

    public void setSoRefContractServicesDay(BigDecimal aValue){
       soRefContractServicesDay = aValue;
    }
    public BigDecimal getSoRefContractServicesDay(){
       return soRefContractServicesDay;
    }

    public void setSoRefUserGen(String aValue){
       soRefUserGen = aValue;
    }
    public String getSoRefUserGen(){
       return soRefUserGen;
    }


    public void setSoRefDateEdit(Date aValue){
       soRefDateEdit = aValue;
    }
    public Date getSoRefDateEdit(){
       return soRefDateEdit;
    }


    public void setSoRefWarrantDate(Date aValue){
       soRefWarrantDate = aValue;
    }
    public Date getSoRefWarrantDate(){
       return soRefWarrantDate;
    }

    public void setSoRefWarrantNumber(String aValue){
       soRefWarrantNumber = aValue;
    }
    public String getSoRefWarrantNumber(){
       return soRefWarrantNumber;
    }

    public void setSoRefWarrantFIO(String aValue){
       soRefWarrantFIO = aValue;
    }
    public String getSoRefWarrantFIO(){
       return soRefWarrantFIO;
    }

    public void setSoRefRegionalType(int aValue){
       soRefRegionalType = aValue;
    }
    public int getSoRefRegionalType(){
       return soRefRegionalType;
    }

    public void setSoRefBasisType(BigDecimal aValue){
       soRefBasisType = aValue;
    }
    public BigDecimal getSoRefBasisType(){
       return soRefBasisType;
    }

    public void setSoRefContragentPosition(String aValue){
       soRefContragentPosition = aValue;
    }
    public String getSoRefContragentPosition(){
       return soRefContragentPosition;
    }


    public void setSoRefExecuteWorkDate(Date aValue){
       soRefExecuteWorkDate = aValue;
    }
    public Date getSoRefExecuteWorkDate(){
       return soRefExecuteWorkDate;
    }


    public void setSoRefTimeStart(Date aValue){
       soRefTimeStart = aValue;
    }
    public Date getSoRefTimeStart(){
       return soRefTimeStart;
    }


    public void setSoRefTimeFinal(Date aValue){
       soRefTimeFinal = aValue;
    }
    public Date getSoRefTimeFinal(){
       return soRefTimeFinal;
    }

    public void setSoRefContragentPhoneNumber(String aValue){
       soRefContragentPhoneNumber = aValue;
    }
    public String getSoRefContragentPhoneNumber(){
       return soRefContragentPhoneNumber;
    }

    public void setSoRefExecutorPhoneNumber(String aValue){
       soRefExecutorPhoneNumber = aValue;
    }
    public String getSoRefExecutorPhoneNumber(){
       return soRefExecutorPhoneNumber;
    }

    public void setSoRefContragentObjectWork(String aValue){
       soRefContragentObjectWork = aValue;
    }
    public String getSoRefContragentObjectWork(){
       return soRefContragentObjectWork;
    }

    public void setSoRefIsNoPay(int aValue){
       soRefIsNoPay = aValue;
    }
    public int getSoRefIsNoPay(){
       return soRefIsNoPay;
    }

    public void setSoRefIsCustomerMaterials(int aValue){
       soRefIsCustomerMaterials = aValue;
    }
    public int getSoRefIsCustomerMaterials(){
       return soRefIsCustomerMaterials;
    }


    public void setSoRefPayDate(Date aValue){
       soRefPayDate = aValue;
    }
    public Date getSoRefPayDate(){
       return soRefPayDate;
    }

    public void setSoRefFinPayFormCode(int aValue){
       soRefFinPayFormCode = aValue;
    }
    public int getSoRefFinPayFormCode(){
       return soRefFinPayFormCode;
    }

    public void setSoRefFinPayFormName(String aValue){
       soRefFinPayFormName = aValue;
    }
    public String getSoRefFinPayFormName(){
       return soRefFinPayFormName;
    }

    public void setSoRefPartnerId(int aValue){
       soRefPartnerId = aValue;
    }
    public int getSoRefPartnerId(){
       return soRefPartnerId;
    }

    public void setSoRefPayDetail(String aValue){
       soRefPayDetail = aValue;
    }
    public String getSoRefPayDetail(){
       return soRefPayDetail;
    }

    public void setSoRefActTransferNumber(String aValue){
       soRefActTransferNumber = aValue;
    }
    public String getSoRefActTransferNumber(){
       return soRefActTransferNumber;
    }


    public void setSoRefActTransferDate(Date aValue){
       soRefActTransferDate = aValue;
    }
    public Date getSoRefActTransferDate(){
       return soRefActTransferDate;
    }

    public void setSoRefResposible(String aValue){
       soRefResposible = aValue;
    }
    public String getSoRefResposible(){
       return soRefResposible;
    }

    public void setSoRefResposiblePosition(String aValue){
       soRefResposiblePosition = aValue;
    }
    public String getSoRefResposiblePosition(){
       return soRefResposiblePosition;
    }

    public void setSoRefResposibleTabNumber(String aValue){
       soRefResposibleTabNumber = aValue;
    }
    public String getSoRefResposibleTabNumber(){
       return soRefResposibleTabNumber;
    }

    public void setSoRefPrevContractStatus(int aValue){
       soRefPrevContractStatus = aValue;
    }
    public int getSoRefPrevContractStatus(){
       return soRefPrevContractStatus;
    }

    public void setSoRefReconnectionTU(int aValue){
       soRefReconnectionTU = aValue;
    }
    public int getSoRefReconnectionTU(){
       return soRefReconnectionTU;
    }

    public void setSoRefPersonalAccountCode(int aValue){
       soRefPersonalAccountCode = aValue;
    }
    public int getSoRefPersonalAccountCode(){
       return soRefPersonalAccountCode;
    }

    public void setSoRefPersonalAccountNumber(String aValue){
       soRefPersonalAccountNumber = aValue;
    }
    public String getSoRefPersonalAccountNumber(){
       return soRefPersonalAccountNumber;
    }

    public void setSoRefTabNumber(String aValue){
       soRefTabNumber = aValue;
    }
    public String getSoRefTabNumber(){
       return soRefTabNumber;
    }

    public void setSoRefCnPackCode(int aValue){
       soRefCnPackCode = aValue;
    }
    public int getSoRefCnPackCode(){
       return soRefCnPackCode;
    }

    public void setSoRefDfPackCode(int aValue){
       soRefDfPackCode = aValue;
    }
    public int getSoRefDfPackCode(){
       return soRefDfPackCode;
    }

    public void setSoRefCountersZoneType(int aValue){
       soRefCountersZoneType = aValue;
    }
    public int getSoRefCountersZoneType(){
       return soRefCountersZoneType;
    }

    public void setPayment2soRefCode(int aValue){
       payment2soRefCode = aValue;
    }
    public int getPayment2soRefCode(){
       return payment2soRefCode;
    }


    public void setPayment2soRefDateGen(Date aValue){
       payment2soRefDateGen = aValue;
    }
    public Date getPayment2soRefDateGen(){
       return payment2soRefDateGen;
    }

    public void setPayment2soRefSumTotal(BigDecimal aValue){
       payment2soRefSumTotal = aValue;
    }
    public BigDecimal getPayment2soRefSumTotal(){
       return payment2soRefSumTotal;
    }

    public void setPayment2soRefSumGen(BigDecimal aValue){
       payment2soRefSumGen = aValue;
    }
    public BigDecimal getPayment2soRefSumGen(){
       return payment2soRefSumGen;
    }

    public void setPayment2soRefSumVat(BigDecimal aValue){
       payment2soRefSumVat = aValue;
    }
    public BigDecimal getPayment2soRefSumVat(){
       return payment2soRefSumVat;
    }

    public void setPayment2soRefUserGen(String aValue){
       payment2soRefUserGen = aValue;
    }
    public String getPayment2soRefUserGen(){
       return payment2soRefUserGen;
    }


    public void setPayment2soRefDateEdit(Date aValue){
       payment2soRefDateEdit = aValue;
    }
    public Date getPayment2soRefDateEdit(){
       return payment2soRefDateEdit;
    }

    public void setSoBillRefCode(int aValue){
       soBillRefCode = aValue;
    }
    public int getSoBillRefCode(){
       return soBillRefCode;
    }


    public void setSoBillRefDateGen(Date aValue){
       soBillRefDateGen = aValue;
    }
    public Date getSoBillRefDateGen(){
       return soBillRefDateGen;
    }

    public void setSoBillRefSumTotal(BigDecimal aValue){
       soBillRefSumTotal = aValue;
    }
    public BigDecimal getSoBillRefSumTotal(){
       return soBillRefSumTotal;
    }

    public void setSoBillRefSumGen(BigDecimal aValue){
       soBillRefSumGen = aValue;
    }
    public BigDecimal getSoBillRefSumGen(){
       return soBillRefSumGen;
    }

    public void setSoBillRefSumVat(BigDecimal aValue){
       soBillRefSumVat = aValue;
    }
    public BigDecimal getSoBillRefSumVat(){
       return soBillRefSumVat;
    }

    public void setSoBillRefUserGen(String aValue){
       soBillRefUserGen = aValue;
    }
    public String getSoBillRefUserGen(){
       return soBillRefUserGen;
    }


    public void setSoBillRefDateEdit(Date aValue){
       soBillRefDateEdit = aValue;
    }
    public Date getSoBillRefDateEdit(){
       return soBillRefDateEdit;
    }

    public void setSo2ProvRefCode(int aValue){
       so2ProvRefCode = aValue;
    }
    public int getSo2ProvRefCode(){
       return so2ProvRefCode;
    }

    public void setSo2ProvRefPartId(int aValue){
       so2ProvRefPartId = aValue;
    }
    public int getSo2ProvRefPartId(){
       return so2ProvRefPartId;
    }

    public void setSo2ProvRefUserGen(String aValue){
       so2ProvRefUserGen = aValue;
    }
    public String getSo2ProvRefUserGen(){
       return so2ProvRefUserGen;
    }


    public void setSo2ProvRefDatePosting(Date aValue){
       so2ProvRefDatePosting = aValue;
    }
    public Date getSo2ProvRefDatePosting(){
       return so2ProvRefDatePosting;
    }


    public void setSo2ProvRefDateEdit(Date aValue){
       so2ProvRefDateEdit = aValue;
    }
    public Date getSo2ProvRefDateEdit(){
       return so2ProvRefDateEdit;
    }



}