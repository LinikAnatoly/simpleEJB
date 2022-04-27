
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;
import com.ksoe.energynet.valueobject.filter.ENTechAgreement2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.brief.ENTechAgreement2ServicesObjectShort;
import com.ksoe.energynet.valueobject.lists.ENTechAgreement2ServicesObjectShortList;


/**
 * DAO Object for ENTechAgreement2ServicesObject;
 *
 */

public class ENTechAgreement2ServicesObjectDAOGen extends GenericDataMiner {

	public ENTechAgreement2ServicesObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTechAgreement2ServicesObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTechAgreement2ServicesObject inObject) throws PersistenceException {
		ENTechAgreement2ServicesObject obj = new ENTechAgreement2ServicesObject();
		obj.code = inObject.code;
		loadObject(obj);

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

		if(inObject.partnerOkpo == null && obj.partnerOkpo == null){}
		else
			if(inObject.partnerOkpo == null || obj.partnerOkpo == null) return false;
			else
				if ( ! inObject.partnerOkpo.equals(obj.partnerOkpo)){
					return false;
				}

		if(inObject.bankName == null && obj.bankName == null){}
		else
			if(inObject.bankName == null || obj.bankName == null) return false;
			else
				if ( ! inObject.bankName.equals(obj.bankName)){
					return false;
				}

		if(inObject.bankMfo == null && obj.bankMfo == null){}
		else
			if(inObject.bankMfo == null || obj.bankMfo == null) return false;
			else
				if ( ! inObject.bankMfo.equals(obj.bankMfo)){
					return false;
				}

		if(inObject.bankRSchet == null && obj.bankRSchet == null){}
		else
			if(inObject.bankRSchet == null || obj.bankRSchet == null) return false;
			else
				if ( ! inObject.bankRSchet.equals(obj.bankRSchet)){
					return false;
				}

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

		if(inObject.objectName == null && obj.objectName == null){}
		else
			if(inObject.objectName == null || obj.objectName == null) return false;
			else
				if ( ! inObject.objectName.equals(obj.objectName)){
					return false;
				}

		if(inObject.costWorks == null && obj.costWorks == null){}
		else
			if(inObject.costWorks == null || obj.costWorks == null) return false;
			else
				if ( ! inObject.costWorks.equals(obj.costWorks)){
					return false;
				}

		if(inObject.costWorksNDS == null && obj.costWorksNDS == null){}
		else
			if(inObject.costWorksNDS == null || obj.costWorksNDS == null) return false;
			else
				if ( ! inObject.costWorksNDS.equals(obj.costWorksNDS)){
					return false;
				}

		if(inObject.basisForAction == null && obj.basisForAction == null){}
		else
			if(inObject.basisForAction == null || obj.basisForAction == null) return false;
			else
				if ( ! inObject.basisForAction.equals(obj.basisForAction)){
					return false;
				}

		if(inObject.actNumber == null && obj.actNumber == null){}
		else
			if(inObject.actNumber == null || obj.actNumber == null) return false;
			else
				if ( ! inObject.actNumber.equals(obj.actNumber)){
					return false;
				}

		if(inObject.actDate == null && obj.actDate == null){} else 
			if(inObject.actDate == null || obj.actDate == null) return false;
			else
				if (inObject.actDate.compareTo(obj.actDate) != 0){
					return false;
				}

		if(inObject.executorTaxType == null && obj.executorTaxType == null){}
		else
			if(inObject.executorTaxType == null || obj.executorTaxType == null) return false;
			else
				if ( ! inObject.executorTaxType.equals(obj.executorTaxType)){
					return false;
				}

		if(inObject.area == null && obj.area == null){}
		else
			if(inObject.area == null || obj.area == null) return false;
			else
				if ( ! inObject.area.equals(obj.area)){
					return false;
				}

		if(inObject.partnerPosition == null && obj.partnerPosition == null){}
		else
			if(inObject.partnerPosition == null || obj.partnerPosition == null) return false;
			else
				if ( ! inObject.partnerPosition.equals(obj.partnerPosition)){
					return false;
				}

		if(inObject.partnerFIO == null && obj.partnerFIO == null){}
		else
			if(inObject.partnerFIO == null || obj.partnerFIO == null) return false;
			else
				if ( ! inObject.partnerFIO.equals(obj.partnerFIO)){
					return false;
				}

		if(inObject.partnerAddress == null && obj.partnerAddress == null){}
		else
			if(inObject.partnerAddress == null || obj.partnerAddress == null) return false;
			else
				if ( ! inObject.partnerAddress.equals(obj.partnerAddress)){
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
		if(inObject.contractTerm == null && obj.contractTerm == null){} else 
			if(inObject.contractTerm == null || obj.contractTerm == null) return false;
			else
				if (inObject.contractTerm.compareTo(obj.contractTerm) != 0){
					return false;
				}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.agreementWarrantRef.code != obj.agreementWarrantRef.code){
			return false;
		}
		if (inObject.actWarrantRef.code != obj.actWarrantRef.code){
			return false;
		}
		if (inObject.servicesFromSideRef.code != obj.servicesFromSideRef.code){
			return false;
		}
		if (inObject.techAgrKindRef.code != obj.techAgrKindRef.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENTechAgreement2ServicesObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTechAgreement2ServicesObject anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTECHAGRMNT2SRVCSBJCT (CODE,PARTNERNAME,PARTNERCODE,PARTNEROKPO,BANKNAME,BANKMFO,BANKRSCHET,CONTRACTNUMBER,CONTRACTDATE,FINDOCCODE,FINDOCID,COMMENTGEN,OBJECTNAME,COSTWORKS,COSTWORKSNDS,BASISFORACTION,ACTNUMBER,ACTDATE,EXECUTORTAXTYPE,AREA,PARTNERPOSITION,PARTNERFIO,PARTNERADDRESS,USERGEN,DATEEDIT,MODIFY_TIME,CONTRACTTERM,SERVICESOBJECTREFCODE,AGREEMENTWARRANTREFCOD,ACTWARRANTREFCODE,SERVICESFROMSIDEREFCOD,TECHAGRKINDREFCODE,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.partnerName);
			statement.setString(3,anObject.partnerCode);
			statement.setString(4,anObject.partnerOkpo);
			statement.setString(5,anObject.bankName);
			statement.setString(6,anObject.bankMfo);
			statement.setString(7,anObject.bankRSchet);
			statement.setString(8,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(9,null);
			} else {
				statement.setDate(9,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(10,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(11,anObject.finDocID);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			statement.setString(12,anObject.commentGen);
			statement.setString(13,anObject.objectName);
			if (anObject.costWorks != null) {
				anObject.costWorks = anObject.costWorks.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.costWorks);
			if (anObject.costWorksNDS != null) {
				anObject.costWorksNDS = anObject.costWorksNDS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15,anObject.costWorksNDS);
			statement.setString(16,anObject.basisForAction);
			statement.setString(17,anObject.actNumber);
			if (anObject.actDate == null) {
				statement.setDate(18,null);
			} else {
				statement.setDate(18,new java.sql.Date(anObject.actDate.getTime()));
			}
			statement.setString(19,anObject.executorTaxType);
			if (anObject.area != null) {
				anObject.area = anObject.area.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20,anObject.area);
			statement.setString(21,anObject.partnerPosition);
			statement.setString(22,anObject.partnerFIO);
			statement.setString(23,anObject.partnerAddress);
			statement.setString(24,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(25,null);
			} else {
				statement.setTimestamp(25,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(26,null);
			} else {
				statement.setBigDecimal(26,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.contractTerm == null) {
				statement.setDate(27,null);
			} else {
				statement.setDate(27,new java.sql.Date(anObject.contractTerm.getTime()));
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(28,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(28,java.sql.Types.INTEGER);
			}
			if (anObject.agreementWarrantRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.agreementWarrantRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject.agreementWarrantRef.code%} = {%"+anObject.agreementWarrantRef.code+"%}");
				}
				statement.setInt(29,anObject.agreementWarrantRef.code);
			} else {
				statement.setNull(29,java.sql.Types.INTEGER);
			}
			if (anObject.actWarrantRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.actWarrantRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject.actWarrantRef.code%} = {%"+anObject.actWarrantRef.code+"%}");
				}
				statement.setInt(30,anObject.actWarrantRef.code);
			} else {
				statement.setNull(30,java.sql.Types.INTEGER);
			}
			if (anObject.servicesFromSideRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesFromSideObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesFromSideRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject.servicesFromSideRef.code%} = {%"+anObject.servicesFromSideRef.code+"%}");
				}
				statement.setInt(31,anObject.servicesFromSideRef.code);
			} else {
				statement.setNull(31,java.sql.Types.INTEGER);
			}
			if (anObject.techAgrKindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENTechAgr2SOKindDAOGen(connection,getUserProfile()).exists(anObject.techAgrKindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject.techAgrKindRef.code%} = {%"+anObject.techAgrKindRef.code+"%}");
				}
				statement.setInt(32,anObject.techAgrKindRef.code);
			} else {
				statement.setNull(32,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(33,anObject.generalContractRef.code);
			} else {
				statement.setNull(33,java.sql.Types.INTEGER);
			}			


			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTechAgreement2ServicesObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTechAgreement2ServicesObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTechAgreement2ServicesObject anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTechAgreement2ServicesObject oldObject = new ENTechAgreement2ServicesObject();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTechAgreement2ServicesObject.modify_time_Field+" FROM  ENTECHAGRMNT2SRVCSBJCT WHERE CODE = ?";
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

			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
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
					if(fieldNameStr.compareTo("PARTNEROKPO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BANKNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BANKMFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BANKRSCHET") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
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
					if(fieldNameStr.compareTo("OBJECTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTWORKS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTWORKSNDS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BASISFORACTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORTAXTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AREA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERADDRESS") == 0) {
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTTERM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AGREEMENTWARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTWARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESFROMSIDEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHAGRKINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENERALCONTRACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTECHAGRMNT2SRVCSBJCT SET  PARTNERNAME = ? , PARTNERCODE = ? , PARTNEROKPO = ? , BANKNAME = ? , BANKMFO = ? , BANKRSCHET = ? , CONTRACTNUMBER = ? , CONTRACTDATE = ? , FINDOCCODE = ? , FINDOCID = ? , COMMENTGEN = ? , OBJECTNAME = ? , COSTWORKS = ? , COSTWORKSNDS = ? , BASISFORACTION = ? , ACTNUMBER = ? , ACTDATE = ? , EXECUTORTAXTYPE = ? , AREA = ? , PARTNERPOSITION = ? , PARTNERFIO = ? , PARTNERADDRESS = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , CONTRACTTERM = ? , SERVICESOBJECTREFCODE = ? , AGREEMENTWARRANTREFCOD = ? , ACTWARRANTREFCODE = ? , SERVICESFROMSIDEREFCOD = ? , TECHAGRKINDREFCODE = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTECHAGREEMENT2SERVICESOBJECT SET ";
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
					statement.setString(1,anObject.partnerName);
					statement.setString(2,anObject.partnerCode);
					statement.setString(3,anObject.partnerOkpo);
					statement.setString(4,anObject.bankName);
					statement.setString(5,anObject.bankMfo);
					statement.setString(6,anObject.bankRSchet);
					statement.setString(7,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(8,null);
					} else {
						statement.setDate(8,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(9,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.finDocID);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					statement.setString(11,anObject.commentGen);
					statement.setString(12,anObject.objectName);
					if (anObject.costWorks != null) {
						anObject.costWorks = anObject.costWorks.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.costWorks);
					if (anObject.costWorksNDS != null) {
						anObject.costWorksNDS = anObject.costWorksNDS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14,anObject.costWorksNDS);
					statement.setString(15,anObject.basisForAction);
					statement.setString(16,anObject.actNumber);
					if (anObject.actDate == null) {
						statement.setDate(17,null);
					} else {
						statement.setDate(17,new java.sql.Date(anObject.actDate.getTime()));
					}
					statement.setString(18,anObject.executorTaxType);
					if (anObject.area != null) {
						anObject.area = anObject.area.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19,anObject.area);
					statement.setString(20,anObject.partnerPosition);
					statement.setString(21,anObject.partnerFIO);
					statement.setString(22,anObject.partnerAddress);
					statement.setString(23,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(24,null);
					} else {
						statement.setTimestamp(24,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(25,null);
					} else {
						statement.setBigDecimal(25,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.contractTerm == null) {
						statement.setDate(26,null);
					} else {
						statement.setDate(26,new java.sql.Date(anObject.contractTerm.getTime()));
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(27,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(27,java.sql.Types.INTEGER);
					}
					if (anObject.agreementWarrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(28,anObject.agreementWarrantRef.code);
					} else {
						statement.setNull(28,java.sql.Types.INTEGER);
					}
					if (anObject.actWarrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(29,anObject.actWarrantRef.code);
					} else {
						statement.setNull(29,java.sql.Types.INTEGER);
					}
					if (anObject.servicesFromSideRef.code != Integer.MIN_VALUE) {
						statement.setInt(30,anObject.servicesFromSideRef.code);
					} else {
						statement.setNull(30,java.sql.Types.INTEGER);
					}
					if (anObject.techAgrKindRef.code != Integer.MIN_VALUE) {
						statement.setInt(31,anObject.techAgrKindRef.code);
					} else {
						statement.setNull(31,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(32,anObject.generalContractRef.code);
					} else {
						statement.setNull(32,java.sql.Types.INTEGER);
					}
					statement.setInt(33,anObject.code);
			
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerName);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerCode);
							continue;
						}
						if("PARTNEROKPO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerOkpo);
							continue;
						}
						if("BANKNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.bankName);
							continue;
						}
						if("BANKMFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.bankMfo);
							continue;
						}
						if("BANKRSCHET".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.bankRSchet);
							continue;
						}
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
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finDocCode);
							continue;
						}
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocID);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("OBJECTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.objectName);
							continue;
						}
						if("COSTWORKS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWorks != null) {
								anObject.costWorks = anObject.costWorks.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costWorks);
							continue;
						}
						if("COSTWORKSNDS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWorksNDS != null) {
								anObject.costWorksNDS = anObject.costWorksNDS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costWorksNDS);
							continue;
						}
						if("BASISFORACTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.basisForAction);
							continue;
						}
						if("ACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.actNumber);
							continue;
						}
						if("ACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.actDate.getTime()));
							}
							continue;
						}
						if("EXECUTORTAXTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.executorTaxType);
							continue;
						}
						if("AREA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.area != null) {
								anObject.area = anObject.area.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.area);
							continue;
						}
						if("PARTNERPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerPosition);
							continue;
						}
						if("PARTNERFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerFIO);
							continue;
						}
						if("PARTNERADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerAddress);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
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
						if("CONTRACTTERM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractTerm == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractTerm.getTime()));
							}
							continue;
						}
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesObjectRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("AGREEMENTWARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.agreementWarrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.agreementWarrantRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACTWARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actWarrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actWarrantRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVICESFROMSIDEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesFromSideRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesFromSideRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TECHAGRKINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techAgrKindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.techAgrKindRef.code);
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

	} // end of save(ENTechAgreement2ServicesObject anObject,String[] anAttributes)


	public ENTechAgreement2ServicesObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTechAgreement2ServicesObject filterObject = new ENTechAgreement2ServicesObject();
		Vector<ENTechAgreement2ServicesObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTechAgreement2ServicesObjectShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTechAgreement2ServicesObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerOkpo, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bankName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bankMfo, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bankRSchet, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.objectName, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWorks, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWorksNDS, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.basisForAction, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.actNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.actDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorTaxType, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.area, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerPosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerAddress, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractTerm, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.agreementWarrantRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actWarrantRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesFromSideRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techAgrKindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTechAgreement2ServicesObjectFilter filter) {
		String out = buildCondition((ENTechAgreement2ServicesObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTechAgreement2ServicesObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTechAgreement2ServicesObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENTechAgreement2ServicesObject.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENTechAgreement2ServicesObject.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerOkpo, ENTechAgreement2ServicesObject.partnerOkpo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bankName, ENTechAgreement2ServicesObject.bankName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bankMfo, ENTechAgreement2ServicesObject.bankMfo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bankRSchet, ENTechAgreement2ServicesObject.bankRSchet_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENTechAgreement2ServicesObject.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENTechAgreement2ServicesObject.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENTechAgreement2ServicesObject.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENTechAgreement2ServicesObject.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENTechAgreement2ServicesObject.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectName, ENTechAgreement2ServicesObject.objectName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWorks, ENTechAgreement2ServicesObject.costWorks_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWorksNDS, ENTechAgreement2ServicesObject.costWorksNDS_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.basisForAction, ENTechAgreement2ServicesObject.basisForAction_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.actNumber, ENTechAgreement2ServicesObject.actNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actDate, ENTechAgreement2ServicesObject.actDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorTaxType, ENTechAgreement2ServicesObject.executorTaxType_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.area, ENTechAgreement2ServicesObject.area_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerPosition, ENTechAgreement2ServicesObject.partnerPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerFIO, ENTechAgreement2ServicesObject.partnerFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerAddress, ENTechAgreement2ServicesObject.partnerAddress_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENTechAgreement2ServicesObject.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENTechAgreement2ServicesObject.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTechAgreement2ServicesObject.modify_time_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractTerm, ENTechAgreement2ServicesObject.contractTerm_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENTechAgreement2ServicesObject.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.agreementWarrantRef.code, ENTechAgreement2ServicesObject.agreementWarrantRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actWarrantRef.code, ENTechAgreement2ServicesObject.actWarrantRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesFromSideRef.code, ENTechAgreement2ServicesObject.servicesFromSideRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techAgrKindRef.code, ENTechAgreement2ServicesObject.techAgrKindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENTechAgreement2ServicesObject.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENTechAgreement2ServicesObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTechAgreement2ServicesObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTechAgreement2ServicesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTechAgreement2ServicesObjectShortList getFilteredList(ENTechAgreement2ServicesObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(ENTechAgreement2ServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(ENTechAgreement2ServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(ENTechAgreement2ServicesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(ENTechAgreement2ServicesObjectFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTechAgreement2ServicesObjectShortList getScrollableFilteredList(ENTechAgreement2ServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTechAgreement2ServicesObjectShortList result = new ENTechAgreement2ServicesObjectShortList();
		ENTechAgreement2ServicesObjectShort anObject;
		result.list = new Vector<ENTechAgreement2ServicesObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHAGRMNT2SRVCSBJCT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTECHAGRMNT2SRVCSBJCT.CODE"+
			",ENTECHAGRMNT2SRVCSBJCT.PARTNERNAME"+
			",ENTECHAGRMNT2SRVCSBJCT.PARTNERCODE"+
			",ENTECHAGRMNT2SRVCSBJCT.PARTNEROKPO"+
			",ENTECHAGRMNT2SRVCSBJCT.BANKNAME"+
			",ENTECHAGRMNT2SRVCSBJCT.BANKMFO"+
			",ENTECHAGRMNT2SRVCSBJCT.BANKRSCHET"+
			",ENTECHAGRMNT2SRVCSBJCT.CONTRACTNUMBER"+
			",ENTECHAGRMNT2SRVCSBJCT.CONTRACTDATE"+
			",ENTECHAGRMNT2SRVCSBJCT.FINDOCCODE"+
			",ENTECHAGRMNT2SRVCSBJCT.FINDOCID"+
			",ENTECHAGRMNT2SRVCSBJCT.COMMENTGEN"+
			",ENTECHAGRMNT2SRVCSBJCT.OBJECTNAME"+
			",ENTECHAGRMNT2SRVCSBJCT.COSTWORKS"+
			",ENTECHAGRMNT2SRVCSBJCT.COSTWORKSNDS"+
			",ENTECHAGRMNT2SRVCSBJCT.BASISFORACTION"+
			",ENTECHAGRMNT2SRVCSBJCT.ACTNUMBER"+
			",ENTECHAGRMNT2SRVCSBJCT.ACTDATE"+
			",ENTECHAGRMNT2SRVCSBJCT.EXECUTORTAXTYPE"+
			",ENTECHAGRMNT2SRVCSBJCT.AREA"+
			",ENTECHAGRMNT2SRVCSBJCT.PARTNERPOSITION"+
			",ENTECHAGRMNT2SRVCSBJCT.PARTNERFIO"+
			",ENTECHAGRMNT2SRVCSBJCT.PARTNERADDRESS"+
			",ENTECHAGRMNT2SRVCSBJCT.USERGEN"+
			",ENTECHAGRMNT2SRVCSBJCT.DATEEDIT"+
			",ENTECHAGRMNT2SRVCSBJCT.CONTRACTTERM"+
			", ENSERVICESOBJECT.CODE " +
			", ENSERVICESOBJECT.CONTRACTNUMBER " +
			", ENSERVICESOBJECT.CONTRACTDATE " +
			", ENSERVICESOBJECT.NAME " +
			", ENSERVICESOBJECT.PARTNERCODE " +
			", ENSERVICESOBJECT.FINDOCCODE " +
			", ENSERVICESOBJECT.FINDOCID " +
			", ENSERVICESOBJECT.COMMENTGEN " +
			", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
			", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
			", ENSERVICESOBJECT.CONTRAGENTNAME " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
			", ENSERVICESOBJECT.CONTRAGENTOKPO " +
			", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
			", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
			", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
			", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
			", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
			", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
			", ENSERVICESOBJECT.USERGEN " +
			", ENSERVICESOBJECT.DATEEDIT " +
			", ENSERVICESOBJECT.WARRANTDATE " +
			", ENSERVICESOBJECT.WARRANTNUMBER " +
			", ENSERVICESOBJECT.WARRANTFIO " +
			", ENSERVICESOBJECT.REGIONALTYPE " +
			", ENSERVICESOBJECT.BASISTYPE " +
			", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
			", ENSERVICESOBJECT.EXECUTEWORKDATE " +
			", ENSERVICESOBJECT.TIMESTART " +
			", ENSERVICESOBJECT.TIMEFINAL " +
			", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
			", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
			", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
			", ENSERVICESOBJECT.ISNOPAY " +
			", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
			", ENSERVICESOBJECT.PAYDATE " +
			", ENSERVICESOBJECT.FINPAYFORMCODE " +
			", ENSERVICESOBJECT.FINPAYFORMNAME " +
			", ENSERVICESOBJECT.PARTNERID " +
			", ENSERVICESOBJECT.PAYDETAIL " +
			", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
			", ENSERVICESOBJECT.ACTTRANSFERDATE " +
			", ENSERVICESOBJECT.RESPOSIBLE " +
			", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
			", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
			", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
			", ENSERVICESOBJECT.RECONNECTIONTU " +
			", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
			", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
			", ENSERVICESOBJECT.TABNUMBER " +
			", ENSERVICESOBJECT.CITIESLIST " +
			", ENSERVICESOBJECT.LINELENGTH " +
			", ENSERVICESOBJECT.PROJECTCODE " +
			", ENSERVICESOBJECT.CNPACKCODE " +
			", ENSERVICESOBJECT.DFPACKCODE " +
			", ENSERVICESOBJECT.COUNTERSZONETYPE " +
			", ENSERVICESOBJECT.AXPARTNERCODE " +
			", ENSERVICESOBJECT.AXPARTNERNAME " +
			", ENSERVICESOBJECT.AXCONTRACTNUMBER " +
			", ENSERVICESOBJECT.AXCONTRACTDATE " +
			", ENSERVICESOBJECT.AXCONTRACTCODE " +
			", ENSERVICESOBJECT.AXCONTRACTID " +
			", ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN " +
			", ENSERVICESOBJECT.PROJAGREESUMMA " +
			", ENSERVICESOBJECT.TOPOGRAPHYSUMMA " +
			", ENSERVICESOBJECT.CREATEDFROMSITE " +
			", ENSERVICESOBJECT.TERM " +
			", ENSERVICESOBJECT.REGULATION " +
			", ENSERVICESOBJECT.BOUNDARYDATEWORK " +
			", ENSERVICESOBJECT.COUNTDAYDELAY " +
			", ENSERVICESOBJECT.FACTDATEWORK " +
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
			", ENSERVICESFROMSIDEBJCT.CODE " +
			", ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER " +
			", ENSERVICESFROMSIDEBJCT.CONTRACTDATE " +
			", ENSERVICESFROMSIDEBJCT.NAME " +
			", ENSERVICESFROMSIDEBJCT.PARTNERCODE " +
			", ENSERVICESFROMSIDEBJCT.FINDOCCODE " +
			", ENSERVICESFROMSIDEBJCT.FINDOCID " +
			", ENSERVICESFROMSIDEBJCT.COMMENTGEN " +
			", ENSERVICESFROMSIDEBJCT.USERGEN " +
			", ENSERVICESFROMSIDEBJCT.DATEEDIT " +
			", ENTECHAGR2SOKIND.CODE " +
			", ENTECHAGR2SOKIND.NAME " +
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
		" FROM ENTECHAGRMNT2SRVCSBJCT " +
			", ENSERVICESOBJECT " +
			", ENWARRANT " +
			", ENWARRANT " +
			", ENSERVICESFROMSIDEBJCT " +
			", ENTECHAGR2SOKIND " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENSERVICESOBJECT.CODE = ENTECHAGRMNT2SRVCSBJCT.SERVICESOBJECTREFCODE" ; //+
		whereStr += " AND ENWARRANT.CODE = ENTECHAGRMNT2SRVCSBJCT.AGREEMENTWARRANTREFCOD" ; //+
		whereStr += " AND ENWARRANT.CODE = ENTECHAGRMNT2SRVCSBJCT.ACTWARRANTREFCODE" ; //+
		whereStr += " AND ENSERVICESFROMSIDEBJCT.CODE = ENTECHAGRMNT2SRVCSBJCT.SERVICESFROMSIDEREFCOD" ; //+
		whereStr += " AND ENTECHAGR2SOKIND.CODE = ENTECHAGRMNT2SRVCSBJCT.TECHAGRKINDREFCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENTECHAGRMNT2SRVCSBJCT.GENERALCONTRACTREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

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
				anObject = new ENTechAgreement2ServicesObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.partnerName = set.getString(2);
				anObject.partnerCode = set.getString(3);
				anObject.partnerOkpo = set.getString(4);
				anObject.bankName = set.getString(5);
				anObject.bankMfo = set.getString(6);
				anObject.bankRSchet = set.getString(7);
				anObject.contractNumber = set.getString(8);
				anObject.contractDate = set.getDate(9);
				anObject.finDocCode = set.getString(10);
				anObject.finDocID = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(12);
				anObject.objectName = set.getString(13);
				anObject.costWorks = set.getBigDecimal(14);
				if(anObject.costWorks != null) {
					anObject.costWorks = anObject.costWorks.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWorksNDS = set.getBigDecimal(15);
				if(anObject.costWorksNDS != null) {
					anObject.costWorksNDS = anObject.costWorksNDS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.basisForAction = set.getString(16);
				anObject.actNumber = set.getString(17);
				anObject.actDate = set.getDate(18);
				anObject.executorTaxType = set.getString(19);
				anObject.area = set.getBigDecimal(20);
				if(anObject.area != null) {
					anObject.area = anObject.area.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.partnerPosition = set.getString(21);
				anObject.partnerFIO = set.getString(22);
				anObject.partnerAddress = set.getString(23);
				anObject.userGen = set.getString(24);
				anObject.dateEdit = set.getTimestamp(25);
				anObject.contractTerm = set.getDate(26);

				anObject.servicesObjectRefCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(28);
				anObject.servicesObjectRefContractDate = set.getDate(29);
				anObject.servicesObjectRefName = set.getString(30);
				anObject.servicesObjectRefPartnerCode = set.getString(31);
				anObject.servicesObjectRefFinDocCode = set.getString(32);
				anObject.servicesObjectRefFinDocID = set.getInt(33);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(34);
				anObject.servicesObjectRefContractNumberServices = set.getString(35);
				anObject.servicesObjectRefContractDateServices = set.getDate(36);
				anObject.servicesObjectRefContragentName = set.getString(37);
				anObject.servicesObjectRefContragentAddress = set.getString(38);
				anObject.servicesObjectRefContragentAddressWork = set.getString(39);
				anObject.servicesObjectRefContragentOkpo = set.getString(40);
				anObject.servicesObjectRefContragentBankAccount = set.getString(41);
				anObject.servicesObjectRefContragentBankName = set.getString(42);
				anObject.servicesObjectRefContragentBankMfo = set.getString(43);
				anObject.servicesObjectRefContragentBossName = set.getString(44);
				anObject.servicesObjectRefContragentPassport = set.getString(45);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(46);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(48);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(49);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(50);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(51);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(52);
				anObject.servicesObjectRefDateEdit = set.getDate(53);
				anObject.servicesObjectRefWarrantDate = set.getDate(54);
				anObject.servicesObjectRefWarrantNumber = set.getString(55);
				anObject.servicesObjectRefWarrantFIO = set.getString(56);
				anObject.servicesObjectRefRegionalType = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(58);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(59);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(60);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(61);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(62);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(63);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(64);
				anObject.servicesObjectRefContragentObjectWork = set.getString(65);
				anObject.servicesObjectRefIsNoPay = set.getInt(66);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(68);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(70);
				anObject.servicesObjectRefPartnerId = set.getInt(71);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(72);
				anObject.servicesObjectRefActTransferNumber = set.getString(73);
				anObject.servicesObjectRefActTransferDate = set.getDate(74);
				anObject.servicesObjectRefResposible = set.getString(75);
				anObject.servicesObjectRefResposiblePosition = set.getString(76);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(77);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(78);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(81);
				anObject.servicesObjectRefTabNumber = set.getString(82);
				anObject.servicesObjectRefCitiesList = set.getString(83);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(84);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(85);
				anObject.servicesObjectRefCnPackCode = set.getInt(86);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(88);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(89);
				anObject.servicesObjectRefAxPartnerName = set.getString(90);
				anObject.servicesObjectRefAxContractNumber = set.getString(91);
				anObject.servicesObjectRefAxContractDate = set.getDate(92);
				anObject.servicesObjectRefAxContractCode = set.getString(93);
				anObject.servicesObjectRefAxContractId = set.getString(94);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(95);
	
				anObject.agreementWarrantRefCode = set.getInt(104);
				if(set.wasNull()) {
					anObject.agreementWarrantRefCode = Integer.MIN_VALUE;
				}
				anObject.agreementWarrantRefNumbergen = set.getString(105);
				anObject.agreementWarrantRefName = set.getString(106);
				anObject.agreementWarrantRefWarrantFIO = set.getString(107);
				anObject.agreementWarrantRefWarrantShortFIO = set.getString(108);
				anObject.agreementWarrantRefWarrantPosition = set.getString(109);
				anObject.agreementWarrantRefGenitiveFIO = set.getString(110);
				anObject.agreementWarrantRefGenitivePosition = set.getString(111);
				anObject.agreementWarrantRefPassport = set.getString(112);
				anObject.agreementWarrantRefAddress = set.getString(113);
				anObject.agreementWarrantRefPower = set.getInt(114);
				if(set.wasNull()) {
					anObject.agreementWarrantRefPower = Integer.MIN_VALUE;
				}
				anObject.agreementWarrantRefMaxSum = set.getBigDecimal(115);
				if(anObject.agreementWarrantRefMaxSum != null) {
					anObject.agreementWarrantRefMaxSum = anObject.agreementWarrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actWarrantRefCode = set.getInt(116);
				if(set.wasNull()) {
					anObject.actWarrantRefCode = Integer.MIN_VALUE;
				}
				anObject.actWarrantRefNumbergen = set.getString(117);
				anObject.actWarrantRefName = set.getString(118);
				anObject.actWarrantRefWarrantFIO = set.getString(119);
				anObject.actWarrantRefWarrantShortFIO = set.getString(120);
				anObject.actWarrantRefWarrantPosition = set.getString(121);
				anObject.actWarrantRefGenitiveFIO = set.getString(122);
				anObject.actWarrantRefGenitivePosition = set.getString(123);
				anObject.actWarrantRefPassport = set.getString(124);
				anObject.actWarrantRefAddress = set.getString(125);
				anObject.actWarrantRefPower = set.getInt(126);
				if(set.wasNull()) {
					anObject.actWarrantRefPower = Integer.MIN_VALUE;
				}
				anObject.actWarrantRefMaxSum = set.getBigDecimal(127);
				if(anObject.actWarrantRefMaxSum != null) {
					anObject.actWarrantRefMaxSum = anObject.actWarrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesFromSideRefCode = set.getInt(128);
				if(set.wasNull()) {
					anObject.servicesFromSideRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesFromSideRefContractNumber = set.getString(129);
				anObject.servicesFromSideRefContractDate = set.getDate(130);
				anObject.servicesFromSideRefName = set.getString(131);
				anObject.servicesFromSideRefPartnerCode = set.getString(132);
				anObject.servicesFromSideRefFinDocCode = set.getString(133);
				anObject.servicesFromSideRefFinDocID = set.getInt(134);
				if(set.wasNull()) {
					anObject.servicesFromSideRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesFromSideRefCommentGen = set.getString(135);
				anObject.servicesFromSideRefUserGen = set.getString(136);
				anObject.servicesFromSideRefDateEdit = set.getDate(137);
				anObject.techAgrKindRefCode = set.getInt(138);
				if(set.wasNull()) {
					anObject.techAgrKindRefCode = Integer.MIN_VALUE;
				}
				anObject.techAgrKindRefName = set.getString(139);
				anObject.generalContractRefCode = set.getInt(140);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(141);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(142);
				anObject.generalContractRefContractNumber = set.getString(143);
				anObject.generalContractRefContractDate = set.getDate(144);
				anObject.generalContractRefCommentGen = set.getString(145);
				anObject.generalContractRefPartnerId = set.getInt(146);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(147);
				anObject.generalContractRefPartnerName = set.getString(148);
				anObject.generalContractRefContractRegDate = set.getDate(149);
				anObject.generalContractRefContractStartDate = set.getDate(150);
				anObject.generalContractRefContractEndDate = set.getDate(151);
				anObject.generalContractRefAxContractId = set.getString(152);
				anObject.generalContractRefAxContractCode = set.getString(153);
				anObject.generalContractRefAxContractNumber = set.getString(154);
				anObject.generalContractRefAxContractAccount = set.getString(155);
				anObject.generalContractRefAxContractDate = set.getDate(156);
				anObject.generalContractRefAxContractCommentGen = set.getString(157);
				anObject.generalContractRefAxContractGroupCode = set.getString(158);
				anObject.generalContractRefAxPartnerCode = set.getString(159);
				anObject.generalContractRefAxPartnerName = set.getString(160);
				anObject.generalContractRefUserGen = set.getString(161);				

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
	
	public int[] getFilteredCodeArray(ENTechAgreement2ServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTechAgreement2ServicesObjectFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTechAgreement2ServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTECHAGRMNT2SRVCSBJCT.CODE FROM ENTECHAGRMNT2SRVCSBJCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHAGRMNT2SRVCSBJCT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
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

	public ENTechAgreement2ServicesObject getObject(int uid) throws PersistenceException {
		ENTechAgreement2ServicesObject result = new ENTechAgreement2ServicesObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENTechAgreement2ServicesObject anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENTECHAGRMNT2SRVCSBJCT.CODE, ENTECHAGRMNT2SRVCSBJCT.PARTNERNAME, ENTECHAGRMNT2SRVCSBJCT.PARTNERCODE, ENTECHAGRMNT2SRVCSBJCT.PARTNEROKPO, ENTECHAGRMNT2SRVCSBJCT.BANKNAME, ENTECHAGRMNT2SRVCSBJCT.BANKMFO, ENTECHAGRMNT2SRVCSBJCT.BANKRSCHET, ENTECHAGRMNT2SRVCSBJCT.CONTRACTNUMBER, ENTECHAGRMNT2SRVCSBJCT.CONTRACTDATE, ENTECHAGRMNT2SRVCSBJCT.FINDOCCODE, ENTECHAGRMNT2SRVCSBJCT.FINDOCID, ENTECHAGRMNT2SRVCSBJCT.COMMENTGEN, ENTECHAGRMNT2SRVCSBJCT.OBJECTNAME, ENTECHAGRMNT2SRVCSBJCT.COSTWORKS, ENTECHAGRMNT2SRVCSBJCT.COSTWORKSNDS, ENTECHAGRMNT2SRVCSBJCT.BASISFORACTION, ENTECHAGRMNT2SRVCSBJCT.ACTNUMBER, ENTECHAGRMNT2SRVCSBJCT.ACTDATE, ENTECHAGRMNT2SRVCSBJCT.EXECUTORTAXTYPE, ENTECHAGRMNT2SRVCSBJCT.AREA, ENTECHAGRMNT2SRVCSBJCT.PARTNERPOSITION, ENTECHAGRMNT2SRVCSBJCT.PARTNERFIO, ENTECHAGRMNT2SRVCSBJCT.PARTNERADDRESS, ENTECHAGRMNT2SRVCSBJCT.USERGEN, ENTECHAGRMNT2SRVCSBJCT.DATEEDIT, ENTECHAGRMNT2SRVCSBJCT.MODIFY_TIME, ENTECHAGRMNT2SRVCSBJCT.CONTRACTTERM, ENTECHAGRMNT2SRVCSBJCT.SERVICESOBJECTREFCODE, ENTECHAGRMNT2SRVCSBJCT.AGREEMENTWARRANTREFCOD, ENTECHAGRMNT2SRVCSBJCT.ACTWARRANTREFCODE, ENTECHAGRMNT2SRVCSBJCT.SERVICESFROMSIDEREFCOD, ENTECHAGRMNT2SRVCSBJCT.TECHAGRKINDREFCODE, ENTECHAGRMNT2SRVCSBJCT.GENERALCONTRACTREFCODE  "
			+" FROM ENTECHAGRMNT2SRVCSBJCT WHERE ENTECHAGRMNT2SRVCSBJCT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.partnerName = set.getString(2);
				anObject.partnerCode = set.getString(3);
				anObject.partnerOkpo = set.getString(4);
				anObject.bankName = set.getString(5);
				anObject.bankMfo = set.getString(6);
				anObject.bankRSchet = set.getString(7);
				anObject.contractNumber = set.getString(8);
				anObject.contractDate = set.getDate(9);
				anObject.finDocCode = set.getString(10);
				anObject.finDocID = set.getInt(11);
				if (set.wasNull()) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(12);
				anObject.objectName = set.getString(13);
				anObject.costWorks = set.getBigDecimal(14);
				if(anObject.costWorks != null) {
					anObject.costWorks = anObject.costWorks.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWorksNDS = set.getBigDecimal(15);
				if(anObject.costWorksNDS != null) {
					anObject.costWorksNDS = anObject.costWorksNDS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.basisForAction = set.getString(16);
				anObject.actNumber = set.getString(17);
				anObject.actDate = set.getDate(18);
				anObject.executorTaxType = set.getString(19);
				anObject.area = set.getBigDecimal(20);
				if(anObject.area != null) {
					anObject.area = anObject.area.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.partnerPosition = set.getString(21);
				anObject.partnerFIO = set.getString(22);
				anObject.partnerAddress = set.getString(23);
				anObject.userGen = set.getString(24);
				anObject.dateEdit = set.getTimestamp(25);
				anObject.modify_time = set.getLong(26);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.contractTerm = set.getDate(27);
				anObject.servicesObjectRef.code = set.getInt(28);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.agreementWarrantRef.code = set.getInt(29);
				if (set.wasNull()) {
					anObject.agreementWarrantRef.code = Integer.MIN_VALUE;
				}
				anObject.actWarrantRef.code = set.getInt(30);
				if (set.wasNull()) {
					anObject.actWarrantRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesFromSideRef.code = set.getInt(31);
				if (set.wasNull()) {
					anObject.servicesFromSideRef.code = Integer.MIN_VALUE;
				}
				anObject.techAgrKindRef.code = set.getInt(32);
				if (set.wasNull()) {
					anObject.techAgrKindRef.code = Integer.MIN_VALUE;
				}
				anObject.generalContractRef.code = set.getInt(33);
				if (set.wasNull()) {
					anObject.generalContractRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
				}
				if(anObject.agreementWarrantRef.code != Integer.MIN_VALUE) {
					anObject.setAgreementWarrantRef(
						new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.agreementWarrantRef.code));
				}
				if(anObject.actWarrantRef.code != Integer.MIN_VALUE) {
					anObject.setActWarrantRef(
						new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.actWarrantRef.code));
				}
				if(anObject.servicesFromSideRef.code != Integer.MIN_VALUE) {
					anObject.setServicesFromSideRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesFromSideObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesFromSideRef.code));
				}
				if(anObject.techAgrKindRef.code != Integer.MIN_VALUE) {
					anObject.setTechAgrKindRef(
						new com.ksoe.energynet.dataminer.generated.ENTechAgr2SOKindDAOGen(connection,getUserProfile()).getRef(anObject.techAgrKindRef.code));
				}
				if(anObject.generalContractRef.code != Integer.MIN_VALUE) {
					anObject.setGeneralContractRef(
						new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).getRef(anObject.generalContractRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENTechAgreement2ServicesObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTechAgreement2ServicesObjectRef ref = new com.ksoe.energynet.valueobject.references.ENTechAgreement2ServicesObjectRef();
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

		selectStr = "DELETE FROM  ENTECHAGRMNT2SRVCSBJCT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTechAgreement2ServicesObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTechAgreement2ServicesObject.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTechAgreement2ServicesObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENTechAgreement2ServicesObject.remove%} access denied");
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
	
	public long count(ENTechAgreement2ServicesObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTechAgreement2ServicesObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTechAgreement2ServicesObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTECHAGRMNT2SRVCSBJCT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTechAgreement2ServicesObjectFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTECHAGRMNT2SRVCSBJCT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechAgreement2ServicesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechAgreement2ServicesObject.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENTECHAGRMNT2SRVCSBJCT.CODE FROM  ENTECHAGRMNT2SRVCSBJCT WHERE  ENTECHAGRMNT2SRVCSBJCT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTECHAGRMNT2SRVCSBJCT.CODE");
		_checkConditionToken(condition,"partnername","ENTECHAGRMNT2SRVCSBJCT.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENTECHAGRMNT2SRVCSBJCT.PARTNERCODE");
		_checkConditionToken(condition,"partnerokpo","ENTECHAGRMNT2SRVCSBJCT.PARTNEROKPO");
		_checkConditionToken(condition,"bankname","ENTECHAGRMNT2SRVCSBJCT.BANKNAME");
		_checkConditionToken(condition,"bankmfo","ENTECHAGRMNT2SRVCSBJCT.BANKMFO");
		_checkConditionToken(condition,"bankrschet","ENTECHAGRMNT2SRVCSBJCT.BANKRSCHET");
		_checkConditionToken(condition,"contractnumber","ENTECHAGRMNT2SRVCSBJCT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENTECHAGRMNT2SRVCSBJCT.CONTRACTDATE");
		_checkConditionToken(condition,"findoccode","ENTECHAGRMNT2SRVCSBJCT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENTECHAGRMNT2SRVCSBJCT.FINDOCID");
		_checkConditionToken(condition,"commentgen","ENTECHAGRMNT2SRVCSBJCT.COMMENTGEN");
		_checkConditionToken(condition,"objectname","ENTECHAGRMNT2SRVCSBJCT.OBJECTNAME");
		_checkConditionToken(condition,"costworks","ENTECHAGRMNT2SRVCSBJCT.COSTWORKS");
		_checkConditionToken(condition,"costworksnds","ENTECHAGRMNT2SRVCSBJCT.COSTWORKSNDS");
		_checkConditionToken(condition,"basisforaction","ENTECHAGRMNT2SRVCSBJCT.BASISFORACTION");
		_checkConditionToken(condition,"actnumber","ENTECHAGRMNT2SRVCSBJCT.ACTNUMBER");
		_checkConditionToken(condition,"actdate","ENTECHAGRMNT2SRVCSBJCT.ACTDATE");
		_checkConditionToken(condition,"executortaxtype","ENTECHAGRMNT2SRVCSBJCT.EXECUTORTAXTYPE");
		_checkConditionToken(condition,"area","ENTECHAGRMNT2SRVCSBJCT.AREA");
		_checkConditionToken(condition,"partnerposition","ENTECHAGRMNT2SRVCSBJCT.PARTNERPOSITION");
		_checkConditionToken(condition,"partnerfio","ENTECHAGRMNT2SRVCSBJCT.PARTNERFIO");
		_checkConditionToken(condition,"partneraddress","ENTECHAGRMNT2SRVCSBJCT.PARTNERADDRESS");
		_checkConditionToken(condition,"usergen","ENTECHAGRMNT2SRVCSBJCT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENTECHAGRMNT2SRVCSBJCT.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENTECHAGRMNT2SRVCSBJCT.MODIFY_TIME");
		_checkConditionToken(condition,"contractTerm","ENTECHAGRMNT2SRVCSBJCT.CONTRACTTERM");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"agreementwarrantref","AGREEMENTWARRANTREFCOD");
		_checkConditionToken(condition,"agreementwarrantref.code","AGREEMENTWARRANTREFCOD");
		_checkConditionToken(condition,"actwarrantref","ACTWARRANTREFCODE");
		_checkConditionToken(condition,"actwarrantref.code","ACTWARRANTREFCODE");
		_checkConditionToken(condition,"servicesfromsideref","SERVICESFROMSIDEREFCOD");
		_checkConditionToken(condition,"servicesfromsideref.code","SERVICESFROMSIDEREFCOD");
		_checkConditionToken(condition,"techagrkindref","TECHAGRKINDREFCODE");
		_checkConditionToken(condition,"techagrkindref.code","TECHAGRKINDREFCODE");
		_checkConditionToken(condition,"generalcontractref","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"generalcontractref.code","GENERALCONTRACTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENTechAgreement2ServicesObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTECHAGRMNT2SRVCSBJCT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTECHAGRMNT2SRVCSBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTECHAGRMNT2SRVCSBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTECHAGRMNT2SRVCSBJCT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTechAgreement2ServicesObjectDAO
