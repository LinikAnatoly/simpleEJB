
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesObject2PaymentSchedule;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesObject2PaymentScheduleShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date startDate ;
    public Date endDate ;
    public BigDecimal paySum;
    public int servicesObjectRefCode = Integer.MIN_VALUE;
    public String servicesObjectRefContractNumber;
    public Date servicesObjectRefContractDate;
    public String servicesObjectRefName;
    public String servicesObjectRefPartnerCode;
    public String servicesObjectRefFinDocCode;
    public int servicesObjectRefFinDocID = Integer.MIN_VALUE;
    public String servicesObjectRefCommentGen;
    public String servicesObjectRefContractNumberServices;
    public Date servicesObjectRefContractDateServices;
    public String servicesObjectRefContragentName;
    public String servicesObjectRefContragentAddress;
    public String servicesObjectRefContragentAddressWork;
    public String servicesObjectRefContragentOkpo;
    public String servicesObjectRefContragentBankAccount;
    public String servicesObjectRefContragentBankName;
    public String servicesObjectRefContragentBankMfo;
    public String servicesObjectRefContragentBossName;
    public String servicesObjectRefContragentPassport;
    public BigDecimal servicesObjectRefContractServicesSumma;
    public BigDecimal servicesObjectRefContractServicesPower;
    public String servicesObjectRefCommentServicesGen;
    public BigDecimal servicesObjectRefContractServicesDistance;
    public BigDecimal servicesObjectRefContractServicesDay;
    public String servicesObjectRefUserGen;
    public Date servicesObjectRefDateEdit;
    public Date servicesObjectRefWarrantDate;
    public String servicesObjectRefWarrantNumber;
    public String servicesObjectRefWarrantFIO;
    public int servicesObjectRefRegionalType = Integer.MIN_VALUE;
    public BigDecimal servicesObjectRefBasisType;
    public String servicesObjectRefContragentPosition;
    public Date servicesObjectRefExecuteWorkDate;
    public Date servicesObjectRefTimeStart;
    public Date servicesObjectRefTimeFinal;
    public String servicesObjectRefContragentPhoneNumber;
    public String servicesObjectRefExecutorPhoneNumber;
    public String servicesObjectRefContragentObjectWork;
    public int servicesObjectRefIsNoPay = Integer.MIN_VALUE;
    public Date servicesObjectRefPayDate;
    public int servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
    public String servicesObjectRefFinPayFormName;
    public int servicesObjectRefPartnerId = Integer.MIN_VALUE;
    public String servicesObjectRefPayDetail;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setStartDate(Date aValue){
       startDate = aValue;
    }

    public Date getStartDate(){
       return startDate;
    }

    public void setEndDate(Date aValue){
       endDate = aValue;
    }

    public Date getEndDate(){
       return endDate;
    }
    public void setPaySum(BigDecimal aValue){
       paySum = aValue;
    }

    public BigDecimal getPaySum(){
       return paySum;
    }


    public void setServicesObjectRefCode(int aValue){
       servicesObjectRefCode = aValue;
    }
    public int getServicesObjectRefCode(){
       return servicesObjectRefCode;
    }

    public void setServicesObjectRefContractNumber(String aValue){
       servicesObjectRefContractNumber = aValue;
    }
    public String getServicesObjectRefContractNumber(){
       return servicesObjectRefContractNumber;
    }


    public void setServicesObjectRefContractDate(Date aValue){
       servicesObjectRefContractDate = aValue;
    }
    public Date getServicesObjectRefContractDate(){
       return servicesObjectRefContractDate;
    }

    public void setServicesObjectRefName(String aValue){
       servicesObjectRefName = aValue;
    }
    public String getServicesObjectRefName(){
       return servicesObjectRefName;
    }

    public void setServicesObjectRefPartnerCode(String aValue){
       servicesObjectRefPartnerCode = aValue;
    }
    public String getServicesObjectRefPartnerCode(){
       return servicesObjectRefPartnerCode;
    }

    public void setServicesObjectRefFinDocCode(String aValue){
       servicesObjectRefFinDocCode = aValue;
    }
    public String getServicesObjectRefFinDocCode(){
       return servicesObjectRefFinDocCode;
    }

    public void setServicesObjectRefFinDocID(int aValue){
       servicesObjectRefFinDocID = aValue;
    }
    public int getServicesObjectRefFinDocID(){
       return servicesObjectRefFinDocID;
    }

    public void setServicesObjectRefCommentGen(String aValue){
       servicesObjectRefCommentGen = aValue;
    }
    public String getServicesObjectRefCommentGen(){
       return servicesObjectRefCommentGen;
    }

    public void setServicesObjectRefContractNumberServices(String aValue){
       servicesObjectRefContractNumberServices = aValue;
    }
    public String getServicesObjectRefContractNumberServices(){
       return servicesObjectRefContractNumberServices;
    }


    public void setServicesObjectRefContractDateServices(Date aValue){
       servicesObjectRefContractDateServices = aValue;
    }
    public Date getServicesObjectRefContractDateServices(){
       return servicesObjectRefContractDateServices;
    }

    public void setServicesObjectRefContragentName(String aValue){
       servicesObjectRefContragentName = aValue;
    }
    public String getServicesObjectRefContragentName(){
       return servicesObjectRefContragentName;
    }

    public void setServicesObjectRefContragentAddress(String aValue){
       servicesObjectRefContragentAddress = aValue;
    }
    public String getServicesObjectRefContragentAddress(){
       return servicesObjectRefContragentAddress;
    }

    public void setServicesObjectRefContragentAddressWork(String aValue){
       servicesObjectRefContragentAddressWork = aValue;
    }
    public String getServicesObjectRefContragentAddressWork(){
       return servicesObjectRefContragentAddressWork;
    }

    public void setServicesObjectRefContragentOkpo(String aValue){
       servicesObjectRefContragentOkpo = aValue;
    }
    public String getServicesObjectRefContragentOkpo(){
       return servicesObjectRefContragentOkpo;
    }

    public void setServicesObjectRefContragentBankAccount(String aValue){
       servicesObjectRefContragentBankAccount = aValue;
    }
    public String getServicesObjectRefContragentBankAccount(){
       return servicesObjectRefContragentBankAccount;
    }

    public void setServicesObjectRefContragentBankName(String aValue){
       servicesObjectRefContragentBankName = aValue;
    }
    public String getServicesObjectRefContragentBankName(){
       return servicesObjectRefContragentBankName;
    }

    public void setServicesObjectRefContragentBankMfo(String aValue){
       servicesObjectRefContragentBankMfo = aValue;
    }
    public String getServicesObjectRefContragentBankMfo(){
       return servicesObjectRefContragentBankMfo;
    }

    public void setServicesObjectRefContragentBossName(String aValue){
       servicesObjectRefContragentBossName = aValue;
    }
    public String getServicesObjectRefContragentBossName(){
       return servicesObjectRefContragentBossName;
    }

    public void setServicesObjectRefContragentPassport(String aValue){
       servicesObjectRefContragentPassport = aValue;
    }
    public String getServicesObjectRefContragentPassport(){
       return servicesObjectRefContragentPassport;
    }

    public void setServicesObjectRefContractServicesSumma(BigDecimal aValue){
       servicesObjectRefContractServicesSumma = aValue;
    }
    public BigDecimal getServicesObjectRefContractServicesSumma(){
       return servicesObjectRefContractServicesSumma;
    }

    public void setServicesObjectRefContractServicesPower(BigDecimal aValue){
       servicesObjectRefContractServicesPower = aValue;
    }
    public BigDecimal getServicesObjectRefContractServicesPower(){
       return servicesObjectRefContractServicesPower;
    }

    public void setServicesObjectRefCommentServicesGen(String aValue){
       servicesObjectRefCommentServicesGen = aValue;
    }
    public String getServicesObjectRefCommentServicesGen(){
       return servicesObjectRefCommentServicesGen;
    }

    public void setServicesObjectRefContractServicesDistance(BigDecimal aValue){
       servicesObjectRefContractServicesDistance = aValue;
    }
    public BigDecimal getServicesObjectRefContractServicesDistance(){
       return servicesObjectRefContractServicesDistance;
    }

    public void setServicesObjectRefContractServicesDay(BigDecimal aValue){
       servicesObjectRefContractServicesDay = aValue;
    }
    public BigDecimal getServicesObjectRefContractServicesDay(){
       return servicesObjectRefContractServicesDay;
    }

    public void setServicesObjectRefUserGen(String aValue){
       servicesObjectRefUserGen = aValue;
    }
    public String getServicesObjectRefUserGen(){
       return servicesObjectRefUserGen;
    }


    public void setServicesObjectRefDateEdit(Date aValue){
       servicesObjectRefDateEdit = aValue;
    }
    public Date getServicesObjectRefDateEdit(){
       return servicesObjectRefDateEdit;
    }


    public void setServicesObjectRefWarrantDate(Date aValue){
       servicesObjectRefWarrantDate = aValue;
    }
    public Date getServicesObjectRefWarrantDate(){
       return servicesObjectRefWarrantDate;
    }

    public void setServicesObjectRefWarrantNumber(String aValue){
       servicesObjectRefWarrantNumber = aValue;
    }
    public String getServicesObjectRefWarrantNumber(){
       return servicesObjectRefWarrantNumber;
    }

    public void setServicesObjectRefWarrantFIO(String aValue){
       servicesObjectRefWarrantFIO = aValue;
    }
    public String getServicesObjectRefWarrantFIO(){
       return servicesObjectRefWarrantFIO;
    }

    public void setServicesObjectRefRegionalType(int aValue){
       servicesObjectRefRegionalType = aValue;
    }
    public int getServicesObjectRefRegionalType(){
       return servicesObjectRefRegionalType;
    }

    public void setServicesObjectRefBasisType(BigDecimal aValue){
       servicesObjectRefBasisType = aValue;
    }
    public BigDecimal getServicesObjectRefBasisType(){
       return servicesObjectRefBasisType;
    }

    public void setServicesObjectRefContragentPosition(String aValue){
       servicesObjectRefContragentPosition = aValue;
    }
    public String getServicesObjectRefContragentPosition(){
       return servicesObjectRefContragentPosition;
    }


    public void setServicesObjectRefExecuteWorkDate(Date aValue){
       servicesObjectRefExecuteWorkDate = aValue;
    }
    public Date getServicesObjectRefExecuteWorkDate(){
       return servicesObjectRefExecuteWorkDate;
    }


    public void setServicesObjectRefTimeStart(Date aValue){
       servicesObjectRefTimeStart = aValue;
    }
    public Date getServicesObjectRefTimeStart(){
       return servicesObjectRefTimeStart;
    }


    public void setServicesObjectRefTimeFinal(Date aValue){
       servicesObjectRefTimeFinal = aValue;
    }
    public Date getServicesObjectRefTimeFinal(){
       return servicesObjectRefTimeFinal;
    }

    public void setServicesObjectRefContragentPhoneNumber(String aValue){
       servicesObjectRefContragentPhoneNumber = aValue;
    }
    public String getServicesObjectRefContragentPhoneNumber(){
       return servicesObjectRefContragentPhoneNumber;
    }

    public void setServicesObjectRefExecutorPhoneNumber(String aValue){
       servicesObjectRefExecutorPhoneNumber = aValue;
    }
    public String getServicesObjectRefExecutorPhoneNumber(){
       return servicesObjectRefExecutorPhoneNumber;
    }

    public void setServicesObjectRefContragentObjectWork(String aValue){
       servicesObjectRefContragentObjectWork = aValue;
    }
    public String getServicesObjectRefContragentObjectWork(){
       return servicesObjectRefContragentObjectWork;
    }

    public void setServicesObjectRefIsNoPay(int aValue){
       servicesObjectRefIsNoPay = aValue;
    }
    public int getServicesObjectRefIsNoPay(){
       return servicesObjectRefIsNoPay;
    }


    public void setServicesObjectRefPayDate(Date aValue){
       servicesObjectRefPayDate = aValue;
    }
    public Date getServicesObjectRefPayDate(){
       return servicesObjectRefPayDate;
    }

    public void setServicesObjectRefFinPayFormCode(int aValue){
       servicesObjectRefFinPayFormCode = aValue;
    }
    public int getServicesObjectRefFinPayFormCode(){
       return servicesObjectRefFinPayFormCode;
    }

    public void setServicesObjectRefFinPayFormName(String aValue){
       servicesObjectRefFinPayFormName = aValue;
    }
    public String getServicesObjectRefFinPayFormName(){
       return servicesObjectRefFinPayFormName;
    }

    public void setServicesObjectRefPartnerId(int aValue){
       servicesObjectRefPartnerId = aValue;
    }
    public int getServicesObjectRefPartnerId(){
       return servicesObjectRefPartnerId;
    }

    public void setServicesObjectRefPayDetail(String aValue){
       servicesObjectRefPayDetail = aValue;
    }
    public String getServicesObjectRefPayDetail(){
       return servicesObjectRefPayDetail;
    }



}