
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENServicesObjectFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectShort;
import com.ksoe.energynet.valueobject.lists.ENServicesObjectShortList;


/**
 * DAO Object for ENServicesObject;
 *
 */

public class ENServicesObjectDAOGen extends GenericDataMiner {

	public ENServicesObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesObject inObject) throws PersistenceException {
		ENServicesObject obj = new ENServicesObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.contractNumber == null && obj.contractNumber == null){}
		else
			if(inObject.contractNumber == null || obj.contractNumber == null) return false;
			else
				if ( ! inObject.contractNumber.equals(obj.contractNumber)){
					return false;
				}

		if(inObject.contractDate == null && obj.contractDate == null){} else 
			if(inObject.contractDate == null || obj.contractDate == null) return false;
			else
				if (inObject.contractDate.compareTo(obj.contractDate) != 0){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.partnerCode == null && obj.partnerCode == null){}
		else
			if(inObject.partnerCode == null || obj.partnerCode == null) return false;
			else
				if ( ! inObject.partnerCode.equals(obj.partnerCode)){
					return false;
				}

		if(inObject.finDocCode == null && obj.finDocCode == null){}
		else
			if(inObject.finDocCode == null || obj.finDocCode == null) return false;
			else
				if ( ! inObject.finDocCode.equals(obj.finDocCode)){
					return false;
				}

		if (inObject.finDocID != obj.finDocID){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.contractNumberServices == null && obj.contractNumberServices == null){}
		else
			if(inObject.contractNumberServices == null || obj.contractNumberServices == null) return false;
			else
				if ( ! inObject.contractNumberServices.equals(obj.contractNumberServices)){
					return false;
				}

		if(inObject.contractDateServices == null && obj.contractDateServices == null){} else 
			if(inObject.contractDateServices == null || obj.contractDateServices == null) return false;
			else
				if (inObject.contractDateServices.compareTo(obj.contractDateServices) != 0){
					return false;
				}

		if(inObject.contragentName == null && obj.contragentName == null){}
		else
			if(inObject.contragentName == null || obj.contragentName == null) return false;
			else
				if ( ! inObject.contragentName.equals(obj.contragentName)){
					return false;
				}

		if(inObject.contragentAddress == null && obj.contragentAddress == null){}
		else
			if(inObject.contragentAddress == null || obj.contragentAddress == null) return false;
			else
				if ( ! inObject.contragentAddress.equals(obj.contragentAddress)){
					return false;
				}

		if(inObject.contragentAddressWork == null && obj.contragentAddressWork == null){}
		else
			if(inObject.contragentAddressWork == null || obj.contragentAddressWork == null) return false;
			else
				if ( ! inObject.contragentAddressWork.equals(obj.contragentAddressWork)){
					return false;
				}

		if(inObject.contragentOkpo == null && obj.contragentOkpo == null){}
		else
			if(inObject.contragentOkpo == null || obj.contragentOkpo == null) return false;
			else
				if ( ! inObject.contragentOkpo.equals(obj.contragentOkpo)){
					return false;
				}

		if(inObject.contragentBankAccount == null && obj.contragentBankAccount == null){}
		else
			if(inObject.contragentBankAccount == null || obj.contragentBankAccount == null) return false;
			else
				if ( ! inObject.contragentBankAccount.equals(obj.contragentBankAccount)){
					return false;
				}

		if(inObject.contragentBankName == null && obj.contragentBankName == null){}
		else
			if(inObject.contragentBankName == null || obj.contragentBankName == null) return false;
			else
				if ( ! inObject.contragentBankName.equals(obj.contragentBankName)){
					return false;
				}

		if(inObject.contragentBankMfo == null && obj.contragentBankMfo == null){}
		else
			if(inObject.contragentBankMfo == null || obj.contragentBankMfo == null) return false;
			else
				if ( ! inObject.contragentBankMfo.equals(obj.contragentBankMfo)){
					return false;
				}

		if(inObject.contragentBossName == null && obj.contragentBossName == null){}
		else
			if(inObject.contragentBossName == null || obj.contragentBossName == null) return false;
			else
				if ( ! inObject.contragentBossName.equals(obj.contragentBossName)){
					return false;
				}

		if(inObject.contragentPassport == null && obj.contragentPassport == null){}
		else
			if(inObject.contragentPassport == null || obj.contragentPassport == null) return false;
			else
				if ( ! inObject.contragentPassport.equals(obj.contragentPassport)){
					return false;
				}

		if(inObject.contractServicesSumma == null && obj.contractServicesSumma == null){}
		else
			if(inObject.contractServicesSumma == null || obj.contractServicesSumma == null) return false;
			else
				if ( ! inObject.contractServicesSumma.equals(obj.contractServicesSumma)){
					return false;
				}

		if(inObject.contractServicesSummaVAT == null && obj.contractServicesSummaVAT == null){}
		else
			if(inObject.contractServicesSummaVAT == null || obj.contractServicesSummaVAT == null) return false;
			else
				if ( ! inObject.contractServicesSummaVAT.equals(obj.contractServicesSummaVAT)){
					return false;
				}

		if(inObject.contractServicesPower == null && obj.contractServicesPower == null){}
		else
			if(inObject.contractServicesPower == null || obj.contractServicesPower == null) return false;
			else
				if ( ! inObject.contractServicesPower.equals(obj.contractServicesPower)){
					return false;
				}

		if(inObject.commentServicesGen == null && obj.commentServicesGen == null){}
		else
			if(inObject.commentServicesGen == null || obj.commentServicesGen == null) return false;
			else
				if ( ! inObject.commentServicesGen.equals(obj.commentServicesGen)){
					return false;
				}

		if(inObject.contractServicesDistance == null && obj.contractServicesDistance == null){}
		else
			if(inObject.contractServicesDistance == null || obj.contractServicesDistance == null) return false;
			else
				if ( ! inObject.contractServicesDistance.equals(obj.contractServicesDistance)){
					return false;
				}

		if(inObject.contractServicesDay == null && obj.contractServicesDay == null){}
		else
			if(inObject.contractServicesDay == null || obj.contractServicesDay == null) return false;
			else
				if ( ! inObject.contractServicesDay.equals(obj.contractServicesDay)){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.warrantDate == null && obj.warrantDate == null){} else 
			if(inObject.warrantDate == null || obj.warrantDate == null) return false;
			else
				if (inObject.warrantDate.compareTo(obj.warrantDate) != 0){
					return false;
				}

		if(inObject.warrantNumber == null && obj.warrantNumber == null){}
		else
			if(inObject.warrantNumber == null || obj.warrantNumber == null) return false;
			else
				if ( ! inObject.warrantNumber.equals(obj.warrantNumber)){
					return false;
				}

		if(inObject.warrantFIO == null && obj.warrantFIO == null){}
		else
			if(inObject.warrantFIO == null || obj.warrantFIO == null) return false;
			else
				if ( ! inObject.warrantFIO.equals(obj.warrantFIO)){
					return false;
				}

		if (inObject.regionalType != obj.regionalType){
					return false;
				}

		if(inObject.basisType == null && obj.basisType == null){}
		else
			if(inObject.basisType == null || obj.basisType == null) return false;
			else
				if ( ! inObject.basisType.equals(obj.basisType)){
					return false;
				}

		if(inObject.contragentPosition == null && obj.contragentPosition == null){}
		else
			if(inObject.contragentPosition == null || obj.contragentPosition == null) return false;
			else
				if ( ! inObject.contragentPosition.equals(obj.contragentPosition)){
					return false;
				}

		if(inObject.executeWorkDate == null && obj.executeWorkDate == null){} else 
			if(inObject.executeWorkDate == null || obj.executeWorkDate == null) return false;
			else
				if (inObject.executeWorkDate.compareTo(obj.executeWorkDate) != 0){
					return false;
				}

		if(inObject.timeStart == null && obj.timeStart == null){} else 
			if(inObject.timeStart == null || obj.timeStart == null) return false;
			else
				if (inObject.timeStart.compareTo(obj.timeStart) != 0){
					return false;
				}

		if(inObject.timeFinal == null && obj.timeFinal == null){} else 
			if(inObject.timeFinal == null || obj.timeFinal == null) return false;
			else
				if (inObject.timeFinal.compareTo(obj.timeFinal) != 0){
					return false;
				}

		if(inObject.contragentPhoneNumber == null && obj.contragentPhoneNumber == null){}
		else
			if(inObject.contragentPhoneNumber == null || obj.contragentPhoneNumber == null) return false;
			else
				if ( ! inObject.contragentPhoneNumber.equals(obj.contragentPhoneNumber)){
					return false;
				}

		if(inObject.executorPhoneNumber == null && obj.executorPhoneNumber == null){}
		else
			if(inObject.executorPhoneNumber == null || obj.executorPhoneNumber == null) return false;
			else
				if ( ! inObject.executorPhoneNumber.equals(obj.executorPhoneNumber)){
					return false;
				}

		if(inObject.contragentObjectWork == null && obj.contragentObjectWork == null){}
		else
			if(inObject.contragentObjectWork == null || obj.contragentObjectWork == null) return false;
			else
				if ( ! inObject.contragentObjectWork.equals(obj.contragentObjectWork)){
					return false;
				}

		if (inObject.isNoPay != obj.isNoPay){
					return false;
				}

		if (inObject.isCustomerMaterials != obj.isCustomerMaterials){
					return false;
				}

		if(inObject.payDate == null && obj.payDate == null){} else 
			if(inObject.payDate == null || obj.payDate == null) return false;
			else
				if (inObject.payDate.compareTo(obj.payDate) != 0){
					return false;
				}

		if (inObject.finPayFormCode != obj.finPayFormCode){
					return false;
				}

		if(inObject.finPayFormName == null && obj.finPayFormName == null){}
		else
			if(inObject.finPayFormName == null || obj.finPayFormName == null) return false;
			else
				if ( ! inObject.finPayFormName.equals(obj.finPayFormName)){
					return false;
				}

		if (inObject.partnerId != obj.partnerId){
					return false;
				}

		if(inObject.payDetail == null && obj.payDetail == null){}
		else
			if(inObject.payDetail == null || obj.payDetail == null) return false;
			else
				if ( ! inObject.payDetail.equals(obj.payDetail)){
					return false;
				}

		if(inObject.actTransferNumber == null && obj.actTransferNumber == null){}
		else
			if(inObject.actTransferNumber == null || obj.actTransferNumber == null) return false;
			else
				if ( ! inObject.actTransferNumber.equals(obj.actTransferNumber)){
					return false;
				}

		if(inObject.actTransferDate == null && obj.actTransferDate == null){} else 
			if(inObject.actTransferDate == null || obj.actTransferDate == null) return false;
			else
				if (inObject.actTransferDate.compareTo(obj.actTransferDate) != 0){
					return false;
				}

		if(inObject.resposible == null && obj.resposible == null){}
		else
			if(inObject.resposible == null || obj.resposible == null) return false;
			else
				if ( ! inObject.resposible.equals(obj.resposible)){
					return false;
				}

		if(inObject.resposiblePosition == null && obj.resposiblePosition == null){}
		else
			if(inObject.resposiblePosition == null || obj.resposiblePosition == null) return false;
			else
				if ( ! inObject.resposiblePosition.equals(obj.resposiblePosition)){
					return false;
				}

		if(inObject.resposibleTabNumber == null && obj.resposibleTabNumber == null){}
		else
			if(inObject.resposibleTabNumber == null || obj.resposibleTabNumber == null) return false;
			else
				if ( ! inObject.resposibleTabNumber.equals(obj.resposibleTabNumber)){
					return false;
				}

		if (inObject.prevContractStatus != obj.prevContractStatus){
					return false;
				}

		if (inObject.reconnectionTU != obj.reconnectionTU){
					return false;
				}

		if (inObject.personalAccountCode != obj.personalAccountCode){
					return false;
				}

		if(inObject.personalAccountNumber == null && obj.personalAccountNumber == null){}
		else
			if(inObject.personalAccountNumber == null || obj.personalAccountNumber == null) return false;
			else
				if ( ! inObject.personalAccountNumber.equals(obj.personalAccountNumber)){
					return false;
				}

		if(inObject.tabNumber == null && obj.tabNumber == null){}
		else
			if(inObject.tabNumber == null || obj.tabNumber == null) return false;
			else
				if ( ! inObject.tabNumber.equals(obj.tabNumber)){
					return false;
				}

		if(inObject.citiesList == null && obj.citiesList == null){}
		else
			if(inObject.citiesList == null || obj.citiesList == null) return false;
			else
				if ( ! inObject.citiesList.equals(obj.citiesList)){
					return false;
				}

		if(inObject.lineLength == null && obj.lineLength == null){}
		else
			if(inObject.lineLength == null || obj.lineLength == null) return false;
			else
				if ( ! inObject.lineLength.equals(obj.lineLength)){
					return false;
				}

		if(inObject.projectCode == null && obj.projectCode == null){}
		else
			if(inObject.projectCode == null || obj.projectCode == null) return false;
			else
				if ( ! inObject.projectCode.equals(obj.projectCode)){
					return false;
				}

		if (inObject.cnPackCode != obj.cnPackCode){
					return false;
				}

		if (inObject.dfPackCode != obj.dfPackCode){
					return false;
				}

		if (inObject.countersZoneType != obj.countersZoneType){
					return false;
				}

		if(inObject.axPartnerCode == null && obj.axPartnerCode == null){}
		else
			if(inObject.axPartnerCode == null || obj.axPartnerCode == null) return false;
			else
				if ( ! inObject.axPartnerCode.equals(obj.axPartnerCode)){
					return false;
				}

		if(inObject.axPartnerName == null && obj.axPartnerName == null){}
		else
			if(inObject.axPartnerName == null || obj.axPartnerName == null) return false;
			else
				if ( ! inObject.axPartnerName.equals(obj.axPartnerName)){
					return false;
				}

		if(inObject.axContractNumber == null && obj.axContractNumber == null){}
		else
			if(inObject.axContractNumber == null || obj.axContractNumber == null) return false;
			else
				if ( ! inObject.axContractNumber.equals(obj.axContractNumber)){
					return false;
				}

		if(inObject.axContractDate == null && obj.axContractDate == null){} else 
			if(inObject.axContractDate == null || obj.axContractDate == null) return false;
			else
				if (inObject.axContractDate.compareTo(obj.axContractDate) != 0){
					return false;
				}

		if(inObject.axContractCode == null && obj.axContractCode == null){}
		else
			if(inObject.axContractCode == null || obj.axContractCode == null) return false;
			else
				if ( ! inObject.axContractCode.equals(obj.axContractCode)){
					return false;
				}

		if(inObject.axContractId == null && obj.axContractId == null){}
		else
			if(inObject.axContractId == null || obj.axContractId == null) return false;
			else
				if ( ! inObject.axContractId.equals(obj.axContractId)){
					return false;
				}

		if(inObject.axContractCommentGen == null && obj.axContractCommentGen == null){}
		else
			if(inObject.axContractCommentGen == null || obj.axContractCommentGen == null) return false;
			else
				if ( ! inObject.axContractCommentGen.equals(obj.axContractCommentGen)){
					return false;
				}

		if(inObject.projAgreeSumma == null && obj.projAgreeSumma == null){}
		else
			if(inObject.projAgreeSumma == null || obj.projAgreeSumma == null) return false;
			else
				if ( ! inObject.projAgreeSumma.equals(obj.projAgreeSumma)){
					return false;
				}

		if(inObject.topographySumma == null && obj.topographySumma == null){}
		else
			if(inObject.topographySumma == null || obj.topographySumma == null) return false;
			else
				if ( ! inObject.topographySumma.equals(obj.topographySumma)){
					return false;
				}

		if (inObject.createdFromSite != obj.createdFromSite){
					return false;
				}

		if (inObject.term != obj.term){
					return false;
				}

		if (inObject.regulation != obj.regulation){
					return false;
				}

		if(inObject.boundaryDateWork == null && obj.boundaryDateWork == null){} else 
			if(inObject.boundaryDateWork == null || obj.boundaryDateWork == null) return false;
			else
				if (inObject.boundaryDateWork.compareTo(obj.boundaryDateWork) != 0){
					return false;
				}

		if (inObject.countDayDelay != obj.countDayDelay){
					return false;
				}

		if(inObject.factDateWork == null && obj.factDateWork == null){} else 
			if(inObject.factDateWork == null || obj.factDateWork == null) return false;
			else
				if (inObject.factDateWork.compareTo(obj.factDateWork) != 0){
					return false;
				}

		if(inObject.calcSumsByCalculations == null && obj.calcSumsByCalculations == null){} else 
			if(inObject.calcSumsByCalculations == null || obj.calcSumsByCalculations == null) return false;
			else
				if (inObject.calcSumsByCalculations.compareTo(obj.calcSumsByCalculations) != 0){
					return false;
				}

		if(inObject.codeEIC == null && obj.codeEIC == null){}
		else
			if(inObject.codeEIC == null || obj.codeEIC == null) return false;
			else
				if ( ! inObject.codeEIC.equals(obj.codeEIC)){
					return false;
				}

		if(inObject.personalAccountUid == null && obj.personalAccountUid == null){}
		else
			if(inObject.personalAccountUid == null || obj.personalAccountUid == null) return false;
			else
				if ( ! inObject.personalAccountUid.equals(obj.personalAccountUid)){
					return false;
				}

		if(inObject.customerMailingAddress == null && obj.customerMailingAddress == null){}
		else
			if(inObject.customerMailingAddress == null || obj.customerMailingAddress == null) return false;
			else
				if ( ! inObject.customerMailingAddress.equals(obj.customerMailingAddress)){
					return false;
				}

		if(inObject.powerGeneration == null && obj.powerGeneration == null){}
		else
			if(inObject.powerGeneration == null || obj.powerGeneration == null) return false;
			else
				if ( ! inObject.powerGeneration.equals(obj.powerGeneration)){
					return false;
				}

		if(inObject.postCode == null && obj.postCode == null){}
		else
			if(inObject.postCode == null || obj.postCode == null) return false;
			else
				if ( ! inObject.postCode.equals(obj.postCode)){
					return false;
				}

		if(inObject.customerEmail == null && obj.customerEmail == null){}
		else
			if(inObject.customerEmail == null || obj.customerEmail == null) return false;
			else
				if ( ! inObject.customerEmail.equals(obj.customerEmail)){
					return false;
				}

		if(inObject.demographicCode == null && obj.demographicCode == null){}
		else
			if(inObject.demographicCode == null || obj.demographicCode == null) return false;
			else
				if ( ! inObject.demographicCode.equals(obj.demographicCode)){
					return false;
				}

		if(inObject.ownershipRecordNumber == null && obj.ownershipRecordNumber == null){}
		else
			if(inObject.ownershipRecordNumber == null || obj.ownershipRecordNumber == null) return false;
			else
				if ( ! inObject.ownershipRecordNumber.equals(obj.ownershipRecordNumber)){
					return false;
				}

		if(inObject.realEstateRegNumber == null && obj.realEstateRegNumber == null){}
		else
			if(inObject.realEstateRegNumber == null || obj.realEstateRegNumber == null) return false;
			else
				if ( ! inObject.realEstateRegNumber.equals(obj.realEstateRegNumber)){
					return false;
				}
		if (inObject.department.code != obj.department.code){
			return false;
		}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.contractStatusRef.code != obj.contractStatusRef.code){
			return false;
		}
		if (inObject.contractTypeRef.code != obj.contractTypeRef.code){
			return false;
		}
		if (inObject.contragentTypeRef.code != obj.contragentTypeRef.code){
			return false;
		}
		if (inObject.billStatusRef.code != obj.billStatusRef.code){
			return false;
		}
		if (inObject.warrantRef.code != obj.warrantRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.techConObjects.code != obj.techConObjects.code){
			return false;
		}
		if (inObject.contractKindRef.code != obj.contractKindRef.code){
			return false;
		}
		if (inObject.cnSubsystemTypeRef.code != obj.cnSubsystemTypeRef.code){
			return false;
		}
		if (inObject.calcTypeRef.code != obj.calcTypeRef.code){
			return false;
		}
		if (inObject.siteRef.code != obj.siteRef.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		if (inObject.actIncomeCreatMetodRef.code != obj.actIncomeCreatMetodRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesObject anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(anObject.getDomain_info() == null) {
			anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
		}
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESOBJECT (CODE,CONTRACTNUMBER,CONTRACTDATE,NAME,PARTNERCODE,FINDOCCODE,FINDOCID,COMMENTGEN,CONTRACTNUMBERSERVICES,CONTRACTDATESERVICES,CONTRAGENTNAME,CONTRAGENTADDRESS,CONTRAGENTADDRESSWORK,CONTRAGENTOKPO,CONTRAGENTBANKACCOUNT,CONTRAGENTBANKNAME,CONTRAGENTBANKMFO,CONTRAGENTBOSSNAME,CONTRAGENTPASSPORT,CONTRACTSERVICESSUMMA,CONTRACTSERVICESSUMMVT,CONTRACTSERVICESPOWER,COMMENTSERVICESGEN,CONTRACTSERVICESDISTNC,CONTRACTSERVICESDAY,USERGEN,DATEEDIT,WARRANTDATE,WARRANTNUMBER,WARRANTFIO,REGIONALTYPE,BASISTYPE,CONTRAGENTPOSITION,EXECUTEWORKDATE,TIMESTART,TIMEFINAL,CONTRAGENTPHONENUMBER,EXECUTORPHONENUMBER,CONTRAGENTOBJECTWORK,ISNOPAY,ISCUSTOMERMATERIALS,PAYDATE,FINPAYFORMCODE,FINPAYFORMNAME,PARTNERID,PAYDETAIL,ACTTRANSFERNUMBER,ACTTRANSFERDATE,RESPOSIBLE,RESPOSIBLEPOSITION,RESPOSIBLETABNUMBER,PREVCONTRACTSTATUS,RECONNECTIONTU,PERSONALACCOUNTCODE,PERSONALACCOUNTNUMBER,TABNUMBER,CITIESLIST,LINELENGTH,PROJECTCODE,DOMAIN_INFO,MODIFY_TIME,CNPACKCODE,DFPACKCODE,COUNTERSZONETYPE,AXPARTNERCODE,AXPARTNERNAME,AXCONTRACTNUMBER,AXCONTRACTDATE,AXCONTRACTCODE,AXCONTRACTID,AXCONTRACTCOMMENTGEN,PROJAGREESUMMA,TOPOGRAPHYSUMMA,CREATEDFROMSITE,TERM,REGULATION,BOUNDARYDATEWORK,COUNTDAYDELAY,FACTDATEWORK,CALCSUMSBYCALCULATIONS,CODEEIC,PERSONALACCOUNTUID,CUSTOMERMAILINGADDRESS,POWERGENERATION,POSTCODE,CUSTOMEREMAIL,DEMOGRAPHICCODE,OWNERSHIPRECORDNUMBER,REALESTATEREGNUMBER,DEPARTMENTCODE,ELEMENTCODE,CONTRACTSTATUSREFCODE,CONTRACTTYPEREFCODE,CONTRAGENTTYPEREFCODE,BILLSTATUSREFCODE,WARRANTREFCODE,STATUSREFCODE,TECHCONOBJECTSCODE,CONTRACTKINDREFCODE,CNSUBSYSTEMTYPEREFCODE,CALCTYPEREFCODE,SITEREFCODE,GENERALCONTRACTREFCODE,ACTINCOMECREATMETDRFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(4, anObject.name);
			statement.setString(5, anObject.partnerCode);
			statement.setString(6, anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.finDocID);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setString(8, anObject.commentGen);
			statement.setString(9, anObject.contractNumberServices);
			if (anObject.contractDateServices == null) {
				statement.setDate(10, null);
			} else {
				statement.setDate(10, new java.sql.Date(anObject.contractDateServices.getTime()));
			}
			statement.setString(11, anObject.contragentName);
			statement.setString(12, anObject.contragentAddress);
			statement.setString(13, anObject.contragentAddressWork);
			statement.setString(14, anObject.contragentOkpo);
			statement.setString(15, anObject.contragentBankAccount);
			statement.setString(16, anObject.contragentBankName);
			statement.setString(17, anObject.contragentBankMfo);
			statement.setString(18, anObject.contragentBossName);
			statement.setString(19, anObject.contragentPassport);
			if (anObject.contractServicesSumma != null) {
				anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.contractServicesSumma);
			if (anObject.contractServicesSummaVAT != null) {
				anObject.contractServicesSummaVAT = anObject.contractServicesSummaVAT.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.contractServicesSummaVAT);
			if (anObject.contractServicesPower != null) {
				anObject.contractServicesPower = anObject.contractServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(22, anObject.contractServicesPower);
			statement.setString(23, anObject.commentServicesGen);
			if (anObject.contractServicesDistance != null) {
				anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(24, anObject.contractServicesDistance);
			if (anObject.contractServicesDay != null) {
				anObject.contractServicesDay = anObject.contractServicesDay.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(25, anObject.contractServicesDay);
			statement.setString(26, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(27, null);
			} else {
				statement.setDate(27, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.warrantDate == null) {
				statement.setDate(28, null);
			} else {
				statement.setDate(28, new java.sql.Date(anObject.warrantDate.getTime()));
			}
			statement.setString(29, anObject.warrantNumber);
			statement.setString(30, anObject.warrantFIO);
			if (anObject.regionalType != Integer.MIN_VALUE ) {
				statement.setInt(31, anObject.regionalType);
			} else {
				statement.setNull(31, java.sql.Types.INTEGER);
			}
			if (anObject.basisType != null) {
				anObject.basisType = anObject.basisType.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(32, anObject.basisType);
			statement.setString(33, anObject.contragentPosition);
			if (anObject.executeWorkDate == null) {
				statement.setDate(34, null);
			} else {
				statement.setDate(34, new java.sql.Date(anObject.executeWorkDate.getTime()));
			}
			if (anObject.timeStart == null) {
				statement.setTimestamp(35, null);
			} else {
				statement.setTimestamp(35, new java.sql.Timestamp(anObject.timeStart.getTime()));
			}
			if (anObject.timeFinal == null) {
				statement.setTimestamp(36, null);
			} else {
				statement.setTimestamp(36, new java.sql.Timestamp(anObject.timeFinal.getTime()));
			}
			statement.setString(37, anObject.contragentPhoneNumber);
			statement.setString(38, anObject.executorPhoneNumber);
			statement.setString(39, anObject.contragentObjectWork);
			if (anObject.isNoPay != Integer.MIN_VALUE ) {
				statement.setInt(40, anObject.isNoPay);
			} else {
				statement.setNull(40, java.sql.Types.INTEGER);
			}
			if (anObject.isCustomerMaterials != Integer.MIN_VALUE ) {
				statement.setInt(41, anObject.isCustomerMaterials);
			} else {
				statement.setNull(41, java.sql.Types.INTEGER);
			}
			if (anObject.payDate == null) {
				statement.setDate(42, null);
			} else {
				statement.setDate(42, new java.sql.Date(anObject.payDate.getTime()));
			}
			if (anObject.finPayFormCode != Integer.MIN_VALUE ) {
				statement.setInt(43, anObject.finPayFormCode);
			} else {
				statement.setNull(43, java.sql.Types.INTEGER);
			}
			statement.setString(44, anObject.finPayFormName);
			if (anObject.partnerId != Integer.MIN_VALUE ) {
				statement.setInt(45, anObject.partnerId);
			} else {
				statement.setNull(45, java.sql.Types.INTEGER);
			}
			statement.setString(46, anObject.payDetail);
			statement.setString(47, anObject.actTransferNumber);
			if (anObject.actTransferDate == null) {
				statement.setDate(48, null);
			} else {
				statement.setDate(48, new java.sql.Date(anObject.actTransferDate.getTime()));
			}
			statement.setString(49, anObject.resposible);
			statement.setString(50, anObject.resposiblePosition);
			statement.setString(51, anObject.resposibleTabNumber);
			if (anObject.prevContractStatus != Integer.MIN_VALUE ) {
				statement.setInt(52, anObject.prevContractStatus);
			} else {
				statement.setNull(52, java.sql.Types.INTEGER);
			}
			if (anObject.reconnectionTU != Integer.MIN_VALUE ) {
				statement.setInt(53, anObject.reconnectionTU);
			} else {
				statement.setNull(53, java.sql.Types.INTEGER);
			}
			if (anObject.personalAccountCode != Integer.MIN_VALUE ) {
				statement.setInt(54, anObject.personalAccountCode);
			} else {
				statement.setNull(54, java.sql.Types.INTEGER);
			}
			statement.setString(55, anObject.personalAccountNumber);
			statement.setString(56, anObject.tabNumber);
			statement.setString(57, anObject.citiesList);
			if (anObject.lineLength != null) {
				anObject.lineLength = anObject.lineLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(58, anObject.lineLength);
			statement.setString(59, anObject.projectCode);
			statement.setString(60, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(61, null);
			} else {
				statement.setBigDecimal(61, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.cnPackCode != Integer.MIN_VALUE ) {
				statement.setInt(62, anObject.cnPackCode);
			} else {
				statement.setNull(62, java.sql.Types.INTEGER);
			}
			if (anObject.dfPackCode != Integer.MIN_VALUE ) {
				statement.setInt(63, anObject.dfPackCode);
			} else {
				statement.setNull(63, java.sql.Types.INTEGER);
			}
			if (anObject.countersZoneType != Integer.MIN_VALUE ) {
				statement.setInt(64, anObject.countersZoneType);
			} else {
				statement.setNull(64, java.sql.Types.INTEGER);
			}
			statement.setString(65, anObject.axPartnerCode);
			statement.setString(66, anObject.axPartnerName);
			statement.setString(67, anObject.axContractNumber);
			if (anObject.axContractDate == null) {
				statement.setDate(68, null);
			} else {
				statement.setDate(68, new java.sql.Date(anObject.axContractDate.getTime()));
			}
			statement.setString(69, anObject.axContractCode);
			statement.setString(70, anObject.axContractId);
			statement.setString(71, anObject.axContractCommentGen);
			if (anObject.projAgreeSumma != null) {
				anObject.projAgreeSumma = anObject.projAgreeSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(72, anObject.projAgreeSumma);
			if (anObject.topographySumma != null) {
				anObject.topographySumma = anObject.topographySumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(73, anObject.topographySumma);
			if (anObject.createdFromSite != Integer.MIN_VALUE ) {
				statement.setInt(74, anObject.createdFromSite);
			} else {
				statement.setNull(74, java.sql.Types.INTEGER);
			}
			if (anObject.term != Integer.MIN_VALUE ) {
				statement.setInt(75, anObject.term);
			} else {
				statement.setNull(75, java.sql.Types.INTEGER);
			}
			if (anObject.regulation != Integer.MIN_VALUE ) {
				statement.setInt(76, anObject.regulation);
			} else {
				statement.setNull(76, java.sql.Types.INTEGER);
			}
			if (anObject.boundaryDateWork == null) {
				statement.setDate(77, null);
			} else {
				statement.setDate(77, new java.sql.Date(anObject.boundaryDateWork.getTime()));
			}
			if (anObject.countDayDelay != Integer.MIN_VALUE ) {
				statement.setInt(78, anObject.countDayDelay);
			} else {
				statement.setNull(78, java.sql.Types.INTEGER);
			}
			if (anObject.factDateWork == null) {
				statement.setDate(79, null);
			} else {
				statement.setDate(79, new java.sql.Date(anObject.factDateWork.getTime()));
			}
			if (anObject.calcSumsByCalculations != null) {
				statement.setBoolean(80, anObject.calcSumsByCalculations);
			} else {
				statement.setNull(80, java.sql.Types.BOOLEAN);
			}
			statement.setString(81, anObject.codeEIC);
			statement.setString(82, anObject.personalAccountUid);
			statement.setString(83, anObject.customerMailingAddress);
			if (anObject.powerGeneration != null) {
				anObject.powerGeneration = anObject.powerGeneration.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(84, anObject.powerGeneration);
			statement.setString(85, anObject.postCode);
			statement.setString(86, anObject.customerEmail);
			statement.setString(87, anObject.demographicCode);
			statement.setString(88, anObject.ownershipRecordNumber);
			statement.setString(89, anObject.realEstateRegNumber);
			if (anObject.department.code != Integer.MIN_VALUE){
				statement.setInt(90,anObject.department.code);
			} else {
				statement.setNull(90,java.sql.Types.INTEGER);
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				statement.setInt(91,anObject.element.code);
			} else {
				statement.setNull(91,java.sql.Types.INTEGER);
			}
			if (anObject.contractStatusRef.code != Integer.MIN_VALUE){
				statement.setInt(92,anObject.contractStatusRef.code);
			} else {
				statement.setNull(92,java.sql.Types.INTEGER);
			}
			if (anObject.contractTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(93,anObject.contractTypeRef.code);
			} else {
				statement.setNull(93,java.sql.Types.INTEGER);
			}
			if (anObject.contragentTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(94,anObject.contragentTypeRef.code);
			} else {
				statement.setNull(94,java.sql.Types.INTEGER);
			}
			if (anObject.billStatusRef.code != Integer.MIN_VALUE){
				statement.setInt(95,anObject.billStatusRef.code);
			} else {
				statement.setNull(95,java.sql.Types.INTEGER);
			}
			if (anObject.warrantRef.code != Integer.MIN_VALUE){
				statement.setInt(96,anObject.warrantRef.code);
			} else {
				statement.setNull(96,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(97,anObject.statusRef.code);
			} else {
				statement.setNull(97,java.sql.Types.INTEGER);
			}
			if (anObject.techConObjects.code != Integer.MIN_VALUE){
				statement.setInt(98,anObject.techConObjects.code);
			} else {
				statement.setNull(98,java.sql.Types.INTEGER);
			}
			if (anObject.contractKindRef.code != Integer.MIN_VALUE){
				statement.setInt(99,anObject.contractKindRef.code);
			} else {
				statement.setNull(99,java.sql.Types.INTEGER);
			}
			if (anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(100,anObject.cnSubsystemTypeRef.code);
			} else {
				statement.setNull(100,java.sql.Types.INTEGER);
			}
			if (anObject.calcTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(101,anObject.calcTypeRef.code);
			} else {
				statement.setNull(101,java.sql.Types.INTEGER);
			}
			if (anObject.siteRef.code != Integer.MIN_VALUE){
				statement.setInt(102,anObject.siteRef.code);
			} else {
				statement.setNull(102,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				statement.setInt(103,anObject.generalContractRef.code);
			} else {
				statement.setNull(103,java.sql.Types.INTEGER);
			}
			if (anObject.actIncomeCreatMetodRef.code != Integer.MIN_VALUE){
				statement.setInt(104,anObject.actIncomeCreatMetodRef.code);
			} else {
				statement.setNull(104,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENServicesObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesObject anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENServicesObject oldObject = new ENServicesObject();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENServicesObject.modify_time_Field + "," + ENServicesObject.domain_info_Field+" FROM  ENSERVICESOBJECT WHERE CODE = ?";
			ResultSet set = null;
			try {
				statement = connection.prepareStatement(oldObjectSelectStr);
				statement.setInt(1,oldObject.code);
				set = statement.executeQuery();
				if(!set.next()) {
					throw new PersistenceException("Can't get old object.");
				}
				oldObject.modify_time = set.getLong(1);
				if(set.wasNull()) {
					oldObject.modify_time = Long.MIN_VALUE;
				}
				oldObject.domain_info = set.getString(2);
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (set != null) set.close();} catch (SQLException e) {}
				try {if (statement != null) statement.close();} catch (SQLException e) {}
				statement = null;
			}
			if(oldObject.modify_time != anObject.modify_time) {
				throw new PersistenceException("Can't update object (optimistic locking).");
			}
			anObject.modify_time = System.currentTimeMillis();

			if(anObject.getDomain_info() == null) {
				anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
			}
			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTNUMBERSERVICES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTDATESERVICES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTADDRESSWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTOKPO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTBANKACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTBANKNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTBANKMFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTBOSSNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTPASSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSERVICESSUMMA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSERVICESSUMMAVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSERVICESPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTSERVICESGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSERVICESDISTANCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSERVICESDAY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REGIONALTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BASISTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTEWORKDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTPHONENUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORPHONENUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTOBJECTWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISNOPAY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISCUSTOMERMATERIALS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PAYDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINPAYFORMCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINPAYFORMNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PAYDETAIL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTTRANSFERNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTTRANSFERDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPOSIBLE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPOSIBLEPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPOSIBLETABNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PREVCONTRACTSTATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECONNECTIONTU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALACCOUNTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALACCOUNTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TABNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CITIESLIST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LINELENGTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PROJECTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DOMAIN_INFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CNPACKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFPACKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERSZONETYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXPARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXPARTNERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTCOMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PROJAGREESUMMA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TOPOGRAPHYSUMMA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CREATEDFROMSITE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TERM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REGULATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BOUNDARYDATEWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTDAYDELAY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FACTDATEWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCSUMSBYCALCULATIONS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CODEEIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALACCOUNTUID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMERMAILINGADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POWERGENERATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMEREMAIL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEMOGRAPHICCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OWNERSHIPRECORDNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REALESTATEREGNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSTATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BILLSTATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHCONOBJECTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTKINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CNSUBSYSTEMTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SITEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENERALCONTRACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTINCOMECREATMETODREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESOBJECT SET  CONTRACTNUMBER = ? , CONTRACTDATE = ? , NAME = ? , PARTNERCODE = ? , FINDOCCODE = ? , FINDOCID = ? , COMMENTGEN = ? , CONTRACTNUMBERSERVICES = ? , CONTRACTDATESERVICES = ? , CONTRAGENTNAME = ? , CONTRAGENTADDRESS = ? , CONTRAGENTADDRESSWORK = ? , CONTRAGENTOKPO = ? , CONTRAGENTBANKACCOUNT = ? , CONTRAGENTBANKNAME = ? , CONTRAGENTBANKMFO = ? , CONTRAGENTBOSSNAME = ? , CONTRAGENTPASSPORT = ? , CONTRACTSERVICESSUMMA = ? , CONTRACTSERVICESSUMMVT = ? , CONTRACTSERVICESPOWER = ? , COMMENTSERVICESGEN = ? , CONTRACTSERVICESDISTNC = ? , CONTRACTSERVICESDAY = ? , USERGEN = ? , DATEEDIT = ? , WARRANTDATE = ? , WARRANTNUMBER = ? , WARRANTFIO = ? , REGIONALTYPE = ? , BASISTYPE = ? , CONTRAGENTPOSITION = ? , EXECUTEWORKDATE = ? , TIMESTART = ? , TIMEFINAL = ? , CONTRAGENTPHONENUMBER = ? , EXECUTORPHONENUMBER = ? , CONTRAGENTOBJECTWORK = ? , ISNOPAY = ? , ISCUSTOMERMATERIALS = ? , PAYDATE = ? , FINPAYFORMCODE = ? , FINPAYFORMNAME = ? , PARTNERID = ? , PAYDETAIL = ? , ACTTRANSFERNUMBER = ? , ACTTRANSFERDATE = ? , RESPOSIBLE = ? , RESPOSIBLEPOSITION = ? , RESPOSIBLETABNUMBER = ? , PREVCONTRACTSTATUS = ? , RECONNECTIONTU = ? , PERSONALACCOUNTCODE = ? , PERSONALACCOUNTNUMBER = ? , TABNUMBER = ? , CITIESLIST = ? , LINELENGTH = ? , PROJECTCODE = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , CNPACKCODE = ? , DFPACKCODE = ? , COUNTERSZONETYPE = ? , AXPARTNERCODE = ? , AXPARTNERNAME = ? , AXCONTRACTNUMBER = ? , AXCONTRACTDATE = ? , AXCONTRACTCODE = ? , AXCONTRACTID = ? , AXCONTRACTCOMMENTGEN = ? , PROJAGREESUMMA = ? , TOPOGRAPHYSUMMA = ? , CREATEDFROMSITE = ? , TERM = ? , REGULATION = ? , BOUNDARYDATEWORK = ? , COUNTDAYDELAY = ? , FACTDATEWORK = ? , CALCSUMSBYCALCULATIONS = ? , CODEEIC = ? , PERSONALACCOUNTUID = ? , CUSTOMERMAILINGADDRESS = ? , POWERGENERATION = ? , POSTCODE = ? , CUSTOMEREMAIL = ? , DEMOGRAPHICCODE = ? , OWNERSHIPRECORDNUMBER = ? , REALESTATEREGNUMBER = ? , DEPARTMENTCODE = ? , ELEMENTCODE = ? , CONTRACTSTATUSREFCODE = ? , CONTRACTTYPEREFCODE = ? , CONTRAGENTTYPEREFCODE = ? , BILLSTATUSREFCODE = ? , WARRANTREFCODE = ? , STATUSREFCODE = ? , TECHCONOBJECTSCODE = ? , CONTRACTKINDREFCODE = ? , CNSUBSYSTEMTYPEREFCODE = ? , CALCTYPEREFCODE = ? , SITEREFCODE = ? , GENERALCONTRACTREFCODE = ? , ACTINCOMECREATMETDRFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESOBJECT SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					if(fldIndex > 0) {
						selectStr+=", ";
					}
					selectStr+=(String)fields.get(fldIndex);
					selectStr+=" = ?";
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					statement.setString(1, anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(3, anObject.name);
					statement.setString(4, anObject.partnerCode);
					statement.setString(5, anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.finDocID);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setString(7, anObject.commentGen);
					statement.setString(8, anObject.contractNumberServices);
					if (anObject.contractDateServices == null) {
						statement.setDate(9, null);
					} else {
						statement.setDate(9, new java.sql.Date(anObject.contractDateServices.getTime()));
					}
					statement.setString(10, anObject.contragentName);
					statement.setString(11, anObject.contragentAddress);
					statement.setString(12, anObject.contragentAddressWork);
					statement.setString(13, anObject.contragentOkpo);
					statement.setString(14, anObject.contragentBankAccount);
					statement.setString(15, anObject.contragentBankName);
					statement.setString(16, anObject.contragentBankMfo);
					statement.setString(17, anObject.contragentBossName);
					statement.setString(18, anObject.contragentPassport);
					if (anObject.contractServicesSumma != null) {
						anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.contractServicesSumma);
					if (anObject.contractServicesSummaVAT != null) {
						anObject.contractServicesSummaVAT = anObject.contractServicesSummaVAT.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.contractServicesSummaVAT);
					if (anObject.contractServicesPower != null) {
						anObject.contractServicesPower = anObject.contractServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(21, anObject.contractServicesPower);
					statement.setString(22, anObject.commentServicesGen);
					if (anObject.contractServicesDistance != null) {
						anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(23, anObject.contractServicesDistance);
					if (anObject.contractServicesDay != null) {
						anObject.contractServicesDay = anObject.contractServicesDay.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(24, anObject.contractServicesDay);
					statement.setString(25, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(26, null);
					} else {
						statement.setDate(26, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.warrantDate == null) {
						statement.setDate(27, null);
					} else {
						statement.setDate(27, new java.sql.Date(anObject.warrantDate.getTime()));
					}
					statement.setString(28, anObject.warrantNumber);
					statement.setString(29, anObject.warrantFIO);
					if (anObject.regionalType != Integer.MIN_VALUE) {
						statement.setInt(30, anObject.regionalType);
					} else {
						statement.setNull(30, java.sql.Types.INTEGER);
					}
					if (anObject.basisType != null) {
						anObject.basisType = anObject.basisType.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(31, anObject.basisType);
					statement.setString(32, anObject.contragentPosition);
					if (anObject.executeWorkDate == null) {
						statement.setDate(33, null);
					} else {
						statement.setDate(33, new java.sql.Date(anObject.executeWorkDate.getTime()));
					}
					if (anObject.timeStart == null) {
						statement.setTimestamp(34, null);
					} else {
						statement.setTimestamp(34, new java.sql.Timestamp(anObject.timeStart.getTime()));
					}
					if (anObject.timeFinal == null) {
						statement.setTimestamp(35, null);
					} else {
						statement.setTimestamp(35, new java.sql.Timestamp(anObject.timeFinal.getTime()));
					}
					statement.setString(36, anObject.contragentPhoneNumber);
					statement.setString(37, anObject.executorPhoneNumber);
					statement.setString(38, anObject.contragentObjectWork);
					if (anObject.isNoPay != Integer.MIN_VALUE) {
						statement.setInt(39, anObject.isNoPay);
					} else {
						statement.setNull(39, java.sql.Types.INTEGER);
					}
					if (anObject.isCustomerMaterials != Integer.MIN_VALUE) {
						statement.setInt(40, anObject.isCustomerMaterials);
					} else {
						statement.setNull(40, java.sql.Types.INTEGER);
					}
					if (anObject.payDate == null) {
						statement.setDate(41, null);
					} else {
						statement.setDate(41, new java.sql.Date(anObject.payDate.getTime()));
					}
					if (anObject.finPayFormCode != Integer.MIN_VALUE) {
						statement.setInt(42, anObject.finPayFormCode);
					} else {
						statement.setNull(42, java.sql.Types.INTEGER);
					}
					statement.setString(43, anObject.finPayFormName);
					if (anObject.partnerId != Integer.MIN_VALUE) {
						statement.setInt(44, anObject.partnerId);
					} else {
						statement.setNull(44, java.sql.Types.INTEGER);
					}
					statement.setString(45, anObject.payDetail);
					statement.setString(46, anObject.actTransferNumber);
					if (anObject.actTransferDate == null) {
						statement.setDate(47, null);
					} else {
						statement.setDate(47, new java.sql.Date(anObject.actTransferDate.getTime()));
					}
					statement.setString(48, anObject.resposible);
					statement.setString(49, anObject.resposiblePosition);
					statement.setString(50, anObject.resposibleTabNumber);
					if (anObject.prevContractStatus != Integer.MIN_VALUE) {
						statement.setInt(51, anObject.prevContractStatus);
					} else {
						statement.setNull(51, java.sql.Types.INTEGER);
					}
					if (anObject.reconnectionTU != Integer.MIN_VALUE) {
						statement.setInt(52, anObject.reconnectionTU);
					} else {
						statement.setNull(52, java.sql.Types.INTEGER);
					}
					if (anObject.personalAccountCode != Integer.MIN_VALUE) {
						statement.setInt(53, anObject.personalAccountCode);
					} else {
						statement.setNull(53, java.sql.Types.INTEGER);
					}
					statement.setString(54, anObject.personalAccountNumber);
					statement.setString(55, anObject.tabNumber);
					statement.setString(56, anObject.citiesList);
					if (anObject.lineLength != null) {
						anObject.lineLength = anObject.lineLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(57, anObject.lineLength);
					statement.setString(58, anObject.projectCode);
					statement.setString(59, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(60, null);
					} else {
						statement.setBigDecimal(60, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.cnPackCode != Integer.MIN_VALUE) {
						statement.setInt(61, anObject.cnPackCode);
					} else {
						statement.setNull(61, java.sql.Types.INTEGER);
					}
					if (anObject.dfPackCode != Integer.MIN_VALUE) {
						statement.setInt(62, anObject.dfPackCode);
					} else {
						statement.setNull(62, java.sql.Types.INTEGER);
					}
					if (anObject.countersZoneType != Integer.MIN_VALUE) {
						statement.setInt(63, anObject.countersZoneType);
					} else {
						statement.setNull(63, java.sql.Types.INTEGER);
					}
					statement.setString(64, anObject.axPartnerCode);
					statement.setString(65, anObject.axPartnerName);
					statement.setString(66, anObject.axContractNumber);
					if (anObject.axContractDate == null) {
						statement.setDate(67, null);
					} else {
						statement.setDate(67, new java.sql.Date(anObject.axContractDate.getTime()));
					}
					statement.setString(68, anObject.axContractCode);
					statement.setString(69, anObject.axContractId);
					statement.setString(70, anObject.axContractCommentGen);
					if (anObject.projAgreeSumma != null) {
						anObject.projAgreeSumma = anObject.projAgreeSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(71, anObject.projAgreeSumma);
					if (anObject.topographySumma != null) {
						anObject.topographySumma = anObject.topographySumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(72, anObject.topographySumma);
					if (anObject.createdFromSite != Integer.MIN_VALUE) {
						statement.setInt(73, anObject.createdFromSite);
					} else {
						statement.setNull(73, java.sql.Types.INTEGER);
					}
					if (anObject.term != Integer.MIN_VALUE) {
						statement.setInt(74, anObject.term);
					} else {
						statement.setNull(74, java.sql.Types.INTEGER);
					}
					if (anObject.regulation != Integer.MIN_VALUE) {
						statement.setInt(75, anObject.regulation);
					} else {
						statement.setNull(75, java.sql.Types.INTEGER);
					}
					if (anObject.boundaryDateWork == null) {
						statement.setDate(76, null);
					} else {
						statement.setDate(76, new java.sql.Date(anObject.boundaryDateWork.getTime()));
					}
					if (anObject.countDayDelay != Integer.MIN_VALUE) {
						statement.setInt(77, anObject.countDayDelay);
					} else {
						statement.setNull(77, java.sql.Types.INTEGER);
					}
					if (anObject.factDateWork == null) {
						statement.setDate(78, null);
					} else {
						statement.setDate(78, new java.sql.Date(anObject.factDateWork.getTime()));
					}
					if (anObject.calcSumsByCalculations == null) {
						statement.setNull(79, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(79, anObject.calcSumsByCalculations);
					}
					statement.setString(80, anObject.codeEIC);
					statement.setString(81, anObject.personalAccountUid);
					statement.setString(82, anObject.customerMailingAddress);
					if (anObject.powerGeneration != null) {
						anObject.powerGeneration = anObject.powerGeneration.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(83, anObject.powerGeneration);
					statement.setString(84, anObject.postCode);
					statement.setString(85, anObject.customerEmail);
					statement.setString(86, anObject.demographicCode);
					statement.setString(87, anObject.ownershipRecordNumber);
					statement.setString(88, anObject.realEstateRegNumber);
					if (anObject.department.code != Integer.MIN_VALUE) {
						statement.setInt(89, anObject.department.code);
					} else {
						statement.setNull(89, java.sql.Types.INTEGER);
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(90, anObject.element.code);
					} else {
						statement.setNull(90, java.sql.Types.INTEGER);
					}
					if (anObject.contractStatusRef.code != Integer.MIN_VALUE) {
						statement.setInt(91, anObject.contractStatusRef.code);
					} else {
						statement.setNull(91, java.sql.Types.INTEGER);
					}
					if (anObject.contractTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(92, anObject.contractTypeRef.code);
					} else {
						statement.setNull(92, java.sql.Types.INTEGER);
					}
					if (anObject.contragentTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(93, anObject.contragentTypeRef.code);
					} else {
						statement.setNull(93, java.sql.Types.INTEGER);
					}
					if (anObject.billStatusRef.code != Integer.MIN_VALUE) {
						statement.setInt(94, anObject.billStatusRef.code);
					} else {
						statement.setNull(94, java.sql.Types.INTEGER);
					}
					if (anObject.warrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(95, anObject.warrantRef.code);
					} else {
						statement.setNull(95, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(96, anObject.statusRef.code);
					} else {
						statement.setNull(96, java.sql.Types.INTEGER);
					}
					if (anObject.techConObjects.code != Integer.MIN_VALUE) {
						statement.setInt(97, anObject.techConObjects.code);
					} else {
						statement.setNull(97, java.sql.Types.INTEGER);
					}
					if (anObject.contractKindRef.code != Integer.MIN_VALUE) {
						statement.setInt(98, anObject.contractKindRef.code);
					} else {
						statement.setNull(98, java.sql.Types.INTEGER);
					}
					if (anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(99, anObject.cnSubsystemTypeRef.code);
					} else {
						statement.setNull(99, java.sql.Types.INTEGER);
					}
					if (anObject.calcTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(100, anObject.calcTypeRef.code);
					} else {
						statement.setNull(100, java.sql.Types.INTEGER);
					}
					if (anObject.siteRef.code != Integer.MIN_VALUE) {
						statement.setInt(101, anObject.siteRef.code);
					} else {
						statement.setNull(101, java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(102, anObject.generalContractRef.code);
					} else {
						statement.setNull(102, java.sql.Types.INTEGER);
					}
					if (anObject.actIncomeCreatMetodRef.code != Integer.MIN_VALUE) {
						statement.setInt(103, anObject.actIncomeCreatMetodRef.code);
					} else {
						statement.setNull(103, java.sql.Types.INTEGER);
					}
					statement.setInt(104, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contractNumber);
							continue;
						}
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.contractDate.getTime()));
							}
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnerCode);
							continue;
						}
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finDocCode);
							continue;
						}
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.finDocID);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("CONTRACTNUMBERSERVICES".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contractNumberServices);
							continue;
						}
						if("CONTRACTDATESERVICES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDateServices == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.contractDateServices.getTime()));
							}
							continue;
						}
						if("CONTRAGENTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentName);
							continue;
						}
						if("CONTRAGENTADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentAddress);
							continue;
						}
						if("CONTRAGENTADDRESSWORK".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentAddressWork);
							continue;
						}
						if("CONTRAGENTOKPO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentOkpo);
							continue;
						}
						if("CONTRAGENTBANKACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentBankAccount);
							continue;
						}
						if("CONTRAGENTBANKNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentBankName);
							continue;
						}
						if("CONTRAGENTBANKMFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentBankMfo);
							continue;
						}
						if("CONTRAGENTBOSSNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentBossName);
							continue;
						}
						if("CONTRAGENTPASSPORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentPassport);
							continue;
						}
						if("CONTRACTSERVICESSUMMA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractServicesSumma != null) {
								anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.contractServicesSumma);
							continue;
						}
						if("CONTRACTSERVICESSUMMAVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractServicesSummaVAT != null) {
								anObject.contractServicesSummaVAT = anObject.contractServicesSummaVAT.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.contractServicesSummaVAT);
							continue;
						}
						if("CONTRACTSERVICESPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractServicesPower != null) {
								anObject.contractServicesPower = anObject.contractServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.contractServicesPower);
							continue;
						}
						if("COMMENTSERVICESGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentServicesGen);
							continue;
						}
						if("CONTRACTSERVICESDISTANCE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractServicesDistance != null) {
								anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.contractServicesDistance);
							continue;
						}
						if("CONTRACTSERVICESDAY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractServicesDay != null) {
								anObject.contractServicesDay = anObject.contractServicesDay.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.contractServicesDay);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("WARRANTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.warrantDate.getTime()));
							}
							continue;
						}
						if("WARRANTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.warrantNumber);
							continue;
						}
						if("WARRANTFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.warrantFIO);
							continue;
						}
						if("REGIONALTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.regionalType);
							continue;
						}
						if("BASISTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.basisType != null) {
								anObject.basisType = anObject.basisType.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.basisType);
							continue;
						}
						if("CONTRAGENTPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentPosition);
							continue;
						}
						if("EXECUTEWORKDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.executeWorkDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.executeWorkDate.getTime()));
							}
							continue;
						}
						if("TIMESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeStart == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.timeStart.getTime()));
							}
							continue;
						}
						if("TIMEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeFinal == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.timeFinal.getTime()));
							}
							continue;
						}
						if("CONTRAGENTPHONENUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentPhoneNumber);
							continue;
						}
						if("EXECUTORPHONENUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorPhoneNumber);
							continue;
						}
						if("CONTRAGENTOBJECTWORK".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contragentObjectWork);
							continue;
						}
						if("ISNOPAY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isNoPay);
							continue;
						}
						if("ISCUSTOMERMATERIALS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isCustomerMaterials);
							continue;
						}
						if("PAYDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.payDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.payDate.getTime()));
							}
							continue;
						}
						if("FINPAYFORMCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.finPayFormCode);
							continue;
						}
						if("FINPAYFORMNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finPayFormName);
							continue;
						}
						if("PARTNERID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.partnerId);
							continue;
						}
						if("PAYDETAIL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.payDetail);
							continue;
						}
						if("ACTTRANSFERNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.actTransferNumber);
							continue;
						}
						if("ACTTRANSFERDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actTransferDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.actTransferDate.getTime()));
							}
							continue;
						}
						if("RESPOSIBLE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.resposible);
							continue;
						}
						if("RESPOSIBLEPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.resposiblePosition);
							continue;
						}
						if("RESPOSIBLETABNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.resposibleTabNumber);
							continue;
						}
						if("PREVCONTRACTSTATUS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.prevContractStatus);
							continue;
						}
						if("RECONNECTIONTU".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.reconnectionTU);
							continue;
						}
						if("PERSONALACCOUNTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.personalAccountCode);
							continue;
						}
						if("PERSONALACCOUNTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personalAccountNumber);
							continue;
						}
						if("TABNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.tabNumber);
							continue;
						}
						if("CITIESLIST".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.citiesList);
							continue;
						}
						if("LINELENGTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.lineLength != null) {
								anObject.lineLength = anObject.lineLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.lineLength);
							continue;
						}
						if("PROJECTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.projectCode);
							continue;
						}
						if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.domain_info);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("CNPACKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.cnPackCode);
							continue;
						}
						if("DFPACKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfPackCode);
							continue;
						}
						if("COUNTERSZONETYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.countersZoneType);
							continue;
						}
						if("AXPARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axPartnerCode);
							continue;
						}
						if("AXPARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axPartnerName);
							continue;
						}
						if("AXCONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axContractNumber);
							continue;
						}
						if("AXCONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.axContractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.axContractDate.getTime()));
							}
							continue;
						}
						if("AXCONTRACTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axContractCode);
							continue;
						}
						if("AXCONTRACTID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axContractId);
							continue;
						}
						if("AXCONTRACTCOMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axContractCommentGen);
							continue;
						}
						if("PROJAGREESUMMA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.projAgreeSumma != null) {
								anObject.projAgreeSumma = anObject.projAgreeSumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.projAgreeSumma);
							continue;
						}
						if("TOPOGRAPHYSUMMA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.topographySumma != null) {
								anObject.topographySumma = anObject.topographySumma.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.topographySumma);
							continue;
						}
						if("CREATEDFROMSITE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.createdFromSite);
							continue;
						}
						if("TERM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.term);
							continue;
						}
						if("REGULATION".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.regulation);
							continue;
						}
						if("BOUNDARYDATEWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.boundaryDateWork == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.boundaryDateWork.getTime()));
							}
							continue;
						}
						if("COUNTDAYDELAY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.countDayDelay);
							continue;
						}
						if("FACTDATEWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.factDateWork == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.factDateWork.getTime()));
							}
							continue;
						}
						if("CALCSUMSBYCALCULATIONS".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.calcSumsByCalculations);
							continue;
						}
						if("CODEEIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.codeEIC);
							continue;
						}
						if("PERSONALACCOUNTUID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personalAccountUid);
							continue;
						}
						if("CUSTOMERMAILINGADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.customerMailingAddress);
							continue;
						}
						if("POWERGENERATION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.powerGeneration != null) {
								anObject.powerGeneration = anObject.powerGeneration.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.powerGeneration);
							continue;
						}
						if("POSTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.postCode);
							continue;
						}
						if("CUSTOMEREMAIL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.customerEmail);
							continue;
						}
						if("DEMOGRAPHICCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.demographicCode);
							continue;
						}
						if("OWNERSHIPRECORDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.ownershipRecordNumber);
							continue;
						}
						if("REALESTATEREGNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.realEstateRegNumber);
							continue;
						}
						if("DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.department.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.department.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.element.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRACTSTATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractStatusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.contractStatusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRACTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.contractTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRAGENTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contragentTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.contragentTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("BILLSTATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.billStatusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.billStatusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.statusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TECHCONOBJECTS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techConObjects.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.techConObjects.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRACTKINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractKindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.contractKindRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CNSUBSYSTEMTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.cnSubsystemTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CALCTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.calcTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SITEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.siteRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.siteRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GENERALCONTRACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.generalContractRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACTINCOMECREATMETODREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actIncomeCreatMetodRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.actIncomeCreatMetodRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size()+1, anObject.code);
				}

				statement.execute();


			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+selectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (statement != null) statement.close();} catch (SQLException e) {}
			}
		} finally {
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}

	} // end of save(ENServicesObject anObject,String[] anAttributes)


	public ENServicesObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesObject filterObject = new ENServicesObject();
		Vector<ENServicesObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesObjectShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumberServices, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDateServices, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentAddress, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentAddressWork, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentOkpo, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentBankAccount, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentBankName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentBankMfo, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentBossName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentPassport, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.contractServicesSumma, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.contractServicesSummaVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.contractServicesPower, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentServicesGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.contractServicesDistance, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.contractServicesDay, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.warrantDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.warrantNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.warrantFIO, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.regionalType, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.basisType, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentPosition, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.executeWorkDate, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeStart, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeFinal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentPhoneNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorPhoneNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contragentObjectWork, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isNoPay, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isCustomerMaterials, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.payDate, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finPayFormCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finPayFormName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.partnerId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.payDetail, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.actTransferNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.actTransferDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.resposible, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.resposiblePosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.resposibleTabNumber, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.prevContractStatus, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.reconnectionTU, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.personalAccountCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personalAccountNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tabNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.citiesList, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.lineLength, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.projectCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cnPackCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfPackCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.countersZoneType, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axPartnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axPartnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.axContractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractCommentGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.projAgreeSumma, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.topographySumma, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.createdFromSite, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.term, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.regulation, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.boundaryDateWork, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.countDayDelay, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.factDateWork, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.calcSumsByCalculations, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codeEIC, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personalAccountUid, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customerMailingAddress, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.powerGeneration, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.postCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customerEmail, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.demographicCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ownershipRecordNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.realEstateRegNumber, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.department.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contractStatusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contractTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contragentTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.billStatusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techConObjects.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contractKindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cnSubsystemTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.siteRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actIncomeCreatMetodRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesObjectFilter filter) {
		String out = buildCondition((ENServicesObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENServicesObject.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENServicesObject.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENServicesObject.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENServicesObject.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENServicesObject.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENServicesObject.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENServicesObject.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumberServices, ENServicesObject.contractNumberServices_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDateServices, ENServicesObject.contractDateServices_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentName, ENServicesObject.contragentName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentAddress, ENServicesObject.contragentAddress_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentAddressWork, ENServicesObject.contragentAddressWork_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentOkpo, ENServicesObject.contragentOkpo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentBankAccount, ENServicesObject.contragentBankAccount_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentBankName, ENServicesObject.contragentBankName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentBankMfo, ENServicesObject.contragentBankMfo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentBossName, ENServicesObject.contragentBossName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentPassport, ENServicesObject.contragentPassport_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractServicesSumma, ENServicesObject.contractServicesSumma_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractServicesSummaVAT, ENServicesObject.contractServicesSummaVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractServicesPower, ENServicesObject.contractServicesPower_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentServicesGen, ENServicesObject.commentServicesGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractServicesDistance, ENServicesObject.contractServicesDistance_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractServicesDay, ENServicesObject.contractServicesDay_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENServicesObject.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENServicesObject.dateEdit_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.warrantDate, ENServicesObject.warrantDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.warrantNumber, ENServicesObject.warrantNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.warrantFIO, ENServicesObject.warrantFIO_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.regionalType, ENServicesObject.regionalType_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.basisType, ENServicesObject.basisType_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentPosition, ENServicesObject.contragentPosition_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.executeWorkDate, ENServicesObject.executeWorkDate_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeStart, ENServicesObject.timeStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeFinal, ENServicesObject.timeFinal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentPhoneNumber, ENServicesObject.contragentPhoneNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorPhoneNumber, ENServicesObject.executorPhoneNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contragentObjectWork, ENServicesObject.contragentObjectWork_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isNoPay, ENServicesObject.isNoPay_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isCustomerMaterials, ENServicesObject.isCustomerMaterials_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.payDate, ENServicesObject.payDate_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finPayFormCode, ENServicesObject.finPayFormCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finPayFormName, ENServicesObject.finPayFormName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.partnerId, ENServicesObject.partnerId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.payDetail, ENServicesObject.payDetail_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.actTransferNumber, ENServicesObject.actTransferNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actTransferDate, ENServicesObject.actTransferDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.resposible, ENServicesObject.resposible_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.resposiblePosition, ENServicesObject.resposiblePosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.resposibleTabNumber, ENServicesObject.resposibleTabNumber_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.prevContractStatus, ENServicesObject.prevContractStatus_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.reconnectionTU, ENServicesObject.reconnectionTU_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.personalAccountCode, ENServicesObject.personalAccountCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personalAccountNumber, ENServicesObject.personalAccountNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tabNumber, ENServicesObject.tabNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.citiesList, ENServicesObject.citiesList_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.lineLength, ENServicesObject.lineLength_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.projectCode, ENServicesObject.projectCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENServicesObject.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENServicesObject.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cnPackCode, ENServicesObject.cnPackCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfPackCode, ENServicesObject.dfPackCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.countersZoneType, ENServicesObject.countersZoneType_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axPartnerCode, ENServicesObject.axPartnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axPartnerName, ENServicesObject.axPartnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractNumber, ENServicesObject.axContractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.axContractDate, ENServicesObject.axContractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractCode, ENServicesObject.axContractCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractId, ENServicesObject.axContractId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractCommentGen, ENServicesObject.axContractCommentGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.projAgreeSumma, ENServicesObject.projAgreeSumma_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.topographySumma, ENServicesObject.topographySumma_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.createdFromSite, ENServicesObject.createdFromSite_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.term, ENServicesObject.term_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.regulation, ENServicesObject.regulation_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.boundaryDateWork, ENServicesObject.boundaryDateWork_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.countDayDelay, ENServicesObject.countDayDelay_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.factDateWork, ENServicesObject.factDateWork_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.calcSumsByCalculations, ENServicesObject.calcSumsByCalculations_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codeEIC, ENServicesObject.codeEIC_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personalAccountUid, ENServicesObject.personalAccountUid_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customerMailingAddress, ENServicesObject.customerMailingAddress_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.powerGeneration, ENServicesObject.powerGeneration_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.postCode, ENServicesObject.postCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customerEmail, ENServicesObject.customerEmail_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.demographicCode, ENServicesObject.demographicCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ownershipRecordNumber, ENServicesObject.ownershipRecordNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.realEstateRegNumber, ENServicesObject.realEstateRegNumber_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.department.code, ENServicesObject.department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENServicesObject.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contractStatusRef.code, ENServicesObject.contractStatusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contractTypeRef.code, ENServicesObject.contractTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contragentTypeRef.code, ENServicesObject.contragentTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.billStatusRef.code, ENServicesObject.billStatusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantRef.code, ENServicesObject.warrantRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENServicesObject.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techConObjects.code, ENServicesObject.techConObjects_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contractKindRef.code, ENServicesObject.contractKindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cnSubsystemTypeRef.code, ENServicesObject.cnSubsystemTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcTypeRef.code, ENServicesObject.calcTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.siteRef.code, ENServicesObject.siteRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENServicesObject.generalContractRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actIncomeCreatMetodRef.code, ENServicesObject.actIncomeCreatMetodRef_QFielld, out);
		}
		return out;
	}

	public ENServicesObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesObjectShortList getFilteredList(ENServicesObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesObjectShortList getScrollableFilteredList(ENServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesObjectShortList getScrollableFilteredList(ENServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesObjectShortList getScrollableFilteredList(ENServicesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesObjectShortList getScrollableFilteredList(ENServicesObjectFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesObjectShortList getScrollableFilteredList(ENServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesObjectShortList result = new ENServicesObjectShortList();
		ENServicesObjectShort anObject;
		result.list = new Vector<ENServicesObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESOBJECT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESOBJECT.CODE"+
			",ENSERVICESOBJECT.CONTRACTNUMBER"+
			",ENSERVICESOBJECT.CONTRACTDATE"+
			",ENSERVICESOBJECT.NAME"+
			",ENSERVICESOBJECT.PARTNERCODE"+
			",ENSERVICESOBJECT.FINDOCCODE"+
			",ENSERVICESOBJECT.FINDOCID"+
			",ENSERVICESOBJECT.COMMENTGEN"+
			",ENSERVICESOBJECT.CONTRACTNUMBERSERVICES"+
			",ENSERVICESOBJECT.CONTRACTDATESERVICES"+
			",ENSERVICESOBJECT.CONTRAGENTNAME"+
			",ENSERVICESOBJECT.CONTRAGENTADDRESS"+
			",ENSERVICESOBJECT.CONTRAGENTADDRESSWORK"+
			",ENSERVICESOBJECT.CONTRAGENTOKPO"+
			",ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT"+
			",ENSERVICESOBJECT.CONTRAGENTBANKNAME"+
			",ENSERVICESOBJECT.CONTRAGENTBANKMFO"+
			",ENSERVICESOBJECT.CONTRAGENTBOSSNAME"+
			",ENSERVICESOBJECT.CONTRAGENTPASSPORT"+
			",ENSERVICESOBJECT.CONTRACTSERVICESSUMMA"+
			",ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT"+
			",ENSERVICESOBJECT.CONTRACTSERVICESPOWER"+
			",ENSERVICESOBJECT.COMMENTSERVICESGEN"+
			",ENSERVICESOBJECT.CONTRACTSERVICESDISTNC"+
			",ENSERVICESOBJECT.CONTRACTSERVICESDAY"+
			",ENSERVICESOBJECT.USERGEN"+
			",ENSERVICESOBJECT.DATEEDIT"+
			",ENSERVICESOBJECT.WARRANTDATE"+
			",ENSERVICESOBJECT.WARRANTNUMBER"+
			",ENSERVICESOBJECT.WARRANTFIO"+
			",ENSERVICESOBJECT.REGIONALTYPE"+
			",ENSERVICESOBJECT.BASISTYPE"+
			",ENSERVICESOBJECT.CONTRAGENTPOSITION"+
			",ENSERVICESOBJECT.EXECUTEWORKDATE"+
			",ENSERVICESOBJECT.TIMESTART"+
			",ENSERVICESOBJECT.TIMEFINAL"+
			",ENSERVICESOBJECT.CONTRAGENTPHONENUMBER"+
			",ENSERVICESOBJECT.EXECUTORPHONENUMBER"+
			",ENSERVICESOBJECT.CONTRAGENTOBJECTWORK"+
			",ENSERVICESOBJECT.ISNOPAY"+
			",ENSERVICESOBJECT.ISCUSTOMERMATERIALS"+
			",ENSERVICESOBJECT.PAYDATE"+
			",ENSERVICESOBJECT.FINPAYFORMCODE"+
			",ENSERVICESOBJECT.FINPAYFORMNAME"+
			",ENSERVICESOBJECT.PARTNERID"+
			",ENSERVICESOBJECT.PAYDETAIL"+
			",ENSERVICESOBJECT.ACTTRANSFERNUMBER"+
			",ENSERVICESOBJECT.ACTTRANSFERDATE"+
			",ENSERVICESOBJECT.RESPOSIBLE"+
			",ENSERVICESOBJECT.RESPOSIBLEPOSITION"+
			",ENSERVICESOBJECT.RESPOSIBLETABNUMBER"+
			",ENSERVICESOBJECT.PREVCONTRACTSTATUS"+
			",ENSERVICESOBJECT.RECONNECTIONTU"+
			",ENSERVICESOBJECT.PERSONALACCOUNTCODE"+
			",ENSERVICESOBJECT.PERSONALACCOUNTNUMBER"+
			",ENSERVICESOBJECT.TABNUMBER"+
			",ENSERVICESOBJECT.CITIESLIST"+
			",ENSERVICESOBJECT.LINELENGTH"+
			",ENSERVICESOBJECT.PROJECTCODE"+
			",ENSERVICESOBJECT.CNPACKCODE"+
			",ENSERVICESOBJECT.DFPACKCODE"+
			",ENSERVICESOBJECT.COUNTERSZONETYPE"+
			",ENSERVICESOBJECT.AXPARTNERCODE"+
			",ENSERVICESOBJECT.AXPARTNERNAME"+
			",ENSERVICESOBJECT.AXCONTRACTNUMBER"+
			",ENSERVICESOBJECT.AXCONTRACTDATE"+
			",ENSERVICESOBJECT.AXCONTRACTCODE"+
			",ENSERVICESOBJECT.AXCONTRACTID"+
			",ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN"+
			",ENSERVICESOBJECT.PROJAGREESUMMA"+
			",ENSERVICESOBJECT.TOPOGRAPHYSUMMA"+
			",ENSERVICESOBJECT.CREATEDFROMSITE"+
			",ENSERVICESOBJECT.TERM"+
			",ENSERVICESOBJECT.REGULATION"+
			",ENSERVICESOBJECT.BOUNDARYDATEWORK"+
			",ENSERVICESOBJECT.COUNTDAYDELAY"+
			",ENSERVICESOBJECT.FACTDATEWORK"+
			",ENSERVICESOBJECT.CODEEIC"+
			",ENSERVICESOBJECT.PERSONALACCOUNTUID"+
			",ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS"+
			",ENSERVICESOBJECT.POWERGENERATION"+
			",ENSERVICESOBJECT.POSTCODE"+
			",ENSERVICESOBJECT.CUSTOMEREMAIL"+
			",ENSERVICESOBJECT.DEMOGRAPHICCODE"+
			",ENSERVICESOBJECT.OWNERSHIPRECORDNUMBER"+
			",ENSERVICESOBJECT.REALESTATEREGNUMBER"+
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +
			", ENELEMENT.CODE " +
			", ENSERVICESCONTRACTSTTS.CODE " +
			", ENSERVICESCONTRACTSTTS.NAME " +
			", ENSERVICESCONTRACTTYPE.CODE " +
			", ENSERVICESCONTRACTTYPE.NAME " +
			", ENSERVICESCONTRAGENTTP.CODE " +
			", ENSERVICESCONTRAGENTTP.NAME " +
			", ENSERVICESBILLSTATUS.CODE " +
			", ENSERVICESBILLSTATUS.NAME " +
			", ENWARRANT.CODE " +
			", ENWARRANT.NUMBERGEN " +
			", ENWARRANT.NAME " +
			", ENWARRANT.WARRANTFIO " +
			", ENWARRANT.WARRANTSHORTFIO " +
			", ENWARRANT.WARRANTPOSITION " +
			", ENWARRANT.GENITIVEFIO " +
			", ENWARRANT.GENITIVEPOSITION " +
			", ENWARRANT.PASSPORT " +
			", ENWARRANT.ADDRESS " +
			", ENWARRANT.POWER " +
			", ENWARRANT.MAXSUM " +
			", ENWARRANT.DEPARTMENTNAME " +
			", ENWARRANT.DEPARTMENTNAMEGENITIVE " +
			", ENSERVICESOBJECTSTATUS.CODE " +
			", ENSERVICESOBJECTSTATUS.NAME " +
			", ENTECHCONDITIONSOBJCTS.CODE " +
			", ENTECHCONDITIONSOBJCTS.NUMBERGEN " +
			", ENTECHCONDITIONSOBJCTS.DATEGEN " +
			", ENTECHCONDITIONSOBJCTS.CUSTOMER " +
			", ENTECHCONDITIONSOBJCTS.BUILDING " +
			", ENTECHCONDITIONSOBJCTS.ADDRESS " +
			", ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM " +
			", ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER " +
			", ENTECHCONDITIONSOBJCTS.POWERGENERATION " +
			", ENTECHCONDITIONSOBJCTS.YEARGEN " +
			", ENTECHCONDITIONSOBJCTS.PERFORMER " +
			", ENTECHCONDITIONSOBJCTS.PERFORMERPHONE " +
			", ENTECHCONDITIONSOBJCTS.USERGEN " +
			", ENTECHCONDITIONSOBJCTS.DATEEDIT " +
			", ENTECHCONDITIONSOBJCTS.SECURITYZONE " +
			", ENTECHCONDITIONSOBJCTS.OBJECTSECURITYZONE " +
			", ENSERVICESCONTRACTKIND.CODE " +
			", ENSERVICESCONTRACTKIND.NAME " +
			", CNSUBSYSTEMTYPE.CODE " +
			", CNSUBSYSTEMTYPE.NAME " +
			", ENSERVICESOBJECTCALCTP.CODE " +
			", ENSERVICESOBJECTCALCTP.NAME " +
			", ENSITE.CODE " +
			", ENSITE.NAME " +
			", ENSITE.SITEADDRESS " +
			", ENSITE.SITEPHONE " +
			", ENGENERALCONTRACTS.CODE " +
			", ENGENERALCONTRACTS.FINDOCID " +
			", ENGENERALCONTRACTS.FINDOCCODE " +
			", ENGENERALCONTRACTS.CONTRACTNUMBER " +
			", ENGENERALCONTRACTS.CONTRACTDATE " +
			", ENGENERALCONTRACTS.COMMENTGEN " +
			", ENGENERALCONTRACTS.PARTNERID " +
			", ENGENERALCONTRACTS.PARTNERCODE " +
			", ENGENERALCONTRACTS.PARTNERNAME " +
			", ENGENERALCONTRACTS.CONTRACTREGDATE " +
			", ENGENERALCONTRACTS.CONTRACTSTARTDATE " +
			", ENGENERALCONTRACTS.CONTRACTENDDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTID " +
			", ENGENERALCONTRACTS.AXCONTRACTCODE " +
			", ENGENERALCONTRACTS.AXCONTRACTNUMBER " +
			", ENGENERALCONTRACTS.AXCONTRACTACCOUNT " +
			", ENGENERALCONTRACTS.AXCONTRACTDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN " +
			", ENGENERALCONTRACTS.AXCONTRACTGROUPCODE " +
			", ENGENERALCONTRACTS.AXPARTNERCODE " +
			", ENGENERALCONTRACTS.AXPARTNERNAME " +
			", ENGENERALCONTRACTS.USERGEN " +
			", ENACTINCOMECREATMETOD.CODE " +
			", ENACTINCOMECREATMETOD.NAME " +
		" FROM ENSERVICESOBJECT " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENSERVICESOBJECT.DEPARTMENTCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENSERVICESOBJECT.ELEMENTCODE "+
			" LEFT JOIN ENSERVICESCONTRACTSTTS on ENSERVICESCONTRACTSTTS.CODE = ENSERVICESOBJECT.CONTRACTSTATUSREFCODE "+
			" LEFT JOIN ENSERVICESCONTRACTTYPE on ENSERVICESCONTRACTTYPE.CODE = ENSERVICESOBJECT.CONTRACTTYPEREFCODE "+
			" LEFT JOIN ENSERVICESCONTRAGENTTP on ENSERVICESCONTRAGENTTP.CODE = ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE "+
			" LEFT JOIN ENSERVICESBILLSTATUS on ENSERVICESBILLSTATUS.CODE = ENSERVICESOBJECT.BILLSTATUSREFCODE "+
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENSERVICESOBJECT.WARRANTREFCODE "+
			" LEFT JOIN ENSERVICESOBJECTSTATUS on ENSERVICESOBJECTSTATUS.CODE = ENSERVICESOBJECT.STATUSREFCODE "+
			" LEFT JOIN ENTECHCONDITIONSOBJCTS on ENTECHCONDITIONSOBJCTS.CODE = ENSERVICESOBJECT.TECHCONOBJECTSCODE "+
			" LEFT JOIN ENSERVICESCONTRACTKIND on ENSERVICESCONTRACTKIND.CODE = ENSERVICESOBJECT.CONTRACTKINDREFCODE "+
			" LEFT JOIN CNSUBSYSTEMTYPE on CNSUBSYSTEMTYPE.CODE = ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE "+
			" LEFT JOIN ENSERVICESOBJECTCALCTP on ENSERVICESOBJECTCALCTP.CODE = ENSERVICESOBJECT.CALCTYPEREFCODE "+
			" LEFT JOIN ENSITE on ENSITE.CODE = ENSERVICESOBJECT.SITEREFCODE "+
			" LEFT JOIN ENGENERALCONTRACTS on ENGENERALCONTRACTS.CODE = ENSERVICESOBJECT.GENERALCONTRACTREFCODE "+
			" LEFT JOIN ENACTINCOMECREATMETOD on ENACTINCOMECREATMETOD.CODE = ENSERVICESOBJECT.ACTINCOMECREATMETDRFCD "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENServicesObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.name = set.getString(4);
				anObject.partnerCode = set.getString(5);
				anObject.finDocCode = set.getString(6);
				anObject.finDocID = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(8);
				anObject.contractNumberServices = set.getString(9);
				anObject.contractDateServices = set.getDate(10);
				anObject.contragentName = set.getString(11);
				anObject.contragentAddress = set.getString(12);
				anObject.contragentAddressWork = set.getString(13);
				anObject.contragentOkpo = set.getString(14);
				anObject.contragentBankAccount = set.getString(15);
				anObject.contragentBankName = set.getString(16);
				anObject.contragentBankMfo = set.getString(17);
				anObject.contragentBossName = set.getString(18);
				anObject.contragentPassport = set.getString(19);
				anObject.contractServicesSumma = set.getBigDecimal(20);
				if(anObject.contractServicesSumma != null) {
					anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractServicesSummaVAT = set.getBigDecimal(21);
				if(anObject.contractServicesSummaVAT != null) {
					anObject.contractServicesSummaVAT = anObject.contractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractServicesPower = set.getBigDecimal(22);
				if(anObject.contractServicesPower != null) {
					anObject.contractServicesPower = anObject.contractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentServicesGen = set.getString(23);
				anObject.contractServicesDistance = set.getBigDecimal(24);
				if(anObject.contractServicesDistance != null) {
					anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractServicesDay = set.getBigDecimal(25);
				if(anObject.contractServicesDay != null) {
					anObject.contractServicesDay = anObject.contractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(26);
				anObject.dateEdit = set.getDate(27);
				anObject.warrantDate = set.getDate(28);
				anObject.warrantNumber = set.getString(29);
				anObject.warrantFIO = set.getString(30);
				anObject.regionalType = set.getInt(31);
				if ( set.wasNull() ) {
					anObject.regionalType = Integer.MIN_VALUE;
				}
				anObject.basisType = set.getBigDecimal(32);
				if(anObject.basisType != null) {
					anObject.basisType = anObject.basisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contragentPosition = set.getString(33);
				anObject.executeWorkDate = set.getDate(34);
				anObject.timeStart = set.getTimestamp(35);
				anObject.timeFinal = set.getTimestamp(36);
				anObject.contragentPhoneNumber = set.getString(37);
				anObject.executorPhoneNumber = set.getString(38);
				anObject.contragentObjectWork = set.getString(39);
				anObject.isNoPay = set.getInt(40);
				if ( set.wasNull() ) {
					anObject.isNoPay = Integer.MIN_VALUE;
				}
				anObject.isCustomerMaterials = set.getInt(41);
				if ( set.wasNull() ) {
					anObject.isCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.payDate = set.getDate(42);
				anObject.finPayFormCode = set.getInt(43);
				if ( set.wasNull() ) {
					anObject.finPayFormCode = Integer.MIN_VALUE;
				}
				anObject.finPayFormName = set.getString(44);
				anObject.partnerId = set.getInt(45);
				if ( set.wasNull() ) {
					anObject.partnerId = Integer.MIN_VALUE;
				}
				anObject.payDetail = set.getString(46);
				anObject.actTransferNumber = set.getString(47);
				anObject.actTransferDate = set.getDate(48);
				anObject.resposible = set.getString(49);
				anObject.resposiblePosition = set.getString(50);
				anObject.resposibleTabNumber = set.getString(51);
				anObject.prevContractStatus = set.getInt(52);
				if ( set.wasNull() ) {
					anObject.prevContractStatus = Integer.MIN_VALUE;
				}
				anObject.reconnectionTU = set.getInt(53);
				if ( set.wasNull() ) {
					anObject.reconnectionTU = Integer.MIN_VALUE;
				}
				anObject.personalAccountCode = set.getInt(54);
				if ( set.wasNull() ) {
					anObject.personalAccountCode = Integer.MIN_VALUE;
				}
				anObject.personalAccountNumber = set.getString(55);
				anObject.tabNumber = set.getString(56);
				anObject.citiesList = set.getString(57);
				anObject.lineLength = set.getBigDecimal(58);
				if(anObject.lineLength != null) {
					anObject.lineLength = anObject.lineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.projectCode = set.getString(59);
				anObject.cnPackCode = set.getInt(60);
				if ( set.wasNull() ) {
					anObject.cnPackCode = Integer.MIN_VALUE;
				}
				anObject.dfPackCode = set.getInt(61);
				if ( set.wasNull() ) {
					anObject.dfPackCode = Integer.MIN_VALUE;
				}
				anObject.countersZoneType = set.getInt(62);
				if ( set.wasNull() ) {
					anObject.countersZoneType = Integer.MIN_VALUE;
				}
				anObject.axPartnerCode = set.getString(63);
				anObject.axPartnerName = set.getString(64);
				anObject.axContractNumber = set.getString(65);
				anObject.axContractDate = set.getDate(66);
				anObject.axContractCode = set.getString(67);
				anObject.axContractId = set.getString(68);
				anObject.axContractCommentGen = set.getString(69);
				anObject.projAgreeSumma = set.getBigDecimal(70);
				if(anObject.projAgreeSumma != null) {
					anObject.projAgreeSumma = anObject.projAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.topographySumma = set.getBigDecimal(71);
				if(anObject.topographySumma != null) {
					anObject.topographySumma = anObject.topographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.createdFromSite = set.getInt(72);
				if ( set.wasNull() ) {
					anObject.createdFromSite = Integer.MIN_VALUE;
				}
				anObject.term = set.getInt(73);
				if ( set.wasNull() ) {
					anObject.term = Integer.MIN_VALUE;
				}
				anObject.regulation = set.getInt(74);
				if ( set.wasNull() ) {
					anObject.regulation = Integer.MIN_VALUE;
				}
				anObject.boundaryDateWork = set.getDate(75);
				anObject.countDayDelay = set.getInt(76);
				if ( set.wasNull() ) {
					anObject.countDayDelay = Integer.MIN_VALUE;
				}
				anObject.factDateWork = set.getDate(77);
				anObject.codeEIC = set.getString(78);
				anObject.personalAccountUid = set.getString(79);
				anObject.customerMailingAddress = set.getString(80);
				anObject.powerGeneration = set.getBigDecimal(81);
				if(anObject.powerGeneration != null) {
					anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.postCode = set.getString(82);
				anObject.customerEmail = set.getString(83);
				anObject.demographicCode = set.getString(84);
				anObject.ownershipRecordNumber = set.getString(85);
				anObject.realEstateRegNumber = set.getString(86);

				anObject.departmentCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(88);
				anObject.departmentDateStart = set.getDate(89);
				anObject.departmentDateFinal = set.getDate(90);
				anObject.departmentRenCode = set.getInt(91);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(92);
				anObject.departmentKau_table_id_1884 = set.getInt(93);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(94);
				anObject.departmentName_1884 = set.getString(95);
				anObject.departmentHrmorganizationid = set.getString(96);
				anObject.elementCode = set.getInt(97);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.contractStatusRefCode = set.getInt(98);
				if(set.wasNull()) {
					anObject.contractStatusRefCode = Integer.MIN_VALUE;
				}
				anObject.contractStatusRefName = set.getString(99);
				anObject.contractTypeRefCode = set.getInt(100);
				if(set.wasNull()) {
					anObject.contractTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.contractTypeRefName = set.getString(101);
				anObject.contragentTypeRefCode = set.getInt(102);
				if(set.wasNull()) {
					anObject.contragentTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.contragentTypeRefName = set.getString(103);
				anObject.billStatusRefCode = set.getInt(104);
				if(set.wasNull()) {
					anObject.billStatusRefCode = Integer.MIN_VALUE;
				}
				anObject.billStatusRefName = set.getString(105);
				anObject.warrantRefCode = set.getInt(106);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(107);
				anObject.warrantRefName = set.getString(108);
				anObject.warrantRefWarrantFIO = set.getString(109);
				anObject.warrantRefWarrantShortFIO = set.getString(110);
				anObject.warrantRefWarrantPosition = set.getString(111);
				anObject.warrantRefGenitiveFIO = set.getString(112);
				anObject.warrantRefGenitivePosition = set.getString(113);
				anObject.warrantRefPassport = set.getString(114);
				anObject.warrantRefAddress = set.getString(115);
				anObject.warrantRefPower = set.getInt(116);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(117);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.warrantRefDepartmentName = set.getString(118);
				anObject.warrantRefDepartmentNameGenitive = set.getString(119);
				anObject.statusRefCode = set.getInt(120);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(121);
				anObject.techConObjectsCode = set.getInt(122);
				if(set.wasNull()) {
					anObject.techConObjectsCode = Integer.MIN_VALUE;
				}
				anObject.techConObjectsNumberGen = set.getString(123);
				anObject.techConObjectsDateGen = set.getDate(124);
				anObject.techConObjectsCustomer = set.getString(125);
				anObject.techConObjectsBuilding = set.getString(126);
				anObject.techConObjectsAddress = set.getString(127);
				anObject.techConObjectsTyCurrentPower = set.getBigDecimal(128);
				if(anObject.techConObjectsTyCurrentPower != null) {
					anObject.techConObjectsTyCurrentPower = anObject.techConObjectsTyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsTyServicesPower = set.getBigDecimal(129);
				if(anObject.techConObjectsTyServicesPower != null) {
					anObject.techConObjectsTyServicesPower = anObject.techConObjectsTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsConnectionPowerPlaces = set.getString(130);
				anObject.techConObjectsConnectionPowerPlacesNum = set.getString(131);
				anObject.techConObjectsConnectionPowerPoint = set.getString(132);
				anObject.techConObjectsConnectionPowerPointNum = set.getString(133);
				anObject.techConObjectsConnectionSource = set.getString(134);
				anObject.techConObjectsConnectionSourceNum = set.getString(135);
				anObject.techConObjectsCat1CurrentPower = set.getBigDecimal(136);
				if(anObject.techConObjectsCat1CurrentPower != null) {
					anObject.techConObjectsCat1CurrentPower = anObject.techConObjectsCat1CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsCat2CurrentPower = set.getBigDecimal(137);
				if(anObject.techConObjectsCat2CurrentPower != null) {
					anObject.techConObjectsCat2CurrentPower = anObject.techConObjectsCat2CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsCat3CurrentPower = set.getBigDecimal(138);
				if(anObject.techConObjectsCat3CurrentPower != null) {
					anObject.techConObjectsCat3CurrentPower = anObject.techConObjectsCat3CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsCat1ServicesPower = set.getBigDecimal(139);
				if(anObject.techConObjectsCat1ServicesPower != null) {
					anObject.techConObjectsCat1ServicesPower = anObject.techConObjectsCat1ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsCat2ServicesPower = set.getBigDecimal(140);
				if(anObject.techConObjectsCat2ServicesPower != null) {
					anObject.techConObjectsCat2ServicesPower = anObject.techConObjectsCat2ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsCat3ServicesPower = set.getBigDecimal(141);
				if(anObject.techConObjectsCat3ServicesPower != null) {
					anObject.techConObjectsCat3ServicesPower = anObject.techConObjectsCat3ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsTyServicesPowerWaterHeating = set.getBigDecimal(142);
				if(anObject.techConObjectsTyServicesPowerWaterHeating != null) {
					anObject.techConObjectsTyServicesPowerWaterHeating = anObject.techConObjectsTyServicesPowerWaterHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsTyServicesPowerHeating = set.getBigDecimal(143);
				if(anObject.techConObjectsTyServicesPowerHeating != null) {
					anObject.techConObjectsTyServicesPowerHeating = anObject.techConObjectsTyServicesPowerHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsTyServicesPowerCooker = set.getBigDecimal(144);
				if(anObject.techConObjectsTyServicesPowerCooker != null) {
					anObject.techConObjectsTyServicesPowerCooker = anObject.techConObjectsTyServicesPowerCooker.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsPowerGeneration = set.getBigDecimal(145);
				if(anObject.techConObjectsPowerGeneration != null) {
					anObject.techConObjectsPowerGeneration = anObject.techConObjectsPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techConObjectsYearGen = set.getInt(146);
				if(set.wasNull()) {
					anObject.techConObjectsYearGen = Integer.MIN_VALUE;
				}
				anObject.techConObjectsPerformer = set.getString(147);
				anObject.techConObjectsPerformerPhone = set.getString(148);
				anObject.techConObjectsUserGen = set.getString(149);
				anObject.techConObjectsDateEdit = set.getDate(150);
anObject.contractKindRefCode = set.getInt(153);
				if(set.wasNull()) {
					anObject.contractKindRefCode = Integer.MIN_VALUE;
				}
				anObject.contractKindRefName = set.getString(154);
				anObject.cnSubsystemTypeRefCode = set.getInt(155);
				if(set.wasNull()) {
					anObject.cnSubsystemTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.cnSubsystemTypeRefName = set.getString(156);
				anObject.calcTypeRefCode = set.getInt(157);
				if(set.wasNull()) {
					anObject.calcTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.calcTypeRefName = set.getString(158);
				anObject.siteRefCode = set.getInt(159);
				if(set.wasNull()) {
					anObject.siteRefCode = Integer.MIN_VALUE;
				}
				anObject.siteRefName = set.getString(160);
				anObject.siteRefSiteaddress = set.getString(161);
				anObject.siteRefSitephone = set.getString(162);
				anObject.generalContractRefCode = set.getInt(163);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(164);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(165);
				anObject.generalContractRefContractNumber = set.getString(166);
				anObject.generalContractRefContractDate = set.getDate(167);
				anObject.generalContractRefCommentGen = set.getString(168);
				anObject.generalContractRefPartnerId = set.getInt(169);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(170);
				anObject.generalContractRefPartnerName = set.getString(171);
				anObject.generalContractRefContractRegDate = set.getDate(172);
				anObject.generalContractRefContractStartDate = set.getDate(173);
				anObject.generalContractRefContractEndDate = set.getDate(174);
				anObject.generalContractRefAxContractId = set.getString(175);
				anObject.generalContractRefAxContractCode = set.getString(176);
				anObject.generalContractRefAxContractNumber = set.getString(177);
				anObject.generalContractRefAxContractAccount = set.getString(178);
				anObject.generalContractRefAxContractDate = set.getDate(179);
				anObject.generalContractRefAxContractCommentGen = set.getString(180);
				anObject.generalContractRefAxContractGroupCode = set.getString(181);
				anObject.generalContractRefAxPartnerCode = set.getString(182);
				anObject.generalContractRefAxPartnerName = set.getString(183);
				anObject.generalContractRefUserGen = set.getString(184);
				anObject.actIncomeCreatMetodRefCode = set.getInt(185);
				if(set.wasNull()) {
					anObject.actIncomeCreatMetodRefCode = Integer.MIN_VALUE;
				}
				anObject.actIncomeCreatMetodRefName = set.getString(186);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public int[] getFilteredCodeArray(ENServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesObjectFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESOBJECT.CODE FROM ENSERVICESOBJECT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESOBJECT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENSERVICESOBJECT.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement,aBindObjects,number);
			}

			set = statement.executeQuery();
			int i;
			for(i = 0;set.next();i++) {
				/*if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}*/
				result.add(set.getInt(1));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = result.get(j);
			}
			return array;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	} // end of getFilteredCodeArray


	public ENServicesObject getObject(int uid) throws PersistenceException {
		ENServicesObject result = new ENServicesObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENServicesObject anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENServicesObject anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENServicesObject anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

        SegregationInfo segregationInfo = null;
        String segregationWhereStr = null;
        
        if (!noSegregation) {
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENServicesObject.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENSERVICESOBJECT.CODE, ENSERVICESOBJECT.CONTRACTNUMBER, ENSERVICESOBJECT.CONTRACTDATE, ENSERVICESOBJECT.NAME, ENSERVICESOBJECT.PARTNERCODE, ENSERVICESOBJECT.FINDOCCODE, ENSERVICESOBJECT.FINDOCID, ENSERVICESOBJECT.COMMENTGEN, ENSERVICESOBJECT.CONTRACTNUMBERSERVICES, ENSERVICESOBJECT.CONTRACTDATESERVICES, ENSERVICESOBJECT.CONTRAGENTNAME, ENSERVICESOBJECT.CONTRAGENTADDRESS, ENSERVICESOBJECT.CONTRAGENTADDRESSWORK, ENSERVICESOBJECT.CONTRAGENTOKPO, ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT, ENSERVICESOBJECT.CONTRAGENTBANKNAME, ENSERVICESOBJECT.CONTRAGENTBANKMFO, ENSERVICESOBJECT.CONTRAGENTBOSSNAME, ENSERVICESOBJECT.CONTRAGENTPASSPORT, ENSERVICESOBJECT.CONTRACTSERVICESSUMMA, ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT, ENSERVICESOBJECT.CONTRACTSERVICESPOWER, ENSERVICESOBJECT.COMMENTSERVICESGEN, ENSERVICESOBJECT.CONTRACTSERVICESDISTNC, ENSERVICESOBJECT.CONTRACTSERVICESDAY, ENSERVICESOBJECT.USERGEN, ENSERVICESOBJECT.DATEEDIT, ENSERVICESOBJECT.WARRANTDATE, ENSERVICESOBJECT.WARRANTNUMBER, ENSERVICESOBJECT.WARRANTFIO, ENSERVICESOBJECT.REGIONALTYPE, ENSERVICESOBJECT.BASISTYPE, ENSERVICESOBJECT.CONTRAGENTPOSITION, ENSERVICESOBJECT.EXECUTEWORKDATE, ENSERVICESOBJECT.TIMESTART, ENSERVICESOBJECT.TIMEFINAL, ENSERVICESOBJECT.CONTRAGENTPHONENUMBER, ENSERVICESOBJECT.EXECUTORPHONENUMBER, ENSERVICESOBJECT.CONTRAGENTOBJECTWORK, ENSERVICESOBJECT.ISNOPAY, ENSERVICESOBJECT.ISCUSTOMERMATERIALS, ENSERVICESOBJECT.PAYDATE, ENSERVICESOBJECT.FINPAYFORMCODE, ENSERVICESOBJECT.FINPAYFORMNAME, ENSERVICESOBJECT.PARTNERID, ENSERVICESOBJECT.PAYDETAIL, ENSERVICESOBJECT.ACTTRANSFERNUMBER, ENSERVICESOBJECT.ACTTRANSFERDATE, ENSERVICESOBJECT.RESPOSIBLE, ENSERVICESOBJECT.RESPOSIBLEPOSITION, ENSERVICESOBJECT.RESPOSIBLETABNUMBER, ENSERVICESOBJECT.PREVCONTRACTSTATUS, ENSERVICESOBJECT.RECONNECTIONTU, ENSERVICESOBJECT.PERSONALACCOUNTCODE, ENSERVICESOBJECT.PERSONALACCOUNTNUMBER, ENSERVICESOBJECT.TABNUMBER, ENSERVICESOBJECT.CITIESLIST, ENSERVICESOBJECT.LINELENGTH, ENSERVICESOBJECT.PROJECTCODE, ENSERVICESOBJECT.DOMAIN_INFO, ENSERVICESOBJECT.MODIFY_TIME, ENSERVICESOBJECT.CNPACKCODE, ENSERVICESOBJECT.DFPACKCODE, ENSERVICESOBJECT.COUNTERSZONETYPE, ENSERVICESOBJECT.AXPARTNERCODE, ENSERVICESOBJECT.AXPARTNERNAME, ENSERVICESOBJECT.AXCONTRACTNUMBER, ENSERVICESOBJECT.AXCONTRACTDATE, ENSERVICESOBJECT.AXCONTRACTCODE, ENSERVICESOBJECT.AXCONTRACTID, ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN, ENSERVICESOBJECT.PROJAGREESUMMA, ENSERVICESOBJECT.TOPOGRAPHYSUMMA, ENSERVICESOBJECT.CREATEDFROMSITE, ENSERVICESOBJECT.TERM, ENSERVICESOBJECT.REGULATION, ENSERVICESOBJECT.BOUNDARYDATEWORK, ENSERVICESOBJECT.COUNTDAYDELAY, ENSERVICESOBJECT.FACTDATEWORK, ENSERVICESOBJECT.CALCSUMSBYCALCULATIONS, ENSERVICESOBJECT.CODEEIC, ENSERVICESOBJECT.PERSONALACCOUNTUID, ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS, ENSERVICESOBJECT.POWERGENERATION, ENSERVICESOBJECT.POSTCODE, ENSERVICESOBJECT.CUSTOMEREMAIL, ENSERVICESOBJECT.DEMOGRAPHICCODE, ENSERVICESOBJECT.OWNERSHIPRECORDNUMBER, ENSERVICESOBJECT.REALESTATEREGNUMBER, ENSERVICESOBJECT.DEPARTMENTCODE, ENSERVICESOBJECT.ELEMENTCODE, ENSERVICESOBJECT.CONTRACTSTATUSREFCODE, ENSERVICESOBJECT.CONTRACTTYPEREFCODE, ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE, ENSERVICESOBJECT.BILLSTATUSREFCODE, ENSERVICESOBJECT.WARRANTREFCODE, ENSERVICESOBJECT.STATUSREFCODE, ENSERVICESOBJECT.TECHCONOBJECTSCODE, ENSERVICESOBJECT.CONTRACTKINDREFCODE, ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE, ENSERVICESOBJECT.CALCTYPEREFCODE, ENSERVICESOBJECT.SITEREFCODE, ENSERVICESOBJECT.GENERALCONTRACTREFCODE, ENSERVICESOBJECT.ACTINCOMECREATMETDRFCD "
			+" FROM ENSERVICESOBJECT WHERE ENSERVICESOBJECT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());
            if (segregationWhereStr.length() > 0) {
                selectStr = selectStr + " AND " + segregationWhereStr;
            }
        }

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.name = set.getString(4);
				anObject.partnerCode = set.getString(5);
				anObject.finDocCode = set.getString(6);
				anObject.finDocID = set.getInt(7);
				if (set.wasNull()) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(8);
				anObject.contractNumberServices = set.getString(9);
				anObject.contractDateServices = set.getDate(10);
				anObject.contragentName = set.getString(11);
				anObject.contragentAddress = set.getString(12);
				anObject.contragentAddressWork = set.getString(13);
				anObject.contragentOkpo = set.getString(14);
				anObject.contragentBankAccount = set.getString(15);
				anObject.contragentBankName = set.getString(16);
				anObject.contragentBankMfo = set.getString(17);
				anObject.contragentBossName = set.getString(18);
				anObject.contragentPassport = set.getString(19);
				anObject.contractServicesSumma = set.getBigDecimal(20);
				if(anObject.contractServicesSumma != null) {
					anObject.contractServicesSumma = anObject.contractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractServicesSummaVAT = set.getBigDecimal(21);
				if(anObject.contractServicesSummaVAT != null) {
					anObject.contractServicesSummaVAT = anObject.contractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractServicesPower = set.getBigDecimal(22);
				if(anObject.contractServicesPower != null) {
					anObject.contractServicesPower = anObject.contractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentServicesGen = set.getString(23);
				anObject.contractServicesDistance = set.getBigDecimal(24);
				if(anObject.contractServicesDistance != null) {
					anObject.contractServicesDistance = anObject.contractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractServicesDay = set.getBigDecimal(25);
				if(anObject.contractServicesDay != null) {
					anObject.contractServicesDay = anObject.contractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(26);
				anObject.dateEdit = set.getDate(27);
				anObject.warrantDate = set.getDate(28);
				anObject.warrantNumber = set.getString(29);
				anObject.warrantFIO = set.getString(30);
				anObject.regionalType = set.getInt(31);
				if (set.wasNull()) {
					anObject.regionalType = Integer.MIN_VALUE;
				}
				anObject.basisType = set.getBigDecimal(32);
				if(anObject.basisType != null) {
					anObject.basisType = anObject.basisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contragentPosition = set.getString(33);
				anObject.executeWorkDate = set.getDate(34);
				anObject.timeStart = set.getTimestamp(35);
				anObject.timeFinal = set.getTimestamp(36);
				anObject.contragentPhoneNumber = set.getString(37);
				anObject.executorPhoneNumber = set.getString(38);
				anObject.contragentObjectWork = set.getString(39);
				anObject.isNoPay = set.getInt(40);
				if (set.wasNull()) {
					anObject.isNoPay = Integer.MIN_VALUE;
				}
				anObject.isCustomerMaterials = set.getInt(41);
				if (set.wasNull()) {
					anObject.isCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.payDate = set.getDate(42);
				anObject.finPayFormCode = set.getInt(43);
				if (set.wasNull()) {
					anObject.finPayFormCode = Integer.MIN_VALUE;
				}
				anObject.finPayFormName = set.getString(44);
				anObject.partnerId = set.getInt(45);
				if (set.wasNull()) {
					anObject.partnerId = Integer.MIN_VALUE;
				}
				anObject.payDetail = set.getString(46);
				anObject.actTransferNumber = set.getString(47);
				anObject.actTransferDate = set.getDate(48);
				anObject.resposible = set.getString(49);
				anObject.resposiblePosition = set.getString(50);
				anObject.resposibleTabNumber = set.getString(51);
				anObject.prevContractStatus = set.getInt(52);
				if (set.wasNull()) {
					anObject.prevContractStatus = Integer.MIN_VALUE;
				}
				anObject.reconnectionTU = set.getInt(53);
				if (set.wasNull()) {
					anObject.reconnectionTU = Integer.MIN_VALUE;
				}
				anObject.personalAccountCode = set.getInt(54);
				if (set.wasNull()) {
					anObject.personalAccountCode = Integer.MIN_VALUE;
				}
				anObject.personalAccountNumber = set.getString(55);
				anObject.tabNumber = set.getString(56);
				anObject.citiesList = set.getString(57);
				anObject.lineLength = set.getBigDecimal(58);
				if(anObject.lineLength != null) {
					anObject.lineLength = anObject.lineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.projectCode = set.getString(59);
				anObject.domain_info = set.getString(60);
				anObject.modify_time = set.getLong(61);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.cnPackCode = set.getInt(62);
				if (set.wasNull()) {
					anObject.cnPackCode = Integer.MIN_VALUE;
				}
				anObject.dfPackCode = set.getInt(63);
				if (set.wasNull()) {
					anObject.dfPackCode = Integer.MIN_VALUE;
				}
				anObject.countersZoneType = set.getInt(64);
				if (set.wasNull()) {
					anObject.countersZoneType = Integer.MIN_VALUE;
				}
				anObject.axPartnerCode = set.getString(65);
				anObject.axPartnerName = set.getString(66);
				anObject.axContractNumber = set.getString(67);
				anObject.axContractDate = set.getDate(68);
				anObject.axContractCode = set.getString(69);
				anObject.axContractId = set.getString(70);
				anObject.axContractCommentGen = set.getString(71);
				anObject.projAgreeSumma = set.getBigDecimal(72);
				if(anObject.projAgreeSumma != null) {
					anObject.projAgreeSumma = anObject.projAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.topographySumma = set.getBigDecimal(73);
				if(anObject.topographySumma != null) {
					anObject.topographySumma = anObject.topographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.createdFromSite = set.getInt(74);
				if (set.wasNull()) {
					anObject.createdFromSite = Integer.MIN_VALUE;
				}
				anObject.term = set.getInt(75);
				if (set.wasNull()) {
					anObject.term = Integer.MIN_VALUE;
				}
				anObject.regulation = set.getInt(76);
				if (set.wasNull()) {
					anObject.regulation = Integer.MIN_VALUE;
				}
				anObject.boundaryDateWork = set.getDate(77);
				anObject.countDayDelay = set.getInt(78);
				if (set.wasNull()) {
					anObject.countDayDelay = Integer.MIN_VALUE;
				}
				anObject.factDateWork = set.getDate(79);
				anObject.calcSumsByCalculations = set.getBoolean(80);
				if (set.wasNull()) {
					anObject.calcSumsByCalculations = null;
				}
				anObject.codeEIC = set.getString(81);
				anObject.personalAccountUid = set.getString(82);
				anObject.customerMailingAddress = set.getString(83);
				anObject.powerGeneration = set.getBigDecimal(84);
				if(anObject.powerGeneration != null) {
					anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.postCode = set.getString(85);
				anObject.customerEmail = set.getString(86);
				anObject.demographicCode = set.getString(87);
				anObject.ownershipRecordNumber = set.getString(88);
				anObject.realEstateRegNumber = set.getString(89);
				anObject.department.code = set.getInt(90);
				if (set.wasNull()) {
					anObject.department.code = Integer.MIN_VALUE;
				}
				anObject.element.code = set.getInt(91);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.contractStatusRef.code = set.getInt(92);
				if (set.wasNull()) {
					anObject.contractStatusRef.code = Integer.MIN_VALUE;
				}
				anObject.contractTypeRef.code = set.getInt(93);
				if (set.wasNull()) {
					anObject.contractTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.contragentTypeRef.code = set.getInt(94);
				if (set.wasNull()) {
					anObject.contragentTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.billStatusRef.code = set.getInt(95);
				if (set.wasNull()) {
					anObject.billStatusRef.code = Integer.MIN_VALUE;
				}
				anObject.warrantRef.code = set.getInt(96);
				if (set.wasNull()) {
					anObject.warrantRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(97);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.techConObjects.code = set.getInt(98);
				if (set.wasNull()) {
					anObject.techConObjects.code = Integer.MIN_VALUE;
				}
				anObject.contractKindRef.code = set.getInt(99);
				if (set.wasNull()) {
					anObject.contractKindRef.code = Integer.MIN_VALUE;
				}
				anObject.cnSubsystemTypeRef.code = set.getInt(100);
				if (set.wasNull()) {
					anObject.cnSubsystemTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.calcTypeRef.code = set.getInt(101);
				if (set.wasNull()) {
					anObject.calcTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.siteRef.code = set.getInt(102);
				if (set.wasNull()) {
					anObject.siteRef.code = Integer.MIN_VALUE;
				}
				anObject.generalContractRef.code = set.getInt(103);
				if (set.wasNull()) {
					anObject.generalContractRef.code = Integer.MIN_VALUE;
				}
				anObject.actIncomeCreatMetodRef.code = set.getInt(104);
				if (set.wasNull()) {
					anObject.actIncomeCreatMetodRef.code = Integer.MIN_VALUE;
				}
				if(anObject.department.code != Integer.MIN_VALUE) {
					anObject.setDepartment(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
				}
				if(anObject.techConObjects.code != Integer.MIN_VALUE) {
					anObject.setTechConObjects(
						new com.ksoe.energynet.dataminer.generated.ENTechConditionsObjectsDAOGen(connection,getUserProfile()).getObject(anObject.techConObjects.code));
				}
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if(set != null) set.close(); if (statement != null) statement.close();}
			catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}


	public com.ksoe.energynet.valueobject.references.ENServicesObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesObjectRef ref = new com.ksoe.energynet.valueobject.references.ENServicesObjectRef();
		if(exists(anObjectCode)) {
			ref.code = anObjectCode;
		} else {
			ref.code = Integer.MIN_VALUE;
		}
		return ref;
	}

	public void remove(int uid) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();

		selectStr = "DELETE FROM  ENSERVICESOBJECT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesObject.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject.remove%} access denied");
		}
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,uid);
			statement.execute();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public long count(ENServicesObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESOBJECT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENSERVICESOBJECT.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
		}

		whereStr = BaseDAOUtils.addToCondition(buildCondition(filter), whereStr);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}
		
		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
			}

			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return null;
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}		
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM ENSERVICESOBJECT WHERE code = ?", propertyName);
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, code);
			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return defaultValue;
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - " + sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			try{if(connection != null && !connection.isClosed())connection.close();} catch(SQLException e){}
		}
	}
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESOBJECT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENServicesObject.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENSERVICESOBJECT.DOMAIN_INFO IS NOT NULL) ";
			} else {
				whereStr = " "+whereStr;
			}		
		}

		whereStr += buildCondition(filter);

		if(whereStr.length() != 0) {
			sql += " WHERE " + whereStr;
		}
		
		if(filter.getOrderBySQL() != null && filter.getOrderBySQL().trim().length() > 0) {
			sql += " ORDER BY " + filter.getOrderBySQL();
		}
		
		sql += " OFFSET " + fromPosition;
		
		if(quantity > -1) {
			sql += " LIMIT " + quantity;
		}
		
		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,new Vector<Object>(bindObjects),number);
			}

			set = statement.executeQuery();
			while(set.next()) {
				out.add((E)set.getObject(1));
			}
			return out;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
		}		
	}

	public boolean exists(int anObjectCode) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(anObjectCode == Integer.MIN_VALUE) {
			return false;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENSERVICESOBJECT.CODE FROM  ENSERVICESOBJECT WHERE  ENSERVICESOBJECT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESOBJECT",segregationInfo,getUserProfile().getDomainInfo());
		if(segregationWhereStr.length() > 0) {
			selectStr = selectStr +
				" AND " + segregationWhereStr;
		}
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObjectCode);
			set = statement.executeQuery();
			if(set.next()) {
				return true;
			}
			return false;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public static String processCondition(String aCondition) {
		if(aCondition == null || aCondition.length() == 0) {
			return "";
		}

		StringBuffer condition = new StringBuffer(aCondition);
		_checkConditionToken(condition,";"," ");
		_checkConditionToken(condition,"--"," ");
		_checkConditionToken(condition,"\r"," ");
		_checkConditionToken(condition,"\n"," ");
		_checkConditionToken(condition,"||"," OR ");
		_checkConditionToken(condition,"&&"," AND ");
		_checkConditionToken(condition,"==","=");
		_checkConditionToken(condition,"!=","<>");
		_checkConditionToken(condition,"code","ENSERVICESOBJECT.CODE");
		_checkConditionToken(condition,"contractnumber","ENSERVICESOBJECT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENSERVICESOBJECT.CONTRACTDATE");
		_checkConditionToken(condition,"name","ENSERVICESOBJECT.NAME");
		_checkConditionToken(condition,"partnercode","ENSERVICESOBJECT.PARTNERCODE");
		_checkConditionToken(condition,"findoccode","ENSERVICESOBJECT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENSERVICESOBJECT.FINDOCID");
		_checkConditionToken(condition,"commentgen","ENSERVICESOBJECT.COMMENTGEN");
		_checkConditionToken(condition,"contractnumberservices","ENSERVICESOBJECT.CONTRACTNUMBERSERVICES");
		_checkConditionToken(condition,"contractdateservices","ENSERVICESOBJECT.CONTRACTDATESERVICES");
		_checkConditionToken(condition,"contragentname","ENSERVICESOBJECT.CONTRAGENTNAME");
		_checkConditionToken(condition,"contragentaddress","ENSERVICESOBJECT.CONTRAGENTADDRESS");
		_checkConditionToken(condition,"contragentaddresswork","ENSERVICESOBJECT.CONTRAGENTADDRESSWORK");
		_checkConditionToken(condition,"contragentokpo","ENSERVICESOBJECT.CONTRAGENTOKPO");
		_checkConditionToken(condition,"contragentbankaccount","ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT");
		_checkConditionToken(condition,"contragentbankname","ENSERVICESOBJECT.CONTRAGENTBANKNAME");
		_checkConditionToken(condition,"contragentbankmfo","ENSERVICESOBJECT.CONTRAGENTBANKMFO");
		_checkConditionToken(condition,"contragentbossname","ENSERVICESOBJECT.CONTRAGENTBOSSNAME");
		_checkConditionToken(condition,"contragentpassport","ENSERVICESOBJECT.CONTRAGENTPASSPORT");
		_checkConditionToken(condition,"contractservicessumma","ENSERVICESOBJECT.CONTRACTSERVICESSUMMA");
		_checkConditionToken(condition,"contractservicessummavat","ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT");
		_checkConditionToken(condition,"contractservicespower","ENSERVICESOBJECT.CONTRACTSERVICESPOWER");
		_checkConditionToken(condition,"commentservicesgen","ENSERVICESOBJECT.COMMENTSERVICESGEN");
		_checkConditionToken(condition,"contractservicesdistance","ENSERVICESOBJECT.CONTRACTSERVICESDISTNC");
		_checkConditionToken(condition,"contractservicesday","ENSERVICESOBJECT.CONTRACTSERVICESDAY");
		_checkConditionToken(condition,"usergen","ENSERVICESOBJECT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENSERVICESOBJECT.DATEEDIT");
		_checkConditionToken(condition,"warrantdate","ENSERVICESOBJECT.WARRANTDATE");
		_checkConditionToken(condition,"warrantnumber","ENSERVICESOBJECT.WARRANTNUMBER");
		_checkConditionToken(condition,"warrantfio","ENSERVICESOBJECT.WARRANTFIO");
		_checkConditionToken(condition,"regionaltype","ENSERVICESOBJECT.REGIONALTYPE");
		_checkConditionToken(condition,"basistype","ENSERVICESOBJECT.BASISTYPE");
		_checkConditionToken(condition,"contragentposition","ENSERVICESOBJECT.CONTRAGENTPOSITION");
		_checkConditionToken(condition,"executeworkdate","ENSERVICESOBJECT.EXECUTEWORKDATE");
		_checkConditionToken(condition,"timestart","ENSERVICESOBJECT.TIMESTART");
		_checkConditionToken(condition,"timefinal","ENSERVICESOBJECT.TIMEFINAL");
		_checkConditionToken(condition,"contragentphonenumber","ENSERVICESOBJECT.CONTRAGENTPHONENUMBER");
		_checkConditionToken(condition,"executorphonenumber","ENSERVICESOBJECT.EXECUTORPHONENUMBER");
		_checkConditionToken(condition,"contragentobjectwork","ENSERVICESOBJECT.CONTRAGENTOBJECTWORK");
		_checkConditionToken(condition,"isnopay","ENSERVICESOBJECT.ISNOPAY");
		_checkConditionToken(condition,"iscustomermaterials","ENSERVICESOBJECT.ISCUSTOMERMATERIALS");
		_checkConditionToken(condition,"paydate","ENSERVICESOBJECT.PAYDATE");
		_checkConditionToken(condition,"finpayformcode","ENSERVICESOBJECT.FINPAYFORMCODE");
		_checkConditionToken(condition,"finpayformname","ENSERVICESOBJECT.FINPAYFORMNAME");
		_checkConditionToken(condition,"partnerid","ENSERVICESOBJECT.PARTNERID");
		_checkConditionToken(condition,"paydetail","ENSERVICESOBJECT.PAYDETAIL");
		_checkConditionToken(condition,"acttransfernumber","ENSERVICESOBJECT.ACTTRANSFERNUMBER");
		_checkConditionToken(condition,"acttransferdate","ENSERVICESOBJECT.ACTTRANSFERDATE");
		_checkConditionToken(condition,"resposible","ENSERVICESOBJECT.RESPOSIBLE");
		_checkConditionToken(condition,"resposibleposition","ENSERVICESOBJECT.RESPOSIBLEPOSITION");
		_checkConditionToken(condition,"resposibletabnumber","ENSERVICESOBJECT.RESPOSIBLETABNUMBER");
		_checkConditionToken(condition,"prevcontractstatus","ENSERVICESOBJECT.PREVCONTRACTSTATUS");
		_checkConditionToken(condition,"reconnectiontu","ENSERVICESOBJECT.RECONNECTIONTU");
		_checkConditionToken(condition,"personalaccountcode","ENSERVICESOBJECT.PERSONALACCOUNTCODE");
		_checkConditionToken(condition,"personalaccountnumber","ENSERVICESOBJECT.PERSONALACCOUNTNUMBER");
		_checkConditionToken(condition,"tabnumber","ENSERVICESOBJECT.TABNUMBER");
		_checkConditionToken(condition,"citieslist","ENSERVICESOBJECT.CITIESLIST");
		_checkConditionToken(condition,"linelength","ENSERVICESOBJECT.LINELENGTH");
		_checkConditionToken(condition,"projectcode","ENSERVICESOBJECT.PROJECTCODE");
		_checkConditionToken(condition,"domain_info","ENSERVICESOBJECT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENSERVICESOBJECT.MODIFY_TIME");
		_checkConditionToken(condition,"cnpackcode","ENSERVICESOBJECT.CNPACKCODE");
		_checkConditionToken(condition,"dfpackcode","ENSERVICESOBJECT.DFPACKCODE");
		_checkConditionToken(condition,"counterszonetype","ENSERVICESOBJECT.COUNTERSZONETYPE");
		_checkConditionToken(condition,"axpartnercode","ENSERVICESOBJECT.AXPARTNERCODE");
		_checkConditionToken(condition,"axpartnername","ENSERVICESOBJECT.AXPARTNERNAME");
		_checkConditionToken(condition,"axcontractnumber","ENSERVICESOBJECT.AXCONTRACTNUMBER");
		_checkConditionToken(condition,"axcontractdate","ENSERVICESOBJECT.AXCONTRACTDATE");
		_checkConditionToken(condition,"axcontractcode","ENSERVICESOBJECT.AXCONTRACTCODE");
		_checkConditionToken(condition,"axcontractid","ENSERVICESOBJECT.AXCONTRACTID");
		_checkConditionToken(condition,"axcontractcommentgen","ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN");
		_checkConditionToken(condition,"projagreesumma","ENSERVICESOBJECT.PROJAGREESUMMA");
		_checkConditionToken(condition,"topographysumma","ENSERVICESOBJECT.TOPOGRAPHYSUMMA");
		_checkConditionToken(condition,"createdfromsite","ENSERVICESOBJECT.CREATEDFROMSITE");
		_checkConditionToken(condition,"term","ENSERVICESOBJECT.TERM");
		_checkConditionToken(condition,"regulation","ENSERVICESOBJECT.REGULATION");
		_checkConditionToken(condition,"boundarydatework","ENSERVICESOBJECT.BOUNDARYDATEWORK");
		_checkConditionToken(condition,"countdaydelay","ENSERVICESOBJECT.COUNTDAYDELAY");
		_checkConditionToken(condition,"factdatework","ENSERVICESOBJECT.FACTDATEWORK");
		_checkConditionToken(condition,"calcsumsbycalculations","ENSERVICESOBJECT.CALCSUMSBYCALCULATIONS");
		_checkConditionToken(condition,"codeeic","ENSERVICESOBJECT.CODEEIC");
		_checkConditionToken(condition,"personalaccountuid","ENSERVICESOBJECT.PERSONALACCOUNTUID");
		_checkConditionToken(condition,"customermailingaddress","ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS");
		_checkConditionToken(condition,"powergeneration","ENSERVICESOBJECT.POWERGENERATION");
		_checkConditionToken(condition,"postcode","ENSERVICESOBJECT.POSTCODE");
		_checkConditionToken(condition,"customeremail","ENSERVICESOBJECT.CUSTOMEREMAIL");
		_checkConditionToken(condition,"demographiccode","ENSERVICESOBJECT.DEMOGRAPHICCODE");
		_checkConditionToken(condition,"ownershiprecordnumber","ENSERVICESOBJECT.OWNERSHIPRECORDNUMBER");
		_checkConditionToken(condition,"realestateregnumber","ENSERVICESOBJECT.REALESTATEREGNUMBER");
		// relationship conditions
		_checkConditionToken(condition,"department","DEPARTMENTCODE");
		_checkConditionToken(condition,"department.code","DEPARTMENTCODE");
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"contractstatusref","CONTRACTSTATUSREFCODE");
		_checkConditionToken(condition,"contractstatusref.code","CONTRACTSTATUSREFCODE");
		_checkConditionToken(condition,"contracttyperef","CONTRACTTYPEREFCODE");
		_checkConditionToken(condition,"contracttyperef.code","CONTRACTTYPEREFCODE");
		_checkConditionToken(condition,"contragenttyperef","CONTRAGENTTYPEREFCODE");
		_checkConditionToken(condition,"contragenttyperef.code","CONTRAGENTTYPEREFCODE");
		_checkConditionToken(condition,"billstatusref","BILLSTATUSREFCODE");
		_checkConditionToken(condition,"billstatusref.code","BILLSTATUSREFCODE");
		_checkConditionToken(condition,"warrantref","WARRANTREFCODE");
		_checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"techconobjects","TECHCONOBJECTSCODE");
		_checkConditionToken(condition,"techconobjects.code","TECHCONOBJECTSCODE");
		_checkConditionToken(condition,"contractkindref","CONTRACTKINDREFCODE");
		_checkConditionToken(condition,"contractkindref.code","CONTRACTKINDREFCODE");
		_checkConditionToken(condition,"cnsubsystemtyperef","CNSUBSYSTEMTYPEREFCODE");
		_checkConditionToken(condition,"cnsubsystemtyperef.code","CNSUBSYSTEMTYPEREFCODE");
		_checkConditionToken(condition,"calctyperef","CALCTYPEREFCODE");
		_checkConditionToken(condition,"calctyperef.code","CALCTYPEREFCODE");
		_checkConditionToken(condition,"siteref","SITEREFCODE");
		_checkConditionToken(condition,"siteref.code","SITEREFCODE");
		_checkConditionToken(condition,"generalcontractref","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"generalcontractref.code","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"actincomecreatmetodref","ACTINCOMECREATMETDRFCD");
		_checkConditionToken(condition,"actincomecreatmetodref.code","ACTINCOMECREATMETDRFCD");
		return condition.toString();
	}

	public Connection getConnection() {
		try {
			if(super.getConnection() != null && !super.getConnection().isClosed())
			return super.getConnection();

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			return dataSource.getConnection();
		}
		catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
		catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
	}

	///////////// PRIVATE SECTION ///////////////
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();
	
	private void _collectAutoIncrementFields(ENServicesObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESOBJECT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESOBJECT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesObjectDAO
