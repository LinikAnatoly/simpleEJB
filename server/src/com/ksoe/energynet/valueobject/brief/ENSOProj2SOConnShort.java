
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSOProj2SOConn;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSOProj2SOConnShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int SOProjRefCode = Integer.MIN_VALUE;
	public String SOProjRefContractNumber;
	public Date SOProjRefContractDate;
	public String SOProjRefName;
	public String SOProjRefPartnerCode;
	public String SOProjRefFinDocCode;
	public int SOProjRefFinDocID = Integer.MIN_VALUE;
	public String SOProjRefCommentGen;
	public String SOProjRefContractNumberServices;
	public Date SOProjRefContractDateServices;
	public String SOProjRefContragentName;
	public String SOProjRefContragentAddress;
	public String SOProjRefContragentAddressWork;
	public String SOProjRefContragentOkpo;
	public String SOProjRefContragentBankAccount;
	public String SOProjRefContragentBankName;
	public String SOProjRefContragentBankMfo;
	public String SOProjRefContragentBossName;
	public String SOProjRefContragentPassport;
	public BigDecimal SOProjRefContractServicesSumma;
	public BigDecimal SOProjRefContractServicesPower;
	public String SOProjRefCommentServicesGen;
	public BigDecimal SOProjRefContractServicesDistance;
	public BigDecimal SOProjRefContractServicesDay;
	public String SOProjRefUserGen;
	public Date SOProjRefDateEdit;
	public Date SOProjRefWarrantDate;
	public String SOProjRefWarrantNumber;
	public String SOProjRefWarrantFIO;
	public int SOProjRefRegionalType = Integer.MIN_VALUE;
	public BigDecimal SOProjRefBasisType;
	public String SOProjRefContragentPosition;
	public Date SOProjRefExecuteWorkDate;
	public Date SOProjRefTimeStart;
	public Date SOProjRefTimeFinal;
	public String SOProjRefContragentPhoneNumber;
	public String SOProjRefExecutorPhoneNumber;
	public String SOProjRefContragentObjectWork;
	public int SOProjRefIsNoPay = Integer.MIN_VALUE;
	public int SOProjRefIsCustomerMaterials = Integer.MIN_VALUE;
	public Date SOProjRefPayDate;
	public int SOProjRefFinPayFormCode = Integer.MIN_VALUE;
	public String SOProjRefFinPayFormName;
	public int SOProjRefPartnerId = Integer.MIN_VALUE;
	public String SOProjRefPayDetail;
	public String SOProjRefActTransferNumber;
	public Date SOProjRefActTransferDate;
	public String SOProjRefResposible;
	public String SOProjRefResposiblePosition;
	public String SOProjRefResposibleTabNumber;
	public int SOProjRefPrevContractStatus = Integer.MIN_VALUE;
	public int SOProjRefReconnectionTU = Integer.MIN_VALUE;
	public int SOProjRefPersonalAccountCode = Integer.MIN_VALUE;
	public String SOProjRefPersonalAccountNumber;
	public String SOProjRefTabNumber;
	public String SOProjRefCitiesList;
	public BigDecimal SOProjRefLineLength;
	public String SOProjRefProjectCode;
	public int SOProjRefCnPackCode = Integer.MIN_VALUE;
	public int SOProjRefDfPackCode = Integer.MIN_VALUE;
	public int SOProjRefCountersZoneType = Integer.MIN_VALUE;
	public String SOProjRefAxPartnerCode;
	public String SOProjRefAxPartnerName;
	public String SOProjRefAxContractNumber;
	public Date SOProjRefAxContractDate;
	public String SOProjRefAxContractCode;
	public String SOProjRefAxContractId;
	public String SOProjRefAxContractCommentGen;
	public int SOConnRefCode = Integer.MIN_VALUE;
	public String SOConnRefContractNumber;
	public Date SOConnRefContractDate;
	public String SOConnRefName;
	public String SOConnRefPartnerCode;
	public String SOConnRefFinDocCode;
	public int SOConnRefFinDocID = Integer.MIN_VALUE;
	public String SOConnRefCommentGen;
	public String SOConnRefContractNumberServices;
	public Date SOConnRefContractDateServices;
	public String SOConnRefContragentName;
	public String SOConnRefContragentAddress;
	public String SOConnRefContragentAddressWork;
	public String SOConnRefContragentOkpo;
	public String SOConnRefContragentBankAccount;
	public String SOConnRefContragentBankName;
	public String SOConnRefContragentBankMfo;
	public String SOConnRefContragentBossName;
	public String SOConnRefContragentPassport;
	public BigDecimal SOConnRefContractServicesSumma;
	public BigDecimal SOConnRefContractServicesPower;
	public String SOConnRefCommentServicesGen;
	public BigDecimal SOConnRefContractServicesDistance;
	public BigDecimal SOConnRefContractServicesDay;
	public String SOConnRefUserGen;
	public Date SOConnRefDateEdit;
	public Date SOConnRefWarrantDate;
	public String SOConnRefWarrantNumber;
	public String SOConnRefWarrantFIO;
	public int SOConnRefRegionalType = Integer.MIN_VALUE;
	public BigDecimal SOConnRefBasisType;
	public String SOConnRefContragentPosition;
	public Date SOConnRefExecuteWorkDate;
	public Date SOConnRefTimeStart;
	public Date SOConnRefTimeFinal;
	public String SOConnRefContragentPhoneNumber;
	public String SOConnRefExecutorPhoneNumber;
	public String SOConnRefContragentObjectWork;
	public int SOConnRefIsNoPay = Integer.MIN_VALUE;
	public int SOConnRefIsCustomerMaterials = Integer.MIN_VALUE;
	public Date SOConnRefPayDate;
	public int SOConnRefFinPayFormCode = Integer.MIN_VALUE;
	public String SOConnRefFinPayFormName;
	public int SOConnRefPartnerId = Integer.MIN_VALUE;
	public String SOConnRefPayDetail;
	public String SOConnRefActTransferNumber;
	public Date SOConnRefActTransferDate;
	public String SOConnRefResposible;
	public String SOConnRefResposiblePosition;
	public String SOConnRefResposibleTabNumber;
	public int SOConnRefPrevContractStatus = Integer.MIN_VALUE;
	public int SOConnRefReconnectionTU = Integer.MIN_VALUE;
	public int SOConnRefPersonalAccountCode = Integer.MIN_VALUE;
	public String SOConnRefPersonalAccountNumber;
	public String SOConnRefTabNumber;
	public String SOConnRefCitiesList;
	public BigDecimal SOConnRefLineLength;
	public String SOConnRefProjectCode;
	public int SOConnRefCnPackCode = Integer.MIN_VALUE;
	public int SOConnRefDfPackCode = Integer.MIN_VALUE;
	public int SOConnRefCountersZoneType = Integer.MIN_VALUE;
	public String SOConnRefAxPartnerCode;
	public String SOConnRefAxPartnerName;
	public String SOConnRefAxContractNumber;
	public Date SOConnRefAxContractDate;
	public String SOConnRefAxContractCode;
	public String SOConnRefAxContractId;
	public String SOConnRefAxContractCommentGen;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setSOProjRefCode(int aValue){
		SOProjRefCode = aValue;
	}
	public int getSOProjRefCode(){
		return SOProjRefCode;
	}

	public void setSOProjRefContractNumber(String aValue){
		SOProjRefContractNumber = aValue;
	}
	public String getSOProjRefContractNumber(){
		return SOProjRefContractNumber;
	}

	public void setSOProjRefContractDate(Date aValue){
		SOProjRefContractDate = aValue;
	}
	public Date getSOProjRefContractDate(){
		return SOProjRefContractDate;
	}

	public void setSOProjRefName(String aValue){
		SOProjRefName = aValue;
	}
	public String getSOProjRefName(){
		return SOProjRefName;
	}

	public void setSOProjRefPartnerCode(String aValue){
		SOProjRefPartnerCode = aValue;
	}
	public String getSOProjRefPartnerCode(){
		return SOProjRefPartnerCode;
	}

	public void setSOProjRefFinDocCode(String aValue){
		SOProjRefFinDocCode = aValue;
	}
	public String getSOProjRefFinDocCode(){
		return SOProjRefFinDocCode;
	}

	public void setSOProjRefFinDocID(int aValue){
		SOProjRefFinDocID = aValue;
	}
	public int getSOProjRefFinDocID(){
		return SOProjRefFinDocID;
	}

	public void setSOProjRefCommentGen(String aValue){
		SOProjRefCommentGen = aValue;
	}
	public String getSOProjRefCommentGen(){
		return SOProjRefCommentGen;
	}

	public void setSOProjRefContractNumberServices(String aValue){
		SOProjRefContractNumberServices = aValue;
	}
	public String getSOProjRefContractNumberServices(){
		return SOProjRefContractNumberServices;
	}

	public void setSOProjRefContractDateServices(Date aValue){
		SOProjRefContractDateServices = aValue;
	}
	public Date getSOProjRefContractDateServices(){
		return SOProjRefContractDateServices;
	}

	public void setSOProjRefContragentName(String aValue){
		SOProjRefContragentName = aValue;
	}
	public String getSOProjRefContragentName(){
		return SOProjRefContragentName;
	}

	public void setSOProjRefContragentAddress(String aValue){
		SOProjRefContragentAddress = aValue;
	}
	public String getSOProjRefContragentAddress(){
		return SOProjRefContragentAddress;
	}

	public void setSOProjRefContragentAddressWork(String aValue){
		SOProjRefContragentAddressWork = aValue;
	}
	public String getSOProjRefContragentAddressWork(){
		return SOProjRefContragentAddressWork;
	}

	public void setSOProjRefContragentOkpo(String aValue){
		SOProjRefContragentOkpo = aValue;
	}
	public String getSOProjRefContragentOkpo(){
		return SOProjRefContragentOkpo;
	}

	public void setSOProjRefContragentBankAccount(String aValue){
		SOProjRefContragentBankAccount = aValue;
	}
	public String getSOProjRefContragentBankAccount(){
		return SOProjRefContragentBankAccount;
	}

	public void setSOProjRefContragentBankName(String aValue){
		SOProjRefContragentBankName = aValue;
	}
	public String getSOProjRefContragentBankName(){
		return SOProjRefContragentBankName;
	}

	public void setSOProjRefContragentBankMfo(String aValue){
		SOProjRefContragentBankMfo = aValue;
	}
	public String getSOProjRefContragentBankMfo(){
		return SOProjRefContragentBankMfo;
	}

	public void setSOProjRefContragentBossName(String aValue){
		SOProjRefContragentBossName = aValue;
	}
	public String getSOProjRefContragentBossName(){
		return SOProjRefContragentBossName;
	}

	public void setSOProjRefContragentPassport(String aValue){
		SOProjRefContragentPassport = aValue;
	}
	public String getSOProjRefContragentPassport(){
		return SOProjRefContragentPassport;
	}

	public void setSOProjRefContractServicesSumma(BigDecimal aValue){
		SOProjRefContractServicesSumma = aValue;
	}
	public BigDecimal getSOProjRefContractServicesSumma(){
		return SOProjRefContractServicesSumma;
	}

	public void setSOProjRefContractServicesPower(BigDecimal aValue){
		SOProjRefContractServicesPower = aValue;
	}
	public BigDecimal getSOProjRefContractServicesPower(){
		return SOProjRefContractServicesPower;
	}

	public void setSOProjRefCommentServicesGen(String aValue){
		SOProjRefCommentServicesGen = aValue;
	}
	public String getSOProjRefCommentServicesGen(){
		return SOProjRefCommentServicesGen;
	}

	public void setSOProjRefContractServicesDistance(BigDecimal aValue){
		SOProjRefContractServicesDistance = aValue;
	}
	public BigDecimal getSOProjRefContractServicesDistance(){
		return SOProjRefContractServicesDistance;
	}

	public void setSOProjRefContractServicesDay(BigDecimal aValue){
		SOProjRefContractServicesDay = aValue;
	}
	public BigDecimal getSOProjRefContractServicesDay(){
		return SOProjRefContractServicesDay;
	}

	public void setSOProjRefUserGen(String aValue){
		SOProjRefUserGen = aValue;
	}
	public String getSOProjRefUserGen(){
		return SOProjRefUserGen;
	}

	public void setSOProjRefDateEdit(Date aValue){
		SOProjRefDateEdit = aValue;
	}
	public Date getSOProjRefDateEdit(){
		return SOProjRefDateEdit;
	}

	public void setSOProjRefWarrantDate(Date aValue){
		SOProjRefWarrantDate = aValue;
	}
	public Date getSOProjRefWarrantDate(){
		return SOProjRefWarrantDate;
	}

	public void setSOProjRefWarrantNumber(String aValue){
		SOProjRefWarrantNumber = aValue;
	}
	public String getSOProjRefWarrantNumber(){
		return SOProjRefWarrantNumber;
	}

	public void setSOProjRefWarrantFIO(String aValue){
		SOProjRefWarrantFIO = aValue;
	}
	public String getSOProjRefWarrantFIO(){
		return SOProjRefWarrantFIO;
	}

	public void setSOProjRefRegionalType(int aValue){
		SOProjRefRegionalType = aValue;
	}
	public int getSOProjRefRegionalType(){
		return SOProjRefRegionalType;
	}

	public void setSOProjRefBasisType(BigDecimal aValue){
		SOProjRefBasisType = aValue;
	}
	public BigDecimal getSOProjRefBasisType(){
		return SOProjRefBasisType;
	}

	public void setSOProjRefContragentPosition(String aValue){
		SOProjRefContragentPosition = aValue;
	}
	public String getSOProjRefContragentPosition(){
		return SOProjRefContragentPosition;
	}

	public void setSOProjRefExecuteWorkDate(Date aValue){
		SOProjRefExecuteWorkDate = aValue;
	}
	public Date getSOProjRefExecuteWorkDate(){
		return SOProjRefExecuteWorkDate;
	}

	public void setSOProjRefTimeStart(Date aValue){
		SOProjRefTimeStart = aValue;
	}
	public Date getSOProjRefTimeStart(){
		return SOProjRefTimeStart;
	}

	public void setSOProjRefTimeFinal(Date aValue){
		SOProjRefTimeFinal = aValue;
	}
	public Date getSOProjRefTimeFinal(){
		return SOProjRefTimeFinal;
	}

	public void setSOProjRefContragentPhoneNumber(String aValue){
		SOProjRefContragentPhoneNumber = aValue;
	}
	public String getSOProjRefContragentPhoneNumber(){
		return SOProjRefContragentPhoneNumber;
	}

	public void setSOProjRefExecutorPhoneNumber(String aValue){
		SOProjRefExecutorPhoneNumber = aValue;
	}
	public String getSOProjRefExecutorPhoneNumber(){
		return SOProjRefExecutorPhoneNumber;
	}

	public void setSOProjRefContragentObjectWork(String aValue){
		SOProjRefContragentObjectWork = aValue;
	}
	public String getSOProjRefContragentObjectWork(){
		return SOProjRefContragentObjectWork;
	}

	public void setSOProjRefIsNoPay(int aValue){
		SOProjRefIsNoPay = aValue;
	}
	public int getSOProjRefIsNoPay(){
		return SOProjRefIsNoPay;
	}

	public void setSOProjRefIsCustomerMaterials(int aValue){
		SOProjRefIsCustomerMaterials = aValue;
	}
	public int getSOProjRefIsCustomerMaterials(){
		return SOProjRefIsCustomerMaterials;
	}

	public void setSOProjRefPayDate(Date aValue){
		SOProjRefPayDate = aValue;
	}
	public Date getSOProjRefPayDate(){
		return SOProjRefPayDate;
	}

	public void setSOProjRefFinPayFormCode(int aValue){
		SOProjRefFinPayFormCode = aValue;
	}
	public int getSOProjRefFinPayFormCode(){
		return SOProjRefFinPayFormCode;
	}

	public void setSOProjRefFinPayFormName(String aValue){
		SOProjRefFinPayFormName = aValue;
	}
	public String getSOProjRefFinPayFormName(){
		return SOProjRefFinPayFormName;
	}

	public void setSOProjRefPartnerId(int aValue){
		SOProjRefPartnerId = aValue;
	}
	public int getSOProjRefPartnerId(){
		return SOProjRefPartnerId;
	}

	public void setSOProjRefPayDetail(String aValue){
		SOProjRefPayDetail = aValue;
	}
	public String getSOProjRefPayDetail(){
		return SOProjRefPayDetail;
	}

	public void setSOProjRefActTransferNumber(String aValue){
		SOProjRefActTransferNumber = aValue;
	}
	public String getSOProjRefActTransferNumber(){
		return SOProjRefActTransferNumber;
	}

	public void setSOProjRefActTransferDate(Date aValue){
		SOProjRefActTransferDate = aValue;
	}
	public Date getSOProjRefActTransferDate(){
		return SOProjRefActTransferDate;
	}

	public void setSOProjRefResposible(String aValue){
		SOProjRefResposible = aValue;
	}
	public String getSOProjRefResposible(){
		return SOProjRefResposible;
	}

	public void setSOProjRefResposiblePosition(String aValue){
		SOProjRefResposiblePosition = aValue;
	}
	public String getSOProjRefResposiblePosition(){
		return SOProjRefResposiblePosition;
	}

	public void setSOProjRefResposibleTabNumber(String aValue){
		SOProjRefResposibleTabNumber = aValue;
	}
	public String getSOProjRefResposibleTabNumber(){
		return SOProjRefResposibleTabNumber;
	}

	public void setSOProjRefPrevContractStatus(int aValue){
		SOProjRefPrevContractStatus = aValue;
	}
	public int getSOProjRefPrevContractStatus(){
		return SOProjRefPrevContractStatus;
	}

	public void setSOProjRefReconnectionTU(int aValue){
		SOProjRefReconnectionTU = aValue;
	}
	public int getSOProjRefReconnectionTU(){
		return SOProjRefReconnectionTU;
	}

	public void setSOProjRefPersonalAccountCode(int aValue){
		SOProjRefPersonalAccountCode = aValue;
	}
	public int getSOProjRefPersonalAccountCode(){
		return SOProjRefPersonalAccountCode;
	}

	public void setSOProjRefPersonalAccountNumber(String aValue){
		SOProjRefPersonalAccountNumber = aValue;
	}
	public String getSOProjRefPersonalAccountNumber(){
		return SOProjRefPersonalAccountNumber;
	}

	public void setSOProjRefTabNumber(String aValue){
		SOProjRefTabNumber = aValue;
	}
	public String getSOProjRefTabNumber(){
		return SOProjRefTabNumber;
	}

	public void setSOProjRefCitiesList(String aValue){
		SOProjRefCitiesList = aValue;
	}
	public String getSOProjRefCitiesList(){
		return SOProjRefCitiesList;
	}

	public void setSOProjRefLineLength(BigDecimal aValue){
		SOProjRefLineLength = aValue;
	}
	public BigDecimal getSOProjRefLineLength(){
		return SOProjRefLineLength;
	}

	public void setSOProjRefProjectCode(String aValue){
		SOProjRefProjectCode = aValue;
	}
	public String getSOProjRefProjectCode(){
		return SOProjRefProjectCode;
	}

	public void setSOProjRefCnPackCode(int aValue){
		SOProjRefCnPackCode = aValue;
	}
	public int getSOProjRefCnPackCode(){
		return SOProjRefCnPackCode;
	}

	public void setSOProjRefDfPackCode(int aValue){
		SOProjRefDfPackCode = aValue;
	}
	public int getSOProjRefDfPackCode(){
		return SOProjRefDfPackCode;
	}

	public void setSOProjRefCountersZoneType(int aValue){
		SOProjRefCountersZoneType = aValue;
	}
	public int getSOProjRefCountersZoneType(){
		return SOProjRefCountersZoneType;
	}

	public void setSOProjRefAxPartnerCode(String aValue){
		SOProjRefAxPartnerCode = aValue;
	}
	public String getSOProjRefAxPartnerCode(){
		return SOProjRefAxPartnerCode;
	}

	public void setSOProjRefAxPartnerName(String aValue){
		SOProjRefAxPartnerName = aValue;
	}
	public String getSOProjRefAxPartnerName(){
		return SOProjRefAxPartnerName;
	}

	public void setSOProjRefAxContractNumber(String aValue){
		SOProjRefAxContractNumber = aValue;
	}
	public String getSOProjRefAxContractNumber(){
		return SOProjRefAxContractNumber;
	}

	public void setSOProjRefAxContractDate(Date aValue){
		SOProjRefAxContractDate = aValue;
	}
	public Date getSOProjRefAxContractDate(){
		return SOProjRefAxContractDate;
	}

	public void setSOProjRefAxContractCode(String aValue){
		SOProjRefAxContractCode = aValue;
	}
	public String getSOProjRefAxContractCode(){
		return SOProjRefAxContractCode;
	}

	public void setSOProjRefAxContractId(String aValue){
		SOProjRefAxContractId = aValue;
	}
	public String getSOProjRefAxContractId(){
		return SOProjRefAxContractId;
	}

	public void setSOProjRefAxContractCommentGen(String aValue){
		SOProjRefAxContractCommentGen = aValue;
	}
	public String getSOProjRefAxContractCommentGen(){
		return SOProjRefAxContractCommentGen;
	}

	public void setSOConnRefCode(int aValue){
		SOConnRefCode = aValue;
	}
	public int getSOConnRefCode(){
		return SOConnRefCode;
	}

	public void setSOConnRefContractNumber(String aValue){
		SOConnRefContractNumber = aValue;
	}
	public String getSOConnRefContractNumber(){
		return SOConnRefContractNumber;
	}

	public void setSOConnRefContractDate(Date aValue){
		SOConnRefContractDate = aValue;
	}
	public Date getSOConnRefContractDate(){
		return SOConnRefContractDate;
	}

	public void setSOConnRefName(String aValue){
		SOConnRefName = aValue;
	}
	public String getSOConnRefName(){
		return SOConnRefName;
	}

	public void setSOConnRefPartnerCode(String aValue){
		SOConnRefPartnerCode = aValue;
	}
	public String getSOConnRefPartnerCode(){
		return SOConnRefPartnerCode;
	}

	public void setSOConnRefFinDocCode(String aValue){
		SOConnRefFinDocCode = aValue;
	}
	public String getSOConnRefFinDocCode(){
		return SOConnRefFinDocCode;
	}

	public void setSOConnRefFinDocID(int aValue){
		SOConnRefFinDocID = aValue;
	}
	public int getSOConnRefFinDocID(){
		return SOConnRefFinDocID;
	}

	public void setSOConnRefCommentGen(String aValue){
		SOConnRefCommentGen = aValue;
	}
	public String getSOConnRefCommentGen(){
		return SOConnRefCommentGen;
	}

	public void setSOConnRefContractNumberServices(String aValue){
		SOConnRefContractNumberServices = aValue;
	}
	public String getSOConnRefContractNumberServices(){
		return SOConnRefContractNumberServices;
	}

	public void setSOConnRefContractDateServices(Date aValue){
		SOConnRefContractDateServices = aValue;
	}
	public Date getSOConnRefContractDateServices(){
		return SOConnRefContractDateServices;
	}

	public void setSOConnRefContragentName(String aValue){
		SOConnRefContragentName = aValue;
	}
	public String getSOConnRefContragentName(){
		return SOConnRefContragentName;
	}

	public void setSOConnRefContragentAddress(String aValue){
		SOConnRefContragentAddress = aValue;
	}
	public String getSOConnRefContragentAddress(){
		return SOConnRefContragentAddress;
	}

	public void setSOConnRefContragentAddressWork(String aValue){
		SOConnRefContragentAddressWork = aValue;
	}
	public String getSOConnRefContragentAddressWork(){
		return SOConnRefContragentAddressWork;
	}

	public void setSOConnRefContragentOkpo(String aValue){
		SOConnRefContragentOkpo = aValue;
	}
	public String getSOConnRefContragentOkpo(){
		return SOConnRefContragentOkpo;
	}

	public void setSOConnRefContragentBankAccount(String aValue){
		SOConnRefContragentBankAccount = aValue;
	}
	public String getSOConnRefContragentBankAccount(){
		return SOConnRefContragentBankAccount;
	}

	public void setSOConnRefContragentBankName(String aValue){
		SOConnRefContragentBankName = aValue;
	}
	public String getSOConnRefContragentBankName(){
		return SOConnRefContragentBankName;
	}

	public void setSOConnRefContragentBankMfo(String aValue){
		SOConnRefContragentBankMfo = aValue;
	}
	public String getSOConnRefContragentBankMfo(){
		return SOConnRefContragentBankMfo;
	}

	public void setSOConnRefContragentBossName(String aValue){
		SOConnRefContragentBossName = aValue;
	}
	public String getSOConnRefContragentBossName(){
		return SOConnRefContragentBossName;
	}

	public void setSOConnRefContragentPassport(String aValue){
		SOConnRefContragentPassport = aValue;
	}
	public String getSOConnRefContragentPassport(){
		return SOConnRefContragentPassport;
	}

	public void setSOConnRefContractServicesSumma(BigDecimal aValue){
		SOConnRefContractServicesSumma = aValue;
	}
	public BigDecimal getSOConnRefContractServicesSumma(){
		return SOConnRefContractServicesSumma;
	}

	public void setSOConnRefContractServicesPower(BigDecimal aValue){
		SOConnRefContractServicesPower = aValue;
	}
	public BigDecimal getSOConnRefContractServicesPower(){
		return SOConnRefContractServicesPower;
	}

	public void setSOConnRefCommentServicesGen(String aValue){
		SOConnRefCommentServicesGen = aValue;
	}
	public String getSOConnRefCommentServicesGen(){
		return SOConnRefCommentServicesGen;
	}

	public void setSOConnRefContractServicesDistance(BigDecimal aValue){
		SOConnRefContractServicesDistance = aValue;
	}
	public BigDecimal getSOConnRefContractServicesDistance(){
		return SOConnRefContractServicesDistance;
	}

	public void setSOConnRefContractServicesDay(BigDecimal aValue){
		SOConnRefContractServicesDay = aValue;
	}
	public BigDecimal getSOConnRefContractServicesDay(){
		return SOConnRefContractServicesDay;
	}

	public void setSOConnRefUserGen(String aValue){
		SOConnRefUserGen = aValue;
	}
	public String getSOConnRefUserGen(){
		return SOConnRefUserGen;
	}

	public void setSOConnRefDateEdit(Date aValue){
		SOConnRefDateEdit = aValue;
	}
	public Date getSOConnRefDateEdit(){
		return SOConnRefDateEdit;
	}

	public void setSOConnRefWarrantDate(Date aValue){
		SOConnRefWarrantDate = aValue;
	}
	public Date getSOConnRefWarrantDate(){
		return SOConnRefWarrantDate;
	}

	public void setSOConnRefWarrantNumber(String aValue){
		SOConnRefWarrantNumber = aValue;
	}
	public String getSOConnRefWarrantNumber(){
		return SOConnRefWarrantNumber;
	}

	public void setSOConnRefWarrantFIO(String aValue){
		SOConnRefWarrantFIO = aValue;
	}
	public String getSOConnRefWarrantFIO(){
		return SOConnRefWarrantFIO;
	}

	public void setSOConnRefRegionalType(int aValue){
		SOConnRefRegionalType = aValue;
	}
	public int getSOConnRefRegionalType(){
		return SOConnRefRegionalType;
	}

	public void setSOConnRefBasisType(BigDecimal aValue){
		SOConnRefBasisType = aValue;
	}
	public BigDecimal getSOConnRefBasisType(){
		return SOConnRefBasisType;
	}

	public void setSOConnRefContragentPosition(String aValue){
		SOConnRefContragentPosition = aValue;
	}
	public String getSOConnRefContragentPosition(){
		return SOConnRefContragentPosition;
	}

	public void setSOConnRefExecuteWorkDate(Date aValue){
		SOConnRefExecuteWorkDate = aValue;
	}
	public Date getSOConnRefExecuteWorkDate(){
		return SOConnRefExecuteWorkDate;
	}

	public void setSOConnRefTimeStart(Date aValue){
		SOConnRefTimeStart = aValue;
	}
	public Date getSOConnRefTimeStart(){
		return SOConnRefTimeStart;
	}

	public void setSOConnRefTimeFinal(Date aValue){
		SOConnRefTimeFinal = aValue;
	}
	public Date getSOConnRefTimeFinal(){
		return SOConnRefTimeFinal;
	}

	public void setSOConnRefContragentPhoneNumber(String aValue){
		SOConnRefContragentPhoneNumber = aValue;
	}
	public String getSOConnRefContragentPhoneNumber(){
		return SOConnRefContragentPhoneNumber;
	}

	public void setSOConnRefExecutorPhoneNumber(String aValue){
		SOConnRefExecutorPhoneNumber = aValue;
	}
	public String getSOConnRefExecutorPhoneNumber(){
		return SOConnRefExecutorPhoneNumber;
	}

	public void setSOConnRefContragentObjectWork(String aValue){
		SOConnRefContragentObjectWork = aValue;
	}
	public String getSOConnRefContragentObjectWork(){
		return SOConnRefContragentObjectWork;
	}

	public void setSOConnRefIsNoPay(int aValue){
		SOConnRefIsNoPay = aValue;
	}
	public int getSOConnRefIsNoPay(){
		return SOConnRefIsNoPay;
	}

	public void setSOConnRefIsCustomerMaterials(int aValue){
		SOConnRefIsCustomerMaterials = aValue;
	}
	public int getSOConnRefIsCustomerMaterials(){
		return SOConnRefIsCustomerMaterials;
	}

	public void setSOConnRefPayDate(Date aValue){
		SOConnRefPayDate = aValue;
	}
	public Date getSOConnRefPayDate(){
		return SOConnRefPayDate;
	}

	public void setSOConnRefFinPayFormCode(int aValue){
		SOConnRefFinPayFormCode = aValue;
	}
	public int getSOConnRefFinPayFormCode(){
		return SOConnRefFinPayFormCode;
	}

	public void setSOConnRefFinPayFormName(String aValue){
		SOConnRefFinPayFormName = aValue;
	}
	public String getSOConnRefFinPayFormName(){
		return SOConnRefFinPayFormName;
	}

	public void setSOConnRefPartnerId(int aValue){
		SOConnRefPartnerId = aValue;
	}
	public int getSOConnRefPartnerId(){
		return SOConnRefPartnerId;
	}

	public void setSOConnRefPayDetail(String aValue){
		SOConnRefPayDetail = aValue;
	}
	public String getSOConnRefPayDetail(){
		return SOConnRefPayDetail;
	}

	public void setSOConnRefActTransferNumber(String aValue){
		SOConnRefActTransferNumber = aValue;
	}
	public String getSOConnRefActTransferNumber(){
		return SOConnRefActTransferNumber;
	}

	public void setSOConnRefActTransferDate(Date aValue){
		SOConnRefActTransferDate = aValue;
	}
	public Date getSOConnRefActTransferDate(){
		return SOConnRefActTransferDate;
	}

	public void setSOConnRefResposible(String aValue){
		SOConnRefResposible = aValue;
	}
	public String getSOConnRefResposible(){
		return SOConnRefResposible;
	}

	public void setSOConnRefResposiblePosition(String aValue){
		SOConnRefResposiblePosition = aValue;
	}
	public String getSOConnRefResposiblePosition(){
		return SOConnRefResposiblePosition;
	}

	public void setSOConnRefResposibleTabNumber(String aValue){
		SOConnRefResposibleTabNumber = aValue;
	}
	public String getSOConnRefResposibleTabNumber(){
		return SOConnRefResposibleTabNumber;
	}

	public void setSOConnRefPrevContractStatus(int aValue){
		SOConnRefPrevContractStatus = aValue;
	}
	public int getSOConnRefPrevContractStatus(){
		return SOConnRefPrevContractStatus;
	}

	public void setSOConnRefReconnectionTU(int aValue){
		SOConnRefReconnectionTU = aValue;
	}
	public int getSOConnRefReconnectionTU(){
		return SOConnRefReconnectionTU;
	}

	public void setSOConnRefPersonalAccountCode(int aValue){
		SOConnRefPersonalAccountCode = aValue;
	}
	public int getSOConnRefPersonalAccountCode(){
		return SOConnRefPersonalAccountCode;
	}

	public void setSOConnRefPersonalAccountNumber(String aValue){
		SOConnRefPersonalAccountNumber = aValue;
	}
	public String getSOConnRefPersonalAccountNumber(){
		return SOConnRefPersonalAccountNumber;
	}

	public void setSOConnRefTabNumber(String aValue){
		SOConnRefTabNumber = aValue;
	}
	public String getSOConnRefTabNumber(){
		return SOConnRefTabNumber;
	}

	public void setSOConnRefCitiesList(String aValue){
		SOConnRefCitiesList = aValue;
	}
	public String getSOConnRefCitiesList(){
		return SOConnRefCitiesList;
	}

	public void setSOConnRefLineLength(BigDecimal aValue){
		SOConnRefLineLength = aValue;
	}
	public BigDecimal getSOConnRefLineLength(){
		return SOConnRefLineLength;
	}

	public void setSOConnRefProjectCode(String aValue){
		SOConnRefProjectCode = aValue;
	}
	public String getSOConnRefProjectCode(){
		return SOConnRefProjectCode;
	}

	public void setSOConnRefCnPackCode(int aValue){
		SOConnRefCnPackCode = aValue;
	}
	public int getSOConnRefCnPackCode(){
		return SOConnRefCnPackCode;
	}

	public void setSOConnRefDfPackCode(int aValue){
		SOConnRefDfPackCode = aValue;
	}
	public int getSOConnRefDfPackCode(){
		return SOConnRefDfPackCode;
	}

	public void setSOConnRefCountersZoneType(int aValue){
		SOConnRefCountersZoneType = aValue;
	}
	public int getSOConnRefCountersZoneType(){
		return SOConnRefCountersZoneType;
	}

	public void setSOConnRefAxPartnerCode(String aValue){
		SOConnRefAxPartnerCode = aValue;
	}
	public String getSOConnRefAxPartnerCode(){
		return SOConnRefAxPartnerCode;
	}

	public void setSOConnRefAxPartnerName(String aValue){
		SOConnRefAxPartnerName = aValue;
	}
	public String getSOConnRefAxPartnerName(){
		return SOConnRefAxPartnerName;
	}

	public void setSOConnRefAxContractNumber(String aValue){
		SOConnRefAxContractNumber = aValue;
	}
	public String getSOConnRefAxContractNumber(){
		return SOConnRefAxContractNumber;
	}

	public void setSOConnRefAxContractDate(Date aValue){
		SOConnRefAxContractDate = aValue;
	}
	public Date getSOConnRefAxContractDate(){
		return SOConnRefAxContractDate;
	}

	public void setSOConnRefAxContractCode(String aValue){
		SOConnRefAxContractCode = aValue;
	}
	public String getSOConnRefAxContractCode(){
		return SOConnRefAxContractCode;
	}

	public void setSOConnRefAxContractId(String aValue){
		SOConnRefAxContractId = aValue;
	}
	public String getSOConnRefAxContractId(){
		return SOConnRefAxContractId;
	}

	public void setSOConnRefAxContractCommentGen(String aValue){
		SOConnRefAxContractCommentGen = aValue;
	}
	public String getSOConnRefAxContractCommentGen(){
		return SOConnRefAxContractCommentGen;
	}



}