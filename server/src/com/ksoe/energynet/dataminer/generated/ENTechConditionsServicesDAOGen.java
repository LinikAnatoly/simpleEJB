
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.brief.ENTechConditionsServicesShort;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsServicesShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTechConditionsServices;
 *
 */

public class ENTechConditionsServicesDAOGen extends GenericDataMiner {

	public ENTechConditionsServicesDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTechConditionsServicesDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTechConditionsServices inObject) throws PersistenceException {
		ENTechConditionsServices obj = new ENTechConditionsServices();
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

		if(inObject.finContractNumber == null && obj.finContractNumber == null){}
		else
			if(inObject.finContractNumber == null || obj.finContractNumber == null) return false;
			else
				if ( ! inObject.finContractNumber.equals(obj.finContractNumber)){
					return false;
				}

		if(inObject.finContractDate == null && obj.finContractDate == null){} else
			if(inObject.finContractDate == null || obj.finContractDate == null) return false;
			else
				if (inObject.finContractDate.compareTo(obj.finContractDate) != 0){
					return false;
				}

		if(inObject.partnerName == null && obj.partnerName == null){}
		else
			if(inObject.partnerName == null || obj.partnerName == null) return false;
			else
				if ( ! inObject.partnerName.equals(obj.partnerName)){
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

		if(inObject.finCommentGen == null && obj.finCommentGen == null){}
		else
			if(inObject.finCommentGen == null || obj.finCommentGen == null) return false;
			else
				if ( ! inObject.finCommentGen.equals(obj.finCommentGen)){
					return false;
				}

		if(inObject.tySummaGen == null && obj.tySummaGen == null){}
		else
			if(inObject.tySummaGen == null || obj.tySummaGen == null) return false;
			else
				if ( ! inObject.tySummaGen.equals(obj.tySummaGen)){
					return false;
				}

		if(inObject.tySummaVat == null && obj.tySummaVat == null){}
		else
			if(inObject.tySummaVat == null || obj.tySummaVat == null) return false;
			else
				if ( ! inObject.tySummaVat.equals(obj.tySummaVat)){
					return false;
				}

		if(inObject.tyServicesSumma == null && obj.tyServicesSumma == null){}
		else
			if(inObject.tyServicesSumma == null || obj.tyServicesSumma == null) return false;
			else
				if ( ! inObject.tyServicesSumma.equals(obj.tyServicesSumma)){
					return false;
				}

		if(inObject.tyServicesPower == null && obj.tyServicesPower == null){}
		else
			if(inObject.tyServicesPower == null || obj.tyServicesPower == null) return false;
			else
				if ( ! inObject.tyServicesPower.equals(obj.tyServicesPower)){
					return false;
				}

		if(inObject.commentServicesGen == null && obj.commentServicesGen == null){}
		else
			if(inObject.commentServicesGen == null || obj.commentServicesGen == null) return false;
			else
				if ( ! inObject.commentServicesGen.equals(obj.commentServicesGen)){
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

		if (inObject.cnPackCode != obj.cnPackCode){
					return false;
				}

		if(inObject.executionTerm == null && obj.executionTerm == null){}
		else
			if(inObject.executionTerm == null || obj.executionTerm == null) return false;
			else
				if ( ! inObject.executionTerm.equals(obj.executionTerm)){
					return false;
				}

		if (inObject.buildersArea != obj.buildersArea){
					return false;
				}

		if (inObject.baseStation != obj.baseStation){
					return false;
				}

		if (inObject.smallArchFrm != obj.smallArchFrm){
					return false;
				}

		if(inObject.contractDateFinal == null && obj.contractDateFinal == null){} else
			if(inObject.contractDateFinal == null || obj.contractDateFinal == null) return false;
			else
				if (inObject.contractDateFinal.compareTo(obj.contractDateFinal) != 0){
					return false;
				}

		if (inObject.isSea != obj.isSea){
					return false;
				}

		if (inObject.isDisconnectionNeeded != obj.isDisconnectionNeeded){
					return false;
				}

		if (inObject.isUse2Tariffs != obj.isUse2Tariffs){
					return false;
				}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.department.code != obj.department.code){
			return false;
		}
		if (inObject.warrantRef.code != obj.warrantRef.code){
			return false;
		}
		if (inObject.techCondServicesStatus.code != obj.techCondServicesStatus.code){
			return false;
		}
		if (inObject.techCondServicesType.code != obj.techCondServicesType.code){
			return false;
		}
		if (inObject.contragentForm.code != obj.contragentForm.code){
			return false;
		}
		if (inObject.techCondResponsiblesRef.code != obj.techCondResponsiblesRef.code){
			return false;
		}
		if (inObject.cnSubsystemTypeRef.code != obj.cnSubsystemTypeRef.code){
			return false;
		}
		if (inObject.contragentTypeRef.code != obj.contragentTypeRef.code){
			return false;
		}
		if (inObject.connectionKindRef.code != obj.connectionKindRef.code){
			return false;
		}
		if (inObject.tariffEntryRef.code != obj.tariffEntryRef.code){
			return false;
		}
		if (inObject.calcTypeRef.code != obj.calcTypeRef.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		if (inObject.airLine04Ref.code != obj.airLine04Ref.code){
			return false;
		}
		if (inObject.cableLine04Ref.code != obj.cableLine04Ref.code){
			return false;
		}
		if (inObject.trRef.code != obj.trRef.code){
			return false;
		}
		if (inObject.s04Ref.code != obj.s04Ref.code){
			return false;
		}
		if (inObject.airLine10Ref.code != obj.airLine10Ref.code){
			return false;
		}
		if (inObject.cableLine10Ref.code != obj.cableLine10Ref.code){
			return false;
		}
		if (inObject.s35Ref.code != obj.s35Ref.code){
			return false;
		}
		if (inObject.airLine150Ref.code != obj.airLine150Ref.code){
			return false;
		}
		if (inObject.cableLine150Ref.code != obj.cableLine150Ref.code){
			return false;
		}
		if (inObject.s150Ref.code != obj.s150Ref.code){
			return false;
		}
		return true;
	}

	public int add(ENTechConditionsServices anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTechConditionsServices anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENTECHCONDITIONSSERVCS (CODE,CONTRACTNUMBER,CONTRACTDATE,FINCONTRACTNUMBER,FINCONTRACTDATE,PARTNERNAME,PARTNERCODE,FINDOCCODE,FINDOCID,FINCOMMENTGEN,TYSUMMAGEN,TYSUMMAVAT,TYSERVICESSUMMA,TYSERVICESPOWER,COMMENTSERVICESGEN,USERGEN,DATEEDIT,CNPACKCODE,EXECUTIONTERM,BUILDERSAREA,BASESTATION,SMALLARCHFRM,CONTRACTDATEFINAL,ISSEA,ISDISCONNECTIONNEEDED,ISUSE2TARIFFS,DOMAIN_INFO,MODIFY_TIME,ELEMENTCODE,DEPARTMENTCODE,WARRANTREFCODE,TECHCONDSERVICESSTTSCD,TECHCONDSERVICESTYPECD,CONTRAGENTFORMCODE,TECHCONDRESPONSBLSRFCD,CNSUBSYSTEMTYPEREFCODE,CONTRAGENTTYPEREFCODE,CONNECTIONKINDREFCODE,TARIFFENTRYREFCODE,CALCTYPEREFCODE,GENERALCONTRACTREFCODE,AIRLINE04REFCODE,CABLELINE04REFCODE,TRREFCODE,S04REFCODE,AIRLINE10REFCODE,CABLELINE10REFCODE,S35REFCODE,AIRLINE150REFCODE,CABLELINE150REFCODE,S150REFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(3,null);
			} else {
				statement.setDate(3,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(4,anObject.finContractNumber);
			if (anObject.finContractDate == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.finContractDate.getTime()));
			}
			statement.setString(6,anObject.partnerName);
			statement.setString(7,anObject.partnerCode);
			statement.setString(8,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(9,anObject.finDocID);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			statement.setString(10,anObject.finCommentGen);
			if (anObject.tySummaGen != null) {
				anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11,anObject.tySummaGen);
			if (anObject.tySummaVat != null) {
				anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12,anObject.tySummaVat);
			if (anObject.tyServicesSumma != null) {
				anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13,anObject.tyServicesSumma);
			if (anObject.tyServicesPower != null) {
				anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.tyServicesPower);
			statement.setString(15,anObject.commentServicesGen);
			statement.setString(16,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(17,null);
			} else {
				statement.setDate(17,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.cnPackCode != Integer.MIN_VALUE ) {
				statement.setInt(18,anObject.cnPackCode);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			statement.setString(19,anObject.executionTerm);
			if (anObject.buildersArea != Integer.MIN_VALUE ) {
				statement.setInt(20,anObject.buildersArea);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}
			if (anObject.baseStation != Integer.MIN_VALUE ) {
				statement.setInt(21,anObject.baseStation);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.smallArchFrm != Integer.MIN_VALUE ) {
				statement.setInt(22,anObject.smallArchFrm);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}
			if (anObject.contractDateFinal == null) {
				statement.setDate(23,null);
			} else {
				statement.setDate(23,new java.sql.Date(anObject.contractDateFinal.getTime()));
			}
			if (anObject.isSea != Integer.MIN_VALUE ) {
				statement.setInt(24,anObject.isSea);
			} else {
				statement.setNull(24,java.sql.Types.INTEGER);
			}
			if (anObject.isDisconnectionNeeded != Integer.MIN_VALUE ) {
				statement.setInt(25,anObject.isDisconnectionNeeded);
			} else {
				statement.setNull(25,java.sql.Types.INTEGER);
			}
			if (anObject.isUse2Tariffs != Integer.MIN_VALUE ) {
				statement.setInt(26,anObject.isUse2Tariffs);
			} else {
				statement.setNull(26,java.sql.Types.INTEGER);
			}
			statement.setString(27,anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(28,null);
			} else {
				statement.setBigDecimal(28,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.element.code%} = {%"+anObject.element.code+"%}");
				}
				statement.setInt(29,anObject.element.code);
			} else {
				statement.setNull(29,java.sql.Types.INTEGER);
			}
			if (anObject.department.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.department.code%} = {%"+anObject.department.code+"%}");
				}
				statement.setInt(30,anObject.department.code);
			} else {
				statement.setNull(30,java.sql.Types.INTEGER);
			}
			if (anObject.warrantRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.warrantRef.code%} = {%"+anObject.warrantRef.code+"%}");
				}
				statement.setInt(31,anObject.warrantRef.code);
			} else {
				statement.setNull(31,java.sql.Types.INTEGER);
			}
			if (anObject.techCondServicesStatus.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesStatusDAOGen(connection,getUserProfile()).exists(anObject.techCondServicesStatus.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.techCondServicesStatus.code%} = {%"+anObject.techCondServicesStatus.code+"%}");
				}
				statement.setInt(32,anObject.techCondServicesStatus.code);
			} else {
				statement.setNull(32,java.sql.Types.INTEGER);
			}
			if (anObject.techCondServicesType.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesTypeDAOGen(connection,getUserProfile()).exists(anObject.techCondServicesType.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.techCondServicesType.code%} = {%"+anObject.techCondServicesType.code+"%}");
				}
				statement.setInt(33,anObject.techCondServicesType.code);
			} else {
				statement.setNull(33,java.sql.Types.INTEGER);
			}
			if (anObject.contragentForm.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENTechContragentFormDAOGen(connection,getUserProfile()).exists(anObject.contragentForm.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.contragentForm.code%} = {%"+anObject.contragentForm.code+"%}");
				}
				statement.setInt(34,anObject.contragentForm.code);
			} else {
				statement.setNull(34,java.sql.Types.INTEGER);
			}
			if (anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENTechCondResponsiblesDAOGen(connection,getUserProfile()).exists(anObject.techCondResponsiblesRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.techCondResponsiblesRef.code%} = {%"+anObject.techCondResponsiblesRef.code+"%}");
				}
				statement.setInt(35,anObject.techCondResponsiblesRef.code);
			} else {
				statement.setNull(35,java.sql.Types.INTEGER);
			}
			if (anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.cnSubsystemTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.cnSubsystemTypeRef.code%} = {%"+anObject.cnSubsystemTypeRef.code+"%}");
				}
				statement.setInt(36,anObject.cnSubsystemTypeRef.code);
			} else {
				statement.setNull(36,java.sql.Types.INTEGER);
			}
			if (anObject.contragentTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENTechContragentTypeDAOGen(connection,getUserProfile()).exists(anObject.contragentTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.contragentTypeRef.code%} = {%"+anObject.contragentTypeRef.code+"%}");
				}
				statement.setInt(37,anObject.contragentTypeRef.code);
			} else {
				statement.setNull(37,java.sql.Types.INTEGER);
			}
			if (anObject.connectionKindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionKindDAOGen(connection,getUserProfile()).exists(anObject.connectionKindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.connectionKindRef.code%} = {%"+anObject.connectionKindRef.code+"%}");
				}
				statement.setInt(38,anObject.connectionKindRef.code);
			} else {
				statement.setNull(38,java.sql.Types.INTEGER);
			}
			if (anObject.tariffEntryRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).exists(anObject.tariffEntryRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.tariffEntryRef.code%} = {%"+anObject.tariffEntryRef.code+"%}");
				}
				statement.setInt(39,anObject.tariffEntryRef.code);
			} else {
				statement.setNull(39,java.sql.Types.INTEGER);
			}
			if (anObject.calcTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionCalcTypeDAOGen(connection,getUserProfile()).exists(anObject.calcTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.calcTypeRef.code%} = {%"+anObject.calcTypeRef.code+"%}");
				}
				statement.setInt(40,anObject.calcTypeRef.code);
			} else {
				statement.setNull(40,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(41,anObject.generalContractRef.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}
			if (anObject.airLine04Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENLine04DAOGen(connection,getUserProfile()).exists(anObject.airLine04Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.airLine04Ref.code%} = {%"+anObject.airLine04Ref.code+"%}");
				}
				statement.setInt(42,anObject.airLine04Ref.code);
			} else {
				statement.setNull(42,java.sql.Types.INTEGER);
			}
			if (anObject.cableLine04Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).exists(anObject.cableLine04Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.cableLine04Ref.code%} = {%"+anObject.cableLine04Ref.code+"%}");
				}
				statement.setInt(43,anObject.cableLine04Ref.code);
			} else {
				statement.setNull(43,java.sql.Types.INTEGER);
			}
			if (anObject.trRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENTransformerDAOGen(connection,getUserProfile()).exists(anObject.trRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.trRef.code%} = {%"+anObject.trRef.code+"%}");
				}
				statement.setInt(44,anObject.trRef.code);
			} else {
				statement.setNull(44,java.sql.Types.INTEGER);
			}
			if (anObject.s04Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENSubstation04DAOGen(connection,getUserProfile()).exists(anObject.s04Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.s04Ref.code%} = {%"+anObject.s04Ref.code+"%}");
				}
				statement.setInt(45,anObject.s04Ref.code);
			} else {
				statement.setNull(45,java.sql.Types.INTEGER);
			}
			if (anObject.airLine10Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENLine10DAOGen(connection,getUserProfile()).exists(anObject.airLine10Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.airLine10Ref.code%} = {%"+anObject.airLine10Ref.code+"%}");
				}
				statement.setInt(46,anObject.airLine10Ref.code);
			} else {
				statement.setNull(46,java.sql.Types.INTEGER);
			}
			if (anObject.cableLine10Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).exists(anObject.cableLine10Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.cableLine10Ref.code%} = {%"+anObject.cableLine10Ref.code+"%}");
				}
				statement.setInt(47,anObject.cableLine10Ref.code);
			} else {
				statement.setNull(47,java.sql.Types.INTEGER);
			}
			if (anObject.s35Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).exists(anObject.s35Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.s35Ref.code%} = {%"+anObject.s35Ref.code+"%}");
				}
				statement.setInt(48,anObject.s35Ref.code);
			} else {
				statement.setNull(48,java.sql.Types.INTEGER);
			}
			if (anObject.airLine150Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENLine150DAOGen(connection,getUserProfile()).exists(anObject.airLine150Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.airLine150Ref.code%} = {%"+anObject.airLine150Ref.code+"%}");
				}
				statement.setInt(49,anObject.airLine150Ref.code);
			} else {
				statement.setNull(49,java.sql.Types.INTEGER);
			}
			if (anObject.cableLine150Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).exists(anObject.cableLine150Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.cableLine150Ref.code%} = {%"+anObject.cableLine150Ref.code+"%}");
				}
				statement.setInt(50,anObject.cableLine150Ref.code);
			} else {
				statement.setNull(50,java.sql.Types.INTEGER);
			}
			if (anObject.s150Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).exists(anObject.s150Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechConditionsServices.s150Ref.code%} = {%"+anObject.s150Ref.code+"%}");
				}
				statement.setInt(51,anObject.s150Ref.code);
			} else {
				statement.setNull(51,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTechConditionsServicesDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTechConditionsServices anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTechConditionsServices anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTechConditionsServices oldObject = new ENTechConditionsServices();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTechConditionsServices.modify_time_Field + "," + ENTechConditionsServices.domain_info_Field+" FROM  ENTECHCONDITIONSSERVCS WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("FINCONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINCONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERNAME") == 0) {
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
					if(fieldNameStr.compareTo("FINCOMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSUMMAGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSUMMAVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSERVICESSUMMA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSERVICESPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTSERVICESGEN") == 0) {
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
					if(fieldNameStr.compareTo("CNPACKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTIONTERM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDERSAREA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BASESTATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SMALLARCHFRM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTDATEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISSEA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISDISCONNECTIONNEEDED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISUSE2TARIFFS") == 0) {
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
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHCONDSERVICESSTATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHCONDSERVICESTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTFORM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHCONDRESPONSIBLESREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CNSUBSYSTEMTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRAGENTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONKINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TARIFFENTRYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENERALCONTRACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AIRLINE04REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CABLELINE04REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("S04REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AIRLINE10REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CABLELINE10REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("S35REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AIRLINE150REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CABLELINE150REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("S150REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTECHCONDITIONSSERVCS SET  CONTRACTNUMBER = ? , CONTRACTDATE = ? , FINCONTRACTNUMBER = ? , FINCONTRACTDATE = ? , PARTNERNAME = ? , PARTNERCODE = ? , FINDOCCODE = ? , FINDOCID = ? , FINCOMMENTGEN = ? , TYSUMMAGEN = ? , TYSUMMAVAT = ? , TYSERVICESSUMMA = ? , TYSERVICESPOWER = ? , COMMENTSERVICESGEN = ? , USERGEN = ? , DATEEDIT = ? , CNPACKCODE = ? , EXECUTIONTERM = ? , BUILDERSAREA = ? , BASESTATION = ? , SMALLARCHFRM = ? , CONTRACTDATEFINAL = ? , ISSEA = ? , ISDISCONNECTIONNEEDED = ? , ISUSE2TARIFFS = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , ELEMENTCODE = ? , DEPARTMENTCODE = ? , WARRANTREFCODE = ? , TECHCONDSERVICESSTTSCD = ? , TECHCONDSERVICESTYPECD = ? , CONTRAGENTFORMCODE = ? , TECHCONDRESPONSBLSRFCD = ? , CNSUBSYSTEMTYPEREFCODE = ? , CONTRAGENTTYPEREFCODE = ? , CONNECTIONKINDREFCODE = ? , TARIFFENTRYREFCODE = ? , CALCTYPEREFCODE = ? , GENERALCONTRACTREFCODE = ? , AIRLINE04REFCODE = ? , CABLELINE04REFCODE = ? , TRREFCODE = ? , S04REFCODE = ? , AIRLINE10REFCODE = ? , CABLELINE10REFCODE = ? , S35REFCODE = ? , AIRLINE150REFCODE = ? , CABLELINE150REFCODE = ? , S150REFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTECHCONDITIONSSERVICES SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					selectStr+=(String)fields.get(fldIndex);
					if(fldIndex > 0) {
						selectStr+=",";
					}
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					statement.setString(1,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(2,null);
					} else {
						statement.setDate(2,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(3,anObject.finContractNumber);
					if (anObject.finContractDate == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.finContractDate.getTime()));
					}
					statement.setString(5,anObject.partnerName);
					statement.setString(6,anObject.partnerCode);
					statement.setString(7,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.finDocID);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					statement.setString(9,anObject.finCommentGen);
					if (anObject.tySummaGen != null) {
						anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10,anObject.tySummaGen);
					if (anObject.tySummaVat != null) {
						anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11,anObject.tySummaVat);
					if (anObject.tyServicesSumma != null) {
						anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12,anObject.tyServicesSumma);
					if (anObject.tyServicesPower != null) {
						anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.tyServicesPower);
					statement.setString(14,anObject.commentServicesGen);
					statement.setString(15,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(16,null);
					} else {
						statement.setDate(16,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.cnPackCode != Integer.MIN_VALUE) {
						statement.setInt(17,anObject.cnPackCode);
					} else {
						statement.setNull(17,java.sql.Types.INTEGER);
					}
					statement.setString(18,anObject.executionTerm);
					if (anObject.buildersArea != Integer.MIN_VALUE) {
						statement.setInt(19,anObject.buildersArea);
					} else {
						statement.setNull(19,java.sql.Types.INTEGER);
					}
					if (anObject.baseStation != Integer.MIN_VALUE) {
						statement.setInt(20,anObject.baseStation);
					} else {
						statement.setNull(20,java.sql.Types.INTEGER);
					}
					if (anObject.smallArchFrm != Integer.MIN_VALUE) {
						statement.setInt(21,anObject.smallArchFrm);
					} else {
						statement.setNull(21,java.sql.Types.INTEGER);
					}
					if (anObject.contractDateFinal == null) {
						statement.setDate(22,null);
					} else {
						statement.setDate(22,new java.sql.Date(anObject.contractDateFinal.getTime()));
					}
					if (anObject.isSea != Integer.MIN_VALUE) {
						statement.setInt(23,anObject.isSea);
					} else {
						statement.setNull(23,java.sql.Types.INTEGER);
					}
					if (anObject.isDisconnectionNeeded != Integer.MIN_VALUE) {
						statement.setInt(24,anObject.isDisconnectionNeeded);
					} else {
						statement.setNull(24,java.sql.Types.INTEGER);
					}
					if (anObject.isUse2Tariffs != Integer.MIN_VALUE) {
						statement.setInt(25,anObject.isUse2Tariffs);
					} else {
						statement.setNull(25,java.sql.Types.INTEGER);
					}
					statement.setString(26,anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(27,null);
					} else {
						statement.setBigDecimal(27,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(28,anObject.element.code);
					} else {
						statement.setNull(28,java.sql.Types.INTEGER);
					}
					if (anObject.department.code != Integer.MIN_VALUE) {
						statement.setInt(29,anObject.department.code);
					} else {
						statement.setNull(29,java.sql.Types.INTEGER);
					}
					if (anObject.warrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(30,anObject.warrantRef.code);
					} else {
						statement.setNull(30,java.sql.Types.INTEGER);
					}
					if (anObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
						statement.setInt(31,anObject.techCondServicesStatus.code);
					} else {
						statement.setNull(31,java.sql.Types.INTEGER);
					}
					if (anObject.techCondServicesType.code != Integer.MIN_VALUE) {
						statement.setInt(32,anObject.techCondServicesType.code);
					} else {
						statement.setNull(32,java.sql.Types.INTEGER);
					}
					if (anObject.contragentForm.code != Integer.MIN_VALUE) {
						statement.setInt(33,anObject.contragentForm.code);
					} else {
						statement.setNull(33,java.sql.Types.INTEGER);
					}
					if (anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
						statement.setInt(34,anObject.techCondResponsiblesRef.code);
					} else {
						statement.setNull(34,java.sql.Types.INTEGER);
					}
					if (anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(35,anObject.cnSubsystemTypeRef.code);
					} else {
						statement.setNull(35,java.sql.Types.INTEGER);
					}
					if (anObject.contragentTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(36,anObject.contragentTypeRef.code);
					} else {
						statement.setNull(36,java.sql.Types.INTEGER);
					}
					if (anObject.connectionKindRef.code != Integer.MIN_VALUE) {
						statement.setInt(37,anObject.connectionKindRef.code);
					} else {
						statement.setNull(37,java.sql.Types.INTEGER);
					}
					if (anObject.tariffEntryRef.code != Integer.MIN_VALUE) {
						statement.setInt(38,anObject.tariffEntryRef.code);
					} else {
						statement.setNull(38,java.sql.Types.INTEGER);
					}
					if (anObject.calcTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(39,anObject.calcTypeRef.code);
					} else {
						statement.setNull(39,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(40,anObject.generalContractRef.code);
					} else {
						statement.setNull(40,java.sql.Types.INTEGER);
					}
					if (anObject.airLine04Ref.code != Integer.MIN_VALUE) {
						statement.setInt(41,anObject.airLine04Ref.code);
					} else {
						statement.setNull(41,java.sql.Types.INTEGER);
					}
					if (anObject.cableLine04Ref.code != Integer.MIN_VALUE) {
						statement.setInt(42,anObject.cableLine04Ref.code);
					} else {
						statement.setNull(42,java.sql.Types.INTEGER);
					}
					if (anObject.trRef.code != Integer.MIN_VALUE) {
						statement.setInt(43,anObject.trRef.code);
					} else {
						statement.setNull(43,java.sql.Types.INTEGER);
					}
					if (anObject.s04Ref.code != Integer.MIN_VALUE) {
						statement.setInt(44,anObject.s04Ref.code);
					} else {
						statement.setNull(44,java.sql.Types.INTEGER);
					}
					if (anObject.airLine10Ref.code != Integer.MIN_VALUE) {
						statement.setInt(45,anObject.airLine10Ref.code);
					} else {
						statement.setNull(45,java.sql.Types.INTEGER);
					}
					if (anObject.cableLine10Ref.code != Integer.MIN_VALUE) {
						statement.setInt(46,anObject.cableLine10Ref.code);
					} else {
						statement.setNull(46,java.sql.Types.INTEGER);
					}
					if (anObject.s35Ref.code != Integer.MIN_VALUE) {
						statement.setInt(47,anObject.s35Ref.code);
					} else {
						statement.setNull(47,java.sql.Types.INTEGER);
					}
					if (anObject.airLine150Ref.code != Integer.MIN_VALUE) {
						statement.setInt(48,anObject.airLine150Ref.code);
					} else {
						statement.setNull(48,java.sql.Types.INTEGER);
					}
					if (anObject.cableLine150Ref.code != Integer.MIN_VALUE) {
						statement.setInt(49,anObject.cableLine150Ref.code);
					} else {
						statement.setNull(49,java.sql.Types.INTEGER);
					}
					if (anObject.s150Ref.code != Integer.MIN_VALUE) {
						statement.setInt(50,anObject.s150Ref.code);
					} else {
						statement.setNull(50,java.sql.Types.INTEGER);
					}
					statement.setInt(51,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.contractNumber);
							continue;
						}
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractDate.getTime()));
							}
							continue;
						}
						if("FINCONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finContractNumber);
							continue;
						}
						if("FINCONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finContractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.finContractDate.getTime()));
							}
							continue;
						}
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerName);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerCode);
							continue;
						}
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finDocCode);
							continue;
						}
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocID);
							continue;
						}
						if("FINCOMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finCommentGen);
							continue;
						}
						if("TYSUMMAGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tySummaGen != null) {
								anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.tySummaGen);
							continue;
						}
						if("TYSUMMAVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tySummaVat != null) {
								anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.tySummaVat);
							continue;
						}
						if("TYSERVICESSUMMA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyServicesSumma != null) {
								anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.tyServicesSumma);
							continue;
						}
						if("TYSERVICESPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyServicesPower != null) {
								anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.tyServicesPower);
							continue;
						}
						if("COMMENTSERVICESGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentServicesGen);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("CNPACKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.cnPackCode);
							continue;
						}
						if("EXECUTIONTERM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.executionTerm);
							continue;
						}
						if("BUILDERSAREA".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.buildersArea);
							continue;
						}
						if("BASESTATION".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.baseStation);
							continue;
						}
						if("SMALLARCHFRM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.smallArchFrm);
							continue;
						}
						if("CONTRACTDATEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDateFinal == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractDateFinal.getTime()));
							}
							continue;
						}
						if("ISSEA".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isSea);
							continue;
						}
						if("ISDISCONNECTIONNEEDED".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isDisconnectionNeeded);
							continue;
						}
						if("ISUSE2TARIFFS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isUse2Tariffs);
							continue;
						}
						if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.domain_info);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.element.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.department.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.department.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.warrantRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TECHCONDSERVICESSTATUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.techCondServicesStatus.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TECHCONDSERVICESTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techCondServicesType.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.techCondServicesType.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRAGENTFORM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contragentForm.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.contragentForm.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TECHCONDRESPONSIBLESREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.techCondResponsiblesRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CNSUBSYSTEMTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.cnSubsystemTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRAGENTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contragentTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.contragentTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONNECTIONKINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.connectionKindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.connectionKindRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TARIFFENTRYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tariffEntryRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.tariffEntryRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CALCTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.calcTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GENERALCONTRACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.generalContractRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("AIRLINE04REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.airLine04Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.airLine04Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CABLELINE04REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cableLine04Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.cableLine04Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.trRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.trRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("S04REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.s04Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.s04Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("AIRLINE10REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.airLine10Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.airLine10Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CABLELINE10REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cableLine10Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.cableLine10Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("S35REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.s35Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.s35Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("AIRLINE150REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.airLine150Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.airLine150Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CABLELINE150REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cableLine150Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.cableLine150Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("S150REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.s150Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.s150Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(),anObject.code);
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

	} // end of save(ENTechConditionsServices anObject,String[] anAttributes)


	public ENTechConditionsServicesShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTechConditionsServices filterObject = new ENTechConditionsServices();
		Vector<ENTechConditionsServicesShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTechConditionsServicesShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENTechConditionsServices filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finContractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.finContractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finCommentGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tySummaGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tySummaVat, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyServicesSumma, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyServicesPower, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentServicesGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cnPackCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executionTerm, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.buildersArea, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.baseStation, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.smallArchFrm, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDateFinal, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isSea, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isDisconnectionNeeded, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isUse2Tariffs, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.department.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techCondServicesStatus.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techCondServicesType.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contragentForm.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techCondResponsiblesRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cnSubsystemTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contragentTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.connectionKindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tariffEntryRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.airLine04Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cableLine04Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.trRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.s04Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.airLine10Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cableLine10Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.s35Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.airLine150Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cableLine150Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.s150Ref.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENTechConditionsServicesFilter filter) {
		String out = buildCondition((ENTechConditionsServices)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTechConditionsServices filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTechConditionsServices.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENTechConditionsServices.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENTechConditionsServices.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finContractNumber, ENTechConditionsServices.finContractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.finContractDate, ENTechConditionsServices.finContractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENTechConditionsServices.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENTechConditionsServices.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENTechConditionsServices.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENTechConditionsServices.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finCommentGen, ENTechConditionsServices.finCommentGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tySummaGen, ENTechConditionsServices.tySummaGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tySummaVat, ENTechConditionsServices.tySummaVat_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyServicesSumma, ENTechConditionsServices.tyServicesSumma_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyServicesPower, ENTechConditionsServices.tyServicesPower_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentServicesGen, ENTechConditionsServices.commentServicesGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENTechConditionsServices.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENTechConditionsServices.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cnPackCode, ENTechConditionsServices.cnPackCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executionTerm, ENTechConditionsServices.executionTerm_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.buildersArea, ENTechConditionsServices.buildersArea_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.baseStation, ENTechConditionsServices.baseStation_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.smallArchFrm, ENTechConditionsServices.smallArchFrm_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDateFinal, ENTechConditionsServices.contractDateFinal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isSea, ENTechConditionsServices.isSea_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isDisconnectionNeeded, ENTechConditionsServices.isDisconnectionNeeded_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isUse2Tariffs, ENTechConditionsServices.isUse2Tariffs_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENTechConditionsServices.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTechConditionsServices.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENTechConditionsServices.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.department.code, ENTechConditionsServices.department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantRef.code, ENTechConditionsServices.warrantRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techCondServicesStatus.code, ENTechConditionsServices.techCondServicesStatus_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techCondServicesType.code, ENTechConditionsServices.techCondServicesType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contragentForm.code, ENTechConditionsServices.contragentForm_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techCondResponsiblesRef.code, ENTechConditionsServices.techCondResponsiblesRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cnSubsystemTypeRef.code, ENTechConditionsServices.cnSubsystemTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contragentTypeRef.code, ENTechConditionsServices.contragentTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.connectionKindRef.code, ENTechConditionsServices.connectionKindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tariffEntryRef.code, ENTechConditionsServices.tariffEntryRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcTypeRef.code, ENTechConditionsServices.calcTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENTechConditionsServices.generalContractRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.airLine04Ref.code, ENTechConditionsServices.airLine04Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cableLine04Ref.code, ENTechConditionsServices.cableLine04Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.trRef.code, ENTechConditionsServices.trRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.s04Ref.code, ENTechConditionsServices.s04Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.airLine10Ref.code, ENTechConditionsServices.airLine10Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cableLine10Ref.code, ENTechConditionsServices.cableLine10Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.s35Ref.code, ENTechConditionsServices.s35Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.airLine150Ref.code, ENTechConditionsServices.airLine150Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cableLine150Ref.code, ENTechConditionsServices.cableLine150Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.s150Ref.code, ENTechConditionsServices.s150Ref_QFielld, out);
		}
		return out;
	}

	public ENTechConditionsServicesShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTechConditionsServicesShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTechConditionsServicesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTechConditionsServicesShortList getFilteredList(ENTechConditionsServices filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServices aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServices aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTechConditionsServicesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServicesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServicesFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENTechConditionsServicesShortList getScrollableFilteredList(ENTechConditionsServices aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENTechConditionsServicesShortList result = new ENTechConditionsServicesShortList();
		ENTechConditionsServicesShort anObject;
		result.list = new Vector<ENTechConditionsServicesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHCONDITIONSSERVCS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTECHCONDITIONSSERVCS.CODE"+
			",ENTECHCONDITIONSSERVCS.CONTRACTNUMBER"+
			",ENTECHCONDITIONSSERVCS.CONTRACTDATE"+
			",ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER"+
			",ENTECHCONDITIONSSERVCS.FINCONTRACTDATE"+
			",ENTECHCONDITIONSSERVCS.PARTNERNAME"+
			",ENTECHCONDITIONSSERVCS.PARTNERCODE"+
			",ENTECHCONDITIONSSERVCS.FINDOCCODE"+
			",ENTECHCONDITIONSSERVCS.FINDOCID"+
			",ENTECHCONDITIONSSERVCS.FINCOMMENTGEN"+
			",ENTECHCONDITIONSSERVCS.TYSUMMAGEN"+
			",ENTECHCONDITIONSSERVCS.TYSUMMAVAT"+
			",ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA"+
			",ENTECHCONDITIONSSERVCS.TYSERVICESPOWER"+
			",ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN"+
			",ENTECHCONDITIONSSERVCS.USERGEN"+
			",ENTECHCONDITIONSSERVCS.DATEEDIT"+
			",ENTECHCONDITIONSSERVCS.CNPACKCODE"+
			",ENTECHCONDITIONSSERVCS.EXECUTIONTERM"+
			",ENTECHCONDITIONSSERVCS.BUILDERSAREA"+
			",ENTECHCONDITIONSSERVCS.BASESTATION"+
			",ENTECHCONDITIONSSERVCS.SMALLARCHFRM"+
			",ENTECHCONDITIONSSERVCS.CONTRACTDATEFINAL"+
			",ENTECHCONDITIONSSERVCS.ISSEA"+
			",ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED"+
			",ENTECHCONDITIONSSERVCS.ISUSE2TARIFFS"+
			", ENELEMENT.CODE " +
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
			", ENTECHCONDTNSSRVCSSTTS.CODE " +
			", ENTECHCONDTNSSRVCSSTTS.NAME " +
			", ENTECHCONDITINSSRVCSTP.CODE " +
			", ENTECHCONDITINSSRVCSTP.NAME " +
			", ENTECHCONTRAGENTFORM.CODE " +
			", ENTECHCONTRAGENTFORM.NAME " +
			", ENTECHCONDRESPONSIBLES.CODE " +
			", ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO " +
			", ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER " +
			", ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION " +
			", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME " +
			", ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE " +
			", ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE " +
			", ENTECHCONDRESPONSIBLES.POWER " +
			", CNSUBSYSTEMTYPE.CODE " +
			", CNSUBSYSTEMTYPE.NAME " +
			", ENTECHCONTRAGENTTYPE.CODE " +
			", ENTECHCONTRAGENTTYPE.NAME " +
			", ENCONNECTIONKIND.CODE " +
			", ENCONNECTIONKIND.NAME " +
			", ENCONNECTIONTARIFFENTR.CODE " +
			", ENCONNECTIONTARIFFENTR.VALUE " +
			", ENCONNECTIONTARIFFENTR.STARTDATE " +
			", ENCONNECTIONTARIFFENTR.USERGEN " +
			", ENCONNECTIONCALCTYPE.CODE " +
			", ENCONNECTIONCALCTYPE.NAME " +
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
			", ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE" +
			", ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE" +
			", ENTECHCONDITIONSSERVCS.TRREFCODE" +
			", ENTECHCONDITIONSSERVCS.S04REFCODE" +
			", ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE" +
			", ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE" +
			", ENTECHCONDITIONSSERVCS.S35REFCODE" +
			", ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE" +
			", ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE" +
			", ENTECHCONDITIONSSERVCS.S150REFCODE" +
		" FROM ENTECHCONDITIONSSERVCS " +
			", ENELEMENT " +
			", ENDEPARTMENT " +
			", ENWARRANT " +
			", ENTECHCONDTNSSRVCSSTTS " +
			", ENTECHCONDITINSSRVCSTP " +
			", ENTECHCONTRAGENTFORM " +
			", ENTECHCONDRESPONSIBLES " +
			", CNSUBSYSTEMTYPE " +
			", ENTECHCONTRAGENTTYPE " +
			", ENCONNECTIONKIND " +
			", ENCONNECTIONTARIFFENTR " +
			", ENCONNECTIONCALCTYPE " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENELEMENT.CODE = ENTECHCONDITIONSSERVCS.ELEMENTCODE" ; //+
		whereStr += " AND ENDEPARTMENT.CODE = ENTECHCONDITIONSSERVCS.DEPARTMENTCODE" ; //+
		whereStr += " AND ENWARRANT.CODE = ENTECHCONDITIONSSERVCS.WARRANTREFCODE" ; //+
		whereStr += " AND ENTECHCONDTNSSRVCSSTTS.CODE = ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD" ; //+
		whereStr += " AND ENTECHCONDITINSSRVCSTP.CODE = ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD" ; //+
		whereStr += " AND ENTECHCONTRAGENTFORM.CODE = ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE" ; //+
		whereStr += " AND ENTECHCONDRESPONSIBLES.CODE = ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD" ; //+
		whereStr += " AND CNSUBSYSTEMTYPE.CODE = ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE" ; //+
		whereStr += " AND ENTECHCONTRAGENTTYPE.CODE = ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE" ; //+
		whereStr += " AND ENCONNECTIONKIND.CODE = ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE" ; //+
		whereStr += " AND ENCONNECTIONTARIFFENTR.CODE = ENTECHCONDITIONSSERVCS.TARIFFENTRYREFCODE" ; //+
		whereStr += " AND ENCONNECTIONCALCTYPE.CODE = ENTECHCONDITIONSSERVCS.CALCTYPEREFCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENTECHCONDITIONSSERVCS.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsServices.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSSERVCS",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
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
				anObject = new ENTechConditionsServicesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.finContractNumber = set.getString(4);
				anObject.finContractDate = set.getDate(5);
				anObject.partnerName = set.getString(6);
				anObject.partnerCode = set.getString(7);
				anObject.finDocCode = set.getString(8);
				anObject.finDocID = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.finCommentGen = set.getString(10);
				anObject.tySummaGen = set.getBigDecimal(11);
				if(anObject.tySummaGen != null) {
					anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tySummaVat = set.getBigDecimal(12);
				if(anObject.tySummaVat != null) {
					anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesSumma = set.getBigDecimal(13);
				if(anObject.tyServicesSumma != null) {
					anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPower = set.getBigDecimal(14);
				if(anObject.tyServicesPower != null) {
					anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentServicesGen = set.getString(15);
				anObject.userGen = set.getString(16);
				anObject.dateEdit = set.getDate(17);
				anObject.cnPackCode = set.getInt(18);
				if ( set.wasNull() ) {
					anObject.cnPackCode = Integer.MIN_VALUE;
				}
				anObject.executionTerm = set.getString(19);
				anObject.buildersArea = set.getInt(20);
				if ( set.wasNull() ) {
					anObject.buildersArea = Integer.MIN_VALUE;
				}
				anObject.baseStation = set.getInt(21);
				if ( set.wasNull() ) {
					anObject.baseStation = Integer.MIN_VALUE;
				}
				anObject.smallArchFrm = set.getInt(22);
				if ( set.wasNull() ) {
					anObject.smallArchFrm = Integer.MIN_VALUE;
				}
				anObject.contractDateFinal = set.getDate(23);
				anObject.isSea = set.getInt(24);
				if ( set.wasNull() ) {
					anObject.isSea = Integer.MIN_VALUE;
				}
				anObject.isDisconnectionNeeded = set.getInt(25);
				if ( set.wasNull() ) {
					anObject.isDisconnectionNeeded = Integer.MIN_VALUE;
				}
				anObject.isUse2Tariffs = set.getInt(26);
				if ( set.wasNull() ) {
					anObject.isUse2Tariffs = Integer.MIN_VALUE;
				}

				anObject.elementCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.departmentCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(29);
				anObject.departmentDateStart = set.getDate(30);
				anObject.departmentDateFinal = set.getDate(31);
				anObject.departmentRenCode = set.getInt(32);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(33);
				anObject.departmentKau_table_id_1884 = set.getInt(34);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(35);
				anObject.departmentName_1884 = set.getString(36);
				anObject.departmentHrmorganizationid = set.getString(37);
				anObject.warrantRefCode = set.getInt(38);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(39);
				anObject.warrantRefName = set.getString(40);
				anObject.warrantRefWarrantFIO = set.getString(41);
				anObject.warrantRefWarrantShortFIO = set.getString(42);
				anObject.warrantRefWarrantPosition = set.getString(43);
				anObject.warrantRefGenitiveFIO = set.getString(44);
				anObject.warrantRefGenitivePosition = set.getString(45);
				anObject.warrantRefPassport = set.getString(46);
				anObject.warrantRefAddress = set.getString(47);
				anObject.warrantRefPower = set.getInt(48);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(49);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techCondServicesStatusCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.techCondServicesStatusCode = Integer.MIN_VALUE;
				}
				anObject.techCondServicesStatusName = set.getString(51);
				anObject.techCondServicesTypeCode = set.getInt(52);
				if(set.wasNull()) {
					anObject.techCondServicesTypeCode = Integer.MIN_VALUE;
				}
				anObject.techCondServicesTypeName = set.getString(53);
				anObject.contragentFormCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.contragentFormCode = Integer.MIN_VALUE;
				}
				anObject.contragentFormName = set.getString(55);
				anObject.techCondResponsiblesRefCode = set.getInt(56);
				if(set.wasNull()) {
					anObject.techCondResponsiblesRefCode = Integer.MIN_VALUE;
				}
				anObject.techCondResponsiblesRefResponsibleFIO = set.getString(57);
				anObject.techCondResponsiblesRefResponsibleTabNumber = set.getInt(58);
				if(set.wasNull()) {
					anObject.techCondResponsiblesRefResponsibleTabNumber = Integer.MIN_VALUE;
				}
				anObject.techCondResponsiblesRefResponsiblePosition = set.getString(59);
				anObject.techCondResponsiblesRefResponsibleDepName = set.getString(60);
				anObject.techCondResponsiblesRefResponsibleDepCode = set.getString(61);
				anObject.techCondResponsiblesRefResponsiblePhone = set.getString(62);
				anObject.techCondResponsiblesRefPower = set.getInt(63);
				if(set.wasNull()) {
					anObject.techCondResponsiblesRefPower = Integer.MIN_VALUE;
				}
				anObject.cnSubsystemTypeRefCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.cnSubsystemTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.cnSubsystemTypeRefName = set.getString(65);
				anObject.contragentTypeRefCode = set.getInt(66);
				if(set.wasNull()) {
					anObject.contragentTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.contragentTypeRefName = set.getString(67);
				anObject.connectionKindRefCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.connectionKindRefCode = Integer.MIN_VALUE;
				}
				anObject.connectionKindRefName = set.getString(69);
				anObject.tariffEntryRefCode = set.getInt(70);
				if(set.wasNull()) {
					anObject.tariffEntryRefCode = Integer.MIN_VALUE;
				}
				anObject.tariffEntryRefValue = set.getBigDecimal(71);
				if(anObject.tariffEntryRefValue != null) {
					anObject.tariffEntryRefValue = anObject.tariffEntryRefValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tariffEntryRefStartDate = set.getDate(72);
				anObject.tariffEntryRefUserGen = set.getString(73);
				anObject.calcTypeRefCode = set.getInt(74);
				if(set.wasNull()) {
					anObject.calcTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.calcTypeRefName = set.getString(75);
				anObject.generalContractRefCode = set.getInt(76);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(77);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(78);
				anObject.generalContractRefContractNumber = set.getString(79);
				anObject.generalContractRefContractDate = set.getDate(80);
				anObject.generalContractRefCommentGen = set.getString(81);
				anObject.generalContractRefPartnerId = set.getInt(82);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(83);
				anObject.generalContractRefPartnerName = set.getString(84);
				anObject.generalContractRefContractRegDate = set.getDate(85);
				anObject.generalContractRefContractStartDate = set.getDate(86);
				anObject.generalContractRefContractEndDate = set.getDate(87);
				anObject.generalContractRefAxContractId = set.getString(88);
				anObject.generalContractRefAxContractCode = set.getString(89);
				anObject.generalContractRefAxContractNumber = set.getString(90);
				anObject.generalContractRefAxContractAccount = set.getString(91);
				anObject.generalContractRefAxContractDate = set.getDate(92);
				anObject.generalContractRefAxContractCommentGen = set.getString(93);
				anObject.generalContractRefAxContractGroupCode = set.getString(94);
				anObject.generalContractRefAxPartnerCode = set.getString(95);
				anObject.generalContractRefAxPartnerName = set.getString(96);
				anObject.generalContractRefUserGen = set.getString(97);
				anObject.airLine04RefCode = set.getInt(98);
				if(set.wasNull()) {
					anObject.airLine04RefCode = Integer.MIN_VALUE;
				}
				anObject.cableLine04RefCode = set.getInt(99);
				if(set.wasNull()) {
					anObject.cableLine04RefCode = Integer.MIN_VALUE;
				}
				anObject.trRefCode = set.getInt(100);
				if(set.wasNull()) {
					anObject.trRefCode = Integer.MIN_VALUE;
				}
				anObject.s04RefCode = set.getInt(101);
				if(set.wasNull()) {
					anObject.s04RefCode = Integer.MIN_VALUE;
				}
				anObject.airLine10RefCode = set.getInt(102);
				if(set.wasNull()) {
					anObject.airLine10RefCode = Integer.MIN_VALUE;
				}
				anObject.cableLine10RefCode = set.getInt(103);
				if(set.wasNull()) {
					anObject.cableLine10RefCode = Integer.MIN_VALUE;
				}
				anObject.s35RefCode = set.getInt(104);
				if(set.wasNull()) {
					anObject.s35RefCode = Integer.MIN_VALUE;
				}
				anObject.airLine150RefCode = set.getInt(105);
				if(set.wasNull()) {
					anObject.airLine150RefCode = Integer.MIN_VALUE;
				}
				anObject.cableLine150RefCode = set.getInt(106);
				if(set.wasNull()) {
					anObject.cableLine150RefCode = Integer.MIN_VALUE;
				}
				anObject.s150RefCode = set.getInt(107);
				if(set.wasNull()) {
					anObject.s150RefCode = Integer.MIN_VALUE;
				}

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

	public int[] getFilteredCodeArray(ENTechConditionsServicesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENTechConditionsServices aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTECHCONDITIONSSERVCS.CODE FROM ENTECHCONDITIONSSERVCS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHCONDITIONSSERVCS.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsServices.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSSERVCS",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENTECHCONDITIONSSERVCS.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
		}

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
				result.add(new Integer(set.getInt(1)));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = ((Integer)result.get(j)).intValue();
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

	public ENTechConditionsServices getObject(int uid) throws PersistenceException {
		ENTechConditionsServices result = new ENTechConditionsServices();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENTechConditionsServices anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsServices.getObject%} access denied");
		}


		selectStr = "SELECT  ENTECHCONDITIONSSERVCS.CODE, ENTECHCONDITIONSSERVCS.CONTRACTNUMBER, ENTECHCONDITIONSSERVCS.CONTRACTDATE, ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER, ENTECHCONDITIONSSERVCS.FINCONTRACTDATE, ENTECHCONDITIONSSERVCS.PARTNERNAME, ENTECHCONDITIONSSERVCS.PARTNERCODE, ENTECHCONDITIONSSERVCS.FINDOCCODE, ENTECHCONDITIONSSERVCS.FINDOCID, ENTECHCONDITIONSSERVCS.FINCOMMENTGEN, ENTECHCONDITIONSSERVCS.TYSUMMAGEN, ENTECHCONDITIONSSERVCS.TYSUMMAVAT, ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA, ENTECHCONDITIONSSERVCS.TYSERVICESPOWER, ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN, ENTECHCONDITIONSSERVCS.USERGEN, ENTECHCONDITIONSSERVCS.DATEEDIT, ENTECHCONDITIONSSERVCS.CNPACKCODE, ENTECHCONDITIONSSERVCS.EXECUTIONTERM, ENTECHCONDITIONSSERVCS.BUILDERSAREA, ENTECHCONDITIONSSERVCS.BASESTATION, ENTECHCONDITIONSSERVCS.SMALLARCHFRM, ENTECHCONDITIONSSERVCS.CONTRACTDATEFINAL, ENTECHCONDITIONSSERVCS.ISSEA, ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED, ENTECHCONDITIONSSERVCS.ISUSE2TARIFFS, ENTECHCONDITIONSSERVCS.DOMAIN_INFO, ENTECHCONDITIONSSERVCS.MODIFY_TIME, ENTECHCONDITIONSSERVCS.ELEMENTCODE, ENTECHCONDITIONSSERVCS.DEPARTMENTCODE, ENTECHCONDITIONSSERVCS.WARRANTREFCODE, ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD, ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD, ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE, ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD, ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE, ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE, ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE, ENTECHCONDITIONSSERVCS.TARIFFENTRYREFCODE, ENTECHCONDITIONSSERVCS.CALCTYPEREFCODE, ENTECHCONDITIONSSERVCS.GENERALCONTRACTREFCODE, ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE, ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE, ENTECHCONDITIONSSERVCS.TRREFCODE, ENTECHCONDITIONSSERVCS.S04REFCODE, ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE, ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE, ENTECHCONDITIONSSERVCS.S35REFCODE, ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE, ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE, ENTECHCONDITIONSSERVCS.S150REFCODE "
			+" FROM ENTECHCONDITIONSSERVCS WHERE ENTECHCONDITIONSSERVCS.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSSERVCS",segregationInfo,getUserProfile().getDomainInfo());
		if(segregationWhereStr.length() > 0) {
			selectStr = selectStr + " AND " + segregationWhereStr;
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
				anObject.finContractNumber = set.getString(4);
				anObject.finContractDate = set.getDate(5);
				anObject.partnerName = set.getString(6);
				anObject.partnerCode = set.getString(7);
				anObject.finDocCode = set.getString(8);
				anObject.finDocID = set.getInt(9);
				if (set.wasNull()) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.finCommentGen = set.getString(10);
				anObject.tySummaGen = set.getBigDecimal(11);
				if(anObject.tySummaGen != null) {
					anObject.tySummaGen = anObject.tySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tySummaVat = set.getBigDecimal(12);
				if(anObject.tySummaVat != null) {
					anObject.tySummaVat = anObject.tySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesSumma = set.getBigDecimal(13);
				if(anObject.tyServicesSumma != null) {
					anObject.tyServicesSumma = anObject.tyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPower = set.getBigDecimal(14);
				if(anObject.tyServicesPower != null) {
					anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentServicesGen = set.getString(15);
				anObject.userGen = set.getString(16);
				anObject.dateEdit = set.getDate(17);
				anObject.cnPackCode = set.getInt(18);
				if (set.wasNull()) {
					anObject.cnPackCode = Integer.MIN_VALUE;
				}
				anObject.executionTerm = set.getString(19);
				anObject.buildersArea = set.getInt(20);
				if (set.wasNull()) {
					anObject.buildersArea = Integer.MIN_VALUE;
				}
				anObject.baseStation = set.getInt(21);
				if (set.wasNull()) {
					anObject.baseStation = Integer.MIN_VALUE;
				}
				anObject.smallArchFrm = set.getInt(22);
				if (set.wasNull()) {
					anObject.smallArchFrm = Integer.MIN_VALUE;
				}
				anObject.contractDateFinal = set.getDate(23);
				anObject.isSea = set.getInt(24);
				if (set.wasNull()) {
					anObject.isSea = Integer.MIN_VALUE;
				}
				anObject.isDisconnectionNeeded = set.getInt(25);
				if (set.wasNull()) {
					anObject.isDisconnectionNeeded = Integer.MIN_VALUE;
				}
				anObject.isUse2Tariffs = set.getInt(26);
				if (set.wasNull()) {
					anObject.isUse2Tariffs = Integer.MIN_VALUE;
				}
				anObject.domain_info = set.getString(27);
				anObject.modify_time = set.getLong(28);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.element.code = set.getInt(29);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.department.code = set.getInt(30);
				if (set.wasNull()) {
					anObject.department.code = Integer.MIN_VALUE;
				}
				anObject.warrantRef.code = set.getInt(31);
				if (set.wasNull()) {
					anObject.warrantRef.code = Integer.MIN_VALUE;
				}
				anObject.techCondServicesStatus.code = set.getInt(32);
				if (set.wasNull()) {
					anObject.techCondServicesStatus.code = Integer.MIN_VALUE;
				}
				anObject.techCondServicesType.code = set.getInt(33);
				if (set.wasNull()) {
					anObject.techCondServicesType.code = Integer.MIN_VALUE;
				}
				anObject.contragentForm.code = set.getInt(34);
				if (set.wasNull()) {
					anObject.contragentForm.code = Integer.MIN_VALUE;
				}
				anObject.techCondResponsiblesRef.code = set.getInt(35);
				if (set.wasNull()) {
					anObject.techCondResponsiblesRef.code = Integer.MIN_VALUE;
				}
				anObject.cnSubsystemTypeRef.code = set.getInt(36);
				if (set.wasNull()) {
					anObject.cnSubsystemTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.contragentTypeRef.code = set.getInt(37);
				if (set.wasNull()) {
					anObject.contragentTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.connectionKindRef.code = set.getInt(38);
				if (set.wasNull()) {
					anObject.connectionKindRef.code = Integer.MIN_VALUE;
				}
				anObject.tariffEntryRef.code = set.getInt(39);
				if (set.wasNull()) {
					anObject.tariffEntryRef.code = Integer.MIN_VALUE;
				}
				anObject.calcTypeRef.code = set.getInt(40);
				if (set.wasNull()) {
					anObject.calcTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.generalContractRef.code = set.getInt(41);
				if (set.wasNull()) {
					anObject.generalContractRef.code = Integer.MIN_VALUE;
				}
				anObject.airLine04Ref.code = set.getInt(42);
				if (set.wasNull()) {
					anObject.airLine04Ref.code = Integer.MIN_VALUE;
				}
				anObject.cableLine04Ref.code = set.getInt(43);
				if (set.wasNull()) {
					anObject.cableLine04Ref.code = Integer.MIN_VALUE;
				}
				anObject.trRef.code = set.getInt(44);
				if (set.wasNull()) {
					anObject.trRef.code = Integer.MIN_VALUE;
				}
				anObject.s04Ref.code = set.getInt(45);
				if (set.wasNull()) {
					anObject.s04Ref.code = Integer.MIN_VALUE;
				}
				anObject.airLine10Ref.code = set.getInt(46);
				if (set.wasNull()) {
					anObject.airLine10Ref.code = Integer.MIN_VALUE;
				}
				anObject.cableLine10Ref.code = set.getInt(47);
				if (set.wasNull()) {
					anObject.cableLine10Ref.code = Integer.MIN_VALUE;
				}
				anObject.s35Ref.code = set.getInt(48);
				if (set.wasNull()) {
					anObject.s35Ref.code = Integer.MIN_VALUE;
				}
				anObject.airLine150Ref.code = set.getInt(49);
				if (set.wasNull()) {
					anObject.airLine150Ref.code = Integer.MIN_VALUE;
				}
				anObject.cableLine150Ref.code = set.getInt(50);
				if (set.wasNull()) {
					anObject.cableLine150Ref.code = Integer.MIN_VALUE;
				}
				anObject.s150Ref.code = set.getInt(51);
				if (set.wasNull()) {
					anObject.s150Ref.code = Integer.MIN_VALUE;
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
				}
				if(anObject.department.code != Integer.MIN_VALUE) {
					anObject.setDepartment(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
				}
				if(anObject.warrantRef.code != Integer.MIN_VALUE) {
					anObject.setWarrantRef(
						new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.warrantRef.code));
				}
				if(anObject.techCondServicesStatus.code != Integer.MIN_VALUE) {
					anObject.setTechCondServicesStatus(
						new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesStatusDAOGen(connection,getUserProfile()).getObject(anObject.techCondServicesStatus.code));
				}
				if(anObject.techCondServicesType.code != Integer.MIN_VALUE) {
					anObject.setTechCondServicesType(
						new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesTypeDAOGen(connection,getUserProfile()).getObject(anObject.techCondServicesType.code));
				}
				if(anObject.contragentForm.code != Integer.MIN_VALUE) {
					anObject.setContragentForm(
						new com.ksoe.energynet.dataminer.generated.ENTechContragentFormDAOGen(connection,getUserProfile()).getObject(anObject.contragentForm.code));
				}
				if(anObject.techCondResponsiblesRef.code != Integer.MIN_VALUE) {
					anObject.setTechCondResponsiblesRef(
						new com.ksoe.energynet.dataminer.generated.ENTechCondResponsiblesDAOGen(connection,getUserProfile()).getRef(anObject.techCondResponsiblesRef.code));
				}
				if(anObject.cnSubsystemTypeRef.code != Integer.MIN_VALUE) {
					anObject.setCnSubsystemTypeRef(
						new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.cnSubsystemTypeRef.code));
				}
				if(anObject.contragentTypeRef.code != Integer.MIN_VALUE) {
					anObject.setContragentTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENTechContragentTypeDAOGen(connection,getUserProfile()).getRef(anObject.contragentTypeRef.code));
				}
				if(anObject.connectionKindRef.code != Integer.MIN_VALUE) {
					anObject.setConnectionKindRef(
						new com.ksoe.energynet.dataminer.generated.ENConnectionKindDAOGen(connection,getUserProfile()).getRef(anObject.connectionKindRef.code));
				}
				if(anObject.tariffEntryRef.code != Integer.MIN_VALUE) {
					anObject.setTariffEntryRef(
						new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).getRef(anObject.tariffEntryRef.code));
				}
				if(anObject.calcTypeRef.code != Integer.MIN_VALUE) {
					anObject.setCalcTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENConnectionCalcTypeDAOGen(connection,getUserProfile()).getRef(anObject.calcTypeRef.code));
				}
				if(anObject.generalContractRef.code != Integer.MIN_VALUE) {
					anObject.setGeneralContractRef(
						new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).getRef(anObject.generalContractRef.code));
				}
				if(anObject.airLine04Ref.code != Integer.MIN_VALUE) {
					anObject.setAirLine04Ref(
						new com.ksoe.netobjects.dataminer.generated.ENLine04DAOGen(connection,getUserProfile()).getRef(anObject.airLine04Ref.code));
				}
				if(anObject.cableLine04Ref.code != Integer.MIN_VALUE) {
					anObject.setCableLine04Ref(
						new com.ksoe.netobjects.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).getRef(anObject.cableLine04Ref.code));
				}
				if(anObject.trRef.code != Integer.MIN_VALUE) {
					anObject.setTrRef(
						new com.ksoe.netobjects.dataminer.generated.ENTransformerDAOGen(connection,getUserProfile()).getRef(anObject.trRef.code));
				}
				if(anObject.s04Ref.code != Integer.MIN_VALUE) {
					anObject.setS04Ref(
						new com.ksoe.netobjects.dataminer.generated.ENSubstation04DAOGen(connection,getUserProfile()).getRef(anObject.s04Ref.code));
				}
				if(anObject.airLine10Ref.code != Integer.MIN_VALUE) {
					anObject.setAirLine10Ref(
						new com.ksoe.netobjects.dataminer.generated.ENLine10DAOGen(connection,getUserProfile()).getRef(anObject.airLine10Ref.code));
				}
				if(anObject.cableLine10Ref.code != Integer.MIN_VALUE) {
					anObject.setCableLine10Ref(
						new com.ksoe.netobjects.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).getRef(anObject.cableLine10Ref.code));
				}
				if(anObject.s35Ref.code != Integer.MIN_VALUE) {
					anObject.setS35Ref(
						new com.ksoe.netobjects.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).getRef(anObject.s35Ref.code));
				}
				if(anObject.airLine150Ref.code != Integer.MIN_VALUE) {
					anObject.setAirLine150Ref(
						new com.ksoe.netobjects.dataminer.generated.ENLine150DAOGen(connection,getUserProfile()).getRef(anObject.airLine150Ref.code));
				}
				if(anObject.cableLine150Ref.code != Integer.MIN_VALUE) {
					anObject.setCableLine150Ref(
						new com.ksoe.netobjects.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).getRef(anObject.cableLine150Ref.code));
				}
				if(anObject.s150Ref.code != Integer.MIN_VALUE) {
					anObject.setS150Ref(
						new com.ksoe.netobjects.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).getRef(anObject.s150Ref.code));
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


	public com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef ref = new com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef();
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

		selectStr = "DELETE FROM  ENTECHCONDITIONSSERVCS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTechConditionsServices object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTechConditionsServices.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsServices.remove%} access denied");
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

	public long count(ENTechConditionsServicesFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTechConditionsServicesFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTechConditionsServicesFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTECHCONDITIONSSERVCS", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsServices.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSSERVCS",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENTECHCONDITIONSSERVCS.DOMAIN_INFO IS NOT NULL) ";
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTechConditionsServicesFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTECHCONDITIONSSERVCS");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		ArrayList<E> out = new ArrayList<E>();

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

		if(whereStr.length() != 0) {
			sql += " WHERE " + whereStr;
		}

		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsServices.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsServices.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENTECHCONDITIONSSERVCS.CODE FROM  ENTECHCONDITIONSSERVCS WHERE  ENTECHCONDITIONSSERVCS.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSSERVCS",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENTECHCONDITIONSSERVCS.CODE");
		_checkConditionToken(condition,"contractnumber","ENTECHCONDITIONSSERVCS.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENTECHCONDITIONSSERVCS.CONTRACTDATE");
		_checkConditionToken(condition,"fincontractnumber","ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER");
		_checkConditionToken(condition,"fincontractdate","ENTECHCONDITIONSSERVCS.FINCONTRACTDATE");
		_checkConditionToken(condition,"partnername","ENTECHCONDITIONSSERVCS.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENTECHCONDITIONSSERVCS.PARTNERCODE");
		_checkConditionToken(condition,"findoccode","ENTECHCONDITIONSSERVCS.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENTECHCONDITIONSSERVCS.FINDOCID");
		_checkConditionToken(condition,"fincommentgen","ENTECHCONDITIONSSERVCS.FINCOMMENTGEN");
		_checkConditionToken(condition,"tysummagen","ENTECHCONDITIONSSERVCS.TYSUMMAGEN");
		_checkConditionToken(condition,"tysummavat","ENTECHCONDITIONSSERVCS.TYSUMMAVAT");
		_checkConditionToken(condition,"tyservicessumma","ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA");
		_checkConditionToken(condition,"tyservicespower","ENTECHCONDITIONSSERVCS.TYSERVICESPOWER");
		_checkConditionToken(condition,"commentservicesgen","ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN");
		_checkConditionToken(condition,"usergen","ENTECHCONDITIONSSERVCS.USERGEN");
		_checkConditionToken(condition,"dateedit","ENTECHCONDITIONSSERVCS.DATEEDIT");
		_checkConditionToken(condition,"cnpackcode","ENTECHCONDITIONSSERVCS.CNPACKCODE");
		_checkConditionToken(condition,"executionterm","ENTECHCONDITIONSSERVCS.EXECUTIONTERM");
		_checkConditionToken(condition,"buildersarea","ENTECHCONDITIONSSERVCS.BUILDERSAREA");
		_checkConditionToken(condition,"basestation","ENTECHCONDITIONSSERVCS.BASESTATION");
		_checkConditionToken(condition,"smallarchfrm","ENTECHCONDITIONSSERVCS.SMALLARCHFRM");
		_checkConditionToken(condition,"contractdatefinal","ENTECHCONDITIONSSERVCS.CONTRACTDATEFINAL");
		_checkConditionToken(condition,"issea","ENTECHCONDITIONSSERVCS.ISSEA");
		_checkConditionToken(condition,"isdisconnectionneeded","ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED");
		_checkConditionToken(condition,"isuse2tariffs","ENTECHCONDITIONSSERVCS.ISUSE2TARIFFS");
		_checkConditionToken(condition,"domain_info","ENTECHCONDITIONSSERVCS.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENTECHCONDITIONSSERVCS.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"department","DEPARTMENTCODE");
		_checkConditionToken(condition,"department.code","DEPARTMENTCODE");
		_checkConditionToken(condition,"warrantref","WARRANTREFCODE");
		_checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
		_checkConditionToken(condition,"techcondservicesstatus","TECHCONDSERVICESSTTSCD");
		_checkConditionToken(condition,"techcondservicesstatus.code","TECHCONDSERVICESSTTSCD");
		_checkConditionToken(condition,"techcondservicestype","TECHCONDSERVICESTYPECD");
		_checkConditionToken(condition,"techcondservicestype.code","TECHCONDSERVICESTYPECD");
		_checkConditionToken(condition,"contragentform","CONTRAGENTFORMCODE");
		_checkConditionToken(condition,"contragentform.code","CONTRAGENTFORMCODE");
		_checkConditionToken(condition,"techcondresponsiblesref","TECHCONDRESPONSBLSRFCD");
		_checkConditionToken(condition,"techcondresponsiblesref.code","TECHCONDRESPONSBLSRFCD");
		_checkConditionToken(condition,"cnsubsystemtyperef","CNSUBSYSTEMTYPEREFCODE");
		_checkConditionToken(condition,"cnsubsystemtyperef.code","CNSUBSYSTEMTYPEREFCODE");
		_checkConditionToken(condition,"contragenttyperef","CONTRAGENTTYPEREFCODE");
		_checkConditionToken(condition,"contragenttyperef.code","CONTRAGENTTYPEREFCODE");
		_checkConditionToken(condition,"connectionkindref","CONNECTIONKINDREFCODE");
		_checkConditionToken(condition,"connectionkindref.code","CONNECTIONKINDREFCODE");
		_checkConditionToken(condition,"tariffentryref","TARIFFENTRYREFCODE");
		_checkConditionToken(condition,"tariffentryref.code","TARIFFENTRYREFCODE");
		_checkConditionToken(condition,"calctyperef","CALCTYPEREFCODE");
		_checkConditionToken(condition,"calctyperef.code","CALCTYPEREFCODE");
		_checkConditionToken(condition,"generalcontractref","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"generalcontractref.code","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"airline04ref","AIRLINE04REFCODE");
		_checkConditionToken(condition,"airline04ref.code","AIRLINE04REFCODE");
		_checkConditionToken(condition,"cableline04ref","CABLELINE04REFCODE");
		_checkConditionToken(condition,"cableline04ref.code","CABLELINE04REFCODE");
		_checkConditionToken(condition,"trref","TRREFCODE");
		_checkConditionToken(condition,"trref.code","TRREFCODE");
		_checkConditionToken(condition,"s04ref","S04REFCODE");
		_checkConditionToken(condition,"s04ref.code","S04REFCODE");
		_checkConditionToken(condition,"airline10ref","AIRLINE10REFCODE");
		_checkConditionToken(condition,"airline10ref.code","AIRLINE10REFCODE");
		_checkConditionToken(condition,"cableline10ref","CABLELINE10REFCODE");
		_checkConditionToken(condition,"cableline10ref.code","CABLELINE10REFCODE");
		_checkConditionToken(condition,"s35ref","S35REFCODE");
		_checkConditionToken(condition,"s35ref.code","S35REFCODE");
		_checkConditionToken(condition,"airline150ref","AIRLINE150REFCODE");
		_checkConditionToken(condition,"airline150ref.code","AIRLINE150REFCODE");
		_checkConditionToken(condition,"cableline150ref","CABLELINE150REFCODE");
		_checkConditionToken(condition,"cableline150ref.code","CABLELINE150REFCODE");
		_checkConditionToken(condition,"s150ref","S150REFCODE");
		_checkConditionToken(condition,"s150ref.code","S150REFCODE");
		return condition.toString();
	}

	@Override
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

	private void _collectAutoIncrementFields(ENTechConditionsServices anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTECHCONDITIONSSERVCS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTECHCONDITIONSSERVCS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTECHCONDITIONSSERVCS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTECHCONDITIONSSERVCS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTechConditionsServicesDAO
