
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.energynet.valueobject.ENBuilding;
import com.ksoe.energynet.valueobject.filter.ENBuildingFilter;
import com.ksoe.energynet.valueobject.brief.ENBuildingShort;
import com.ksoe.energynet.valueobject.lists.ENBuildingShortList;


/**
 * DAO Object for ENBuilding;
 *
 */

public class ENBuildingDAOGen extends GenericDataMiner {

	public ENBuildingDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBuildingDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBuilding inObject) throws PersistenceException {
		ENBuilding obj = new ENBuilding();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numbergen == null && obj.numbergen == null){}
		else
			if(inObject.numbergen == null || obj.numbergen == null) return false;
			else
				if ( ! inObject.numbergen.equals(obj.numbergen)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.summaGen == null && obj.summaGen == null){}
		else
			if(inObject.summaGen == null || obj.summaGen == null) return false;
			else
				if ( ! inObject.summaGen.equals(obj.summaGen)){
					return false;
				}

		if(inObject.summaNDS == null && obj.summaNDS == null){}
		else
			if(inObject.summaNDS == null || obj.summaNDS == null) return false;
			else
				if ( ! inObject.summaNDS.equals(obj.summaNDS)){
					return false;
				}

		if(inObject.characteristic == null && obj.characteristic == null){}
		else
			if(inObject.characteristic == null || obj.characteristic == null) return false;
			else
				if ( ! inObject.characteristic.equals(obj.characteristic)){
					return false;
				}

		if(inObject.executedPosition == null && obj.executedPosition == null){}
		else
			if(inObject.executedPosition == null || obj.executedPosition == null) return false;
			else
				if ( ! inObject.executedPosition.equals(obj.executedPosition)){
					return false;
				}

		if(inObject.executedName == null && obj.executedName == null){}
		else
			if(inObject.executedName == null || obj.executedName == null) return false;
			else
				if ( ! inObject.executedName.equals(obj.executedName)){
					return false;
				}

		if(inObject.acceptedPosition == null && obj.acceptedPosition == null){}
		else
			if(inObject.acceptedPosition == null || obj.acceptedPosition == null) return false;
			else
				if ( ! inObject.acceptedPosition.equals(obj.acceptedPosition)){
					return false;
				}

		if(inObject.acceptedName == null && obj.acceptedName == null){}
		else
			if(inObject.acceptedName == null || obj.acceptedName == null) return false;
			else
				if ( ! inObject.acceptedName.equals(obj.acceptedName)){
					return false;
				}

		if(inObject.contractPrice == null && obj.contractPrice == null){}
		else
			if(inObject.contractPrice == null || obj.contractPrice == null) return false;
			else
				if ( ! inObject.contractPrice.equals(obj.contractPrice)){
					return false;
				}

		if(inObject.codeMol == null && obj.codeMol == null){}
		else
			if(inObject.codeMol == null || obj.codeMol == null) return false;
			else
				if ( ! inObject.codeMol.equals(obj.codeMol)){
					return false;
				}

		if(inObject.codePodr == null && obj.codePodr == null){}
		else
			if(inObject.codePodr == null || obj.codePodr == null) return false;
			else
				if ( ! inObject.codePodr.equals(obj.codePodr)){
					return false;
				}

		if(inObject.invNumberOZ == null && obj.invNumberOZ == null){}
		else
			if(inObject.invNumberOZ == null || obj.invNumberOZ == null) return false;
			else
				if ( ! inObject.invNumberOZ.equals(obj.invNumberOZ)){
					return false;
				}

		if(inObject.nameOZ == null && obj.nameOZ == null){}
		else
			if(inObject.nameOZ == null || obj.nameOZ == null) return false;
			else
				if ( ! inObject.nameOZ.equals(obj.nameOZ)){
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

		if (inObject.isInvestProgram != obj.isInvestProgram){
					return false;
				}

		if(inObject.yearInvestProgram == null && obj.yearInvestProgram == null){}
		else
			if(inObject.yearInvestProgram == null || obj.yearInvestProgram == null) return false;
			else
				if ( ! inObject.yearInvestProgram.equals(obj.yearInvestProgram)){
					return false;
				}

		if(inObject.itemInvestProgram == null && obj.itemInvestProgram == null){}
		else
			if(inObject.itemInvestProgram == null || obj.itemInvestProgram == null) return false;
			else
				if ( ! inObject.itemInvestProgram.equals(obj.itemInvestProgram)){
					return false;
				}

		if(inObject.buildingAddress == null && obj.buildingAddress == null){}
		else
			if(inObject.buildingAddress == null || obj.buildingAddress == null) return false;
			else
				if ( ! inObject.buildingAddress.equals(obj.buildingAddress)){
					return false;
				}

		if(inObject.decreeNumber == null && obj.decreeNumber == null){}
		else
			if(inObject.decreeNumber == null || obj.decreeNumber == null) return false;
			else
				if ( ! inObject.decreeNumber.equals(obj.decreeNumber)){
					return false;
				}

		if(inObject.decreeDate == null && obj.decreeDate == null){} else 
			if(inObject.decreeDate == null || obj.decreeDate == null) return false;
			else
				if (inObject.decreeDate.compareTo(obj.decreeDate) != 0){
					return false;
				}

		if (inObject.exploitationTerm != obj.exploitationTerm){
					return false;
				}

		if(inObject.dateLoadExpl == null && obj.dateLoadExpl == null){} else 
			if(inObject.dateLoadExpl == null || obj.dateLoadExpl == null) return false;
			else
				if (inObject.dateLoadExpl.compareTo(obj.dateLoadExpl) != 0){
					return false;
				}

		if(inObject.dateBuild == null && obj.dateBuild == null){} else 
			if(inObject.dateBuild == null || obj.dateBuild == null) return false;
			else
				if (inObject.dateBuild.compareTo(obj.dateBuild) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.invgroupRef.code != obj.invgroupRef.code){
			return false;
		}
		if (inObject.elementRef.code != obj.elementRef.code){
			return false;
		}
		if (inObject.servicesobject.code != obj.servicesobject.code){
			return false;
		}
		return true;
	}

	public int add(ENBuilding anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBuilding anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENBUILDING (CODE,NUMBERGEN,DATEGEN,DATEEDIT,SUMMAGEN,SUMMANDS,CHARACTERISTIC,EXECUTEDPOSITION,EXECUTEDNAME,ACCEPTEDPOSITION,ACCEPTEDNAME,CONTRACTPRICE,CODEMOL,CODEPODR,INVNUMBEROZ,NAMEOZ,FINCONTRACTNUMBER,FINCONTRACTDATE,PARTNERNAME,PARTNERCODE,ISINVESTPROGRAM,YEARINVESTPROGRAM,ITEMINVESTPROGRAM,BUILDINGADDRESS,DECREENUMBER,DECREEDATE,EXPLOITATIONTERM,DATELOADEXPL,DATEBUILD,USERGEN,DOMAIN_INFO,MODIFY_TIME,DEPARTMENTREFCODE,STATUSREFCODE,INVGROUPREFCODE,ELEMENTREFCODE,SERVICESOBJECTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numbergen);
			if (anObject.dateGen == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.summaGen != null) {
				anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.summaGen);
			if (anObject.summaNDS != null) {
				anObject.summaNDS = anObject.summaNDS.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.summaNDS);
			statement.setString(7, anObject.characteristic);
			statement.setString(8, anObject.executedPosition);
			statement.setString(9, anObject.executedName);
			statement.setString(10, anObject.acceptedPosition);
			statement.setString(11, anObject.acceptedName);
			if (anObject.contractPrice != null) {
				anObject.contractPrice = anObject.contractPrice.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.contractPrice);
			statement.setString(13, anObject.codeMol);
			statement.setString(14, anObject.codePodr);
			statement.setString(15, anObject.invNumberOZ);
			statement.setString(16, anObject.nameOZ);
			statement.setString(17, anObject.finContractNumber);
			if (anObject.finContractDate == null) {
				statement.setDate(18, null);
			} else {
				statement.setDate(18, new java.sql.Date(anObject.finContractDate.getTime()));
			}
			statement.setString(19, anObject.partnerName);
			statement.setString(20, anObject.partnerCode);
			if (anObject.isInvestProgram != Integer.MIN_VALUE ) {
				statement.setInt(21, anObject.isInvestProgram);
			} else {
				statement.setNull(21, java.sql.Types.INTEGER);
			}
			statement.setString(22, anObject.yearInvestProgram);
			statement.setString(23, anObject.itemInvestProgram);
			statement.setString(24, anObject.buildingAddress);
			statement.setString(25, anObject.decreeNumber);
			if (anObject.decreeDate == null) {
				statement.setDate(26, null);
			} else {
				statement.setDate(26, new java.sql.Date(anObject.decreeDate.getTime()));
			}
			if (anObject.exploitationTerm != Integer.MIN_VALUE ) {
				statement.setInt(27, anObject.exploitationTerm);
			} else {
				statement.setNull(27, java.sql.Types.INTEGER);
			}
			if (anObject.dateLoadExpl == null) {
				statement.setDate(28, null);
			} else {
				statement.setDate(28, new java.sql.Date(anObject.dateLoadExpl.getTime()));
			}
			if (anObject.dateBuild == null) {
				statement.setDate(29, null);
			} else {
				statement.setDate(29, new java.sql.Date(anObject.dateBuild.getTime()));
			}
			statement.setString(30, anObject.userGen);
			statement.setString(31, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(32, null);
			} else {
				statement.setBigDecimal(32, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				statement.setInt(33,anObject.departmentRef.code);
			} else {
				statement.setNull(33,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(34,anObject.statusRef.code);
			} else {
				statement.setNull(34,java.sql.Types.INTEGER);
			}
			if (anObject.invgroupRef.code != Integer.MIN_VALUE){
				statement.setInt(35,anObject.invgroupRef.code);
			} else {
				statement.setNull(35,java.sql.Types.INTEGER);
			}
			if (anObject.elementRef.code != Integer.MIN_VALUE){
				statement.setInt(36,anObject.elementRef.code);
			} else {
				statement.setNull(36,java.sql.Types.INTEGER);
			}
			if (anObject.servicesobject.code != Integer.MIN_VALUE){
				statement.setInt(37,anObject.servicesobject.code);
			} else {
				statement.setNull(37,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENBuildingDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBuilding anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBuilding anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENBuilding oldObject = new ENBuilding();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENBuilding.modify_time_Field + "," + ENBuilding.domain_info_Field+" FROM  ENBUILDING WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMAGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMANDS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHARACTERISTIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTEDPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTEDNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCEPTEDPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCEPTEDNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTPRICE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CODEMOL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CODEPODR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVNUMBEROZ") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAMEOZ") == 0) {
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
					if(fieldNameStr.compareTo("ISINVESTPROGRAM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("YEARINVESTPROGRAM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ITEMINVESTPROGRAM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDINGADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DECREENUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DECREEDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXPLOITATIONTERM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATELOADEXPL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEBUILD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
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
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVGROUPREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBUILDING SET  NUMBERGEN = ? , DATEGEN = ? , DATEEDIT = ? , SUMMAGEN = ? , SUMMANDS = ? , CHARACTERISTIC = ? , EXECUTEDPOSITION = ? , EXECUTEDNAME = ? , ACCEPTEDPOSITION = ? , ACCEPTEDNAME = ? , CONTRACTPRICE = ? , CODEMOL = ? , CODEPODR = ? , INVNUMBEROZ = ? , NAMEOZ = ? , FINCONTRACTNUMBER = ? , FINCONTRACTDATE = ? , PARTNERNAME = ? , PARTNERCODE = ? , ISINVESTPROGRAM = ? , YEARINVESTPROGRAM = ? , ITEMINVESTPROGRAM = ? , BUILDINGADDRESS = ? , DECREENUMBER = ? , DECREEDATE = ? , EXPLOITATIONTERM = ? , DATELOADEXPL = ? , DATEBUILD = ? , USERGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DEPARTMENTREFCODE = ? , STATUSREFCODE = ? , INVGROUPREFCODE = ? , ELEMENTREFCODE = ? , SERVICESOBJECTCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBUILDING SET ";
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
					statement.setString(1, anObject.numbergen);
					if (anObject.dateGen == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.summaGen != null) {
						anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.summaGen);
					if (anObject.summaNDS != null) {
						anObject.summaNDS = anObject.summaNDS.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.summaNDS);
					statement.setString(6, anObject.characteristic);
					statement.setString(7, anObject.executedPosition);
					statement.setString(8, anObject.executedName);
					statement.setString(9, anObject.acceptedPosition);
					statement.setString(10, anObject.acceptedName);
					if (anObject.contractPrice != null) {
						anObject.contractPrice = anObject.contractPrice.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.contractPrice);
					statement.setString(12, anObject.codeMol);
					statement.setString(13, anObject.codePodr);
					statement.setString(14, anObject.invNumberOZ);
					statement.setString(15, anObject.nameOZ);
					statement.setString(16, anObject.finContractNumber);
					if (anObject.finContractDate == null) {
						statement.setDate(17, null);
					} else {
						statement.setDate(17, new java.sql.Date(anObject.finContractDate.getTime()));
					}
					statement.setString(18, anObject.partnerName);
					statement.setString(19, anObject.partnerCode);
					if (anObject.isInvestProgram != Integer.MIN_VALUE) {
						statement.setInt(20, anObject.isInvestProgram);
					} else {
						statement.setNull(20, java.sql.Types.INTEGER);
					}
					statement.setString(21, anObject.yearInvestProgram);
					statement.setString(22, anObject.itemInvestProgram);
					statement.setString(23, anObject.buildingAddress);
					statement.setString(24, anObject.decreeNumber);
					if (anObject.decreeDate == null) {
						statement.setDate(25, null);
					} else {
						statement.setDate(25, new java.sql.Date(anObject.decreeDate.getTime()));
					}
					if (anObject.exploitationTerm != Integer.MIN_VALUE) {
						statement.setInt(26, anObject.exploitationTerm);
					} else {
						statement.setNull(26, java.sql.Types.INTEGER);
					}
					if (anObject.dateLoadExpl == null) {
						statement.setDate(27, null);
					} else {
						statement.setDate(27, new java.sql.Date(anObject.dateLoadExpl.getTime()));
					}
					if (anObject.dateBuild == null) {
						statement.setDate(28, null);
					} else {
						statement.setDate(28, new java.sql.Date(anObject.dateBuild.getTime()));
					}
					statement.setString(29, anObject.userGen);
					statement.setString(30, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(31, null);
					} else {
						statement.setBigDecimal(31, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(32, anObject.departmentRef.code);
					} else {
						statement.setNull(32, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(33, anObject.statusRef.code);
					} else {
						statement.setNull(33, java.sql.Types.INTEGER);
					}
					if (anObject.invgroupRef.code != Integer.MIN_VALUE) {
						statement.setInt(34, anObject.invgroupRef.code);
					} else {
						statement.setNull(34, java.sql.Types.INTEGER);
					}
					if (anObject.elementRef.code != Integer.MIN_VALUE) {
						statement.setInt(35, anObject.elementRef.code);
					} else {
						statement.setNull(35, java.sql.Types.INTEGER);
					}
					if (anObject.servicesobject.code != Integer.MIN_VALUE) {
						statement.setInt(36, anObject.servicesobject.code);
					} else {
						statement.setNull(36, java.sql.Types.INTEGER);
					}
					statement.setInt(37, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numbergen);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateGen.getTime()));
							}
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
						if("SUMMAGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaGen != null) {
								anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summaGen);
							continue;
						}
						if("SUMMANDS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaNDS != null) {
								anObject.summaNDS = anObject.summaNDS.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summaNDS);
							continue;
						}
						if("CHARACTERISTIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.characteristic);
							continue;
						}
						if("EXECUTEDPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executedPosition);
							continue;
						}
						if("EXECUTEDNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executedName);
							continue;
						}
						if("ACCEPTEDPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.acceptedPosition);
							continue;
						}
						if("ACCEPTEDNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.acceptedName);
							continue;
						}
						if("CONTRACTPRICE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractPrice != null) {
								anObject.contractPrice = anObject.contractPrice.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.contractPrice);
							continue;
						}
						if("CODEMOL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.codeMol);
							continue;
						}
						if("CODEPODR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.codePodr);
							continue;
						}
						if("INVNUMBEROZ".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invNumberOZ);
							continue;
						}
						if("NAMEOZ".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.nameOZ);
							continue;
						}
						if("FINCONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finContractNumber);
							continue;
						}
						if("FINCONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finContractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.finContractDate.getTime()));
							}
							continue;
						}
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnerName);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnerCode);
							continue;
						}
						if("ISINVESTPROGRAM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isInvestProgram);
							continue;
						}
						if("YEARINVESTPROGRAM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.yearInvestProgram);
							continue;
						}
						if("ITEMINVESTPROGRAM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.itemInvestProgram);
							continue;
						}
						if("BUILDINGADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.buildingAddress);
							continue;
						}
						if("DECREENUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.decreeNumber);
							continue;
						}
						if("DECREEDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.decreeDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.decreeDate.getTime()));
							}
							continue;
						}
						if("EXPLOITATIONTERM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.exploitationTerm);
							continue;
						}
						if("DATELOADEXPL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateLoadExpl == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateLoadExpl.getTime()));
							}
							continue;
						}
						if("DATEBUILD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateBuild == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateBuild.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.departmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.departmentRef.code);
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
						if("INVGROUPREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.invgroupRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.invgroupRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVICESOBJECT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesobject.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesobject.code);
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

	} // end of save(ENBuilding anObject,String[] anAttributes)


	public ENBuildingShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBuilding filterObject = new ENBuilding();
		Vector<ENBuildingShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBuildingShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBuilding filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numbergen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaNDS, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.characteristic, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executedPosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executedName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.acceptedPosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.acceptedName, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.contractPrice, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codeMol, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codePodr, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumberOZ, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.nameOZ, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finContractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.finContractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isInvestProgram, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.yearInvestProgram, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.itemInvestProgram, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.buildingAddress, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.decreeNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.decreeDate, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.exploitationTerm, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateLoadExpl, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateBuild, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.invgroupRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobject.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBuildingFilter filter) {
		String out = buildCondition((ENBuilding)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBuilding filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBuilding.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numbergen, ENBuilding.numbergen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENBuilding.dateGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENBuilding.dateEdit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaGen, ENBuilding.summaGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaNDS, ENBuilding.summaNDS_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.characteristic, ENBuilding.characteristic_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executedPosition, ENBuilding.executedPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executedName, ENBuilding.executedName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.acceptedPosition, ENBuilding.acceptedPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.acceptedName, ENBuilding.acceptedName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractPrice, ENBuilding.contractPrice_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codeMol, ENBuilding.codeMol_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codePodr, ENBuilding.codePodr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumberOZ, ENBuilding.invNumberOZ_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nameOZ, ENBuilding.nameOZ_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finContractNumber, ENBuilding.finContractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.finContractDate, ENBuilding.finContractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENBuilding.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENBuilding.partnerCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isInvestProgram, ENBuilding.isInvestProgram_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.yearInvestProgram, ENBuilding.yearInvestProgram_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.itemInvestProgram, ENBuilding.itemInvestProgram_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.buildingAddress, ENBuilding.buildingAddress_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.decreeNumber, ENBuilding.decreeNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.decreeDate, ENBuilding.decreeDate_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.exploitationTerm, ENBuilding.exploitationTerm_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateLoadExpl, ENBuilding.dateLoadExpl_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateBuild, ENBuilding.dateBuild_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENBuilding.userGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENBuilding.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENBuilding.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENBuilding.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENBuilding.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.invgroupRef.code, ENBuilding.invgroupRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementRef.code, ENBuilding.elementRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobject.code, ENBuilding.servicesobject_QFielld, out);
		}
		return out;
	}

	public ENBuildingShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBuildingShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBuildingShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBuildingShortList getFilteredList(ENBuilding filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBuildingShortList getScrollableFilteredList(ENBuilding aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBuildingShortList getScrollableFilteredList(ENBuilding aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBuildingShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBuildingShortList getScrollableFilteredList(ENBuildingFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBuildingShortList getScrollableFilteredList(ENBuildingFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBuildingShortList getScrollableFilteredList(ENBuilding aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBuildingShortList result = new ENBuildingShortList();
		ENBuildingShort anObject;
		result.list = new Vector<ENBuildingShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUILDING.CODE"+
			",ENBUILDING.NUMBERGEN"+
			",ENBUILDING.DATEGEN"+
			",ENBUILDING.DATEEDIT"+
			",ENBUILDING.SUMMAGEN"+
			",ENBUILDING.SUMMANDS"+
			",ENBUILDING.CHARACTERISTIC"+
			",ENBUILDING.EXECUTEDPOSITION"+
			",ENBUILDING.EXECUTEDNAME"+
			",ENBUILDING.ACCEPTEDPOSITION"+
			",ENBUILDING.ACCEPTEDNAME"+
			",ENBUILDING.CONTRACTPRICE"+
			",ENBUILDING.CODEMOL"+
			",ENBUILDING.CODEPODR"+
			",ENBUILDING.INVNUMBEROZ"+
			",ENBUILDING.NAMEOZ"+
			",ENBUILDING.FINCONTRACTNUMBER"+
			",ENBUILDING.FINCONTRACTDATE"+
			",ENBUILDING.PARTNERNAME"+
			",ENBUILDING.PARTNERCODE"+
			",ENBUILDING.ISINVESTPROGRAM"+
			",ENBUILDING.YEARINVESTPROGRAM"+
			",ENBUILDING.ITEMINVESTPROGRAM"+
			",ENBUILDING.BUILDINGADDRESS"+
			",ENBUILDING.DECREENUMBER"+
			",ENBUILDING.DECREEDATE"+
			",ENBUILDING.EXPLOITATIONTERM"+
			",ENBUILDING.DATELOADEXPL"+
			",ENBUILDING.DATEBUILD"+
			",ENBUILDING.USERGEN"+
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
			", ENBUILDINGSTATUS.CODE " +
			", ENBUILDINGSTATUS.NAME " +
			", ENINVESTPROGRAMGROUPS.CODE " +
			", ENINVESTPROGRAMGROUPS.NAME " +
			", ENINVESTPROGRAMGROUPS.COMMENTGEN " +
			", ENELEMENT.CODE " +
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
			", ENSERVICESOBJECT.CODEEIC " +
			", ENSERVICESOBJECT.PERSONALACCOUNTUID " +
			", ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS " +
			", ENSERVICESOBJECT.POWERGENERATION " +
			", ENSERVICESOBJECT.POSTCODE " +
			", ENSERVICESOBJECT.CUSTOMEREMAIL " +
		" FROM ENBUILDING " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENBUILDING.DEPARTMENTREFCODE "+
			" LEFT JOIN ENBUILDINGSTATUS on ENBUILDINGSTATUS.CODE = ENBUILDING.STATUSREFCODE "+
			" LEFT JOIN ENINVESTPROGRAMGROUPS on ENINVESTPROGRAMGROUPS.CODE = ENBUILDING.INVGROUPREFCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENBUILDING.ELEMENTREFCODE "+
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENBUILDING.SERVICESOBJECTCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBuilding.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENBuildingShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numbergen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.dateEdit = set.getDate(4);
				anObject.summaGen = set.getBigDecimal(5);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaNDS = set.getBigDecimal(6);
				if(anObject.summaNDS != null) {
					anObject.summaNDS = anObject.summaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.characteristic = set.getString(7);
				anObject.executedPosition = set.getString(8);
				anObject.executedName = set.getString(9);
				anObject.acceptedPosition = set.getString(10);
				anObject.acceptedName = set.getString(11);
				anObject.contractPrice = set.getBigDecimal(12);
				if(anObject.contractPrice != null) {
					anObject.contractPrice = anObject.contractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.codeMol = set.getString(13);
				anObject.codePodr = set.getString(14);
				anObject.invNumberOZ = set.getString(15);
				anObject.nameOZ = set.getString(16);
				anObject.finContractNumber = set.getString(17);
				anObject.finContractDate = set.getDate(18);
				anObject.partnerName = set.getString(19);
				anObject.partnerCode = set.getString(20);
				anObject.isInvestProgram = set.getInt(21);
				if ( set.wasNull() ) {
					anObject.isInvestProgram = Integer.MIN_VALUE;
				}
				anObject.yearInvestProgram = set.getString(22);
				anObject.itemInvestProgram = set.getString(23);
				anObject.buildingAddress = set.getString(24);
				anObject.decreeNumber = set.getString(25);
				anObject.decreeDate = set.getDate(26);
				anObject.exploitationTerm = set.getInt(27);
				if ( set.wasNull() ) {
					anObject.exploitationTerm = Integer.MIN_VALUE;
				}
				anObject.dateLoadExpl = set.getDate(28);
				anObject.dateBuild = set.getDate(29);
				anObject.userGen = set.getString(30);

				anObject.departmentRefCode = set.getInt(31);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(32);
				anObject.departmentRefDateStart = set.getDate(33);
				anObject.departmentRefDateFinal = set.getDate(34);
				anObject.departmentRefRenCode = set.getInt(35);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(36);
				anObject.departmentRefKau_table_id_1884 = set.getInt(37);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(38);
				anObject.departmentRefName_1884 = set.getString(39);
				anObject.departmentRefHrmorganizationid = set.getString(40);
				anObject.statusRefCode = set.getInt(41);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(42);
				anObject.invgroupRefCode = set.getInt(43);
				if(set.wasNull()) {
					anObject.invgroupRefCode = Integer.MIN_VALUE;
				}
				anObject.invgroupRefName = set.getString(44);
				anObject.invgroupRefCommentgen = set.getString(45);
				anObject.elementRefCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCode = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(48);
				anObject.servicesobjectContractDate = set.getDate(49);
				anObject.servicesobjectName = set.getString(50);
				anObject.servicesobjectPartnerCode = set.getString(51);
				anObject.servicesobjectFinDocCode = set.getString(52);
				anObject.servicesobjectFinDocID = set.getInt(53);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(54);
				anObject.servicesobjectContractNumberServices = set.getString(55);
				anObject.servicesobjectContractDateServices = set.getDate(56);
				anObject.servicesobjectContragentName = set.getString(57);
				anObject.servicesobjectContragentAddress = set.getString(58);
				anObject.servicesobjectContragentAddressWork = set.getString(59);
				anObject.servicesobjectContragentOkpo = set.getString(60);
				anObject.servicesobjectContragentBankAccount = set.getString(61);
				anObject.servicesobjectContragentBankName = set.getString(62);
				anObject.servicesobjectContragentBankMfo = set.getString(63);
				anObject.servicesobjectContragentBossName = set.getString(64);
				anObject.servicesobjectContragentPassport = set.getString(65);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(66);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(67);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(68);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(69);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(70);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(71);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(72);
				anObject.servicesobjectDateEdit = set.getDate(73);
				anObject.servicesobjectWarrantDate = set.getDate(74);
				anObject.servicesobjectWarrantNumber = set.getString(75);
				anObject.servicesobjectWarrantFIO = set.getString(76);
				anObject.servicesobjectRegionalType = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(78);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(79);
				anObject.servicesobjectExecuteWorkDate = set.getDate(80);
				anObject.servicesobjectTimeStart = set.getTimestamp(81);
				anObject.servicesobjectTimeFinal = set.getTimestamp(82);
				anObject.servicesobjectContragentPhoneNumber = set.getString(83);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(84);
				anObject.servicesobjectContragentObjectWork = set.getString(85);
				anObject.servicesobjectIsNoPay = set.getInt(86);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(87);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(88);
				anObject.servicesobjectFinPayFormCode = set.getInt(89);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(90);
				anObject.servicesobjectPartnerId = set.getInt(91);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(92);
				anObject.servicesobjectActTransferNumber = set.getString(93);
				anObject.servicesobjectActTransferDate = set.getDate(94);
				anObject.servicesobjectResposible = set.getString(95);
				anObject.servicesobjectResposiblePosition = set.getString(96);
				anObject.servicesobjectResposibleTabNumber = set.getString(97);
				anObject.servicesobjectPrevContractStatus = set.getInt(98);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(99);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(100);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(101);
				anObject.servicesobjectTabNumber = set.getString(102);
				anObject.servicesobjectCitiesList = set.getString(103);
				anObject.servicesobjectLineLength = set.getBigDecimal(104);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(105);
				anObject.servicesobjectCnPackCode = set.getInt(106);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(107);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(108);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(109);
				anObject.servicesobjectAxPartnerName = set.getString(110);
				anObject.servicesobjectAxContractNumber = set.getString(111);
				anObject.servicesobjectAxContractDate = set.getDate(112);
				anObject.servicesobjectAxContractCode = set.getString(113);
				anObject.servicesobjectAxContractId = set.getString(114);
				anObject.servicesobjectAxContractCommentGen = set.getString(115);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(116);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(117);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(118);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(119);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(120);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(121);
				anObject.servicesobjectCountDayDelay = set.getInt(122);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(123);
				anObject.servicesobjectCodeEIC = set.getString(124);
				anObject.servicesobjectPersonalAccountUid = set.getString(125);
				anObject.servicesobjectCustomerMailingAddress = set.getString(126);
				anObject.servicesobjectPowerGeneration = set.getBigDecimal(127);
				if(anObject.servicesobjectPowerGeneration != null) {
					anObject.servicesobjectPowerGeneration = anObject.servicesobjectPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectPostCode = set.getString(128);
				anObject.servicesobjectCustomerEmail = set.getString(129);

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
	
	public int[] getFilteredCodeArray(ENBuildingFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBuildingFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBuilding aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBUILDING.CODE FROM ENBUILDING";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBuilding.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENBUILDING.DOMAIN_INFO IS NOT NULL) ";
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


	public ENBuilding getObject(int uid) throws PersistenceException {
		ENBuilding result = new ENBuilding();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENBuilding anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENBuilding anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENBuilding anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENBuilding.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENBUILDING.CODE, ENBUILDING.NUMBERGEN, ENBUILDING.DATEGEN, ENBUILDING.DATEEDIT, ENBUILDING.SUMMAGEN, ENBUILDING.SUMMANDS, ENBUILDING.CHARACTERISTIC, ENBUILDING.EXECUTEDPOSITION, ENBUILDING.EXECUTEDNAME, ENBUILDING.ACCEPTEDPOSITION, ENBUILDING.ACCEPTEDNAME, ENBUILDING.CONTRACTPRICE, ENBUILDING.CODEMOL, ENBUILDING.CODEPODR, ENBUILDING.INVNUMBEROZ, ENBUILDING.NAMEOZ, ENBUILDING.FINCONTRACTNUMBER, ENBUILDING.FINCONTRACTDATE, ENBUILDING.PARTNERNAME, ENBUILDING.PARTNERCODE, ENBUILDING.ISINVESTPROGRAM, ENBUILDING.YEARINVESTPROGRAM, ENBUILDING.ITEMINVESTPROGRAM, ENBUILDING.BUILDINGADDRESS, ENBUILDING.DECREENUMBER, ENBUILDING.DECREEDATE, ENBUILDING.EXPLOITATIONTERM, ENBUILDING.DATELOADEXPL, ENBUILDING.DATEBUILD, ENBUILDING.USERGEN, ENBUILDING.DOMAIN_INFO, ENBUILDING.MODIFY_TIME, ENBUILDING.DEPARTMENTREFCODE, ENBUILDING.STATUSREFCODE, ENBUILDING.INVGROUPREFCODE, ENBUILDING.ELEMENTREFCODE, ENBUILDING.SERVICESOBJECTCODE "
			+" FROM ENBUILDING WHERE ENBUILDING.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());
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
			
				anObject.numbergen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.dateEdit = set.getDate(4);
				anObject.summaGen = set.getBigDecimal(5);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaNDS = set.getBigDecimal(6);
				if(anObject.summaNDS != null) {
					anObject.summaNDS = anObject.summaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.characteristic = set.getString(7);
				anObject.executedPosition = set.getString(8);
				anObject.executedName = set.getString(9);
				anObject.acceptedPosition = set.getString(10);
				anObject.acceptedName = set.getString(11);
				anObject.contractPrice = set.getBigDecimal(12);
				if(anObject.contractPrice != null) {
					anObject.contractPrice = anObject.contractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.codeMol = set.getString(13);
				anObject.codePodr = set.getString(14);
				anObject.invNumberOZ = set.getString(15);
				anObject.nameOZ = set.getString(16);
				anObject.finContractNumber = set.getString(17);
				anObject.finContractDate = set.getDate(18);
				anObject.partnerName = set.getString(19);
				anObject.partnerCode = set.getString(20);
				anObject.isInvestProgram = set.getInt(21);
				if (set.wasNull()) {
					anObject.isInvestProgram = Integer.MIN_VALUE;
				}
				anObject.yearInvestProgram = set.getString(22);
				anObject.itemInvestProgram = set.getString(23);
				anObject.buildingAddress = set.getString(24);
				anObject.decreeNumber = set.getString(25);
				anObject.decreeDate = set.getDate(26);
				anObject.exploitationTerm = set.getInt(27);
				if (set.wasNull()) {
					anObject.exploitationTerm = Integer.MIN_VALUE;
				}
				anObject.dateLoadExpl = set.getDate(28);
				anObject.dateBuild = set.getDate(29);
				anObject.userGen = set.getString(30);
				anObject.domain_info = set.getString(31);
				anObject.modify_time = set.getLong(32);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(33);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(34);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.invgroupRef.code = set.getInt(35);
				if (set.wasNull()) {
					anObject.invgroupRef.code = Integer.MIN_VALUE;
				}
				anObject.elementRef.code = set.getInt(36);
				if (set.wasNull()) {
					anObject.elementRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesobject.code = set.getInt(37);
				if (set.wasNull()) {
					anObject.servicesobject.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBuildingRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBuildingRef ref = new com.ksoe.energynet.valueobject.references.ENBuildingRef();
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

		selectStr = "DELETE FROM  ENBUILDING WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBuilding object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBuilding.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENBuilding.remove%} access denied");
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
	
	public long count(ENBuildingFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBuildingFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBuildingFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBUILDING", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBuilding.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENBUILDING.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENBUILDING WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuildingFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuildingFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBUILDING");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENBuilding.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENBUILDING.DOMAIN_INFO IS NOT NULL) ";
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBuilding.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBuilding.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENBUILDING.CODE FROM  ENBUILDING WHERE  ENBUILDING.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENBUILDING",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENBUILDING.CODE");
		_checkConditionToken(condition,"numbergen","ENBUILDING.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENBUILDING.DATEGEN");
		_checkConditionToken(condition,"dateedit","ENBUILDING.DATEEDIT");
		_checkConditionToken(condition,"summagen","ENBUILDING.SUMMAGEN");
		_checkConditionToken(condition,"summands","ENBUILDING.SUMMANDS");
		_checkConditionToken(condition,"characteristic","ENBUILDING.CHARACTERISTIC");
		_checkConditionToken(condition,"executedposition","ENBUILDING.EXECUTEDPOSITION");
		_checkConditionToken(condition,"executedname","ENBUILDING.EXECUTEDNAME");
		_checkConditionToken(condition,"acceptedposition","ENBUILDING.ACCEPTEDPOSITION");
		_checkConditionToken(condition,"acceptedname","ENBUILDING.ACCEPTEDNAME");
		_checkConditionToken(condition,"contractprice","ENBUILDING.CONTRACTPRICE");
		_checkConditionToken(condition,"codemol","ENBUILDING.CODEMOL");
		_checkConditionToken(condition,"codepodr","ENBUILDING.CODEPODR");
		_checkConditionToken(condition,"invnumberoz","ENBUILDING.INVNUMBEROZ");
		_checkConditionToken(condition,"nameoz","ENBUILDING.NAMEOZ");
		_checkConditionToken(condition,"fincontractnumber","ENBUILDING.FINCONTRACTNUMBER");
		_checkConditionToken(condition,"fincontractdate","ENBUILDING.FINCONTRACTDATE");
		_checkConditionToken(condition,"partnername","ENBUILDING.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENBUILDING.PARTNERCODE");
		_checkConditionToken(condition,"isinvestprogram","ENBUILDING.ISINVESTPROGRAM");
		_checkConditionToken(condition,"yearinvestprogram","ENBUILDING.YEARINVESTPROGRAM");
		_checkConditionToken(condition,"iteminvestprogram","ENBUILDING.ITEMINVESTPROGRAM");
		_checkConditionToken(condition,"buildingaddress","ENBUILDING.BUILDINGADDRESS");
		_checkConditionToken(condition,"decreenumber","ENBUILDING.DECREENUMBER");
		_checkConditionToken(condition,"decreedate","ENBUILDING.DECREEDATE");
		_checkConditionToken(condition,"exploitationterm","ENBUILDING.EXPLOITATIONTERM");
		_checkConditionToken(condition,"dateloadexpl","ENBUILDING.DATELOADEXPL");
		_checkConditionToken(condition,"datebuild","ENBUILDING.DATEBUILD");
		_checkConditionToken(condition,"usergen","ENBUILDING.USERGEN");
		_checkConditionToken(condition,"domain_info","ENBUILDING.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENBUILDING.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"invgroupref","INVGROUPREFCODE");
		_checkConditionToken(condition,"invgroupref.code","INVGROUPREFCODE");
		_checkConditionToken(condition,"elementref","ELEMENTREFCODE");
		_checkConditionToken(condition,"elementref.code","ELEMENTREFCODE");
		_checkConditionToken(condition,"servicesobject","SERVICESOBJECTCODE");
		_checkConditionToken(condition,"servicesobject.code","SERVICESOBJECTCODE");
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
	
	private void _collectAutoIncrementFields(ENBuilding anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBUILDING", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBUILDING", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBUILDING", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBUILDING");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBuildingDAO
