
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
import com.ksoe.energynet.valueobject.ENReconstrModernOZ;
import com.ksoe.energynet.valueobject.filter.ENReconstrModernOZFilter;
import com.ksoe.energynet.valueobject.brief.ENReconstrModernOZShort;
import com.ksoe.energynet.valueobject.lists.ENReconstrModernOZShortList;


/**
 * DAO Object for ENReconstrModernOZ;
 *
 */

public class ENReconstrModernOZDAOGen extends GenericDataMiner {

	public ENReconstrModernOZDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENReconstrModernOZDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENReconstrModernOZ inObject) throws PersistenceException {
		ENReconstrModernOZ obj = new ENReconstrModernOZ();
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

		if(inObject.characteristicOS == null && obj.characteristicOS == null){}
		else
			if(inObject.characteristicOS == null || obj.characteristicOS == null) return false;
			else
				if ( ! inObject.characteristicOS.equals(obj.characteristicOS)){
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

		if (inObject.typeRM != obj.typeRM){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if (inObject.termUseful != obj.termUseful){
					return false;
				}

		if (inObject.use_limit_before != obj.use_limit_before){
					return false;
				}

		if (inObject.use_limit_n_before != obj.use_limit_n_before){
					return false;
				}

		if(inObject.dateExploitationIn == null && obj.dateExploitationIn == null){} else 
			if(inObject.dateExploitationIn == null || obj.dateExploitationIn == null) return false;
			else
				if (inObject.dateExploitationIn.compareTo(obj.dateExploitationIn) != 0){
					return false;
				}

		if(inObject.dateExploitationOut == null && obj.dateExploitationOut == null){} else 
			if(inObject.dateExploitationOut == null || obj.dateExploitationOut == null) return false;
			else
				if (inObject.dateExploitationOut.compareTo(obj.dateExploitationOut) != 0){
					return false;
				}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		if (inObject.invgroupRef.code != obj.invgroupRef.code){
			return false;
		}
		if (inObject.servicesobject.code != obj.servicesobject.code){
			return false;
		}
		return true;
	}

	public int add(ENReconstrModernOZ anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENReconstrModernOZ anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENRECONSTRMODERNOZ (CODE,NUMBERGEN,DATEGEN,DATEEDIT,SUMMAGEN,SUMMANDS,CHARACTERISTIC,EXECUTEDPOSITION,EXECUTEDNAME,ACCEPTEDPOSITION,ACCEPTEDNAME,CONTRACTPRICE,CODEMOL,CODEPODR,INVNUMBEROZ,NAMEOZ,FINCONTRACTNUMBER,FINCONTRACTDATE,PARTNERNAME,PARTNERCODE,CHARACTERISTICOS,ISINVESTPROGRAM,YEARINVESTPROGRAM,ITEMINVESTPROGRAM,TYPERM,USERGEN,DOMAIN_INFO,MODIFY_TIME,TERMUSEFUL,USE_LIMIT_BEFORE,USE_LIMIT_N_BEFORE,DATEEXPLOITATIONIN,DATEEXPLOITATIONOUT,DEPARTMENTREFCODE,STATUSREFCODE,TYPEREFCODE,INVGROUPREFCODE,SERVICESOBJECTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
			statement.setString(21, anObject.characteristicOS);
			if (anObject.isInvestProgram != Integer.MIN_VALUE ) {
				statement.setInt(22, anObject.isInvestProgram);
			} else {
				statement.setNull(22, java.sql.Types.INTEGER);
			}
			statement.setString(23, anObject.yearInvestProgram);
			statement.setString(24, anObject.itemInvestProgram);
			if (anObject.typeRM != Integer.MIN_VALUE ) {
				statement.setInt(25, anObject.typeRM);
			} else {
				statement.setNull(25, java.sql.Types.INTEGER);
			}
			statement.setString(26, anObject.userGen);
			statement.setString(27, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(28, null);
			} else {
				statement.setBigDecimal(28, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.termUseful != Integer.MIN_VALUE ) {
				statement.setInt(29, anObject.termUseful);
			} else {
				statement.setNull(29, java.sql.Types.INTEGER);
			}
			if (anObject.use_limit_before != Integer.MIN_VALUE ) {
				statement.setInt(30, anObject.use_limit_before);
			} else {
				statement.setNull(30, java.sql.Types.INTEGER);
			}
			if (anObject.use_limit_n_before != Integer.MIN_VALUE ) {
				statement.setInt(31, anObject.use_limit_n_before);
			} else {
				statement.setNull(31, java.sql.Types.INTEGER);
			}
			if (anObject.dateExploitationIn == null) {
				statement.setDate(32, null);
			} else {
				statement.setDate(32, new java.sql.Date(anObject.dateExploitationIn.getTime()));
			}
			if (anObject.dateExploitationOut == null) {
				statement.setDate(33, null);
			} else {
				statement.setDate(33, new java.sql.Date(anObject.dateExploitationOut.getTime()));
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				statement.setInt(34,anObject.departmentRef.code);
			} else {
				statement.setNull(34,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(35,anObject.statusRef.code);
			} else {
				statement.setNull(35,java.sql.Types.INTEGER);
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				statement.setInt(36,anObject.typeRef.code);
			} else {
				statement.setNull(36,java.sql.Types.INTEGER);
			}
			if (anObject.invgroupRef.code != Integer.MIN_VALUE){
				statement.setInt(37,anObject.invgroupRef.code);
			} else {
				statement.setNull(37,java.sql.Types.INTEGER);
			}
			if (anObject.servicesobject.code != Integer.MIN_VALUE){
				statement.setInt(38,anObject.servicesobject.code);
			} else {
				statement.setNull(38,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENReconstrModernOZDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENReconstrModernOZ anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENReconstrModernOZ anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENReconstrModernOZ oldObject = new ENReconstrModernOZ();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENReconstrModernOZ.modify_time_Field + "," + ENReconstrModernOZ.domain_info_Field+" FROM  ENRECONSTRMODERNOZ WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CHARACTERISTICOS") == 0) {
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
					if(fieldNameStr.compareTo("TYPERM") == 0) {
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
					if(fieldNameStr.compareTo("TERMUSEFUL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USE_LIMIT_BEFORE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USE_LIMIT_N_BEFORE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEXPLOITATIONIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEXPLOITATIONOUT") == 0) {
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
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVGROUPREF") == 0) {
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
				selectStr = "UPDATE ENRECONSTRMODERNOZ SET  NUMBERGEN = ? , DATEGEN = ? , DATEEDIT = ? , SUMMAGEN = ? , SUMMANDS = ? , CHARACTERISTIC = ? , EXECUTEDPOSITION = ? , EXECUTEDNAME = ? , ACCEPTEDPOSITION = ? , ACCEPTEDNAME = ? , CONTRACTPRICE = ? , CODEMOL = ? , CODEPODR = ? , INVNUMBEROZ = ? , NAMEOZ = ? , FINCONTRACTNUMBER = ? , FINCONTRACTDATE = ? , PARTNERNAME = ? , PARTNERCODE = ? , CHARACTERISTICOS = ? , ISINVESTPROGRAM = ? , YEARINVESTPROGRAM = ? , ITEMINVESTPROGRAM = ? , TYPERM = ? , USERGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , TERMUSEFUL = ? , USE_LIMIT_BEFORE = ? , USE_LIMIT_N_BEFORE = ? , DATEEXPLOITATIONIN = ? , DATEEXPLOITATIONOUT = ? , DEPARTMENTREFCODE = ? , STATUSREFCODE = ? , TYPEREFCODE = ? , INVGROUPREFCODE = ? , SERVICESOBJECTCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENRECONSTRMODERNOZ SET ";
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
					statement.setString(20, anObject.characteristicOS);
					if (anObject.isInvestProgram != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.isInvestProgram);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					statement.setString(22, anObject.yearInvestProgram);
					statement.setString(23, anObject.itemInvestProgram);
					if (anObject.typeRM != Integer.MIN_VALUE) {
						statement.setInt(24, anObject.typeRM);
					} else {
						statement.setNull(24, java.sql.Types.INTEGER);
					}
					statement.setString(25, anObject.userGen);
					statement.setString(26, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(27, null);
					} else {
						statement.setBigDecimal(27, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.termUseful != Integer.MIN_VALUE) {
						statement.setInt(28, anObject.termUseful);
					} else {
						statement.setNull(28, java.sql.Types.INTEGER);
					}
					if (anObject.use_limit_before != Integer.MIN_VALUE) {
						statement.setInt(29, anObject.use_limit_before);
					} else {
						statement.setNull(29, java.sql.Types.INTEGER);
					}
					if (anObject.use_limit_n_before != Integer.MIN_VALUE) {
						statement.setInt(30, anObject.use_limit_n_before);
					} else {
						statement.setNull(30, java.sql.Types.INTEGER);
					}
					if (anObject.dateExploitationIn == null) {
						statement.setDate(31, null);
					} else {
						statement.setDate(31, new java.sql.Date(anObject.dateExploitationIn.getTime()));
					}
					if (anObject.dateExploitationOut == null) {
						statement.setDate(32, null);
					} else {
						statement.setDate(32, new java.sql.Date(anObject.dateExploitationOut.getTime()));
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(33, anObject.departmentRef.code);
					} else {
						statement.setNull(33, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(34, anObject.statusRef.code);
					} else {
						statement.setNull(34, java.sql.Types.INTEGER);
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(35, anObject.typeRef.code);
					} else {
						statement.setNull(35, java.sql.Types.INTEGER);
					}
					if (anObject.invgroupRef.code != Integer.MIN_VALUE) {
						statement.setInt(36, anObject.invgroupRef.code);
					} else {
						statement.setNull(36, java.sql.Types.INTEGER);
					}
					if (anObject.servicesobject.code != Integer.MIN_VALUE) {
						statement.setInt(37, anObject.servicesobject.code);
					} else {
						statement.setNull(37, java.sql.Types.INTEGER);
					}
					statement.setInt(38, anObject.code);
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
						if("CHARACTERISTICOS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.characteristicOS);
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
						if("TYPERM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.typeRM);
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
						if("TERMUSEFUL".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.termUseful);
							continue;
						}
						if("USE_LIMIT_BEFORE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.use_limit_before);
							continue;
						}
						if("USE_LIMIT_N_BEFORE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.use_limit_n_before);
							continue;
						}
						if("DATEEXPLOITATIONIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateExploitationIn == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateExploitationIn.getTime()));
							}
							continue;
						}
						if("DATEEXPLOITATIONOUT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateExploitationOut == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateExploitationOut.getTime()));
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
						if("TYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.typeRef.code);
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

	} // end of save(ENReconstrModernOZ anObject,String[] anAttributes)


	public ENReconstrModernOZShort getShortObject(int anObjectCode) throws PersistenceException {
		ENReconstrModernOZ filterObject = new ENReconstrModernOZ();
		Vector<ENReconstrModernOZShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENReconstrModernOZShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENReconstrModernOZ filter, PreparedStatement statement) throws SQLException {
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
			index = BaseDAOUtils.setStringParameter(filter.characteristicOS, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isInvestProgram, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.yearInvestProgram, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.itemInvestProgram, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRM, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.termUseful, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.use_limit_before, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.use_limit_n_before, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateExploitationIn, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateExploitationOut, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.invgroupRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobject.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENReconstrModernOZFilter filter) {
		String out = buildCondition((ENReconstrModernOZ)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENReconstrModernOZ filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENReconstrModernOZ.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numbergen, ENReconstrModernOZ.numbergen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENReconstrModernOZ.dateGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENReconstrModernOZ.dateEdit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaGen, ENReconstrModernOZ.summaGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaNDS, ENReconstrModernOZ.summaNDS_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.characteristic, ENReconstrModernOZ.characteristic_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executedPosition, ENReconstrModernOZ.executedPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executedName, ENReconstrModernOZ.executedName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.acceptedPosition, ENReconstrModernOZ.acceptedPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.acceptedName, ENReconstrModernOZ.acceptedName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.contractPrice, ENReconstrModernOZ.contractPrice_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codeMol, ENReconstrModernOZ.codeMol_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codePodr, ENReconstrModernOZ.codePodr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumberOZ, ENReconstrModernOZ.invNumberOZ_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nameOZ, ENReconstrModernOZ.nameOZ_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finContractNumber, ENReconstrModernOZ.finContractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.finContractDate, ENReconstrModernOZ.finContractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENReconstrModernOZ.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENReconstrModernOZ.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.characteristicOS, ENReconstrModernOZ.characteristicOS_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isInvestProgram, ENReconstrModernOZ.isInvestProgram_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.yearInvestProgram, ENReconstrModernOZ.yearInvestProgram_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.itemInvestProgram, ENReconstrModernOZ.itemInvestProgram_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRM, ENReconstrModernOZ.typeRM_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENReconstrModernOZ.userGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENReconstrModernOZ.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENReconstrModernOZ.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.termUseful, ENReconstrModernOZ.termUseful_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.use_limit_before, ENReconstrModernOZ.use_limit_before_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.use_limit_n_before, ENReconstrModernOZ.use_limit_n_before_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateExploitationIn, ENReconstrModernOZ.dateExploitationIn_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateExploitationOut, ENReconstrModernOZ.dateExploitationOut_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENReconstrModernOZ.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENReconstrModernOZ.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENReconstrModernOZ.typeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.invgroupRef.code, ENReconstrModernOZ.invgroupRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobject.code, ENReconstrModernOZ.servicesobject_QFielld, out);
		}
		return out;
	}

	public ENReconstrModernOZShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENReconstrModernOZShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENReconstrModernOZShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENReconstrModernOZShortList getFilteredList(ENReconstrModernOZ filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZ aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZ aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENReconstrModernOZShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENReconstrModernOZShortList getScrollableFilteredList(ENReconstrModernOZ aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENReconstrModernOZShortList result = new ENReconstrModernOZShortList();
		ENReconstrModernOZShort anObject;
		result.list = new Vector<ENReconstrModernOZShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECONSTRMODERNOZ.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENRECONSTRMODERNOZ.CODE"+
			",ENRECONSTRMODERNOZ.NUMBERGEN"+
			",ENRECONSTRMODERNOZ.DATEGEN"+
			",ENRECONSTRMODERNOZ.DATEEDIT"+
			",ENRECONSTRMODERNOZ.SUMMAGEN"+
			",ENRECONSTRMODERNOZ.SUMMANDS"+
			",ENRECONSTRMODERNOZ.CHARACTERISTIC"+
			",ENRECONSTRMODERNOZ.EXECUTEDPOSITION"+
			",ENRECONSTRMODERNOZ.EXECUTEDNAME"+
			",ENRECONSTRMODERNOZ.ACCEPTEDPOSITION"+
			",ENRECONSTRMODERNOZ.ACCEPTEDNAME"+
			",ENRECONSTRMODERNOZ.CONTRACTPRICE"+
			",ENRECONSTRMODERNOZ.CODEMOL"+
			",ENRECONSTRMODERNOZ.CODEPODR"+
			",ENRECONSTRMODERNOZ.INVNUMBEROZ"+
			",ENRECONSTRMODERNOZ.NAMEOZ"+
			",ENRECONSTRMODERNOZ.FINCONTRACTNUMBER"+
			",ENRECONSTRMODERNOZ.FINCONTRACTDATE"+
			",ENRECONSTRMODERNOZ.PARTNERNAME"+
			",ENRECONSTRMODERNOZ.PARTNERCODE"+
			",ENRECONSTRMODERNOZ.CHARACTERISTICOS"+
			",ENRECONSTRMODERNOZ.ISINVESTPROGRAM"+
			",ENRECONSTRMODERNOZ.YEARINVESTPROGRAM"+
			",ENRECONSTRMODERNOZ.ITEMINVESTPROGRAM"+
			",ENRECONSTRMODERNOZ.TYPERM"+
			",ENRECONSTRMODERNOZ.USERGEN"+
			",ENRECONSTRMODERNOZ.TERMUSEFUL"+
			",ENRECONSTRMODERNOZ.USE_LIMIT_BEFORE"+
			",ENRECONSTRMODERNOZ.USE_LIMIT_N_BEFORE"+
			",ENRECONSTRMODERNOZ.DATEEXPLOITATIONIN"+
			",ENRECONSTRMODERNOZ.DATEEXPLOITATIONOUT"+
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
			", ENRECONSTRMODERNOZSTTS.CODE " +
			", ENRECONSTRMODERNOZSTTS.NAME " +
			", ENRECOMODTYPEWORK.CODE " +
			", ENRECOMODTYPEWORK.NAME " +
			", ENINVESTPROGRAMGROUPS.CODE " +
			", ENINVESTPROGRAMGROUPS.NAME " +
			", ENINVESTPROGRAMGROUPS.COMMENTGEN " +
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
		" FROM ENRECONSTRMODERNOZ " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENRECONSTRMODERNOZ.DEPARTMENTREFCODE "+
			" LEFT JOIN ENRECONSTRMODERNOZSTTS on ENRECONSTRMODERNOZSTTS.CODE = ENRECONSTRMODERNOZ.STATUSREFCODE "+
			" LEFT JOIN ENRECOMODTYPEWORK on ENRECOMODTYPEWORK.CODE = ENRECONSTRMODERNOZ.TYPEREFCODE "+
			" LEFT JOIN ENINVESTPROGRAMGROUPS on ENINVESTPROGRAMGROUPS.CODE = ENRECONSTRMODERNOZ.INVGROUPREFCODE "+
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENRECONSTRMODERNOZ.SERVICESOBJECTCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENReconstrModernOZ.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENReconstrModernOZShort();
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
				anObject.characteristicOS = set.getString(21);
				anObject.isInvestProgram = set.getInt(22);
				if ( set.wasNull() ) {
					anObject.isInvestProgram = Integer.MIN_VALUE;
				}
				anObject.yearInvestProgram = set.getString(23);
				anObject.itemInvestProgram = set.getString(24);
				anObject.typeRM = set.getInt(25);
				if ( set.wasNull() ) {
					anObject.typeRM = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(26);
				anObject.termUseful = set.getInt(27);
				if ( set.wasNull() ) {
					anObject.termUseful = Integer.MIN_VALUE;
				}
				anObject.use_limit_before = set.getInt(28);
				if ( set.wasNull() ) {
					anObject.use_limit_before = Integer.MIN_VALUE;
				}
				anObject.use_limit_n_before = set.getInt(29);
				if ( set.wasNull() ) {
					anObject.use_limit_n_before = Integer.MIN_VALUE;
				}
				anObject.dateExploitationIn = set.getDate(30);
				anObject.dateExploitationOut = set.getDate(31);

				anObject.departmentRefCode = set.getInt(32);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(33);
				anObject.departmentRefDateStart = set.getDate(34);
				anObject.departmentRefDateFinal = set.getDate(35);
				anObject.departmentRefRenCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(37);
				anObject.departmentRefKau_table_id_1884 = set.getInt(38);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(39);
				anObject.departmentRefName_1884 = set.getString(40);
				anObject.departmentRefHrmorganizationid = set.getString(41);
				anObject.statusRefCode = set.getInt(42);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(43);
				anObject.typeRefCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(45);
				anObject.invgroupRefCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.invgroupRefCode = Integer.MIN_VALUE;
				}
				anObject.invgroupRefName = set.getString(47);
				anObject.invgroupRefCommentgen = set.getString(48);
				anObject.servicesobjectCode = set.getInt(49);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(50);
				anObject.servicesobjectContractDate = set.getDate(51);
				anObject.servicesobjectName = set.getString(52);
				anObject.servicesobjectPartnerCode = set.getString(53);
				anObject.servicesobjectFinDocCode = set.getString(54);
				anObject.servicesobjectFinDocID = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(56);
				anObject.servicesobjectContractNumberServices = set.getString(57);
				anObject.servicesobjectContractDateServices = set.getDate(58);
				anObject.servicesobjectContragentName = set.getString(59);
				anObject.servicesobjectContragentAddress = set.getString(60);
				anObject.servicesobjectContragentAddressWork = set.getString(61);
				anObject.servicesobjectContragentOkpo = set.getString(62);
				anObject.servicesobjectContragentBankAccount = set.getString(63);
				anObject.servicesobjectContragentBankName = set.getString(64);
				anObject.servicesobjectContragentBankMfo = set.getString(65);
				anObject.servicesobjectContragentBossName = set.getString(66);
				anObject.servicesobjectContragentPassport = set.getString(67);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(68);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(69);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(70);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(71);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(72);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(73);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(74);
				anObject.servicesobjectDateEdit = set.getDate(75);
				anObject.servicesobjectWarrantDate = set.getDate(76);
				anObject.servicesobjectWarrantNumber = set.getString(77);
				anObject.servicesobjectWarrantFIO = set.getString(78);
				anObject.servicesobjectRegionalType = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(80);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(81);
				anObject.servicesobjectExecuteWorkDate = set.getDate(82);
				anObject.servicesobjectTimeStart = set.getTimestamp(83);
				anObject.servicesobjectTimeFinal = set.getTimestamp(84);
				anObject.servicesobjectContragentPhoneNumber = set.getString(85);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(86);
				anObject.servicesobjectContragentObjectWork = set.getString(87);
				anObject.servicesobjectIsNoPay = set.getInt(88);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(89);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(90);
				anObject.servicesobjectFinPayFormCode = set.getInt(91);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(92);
				anObject.servicesobjectPartnerId = set.getInt(93);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(94);
				anObject.servicesobjectActTransferNumber = set.getString(95);
				anObject.servicesobjectActTransferDate = set.getDate(96);
				anObject.servicesobjectResposible = set.getString(97);
				anObject.servicesobjectResposiblePosition = set.getString(98);
				anObject.servicesobjectResposibleTabNumber = set.getString(99);
				anObject.servicesobjectPrevContractStatus = set.getInt(100);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(101);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(102);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(103);
				anObject.servicesobjectTabNumber = set.getString(104);
				anObject.servicesobjectCitiesList = set.getString(105);
				anObject.servicesobjectLineLength = set.getBigDecimal(106);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(107);
				anObject.servicesobjectCnPackCode = set.getInt(108);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(109);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(110);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(111);
				anObject.servicesobjectAxPartnerName = set.getString(112);
				anObject.servicesobjectAxContractNumber = set.getString(113);
				anObject.servicesobjectAxContractDate = set.getDate(114);
				anObject.servicesobjectAxContractCode = set.getString(115);
				anObject.servicesobjectAxContractId = set.getString(116);
				anObject.servicesobjectAxContractCommentGen = set.getString(117);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(118);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(119);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(120);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(121);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(122);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(123);
				anObject.servicesobjectCountDayDelay = set.getInt(124);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(125);
				anObject.servicesobjectCodeEIC = set.getString(126);
				anObject.servicesobjectPersonalAccountUid = set.getString(127);
				anObject.servicesobjectCustomerMailingAddress = set.getString(128);
				anObject.servicesobjectPowerGeneration = set.getBigDecimal(129);
				if(anObject.servicesobjectPowerGeneration != null) {
					anObject.servicesobjectPowerGeneration = anObject.servicesobjectPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectPostCode = set.getString(130);
				anObject.servicesobjectCustomerEmail = set.getString(131);

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
	
	public int[] getFilteredCodeArray(ENReconstrModernOZFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENReconstrModernOZFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENReconstrModernOZ aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENRECONSTRMODERNOZ.CODE FROM ENRECONSTRMODERNOZ";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECONSTRMODERNOZ.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENReconstrModernOZ.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENRECONSTRMODERNOZ.DOMAIN_INFO IS NOT NULL) ";
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


	public ENReconstrModernOZ getObject(int uid) throws PersistenceException {
		ENReconstrModernOZ result = new ENReconstrModernOZ();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENReconstrModernOZ anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENReconstrModernOZ anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENReconstrModernOZ anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENReconstrModernOZ.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENRECONSTRMODERNOZ.CODE, ENRECONSTRMODERNOZ.NUMBERGEN, ENRECONSTRMODERNOZ.DATEGEN, ENRECONSTRMODERNOZ.DATEEDIT, ENRECONSTRMODERNOZ.SUMMAGEN, ENRECONSTRMODERNOZ.SUMMANDS, ENRECONSTRMODERNOZ.CHARACTERISTIC, ENRECONSTRMODERNOZ.EXECUTEDPOSITION, ENRECONSTRMODERNOZ.EXECUTEDNAME, ENRECONSTRMODERNOZ.ACCEPTEDPOSITION, ENRECONSTRMODERNOZ.ACCEPTEDNAME, ENRECONSTRMODERNOZ.CONTRACTPRICE, ENRECONSTRMODERNOZ.CODEMOL, ENRECONSTRMODERNOZ.CODEPODR, ENRECONSTRMODERNOZ.INVNUMBEROZ, ENRECONSTRMODERNOZ.NAMEOZ, ENRECONSTRMODERNOZ.FINCONTRACTNUMBER, ENRECONSTRMODERNOZ.FINCONTRACTDATE, ENRECONSTRMODERNOZ.PARTNERNAME, ENRECONSTRMODERNOZ.PARTNERCODE, ENRECONSTRMODERNOZ.CHARACTERISTICOS, ENRECONSTRMODERNOZ.ISINVESTPROGRAM, ENRECONSTRMODERNOZ.YEARINVESTPROGRAM, ENRECONSTRMODERNOZ.ITEMINVESTPROGRAM, ENRECONSTRMODERNOZ.TYPERM, ENRECONSTRMODERNOZ.USERGEN, ENRECONSTRMODERNOZ.DOMAIN_INFO, ENRECONSTRMODERNOZ.MODIFY_TIME, ENRECONSTRMODERNOZ.TERMUSEFUL, ENRECONSTRMODERNOZ.USE_LIMIT_BEFORE, ENRECONSTRMODERNOZ.USE_LIMIT_N_BEFORE, ENRECONSTRMODERNOZ.DATEEXPLOITATIONIN, ENRECONSTRMODERNOZ.DATEEXPLOITATIONOUT, ENRECONSTRMODERNOZ.DEPARTMENTREFCODE, ENRECONSTRMODERNOZ.STATUSREFCODE, ENRECONSTRMODERNOZ.TYPEREFCODE, ENRECONSTRMODERNOZ.INVGROUPREFCODE, ENRECONSTRMODERNOZ.SERVICESOBJECTCODE "
			+" FROM ENRECONSTRMODERNOZ WHERE ENRECONSTRMODERNOZ.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject.characteristicOS = set.getString(21);
				anObject.isInvestProgram = set.getInt(22);
				if (set.wasNull()) {
					anObject.isInvestProgram = Integer.MIN_VALUE;
				}
				anObject.yearInvestProgram = set.getString(23);
				anObject.itemInvestProgram = set.getString(24);
				anObject.typeRM = set.getInt(25);
				if (set.wasNull()) {
					anObject.typeRM = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(26);
				anObject.domain_info = set.getString(27);
				anObject.modify_time = set.getLong(28);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.termUseful = set.getInt(29);
				if (set.wasNull()) {
					anObject.termUseful = Integer.MIN_VALUE;
				}
				anObject.use_limit_before = set.getInt(30);
				if (set.wasNull()) {
					anObject.use_limit_before = Integer.MIN_VALUE;
				}
				anObject.use_limit_n_before = set.getInt(31);
				if (set.wasNull()) {
					anObject.use_limit_n_before = Integer.MIN_VALUE;
				}
				anObject.dateExploitationIn = set.getDate(32);
				anObject.dateExploitationOut = set.getDate(33);
				anObject.departmentRef.code = set.getInt(34);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(35);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.typeRef.code = set.getInt(36);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
				}
				anObject.invgroupRef.code = set.getInt(37);
				if (set.wasNull()) {
					anObject.invgroupRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesobject.code = set.getInt(38);
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


	public com.ksoe.energynet.valueobject.references.ENReconstrModernOZRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENReconstrModernOZRef ref = new com.ksoe.energynet.valueobject.references.ENReconstrModernOZRef();
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

		selectStr = "DELETE FROM  ENRECONSTRMODERNOZ WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENReconstrModernOZ object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENReconstrModernOZ.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENReconstrModernOZ.remove%} access denied");
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
	
	public long count(ENReconstrModernOZFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENReconstrModernOZFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENReconstrModernOZFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENRECONSTRMODERNOZ", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENReconstrModernOZ.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENRECONSTRMODERNOZ.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENRECONSTRMODERNOZ WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENReconstrModernOZFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENReconstrModernOZFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENRECONSTRMODERNOZ");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENReconstrModernOZ.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENRECONSTRMODERNOZ.DOMAIN_INFO IS NOT NULL) ";
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENReconstrModernOZ.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENReconstrModernOZ.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENRECONSTRMODERNOZ.CODE FROM  ENRECONSTRMODERNOZ WHERE  ENRECONSTRMODERNOZ.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENRECONSTRMODERNOZ",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENRECONSTRMODERNOZ.CODE");
		_checkConditionToken(condition,"numbergen","ENRECONSTRMODERNOZ.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENRECONSTRMODERNOZ.DATEGEN");
		_checkConditionToken(condition,"dateedit","ENRECONSTRMODERNOZ.DATEEDIT");
		_checkConditionToken(condition,"summagen","ENRECONSTRMODERNOZ.SUMMAGEN");
		_checkConditionToken(condition,"summands","ENRECONSTRMODERNOZ.SUMMANDS");
		_checkConditionToken(condition,"characteristic","ENRECONSTRMODERNOZ.CHARACTERISTIC");
		_checkConditionToken(condition,"executedposition","ENRECONSTRMODERNOZ.EXECUTEDPOSITION");
		_checkConditionToken(condition,"executedname","ENRECONSTRMODERNOZ.EXECUTEDNAME");
		_checkConditionToken(condition,"acceptedposition","ENRECONSTRMODERNOZ.ACCEPTEDPOSITION");
		_checkConditionToken(condition,"acceptedname","ENRECONSTRMODERNOZ.ACCEPTEDNAME");
		_checkConditionToken(condition,"contractprice","ENRECONSTRMODERNOZ.CONTRACTPRICE");
		_checkConditionToken(condition,"codemol","ENRECONSTRMODERNOZ.CODEMOL");
		_checkConditionToken(condition,"codepodr","ENRECONSTRMODERNOZ.CODEPODR");
		_checkConditionToken(condition,"invnumberoz","ENRECONSTRMODERNOZ.INVNUMBEROZ");
		_checkConditionToken(condition,"nameoz","ENRECONSTRMODERNOZ.NAMEOZ");
		_checkConditionToken(condition,"fincontractnumber","ENRECONSTRMODERNOZ.FINCONTRACTNUMBER");
		_checkConditionToken(condition,"fincontractdate","ENRECONSTRMODERNOZ.FINCONTRACTDATE");
		_checkConditionToken(condition,"partnername","ENRECONSTRMODERNOZ.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENRECONSTRMODERNOZ.PARTNERCODE");
		_checkConditionToken(condition,"characteristicos","ENRECONSTRMODERNOZ.CHARACTERISTICOS");
		_checkConditionToken(condition,"isinvestprogram","ENRECONSTRMODERNOZ.ISINVESTPROGRAM");
		_checkConditionToken(condition,"yearinvestprogram","ENRECONSTRMODERNOZ.YEARINVESTPROGRAM");
		_checkConditionToken(condition,"iteminvestprogram","ENRECONSTRMODERNOZ.ITEMINVESTPROGRAM");
		_checkConditionToken(condition,"typerm","ENRECONSTRMODERNOZ.TYPERM");
		_checkConditionToken(condition,"usergen","ENRECONSTRMODERNOZ.USERGEN");
		_checkConditionToken(condition,"domain_info","ENRECONSTRMODERNOZ.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENRECONSTRMODERNOZ.MODIFY_TIME");
		_checkConditionToken(condition,"termuseful","ENRECONSTRMODERNOZ.TERMUSEFUL");
		_checkConditionToken(condition,"use_limit_before","ENRECONSTRMODERNOZ.USE_LIMIT_BEFORE");
		_checkConditionToken(condition,"use_limit_n_before","ENRECONSTRMODERNOZ.USE_LIMIT_N_BEFORE");
		_checkConditionToken(condition,"dateexploitationin","ENRECONSTRMODERNOZ.DATEEXPLOITATIONIN");
		_checkConditionToken(condition,"dateexploitationout","ENRECONSTRMODERNOZ.DATEEXPLOITATIONOUT");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
		_checkConditionToken(condition,"invgroupref","INVGROUPREFCODE");
		_checkConditionToken(condition,"invgroupref.code","INVGROUPREFCODE");
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
	
	private void _collectAutoIncrementFields(ENReconstrModernOZ anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENRECONSTRMODERNOZ", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENRECONSTRMODERNOZ", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENRECONSTRMODERNOZ", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENRECONSTRMODERNOZ");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENReconstrModernOZDAO
