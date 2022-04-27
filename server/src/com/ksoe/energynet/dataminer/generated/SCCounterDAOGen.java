
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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
import com.ksoe.energynet.valueobject.SCCounter;
import com.ksoe.energynet.valueobject.filter.SCCounterFilter;
import com.ksoe.energynet.valueobject.brief.SCCounterShort;
import com.ksoe.energynet.valueobject.lists.SCCounterShortList;


/**
 * DAO Object for SCCounter;
 *
 */

public class SCCounterDAOGen extends GenericDataMiner {

	public SCCounterDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCCounterDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCCounter inObject) throws PersistenceException {
		SCCounter obj = new SCCounter();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.buildNumber == null && obj.buildNumber == null){}
		else
			if(inObject.buildNumber == null || obj.buildNumber == null) return false;
			else
				if ( ! inObject.buildNumber.equals(obj.buildNumber)){
					return false;
				}

		if(inObject.account == null && obj.account == null){}
		else
			if(inObject.account == null || obj.account == null) return false;
			else
				if ( ! inObject.account.equals(obj.account)){
					return false;
				}

		if(inObject.departmetFKCode == null && obj.departmetFKCode == null){}
		else
			if(inObject.departmetFKCode == null || obj.departmetFKCode == null) return false;
			else
				if ( ! inObject.departmetFKCode.equals(obj.departmetFKCode)){
					return false;
				}

		if(inObject.molCode == null && obj.molCode == null){}
		else
			if(inObject.molCode == null || obj.molCode == null) return false;
			else
				if ( ! inObject.molCode.equals(obj.molCode)){
					return false;
				}

		if(inObject.dateIn == null && obj.dateIn == null){} else 
			if(inObject.dateIn == null || obj.dateIn == null) return false;
			else
				if (inObject.dateIn.compareTo(obj.dateIn) != 0){
					return false;
				}

		if(inObject.dateBuild == null && obj.dateBuild == null){} else 
			if(inObject.dateBuild == null || obj.dateBuild == null) return false;
			else
				if (inObject.dateBuild.compareTo(obj.dateBuild) != 0){
					return false;
				}

		if(inObject.dateCheck == null && obj.dateCheck == null){} else 
			if(inObject.dateCheck == null || obj.dateCheck == null) return false;
			else
				if (inObject.dateCheck.compareTo(obj.dateCheck) != 0){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if (inObject.scCode != obj.scCode){
					return false;
				}

		if(inObject.counterType == null && obj.counterType == null){}
		else
			if(inObject.counterType == null || obj.counterType == null) return false;
			else
				if ( ! inObject.counterType.equals(obj.counterType)){
					return false;
				}

		if(inObject.installOrderNumber == null && obj.installOrderNumber == null){}
		else
			if(inObject.installOrderNumber == null || obj.installOrderNumber == null) return false;
			else
				if ( ! inObject.installOrderNumber.equals(obj.installOrderNumber)){
					return false;
				}

		if(inObject.reading == null && obj.reading == null){}
		else
			if(inObject.reading == null || obj.reading == null) return false;
			else
				if ( ! inObject.reading.equals(obj.reading)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if (inObject.isliquid != obj.isliquid){
					return false;
				}

		if(inObject.costOld == null && obj.costOld == null){}
		else
			if(inObject.costOld == null || obj.costOld == null) return false;
			else
				if ( ! inObject.costOld.equals(obj.costOld)){
					return false;
				}

		if (inObject.isMoveToZKU != obj.isMoveToZKU){
					return false;
				}

		if(inObject.invnumberzku == null && obj.invnumberzku == null){}
		else
			if(inObject.invnumberzku == null || obj.invnumberzku == null) return false;
			else
				if ( ! inObject.invnumberzku.equals(obj.invnumberzku)){
					return false;
				}

		if(inObject.namezku == null && obj.namezku == null){}
		else
			if(inObject.namezku == null || obj.namezku == null) return false;
			else
				if ( ! inObject.namezku.equals(obj.namezku)){
					return false;
				}

		if(inObject.accountzku == null && obj.accountzku == null){}
		else
			if(inObject.accountzku == null || obj.accountzku == null) return false;
			else
				if ( ! inObject.accountzku.equals(obj.accountzku)){
					return false;
				}

		if(inObject.costzku == null && obj.costzku == null){}
		else
			if(inObject.costzku == null || obj.costzku == null) return false;
			else
				if ( ! inObject.costzku.equals(obj.costzku)){
					return false;
				}

		if (inObject.sccodezku != obj.sccodezku){
					return false;
				}

		if (inObject.elementcode != obj.elementcode){
					return false;
				}

		if(inObject.phasity == null && obj.phasity == null){}
		else
			if(inObject.phasity == null || obj.phasity == null) return false;
			else
				if ( ! inObject.phasity.equals(obj.phasity)){
					return false;
				}

		if(inObject.costzku_b == null && obj.costzku_b == null){}
		else
			if(inObject.costzku_b == null || obj.costzku_b == null) return false;
			else
				if ( ! inObject.costzku_b.equals(obj.costzku_b)){
					return false;
				}

		if (inObject.iszku != obj.iszku){
					return false;
				}

		if(inObject.lschet == null && obj.lschet == null){}
		else
			if(inObject.lschet == null || obj.lschet == null) return false;
			else
				if ( ! inObject.lschet.equals(obj.lschet)){
					return false;
				}

		if(inObject.placeust == null && obj.placeust == null){}
		else
			if(inObject.placeust == null || obj.placeust == null) return false;
			else
				if ( ! inObject.placeust.equals(obj.placeust)){
					return false;
				}

		if(inObject.priconndoc == null && obj.priconndoc == null){}
		else
			if(inObject.priconndoc == null || obj.priconndoc == null) return false;
			else
				if ( ! inObject.priconndoc.equals(obj.priconndoc)){
					return false;
				}

		if(inObject.priconndate == null && obj.priconndate == null){} else 
			if(inObject.priconndate == null || obj.priconndate == null) return false;
			else
				if (inObject.priconndate.compareTo(obj.priconndate) != 0){
					return false;
				}

		if(inObject.checkperiod == null && obj.checkperiod == null){}
		else
			if(inObject.checkperiod == null || obj.checkperiod == null) return false;
			else
				if ( ! inObject.checkperiod.equals(obj.checkperiod)){
					return false;
				}

		if(inObject.actInvitationNumber == null && obj.actInvitationNumber == null){}
		else
			if(inObject.actInvitationNumber == null || obj.actInvitationNumber == null) return false;
			else
				if ( ! inObject.actInvitationNumber.equals(obj.actInvitationNumber)){
					return false;
				}

		if(inObject.dateInvitation == null && obj.dateInvitation == null){} else 
			if(inObject.dateInvitation == null || obj.dateInvitation == null) return false;
			else
				if (inObject.dateInvitation.compareTo(obj.dateInvitation) != 0){
					return false;
				}

		if(inObject.dateExpertise == null && obj.dateExpertise == null){} else 
			if(inObject.dateExpertise == null || obj.dateExpertise == null) return false;
			else
				if (inObject.dateExpertise.compareTo(obj.dateExpertise) != 0){
					return false;
				}

		if(inObject.podrCodeZKU == null && obj.podrCodeZKU == null){}
		else
			if(inObject.podrCodeZKU == null || obj.podrCodeZKU == null) return false;
			else
				if ( ! inObject.podrCodeZKU.equals(obj.podrCodeZKU)){
					return false;
				}

		if (inObject.fundingType != obj.fundingType){
					return false;
				}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
			return false;
		}
		if (inObject.kindRef.code != obj.kindRef.code){
			return false;
		}
		if (inObject.zoneRef.code != obj.zoneRef.code){
			return false;
		}
		return true;
	}

	public int add(SCCounter anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCCounter anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCCOUNTER (CODE,INVNUMBER,NAME,BUILDNUMBER,ACCOUNT,DEPARTMETFKCODE,MOLCODE,DATEIN,DATEBUILD,DATECHECK,COST,SCCODE,COUNTERTYPE,INSTALLORDERNUMBER,READING,DATEEDIT,ISLIQUID,COSTOLD,ISMOVETOZKU,INVNUMBERZKU,NAMEZKU,ACCOUNTZKU,COSTZKU,SCCODEZKU,ELEMENTCODE,PHASITY,COSTZKU_B,ISZKU,LSCHET,PLACEUST,PRICONNDOC,PRICONNDATE,CHECKPERIOD,ACTINVITATIONNUMBER,DATEINVITATION,DATEEXPERTISE,PODRCODEZKU,FUNDINGTYPE,MODIFY_TIME,STATUSREFCODE,ESTIMATEITEMREFCODE,KINDREFCODE,ZONEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.invNumber);
			statement.setString(3, anObject.name);
			statement.setString(4, anObject.buildNumber);
			statement.setString(5, anObject.account);
			statement.setString(6, anObject.departmetFKCode);
			statement.setString(7, anObject.molCode);
			if (anObject.dateIn == null) {
				statement.setDate(8, null);
			} else {
				statement.setDate(8, new java.sql.Date(anObject.dateIn.getTime()));
			}
			if (anObject.dateBuild == null) {
				statement.setDate(9, null);
			} else {
				statement.setDate(9, new java.sql.Date(anObject.dateBuild.getTime()));
			}
			if (anObject.dateCheck == null) {
				statement.setDate(10, null);
			} else {
				statement.setDate(10, new java.sql.Date(anObject.dateCheck.getTime()));
			}
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.cost);
			if (anObject.scCode != Integer.MIN_VALUE ) {
				statement.setInt(12, anObject.scCode);
			} else {
				statement.setNull(12, java.sql.Types.INTEGER);
			}
			statement.setString(13, anObject.counterType);
			statement.setString(14, anObject.installOrderNumber);
			statement.setString(15, anObject.reading);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(16, null);
			} else {
				statement.setTimestamp(16, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.isliquid != Integer.MIN_VALUE ) {
				statement.setInt(17, anObject.isliquid);
			} else {
				statement.setNull(17, java.sql.Types.INTEGER);
			}
			if (anObject.costOld != null) {
				anObject.costOld = anObject.costOld.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.costOld);
			if (anObject.isMoveToZKU != Integer.MIN_VALUE ) {
				statement.setInt(19, anObject.isMoveToZKU);
			} else {
				statement.setNull(19, java.sql.Types.INTEGER);
			}
			statement.setString(20, anObject.invnumberzku);
			statement.setString(21, anObject.namezku);
			statement.setString(22, anObject.accountzku);
			if (anObject.costzku != null) {
				anObject.costzku = anObject.costzku.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23, anObject.costzku);
			if (anObject.sccodezku != Integer.MIN_VALUE ) {
				statement.setInt(24, anObject.sccodezku);
			} else {
				statement.setNull(24, java.sql.Types.INTEGER);
			}
			if (anObject.elementcode != Integer.MIN_VALUE ) {
				statement.setInt(25, anObject.elementcode);
			} else {
				statement.setNull(25, java.sql.Types.INTEGER);
			}
			if (anObject.phasity != null) {
				anObject.phasity = anObject.phasity.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26, anObject.phasity);
			if (anObject.costzku_b != null) {
				anObject.costzku_b = anObject.costzku_b.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(27, anObject.costzku_b);
			if (anObject.iszku != Integer.MIN_VALUE ) {
				statement.setInt(28, anObject.iszku);
			} else {
				statement.setNull(28, java.sql.Types.INTEGER);
			}
			statement.setString(29, anObject.lschet);
			statement.setString(30, anObject.placeust);
			statement.setString(31, anObject.priconndoc);
			if (anObject.priconndate == null) {
				statement.setDate(32, null);
			} else {
				statement.setDate(32, new java.sql.Date(anObject.priconndate.getTime()));
			}
			if (anObject.checkperiod != null) {
				anObject.checkperiod = anObject.checkperiod.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(33, anObject.checkperiod);
			statement.setString(34, anObject.actInvitationNumber);
			if (anObject.dateInvitation == null) {
				statement.setDate(35, null);
			} else {
				statement.setDate(35, new java.sql.Date(anObject.dateInvitation.getTime()));
			}
			if (anObject.dateExpertise == null) {
				statement.setTimestamp(36, null);
			} else {
				statement.setTimestamp(36, new java.sql.Timestamp(anObject.dateExpertise.getTime()));
			}
			statement.setString(37, anObject.podrCodeZKU);
			if (anObject.fundingType != Integer.MIN_VALUE ) {
				statement.setInt(38, anObject.fundingType);
			} else {
				statement.setNull(38, java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(39, null);
			} else {
				statement.setBigDecimal(39, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCCounterStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCCounter.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(40,anObject.statusRef.code);
			} else {
				statement.setNull(40,java.sql.Types.INTEGER);
			}
			if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCCounter.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
				}
				statement.setInt(41,anObject.estimateItemRef.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}
			if (anObject.kindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCCounterKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCCounter.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
				}
				statement.setInt(42,anObject.kindRef.code);
			} else {
				statement.setNull(42,java.sql.Types.INTEGER);
			}
			if (anObject.zoneRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQStorageZoneDAOGen(connection,getUserProfile()).exists(anObject.zoneRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.SCCounter.zoneRef.code%} = {%"+anObject.zoneRef.code+"%}");
				}
				statement.setInt(43,anObject.zoneRef.code);
			} else {
				statement.setNull(43,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%SCCounterDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCCounter anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCCounter anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCCounter oldObject = new SCCounter();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCCounter.modify_time_Field+" FROM  SCCOUNTER WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMETFKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEBUILD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECHECK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INSTALLORDERNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("READING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISLIQUID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTOLD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISMOVETOZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVNUMBERZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAMEZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SCCODEZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHASITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTZKU_B") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LSCHET") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLACEUST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICONNDOC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICONNDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHECKPERIOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTINVITATIONNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEINVITATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEXPERTISE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PODRCODEZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUNDINGTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ESTIMATEITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ZONEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCCOUNTER SET  INVNUMBER = ? , NAME = ? , BUILDNUMBER = ? , ACCOUNT = ? , DEPARTMETFKCODE = ? , MOLCODE = ? , DATEIN = ? , DATEBUILD = ? , DATECHECK = ? , COST = ? , SCCODE = ? , COUNTERTYPE = ? , INSTALLORDERNUMBER = ? , READING = ? , DATEEDIT = ? , ISLIQUID = ? , COSTOLD = ? , ISMOVETOZKU = ? , INVNUMBERZKU = ? , NAMEZKU = ? , ACCOUNTZKU = ? , COSTZKU = ? , SCCODEZKU = ? , ELEMENTCODE = ? , PHASITY = ? , COSTZKU_B = ? , ISZKU = ? , LSCHET = ? , PLACEUST = ? , PRICONNDOC = ? , PRICONNDATE = ? , CHECKPERIOD = ? , ACTINVITATIONNUMBER = ? , DATEINVITATION = ? , DATEEXPERTISE = ? , PODRCODEZKU = ? , FUNDINGTYPE = ? , MODIFY_TIME = ? , STATUSREFCODE = ? , ESTIMATEITEMREFCODE = ? , KINDREFCODE = ? , ZONEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCCOUNTER SET ";
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
					statement.setString(1, anObject.invNumber);
					statement.setString(2, anObject.name);
					statement.setString(3, anObject.buildNumber);
					statement.setString(4, anObject.account);
					statement.setString(5, anObject.departmetFKCode);
					statement.setString(6, anObject.molCode);
					if (anObject.dateIn == null) {
						statement.setDate(7, null);
					} else {
						statement.setDate(7, new java.sql.Date(anObject.dateIn.getTime()));
					}
					if (anObject.dateBuild == null) {
						statement.setDate(8, null);
					} else {
						statement.setDate(8, new java.sql.Date(anObject.dateBuild.getTime()));
					}
					if (anObject.dateCheck == null) {
						statement.setDate(9, null);
					} else {
						statement.setDate(9, new java.sql.Date(anObject.dateCheck.getTime()));
					}
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.cost);
					if (anObject.scCode != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.scCode);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					statement.setString(12, anObject.counterType);
					statement.setString(13, anObject.installOrderNumber);
					statement.setString(14, anObject.reading);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(15, null);
					} else {
						statement.setTimestamp(15, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.isliquid != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.isliquid);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					if (anObject.costOld != null) {
						anObject.costOld = anObject.costOld.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.costOld);
					if (anObject.isMoveToZKU != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.isMoveToZKU);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					statement.setString(19, anObject.invnumberzku);
					statement.setString(20, anObject.namezku);
					statement.setString(21, anObject.accountzku);
					if (anObject.costzku != null) {
						anObject.costzku = anObject.costzku.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22, anObject.costzku);
					if (anObject.sccodezku != Integer.MIN_VALUE) {
						statement.setInt(23, anObject.sccodezku);
					} else {
						statement.setNull(23, java.sql.Types.INTEGER);
					}
					if (anObject.elementcode != Integer.MIN_VALUE) {
						statement.setInt(24, anObject.elementcode);
					} else {
						statement.setNull(24, java.sql.Types.INTEGER);
					}
					if (anObject.phasity != null) {
						anObject.phasity = anObject.phasity.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25, anObject.phasity);
					if (anObject.costzku_b != null) {
						anObject.costzku_b = anObject.costzku_b.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(26, anObject.costzku_b);
					if (anObject.iszku != Integer.MIN_VALUE) {
						statement.setInt(27, anObject.iszku);
					} else {
						statement.setNull(27, java.sql.Types.INTEGER);
					}
					statement.setString(28, anObject.lschet);
					statement.setString(29, anObject.placeust);
					statement.setString(30, anObject.priconndoc);
					if (anObject.priconndate == null) {
						statement.setDate(31, null);
					} else {
						statement.setDate(31, new java.sql.Date(anObject.priconndate.getTime()));
					}
					if (anObject.checkperiod != null) {
						anObject.checkperiod = anObject.checkperiod.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(32, anObject.checkperiod);
					statement.setString(33, anObject.actInvitationNumber);
					if (anObject.dateInvitation == null) {
						statement.setDate(34, null);
					} else {
						statement.setDate(34, new java.sql.Date(anObject.dateInvitation.getTime()));
					}
					if (anObject.dateExpertise == null) {
						statement.setTimestamp(35, null);
					} else {
						statement.setTimestamp(35, new java.sql.Timestamp(anObject.dateExpertise.getTime()));
					}
					statement.setString(36, anObject.podrCodeZKU);
					if (anObject.fundingType != Integer.MIN_VALUE) {
						statement.setInt(37, anObject.fundingType);
					} else {
						statement.setNull(37, java.sql.Types.INTEGER);
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(38, null);
					} else {
						statement.setBigDecimal(38, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(39, anObject.statusRef.code);
					} else {
						statement.setNull(39, java.sql.Types.INTEGER);
					}
					if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(40, anObject.estimateItemRef.code);
					} else {
						statement.setNull(40, java.sql.Types.INTEGER);
					}
					if (anObject.kindRef.code != Integer.MIN_VALUE) {
						statement.setInt(41, anObject.kindRef.code);
					} else {
						statement.setNull(41, java.sql.Types.INTEGER);
					}
					if (anObject.zoneRef.code != Integer.MIN_VALUE) {
						statement.setInt(42, anObject.zoneRef.code);
					} else {
						statement.setNull(42, java.sql.Types.INTEGER);
					}
					statement.setInt(43, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invNumber);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("BUILDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.buildNumber);
							continue;
						}
						if("ACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.account);
							continue;
						}
						if("DEPARTMETFKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.departmetFKCode);
							continue;
						}
						if("MOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.molCode);
							continue;
						}
						if("DATEIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateIn == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateIn.getTime()));
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
						if("DATECHECK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateCheck == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateCheck.getTime()));
							}
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cost);
							continue;
						}
						if("SCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.scCode);
							continue;
						}
						if("COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.counterType);
							continue;
						}
						if("INSTALLORDERNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.installOrderNumber);
							continue;
						}
						if("READING".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reading);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("ISLIQUID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isliquid);
							continue;
						}
						if("COSTOLD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costOld != null) {
								anObject.costOld = anObject.costOld.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costOld);
							continue;
						}
						if("ISMOVETOZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isMoveToZKU);
							continue;
						}
						if("INVNUMBERZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invnumberzku);
							continue;
						}
						if("NAMEZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.namezku);
							continue;
						}
						if("ACCOUNTZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accountzku);
							continue;
						}
						if("COSTZKU".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costzku != null) {
								anObject.costzku = anObject.costzku.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costzku);
							continue;
						}
						if("SCCODEZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.sccodezku);
							continue;
						}
						if("ELEMENTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.elementcode);
							continue;
						}
						if("PHASITY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.phasity != null) {
								anObject.phasity = anObject.phasity.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.phasity);
							continue;
						}
						if("COSTZKU_B".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costzku_b != null) {
								anObject.costzku_b = anObject.costzku_b.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costzku_b);
							continue;
						}
						if("ISZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.iszku);
							continue;
						}
						if("LSCHET".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.lschet);
							continue;
						}
						if("PLACEUST".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.placeust);
							continue;
						}
						if("PRICONNDOC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.priconndoc);
							continue;
						}
						if("PRICONNDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priconndate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.priconndate.getTime()));
							}
							continue;
						}
						if("CHECKPERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.checkperiod != null) {
								anObject.checkperiod = anObject.checkperiod.setScale(0, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.checkperiod);
							continue;
						}
						if("ACTINVITATIONNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.actInvitationNumber);
							continue;
						}
						if("DATEINVITATION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateInvitation == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateInvitation.getTime()));
							}
							continue;
						}
						if("DATEEXPERTISE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateExpertise == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateExpertise.getTime()));
							}
							continue;
						}
						if("PODRCODEZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.podrCodeZKU);
							continue;
						}
						if("FUNDINGTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.fundingType);
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
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.statusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ESTIMATEITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.estimateItemRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("KINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.kindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.kindRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ZONEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.zoneRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.zoneRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(), anObject.code);
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

	} // end of save(SCCounter anObject,String[] anAttributes)


	public SCCounterShort getShortObject(int anObjectCode) throws PersistenceException {
		SCCounter filterObject = new SCCounter();
		Vector<SCCounterShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCCounterShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCCounter filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.buildNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.account, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmetFKCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCode, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateIn, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateBuild, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCheck, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.scCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.installOrderNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reading, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isliquid, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costOld, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isMoveToZKU, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invnumberzku, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.namezku, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountzku, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costzku, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sccodezku, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementcode, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.phasity, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costzku_b, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.iszku, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.lschet, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.placeust, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.priconndoc, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.priconndate, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.checkperiod, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.actInvitationNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateInvitation, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateExpertise, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.podrCodeZKU, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fundingType, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.estimateItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.zoneRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCCounterFilter filter) {
		String out = buildCondition((SCCounter)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCCounter filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCCounter.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, SCCounter.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, SCCounter.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.buildNumber, SCCounter.buildNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.account, SCCounter.account_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmetFKCode, SCCounter.departmetFKCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCode, SCCounter.molCode_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateIn, SCCounter.dateIn_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateBuild, SCCounter.dateBuild_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCheck, SCCounter.dateCheck_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, SCCounter.cost_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.scCode, SCCounter.scCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, SCCounter.counterType_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.installOrderNumber, SCCounter.installOrderNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reading, SCCounter.reading_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, SCCounter.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isliquid, SCCounter.isliquid_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costOld, SCCounter.costOld_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isMoveToZKU, SCCounter.isMoveToZKU_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invnumberzku, SCCounter.invnumberzku_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.namezku, SCCounter.namezku_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountzku, SCCounter.accountzku_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costzku, SCCounter.costzku_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sccodezku, SCCounter.sccodezku_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementcode, SCCounter.elementcode_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.phasity, SCCounter.phasity_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costzku_b, SCCounter.costzku_b_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.iszku, SCCounter.iszku_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.lschet, SCCounter.lschet_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.placeust, SCCounter.placeust_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.priconndoc, SCCounter.priconndoc_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.priconndate, SCCounter.priconndate_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.checkperiod, SCCounter.checkperiod_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.actInvitationNumber, SCCounter.actInvitationNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateInvitation, SCCounter.dateInvitation_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateExpertise, SCCounter.dateExpertise_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.podrCodeZKU, SCCounter.podrCodeZKU_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fundingType, SCCounter.fundingType_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCCounter.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, SCCounter.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.estimateItemRef.code, SCCounter.estimateItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kindRef.code, SCCounter.kindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.zoneRef.code, SCCounter.zoneRef_QFielld, out);
		}
		return out;
	}

	public SCCounterShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCCounterShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCCounterShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCCounterShortList getFilteredList(SCCounter filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCCounterShortList getScrollableFilteredList(SCCounter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCCounterShortList getScrollableFilteredList(SCCounter aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCCounterShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCCounterShortList getScrollableFilteredList(SCCounterFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCCounterShortList getScrollableFilteredList(SCCounterFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCCounterShortList getScrollableFilteredList(SCCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		SCCounterShortList result = new SCCounterShortList();
		SCCounterShort anObject;
		result.list = new Vector<SCCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCCOUNTER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCCOUNTER.CODE"+
			",SCCOUNTER.INVNUMBER"+
			",SCCOUNTER.NAME"+
			",SCCOUNTER.BUILDNUMBER"+
			",SCCOUNTER.ACCOUNT"+
			",SCCOUNTER.DEPARTMETFKCODE"+
			",SCCOUNTER.MOLCODE"+
			",SCCOUNTER.DATEIN"+
			",SCCOUNTER.DATEBUILD"+
			",SCCOUNTER.DATECHECK"+
			",SCCOUNTER.COST"+
			",SCCOUNTER.SCCODE"+
			",SCCOUNTER.COUNTERTYPE"+
			",SCCOUNTER.INSTALLORDERNUMBER"+
			",SCCOUNTER.READING"+
			",SCCOUNTER.DATEEDIT"+
			",SCCOUNTER.ISLIQUID"+
			",SCCOUNTER.COSTOLD"+
			",SCCOUNTER.ISMOVETOZKU"+
			",SCCOUNTER.INVNUMBERZKU"+
			",SCCOUNTER.NAMEZKU"+
			",SCCOUNTER.ACCOUNTZKU"+
			",SCCOUNTER.COSTZKU"+
			",SCCOUNTER.SCCODEZKU"+
			",SCCOUNTER.ELEMENTCODE"+
			",SCCOUNTER.PHASITY"+
			",SCCOUNTER.COSTZKU_B"+
			",SCCOUNTER.ISZKU"+
			",SCCOUNTER.LSCHET"+
			",SCCOUNTER.PLACEUST"+
			",SCCOUNTER.PRICONNDOC"+
			",SCCOUNTER.PRICONNDATE"+
			",SCCOUNTER.CHECKPERIOD"+
			",SCCOUNTER.ACTINVITATIONNUMBER"+
			",SCCOUNTER.DATEINVITATION"+
			",SCCOUNTER.DATEEXPERTISE"+
			",SCCOUNTER.PODRCODEZKU"+
			",SCCOUNTER.FUNDINGTYPE"+
			", SCCOUNTERSTATUS.CODE " +
			", SCCOUNTERSTATUS.NAME " +
			", ENESTIMATEITEM.CODE " +
			", ENESTIMATEITEM.COUNTGEN " +
			", ENESTIMATEITEM.COUNTFACT " +
			", ENESTIMATEITEM.PRICE " +
			", ENESTIMATEITEM.PRICEVRTU " +
			", ENESTIMATEITEM.COST " +
			", ENESTIMATEITEM.ISUSEVAT " +
			", ENESTIMATEITEM.DELIVERYTIME " +
			", ENESTIMATEITEM.USEWORKTIME " +
			", ENESTIMATEITEM.USERGEN " +
			", ENESTIMATEITEM.DATEEDIT " +
			", SCCOUNTERKIND.CODE " +
			", SCCOUNTERKIND.NAME " +
			", RQSTORAGEZONE.CODE " +
			", RQSTORAGEZONE.NAME " +
		" FROM SCCOUNTER " +
			" LEFT JOIN SCCOUNTERSTATUS on SCCOUNTERSTATUS.CODE = SCCOUNTER.STATUSREFCODE "+
			" LEFT JOIN ENESTIMATEITEM on ENESTIMATEITEM.CODE = SCCOUNTER.ESTIMATEITEMREFCODE "+
			" LEFT JOIN SCCOUNTERKIND on SCCOUNTERKIND.CODE = SCCOUNTER.KINDREFCODE "+
			" LEFT JOIN RQSTORAGEZONE on RQSTORAGEZONE.CODE = SCCOUNTER.ZONEREFCODE "+
		"";

	
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
				anObject = new SCCounterShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.dateCheck = set.getDate(10);
				anObject.cost = set.getBigDecimal(11);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(13);
				anObject.installOrderNumber = set.getString(14);
				anObject.reading = set.getString(15);
				anObject.dateEdit = set.getTimestamp(16);
				anObject.isliquid = set.getInt(17);
				if ( set.wasNull() ) {
					anObject.isliquid = Integer.MIN_VALUE;
				}
				anObject.costOld = set.getBigDecimal(18);
				if(anObject.costOld != null) {
					anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isMoveToZKU = set.getInt(19);
				if ( set.wasNull() ) {
					anObject.isMoveToZKU = Integer.MIN_VALUE;
				}
				anObject.invnumberzku = set.getString(20);
				anObject.namezku = set.getString(21);
				anObject.accountzku = set.getString(22);
				anObject.costzku = set.getBigDecimal(23);
				if(anObject.costzku != null) {
					anObject.costzku = anObject.costzku.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sccodezku = set.getInt(24);
				if ( set.wasNull() ) {
					anObject.sccodezku = Integer.MIN_VALUE;
				}
				anObject.elementcode = set.getInt(25);
				if ( set.wasNull() ) {
					anObject.elementcode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(26);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costzku_b = set.getBigDecimal(27);
				if(anObject.costzku_b != null) {
					anObject.costzku_b = anObject.costzku_b.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.iszku = set.getInt(28);
				if ( set.wasNull() ) {
					anObject.iszku = Integer.MIN_VALUE;
				}
				anObject.lschet = set.getString(29);
				anObject.placeust = set.getString(30);
				anObject.priconndoc = set.getString(31);
				anObject.priconndate = set.getDate(32);
				anObject.checkperiod = set.getBigDecimal(33);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actInvitationNumber = set.getString(34);
				anObject.dateInvitation = set.getDate(35);
				anObject.dateExpertise = set.getTimestamp(36);
				anObject.podrCodeZKU = set.getString(37);
				anObject.fundingType = set.getInt(38);
				if ( set.wasNull() ) {
					anObject.fundingType = Integer.MIN_VALUE;
				}

				anObject.statusRefCode = set.getInt(39);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(40);
				anObject.estimateItemRefCode = set.getInt(41);
				if(set.wasNull()) {
					anObject.estimateItemRefCode = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefCountGen = set.getBigDecimal(42);
				if(anObject.estimateItemRefCountGen != null) {
					anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefCountFact = set.getBigDecimal(43);
				if(anObject.estimateItemRefCountFact != null) {
					anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefPrice = set.getBigDecimal(44);
				if(anObject.estimateItemRefPrice != null) {
					anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefPriceVRTU = set.getBigDecimal(45);
				if(anObject.estimateItemRefPriceVRTU != null) {
					anObject.estimateItemRefPriceVRTU = anObject.estimateItemRefPriceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefCost = set.getBigDecimal(46);
				if(anObject.estimateItemRefCost != null) {
					anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefIsUseVAT = set.getInt(47);
				if(set.wasNull()) {
					anObject.estimateItemRefIsUseVAT = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefDeliveryTime = set.getInt(48);
				if(set.wasNull()) {
					anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefUseWorkTime = set.getInt(49);
				if(set.wasNull()) {
					anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefUserGen = set.getString(50);
				anObject.estimateItemRefDateEdit = set.getDate(51);
				anObject.kindRefCode = set.getInt(52);
				if(set.wasNull()) {
					anObject.kindRefCode = Integer.MIN_VALUE;
				}
				anObject.kindRefName = set.getString(53);
				anObject.zoneRefCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.zoneRefCode = Integer.MIN_VALUE;
				}
				anObject.zoneRefName = set.getString(55);

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
	
	public int[] getFilteredCodeArray(SCCounterFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(SCCounterFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(SCCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCCOUNTER.CODE FROM SCCOUNTER";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCCOUNTER.CODE";
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


	public SCCounter getObject(int uid) throws PersistenceException {
		SCCounter result = new SCCounter();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(SCCounter anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  SCCOUNTER.CODE, SCCOUNTER.INVNUMBER, SCCOUNTER.NAME, SCCOUNTER.BUILDNUMBER, SCCOUNTER.ACCOUNT, SCCOUNTER.DEPARTMETFKCODE, SCCOUNTER.MOLCODE, SCCOUNTER.DATEIN, SCCOUNTER.DATEBUILD, SCCOUNTER.DATECHECK, SCCOUNTER.COST, SCCOUNTER.SCCODE, SCCOUNTER.COUNTERTYPE, SCCOUNTER.INSTALLORDERNUMBER, SCCOUNTER.READING, SCCOUNTER.DATEEDIT, SCCOUNTER.ISLIQUID, SCCOUNTER.COSTOLD, SCCOUNTER.ISMOVETOZKU, SCCOUNTER.INVNUMBERZKU, SCCOUNTER.NAMEZKU, SCCOUNTER.ACCOUNTZKU, SCCOUNTER.COSTZKU, SCCOUNTER.SCCODEZKU, SCCOUNTER.ELEMENTCODE, SCCOUNTER.PHASITY, SCCOUNTER.COSTZKU_B, SCCOUNTER.ISZKU, SCCOUNTER.LSCHET, SCCOUNTER.PLACEUST, SCCOUNTER.PRICONNDOC, SCCOUNTER.PRICONNDATE, SCCOUNTER.CHECKPERIOD, SCCOUNTER.ACTINVITATIONNUMBER, SCCOUNTER.DATEINVITATION, SCCOUNTER.DATEEXPERTISE, SCCOUNTER.PODRCODEZKU, SCCOUNTER.FUNDINGTYPE, SCCOUNTER.MODIFY_TIME, SCCOUNTER.STATUSREFCODE, SCCOUNTER.ESTIMATEITEMREFCODE, SCCOUNTER.KINDREFCODE, SCCOUNTER.ZONEREFCODE "
			+" FROM SCCOUNTER WHERE SCCOUNTER.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.dateCheck = set.getDate(10);
				anObject.cost = set.getBigDecimal(11);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(12);
				if (set.wasNull()) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(13);
				anObject.installOrderNumber = set.getString(14);
				anObject.reading = set.getString(15);
				anObject.dateEdit = set.getTimestamp(16);
				anObject.isliquid = set.getInt(17);
				if (set.wasNull()) {
					anObject.isliquid = Integer.MIN_VALUE;
				}
				anObject.costOld = set.getBigDecimal(18);
				if(anObject.costOld != null) {
					anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isMoveToZKU = set.getInt(19);
				if (set.wasNull()) {
					anObject.isMoveToZKU = Integer.MIN_VALUE;
				}
				anObject.invnumberzku = set.getString(20);
				anObject.namezku = set.getString(21);
				anObject.accountzku = set.getString(22);
				anObject.costzku = set.getBigDecimal(23);
				if(anObject.costzku != null) {
					anObject.costzku = anObject.costzku.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sccodezku = set.getInt(24);
				if (set.wasNull()) {
					anObject.sccodezku = Integer.MIN_VALUE;
				}
				anObject.elementcode = set.getInt(25);
				if (set.wasNull()) {
					anObject.elementcode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(26);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costzku_b = set.getBigDecimal(27);
				if(anObject.costzku_b != null) {
					anObject.costzku_b = anObject.costzku_b.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.iszku = set.getInt(28);
				if (set.wasNull()) {
					anObject.iszku = Integer.MIN_VALUE;
				}
				anObject.lschet = set.getString(29);
				anObject.placeust = set.getString(30);
				anObject.priconndoc = set.getString(31);
				anObject.priconndate = set.getDate(32);
				anObject.checkperiod = set.getBigDecimal(33);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actInvitationNumber = set.getString(34);
				anObject.dateInvitation = set.getDate(35);
				anObject.dateExpertise = set.getTimestamp(36);
				anObject.podrCodeZKU = set.getString(37);
				anObject.fundingType = set.getInt(38);
				if (set.wasNull()) {
					anObject.fundingType = Integer.MIN_VALUE;
				}
				anObject.modify_time = set.getLong(39);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(40);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.estimateItemRef.code = set.getInt(41);
				if (set.wasNull()) {
					anObject.estimateItemRef.code = Integer.MIN_VALUE;
				}
				anObject.kindRef.code = set.getInt(42);
				if (set.wasNull()) {
					anObject.kindRef.code = Integer.MIN_VALUE;
				}
				anObject.zoneRef.code = set.getInt(43);
				if (set.wasNull()) {
					anObject.zoneRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.SCCounterRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCCounterRef ref = new com.ksoe.energynet.valueobject.references.SCCounterRef();
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

		selectStr = "DELETE FROM  SCCOUNTER WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCCounter object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCCounter.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(SCCounter.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%SCCounter.remove%} access denied");
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
	
	public long count(SCCounterFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCCounterFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCCounterFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCCOUNTER", aggFunction, column);
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
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM SCCOUNTER WHERE code = ?", propertyName);
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

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, SCCounterFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "SCCOUNTER");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCCounter.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCCounter.getObject%} access denied");
		}

		selectStr =
			"SELECT  SCCOUNTER.CODE FROM  SCCOUNTER WHERE  SCCOUNTER.CODE = ?";
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
		_checkConditionToken(condition,"code","SCCOUNTER.CODE");
		_checkConditionToken(condition,"invnumber","SCCOUNTER.INVNUMBER");
		_checkConditionToken(condition,"name","SCCOUNTER.NAME");
		_checkConditionToken(condition,"buildnumber","SCCOUNTER.BUILDNUMBER");
		_checkConditionToken(condition,"account","SCCOUNTER.ACCOUNT");
		_checkConditionToken(condition,"departmetfkcode","SCCOUNTER.DEPARTMETFKCODE");
		_checkConditionToken(condition,"molcode","SCCOUNTER.MOLCODE");
		_checkConditionToken(condition,"datein","SCCOUNTER.DATEIN");
		_checkConditionToken(condition,"datebuild","SCCOUNTER.DATEBUILD");
		_checkConditionToken(condition,"datecheck","SCCOUNTER.DATECHECK");
		_checkConditionToken(condition,"cost","SCCOUNTER.COST");
		_checkConditionToken(condition,"sccode","SCCOUNTER.SCCODE");
		_checkConditionToken(condition,"countertype","SCCOUNTER.COUNTERTYPE");
		_checkConditionToken(condition,"installordernumber","SCCOUNTER.INSTALLORDERNUMBER");
		_checkConditionToken(condition,"reading","SCCOUNTER.READING");
		_checkConditionToken(condition,"dateedit","SCCOUNTER.DATEEDIT");
		_checkConditionToken(condition,"isliquid","SCCOUNTER.ISLIQUID");
		_checkConditionToken(condition,"costold","SCCOUNTER.COSTOLD");
		_checkConditionToken(condition,"ismovetozku","SCCOUNTER.ISMOVETOZKU");
		_checkConditionToken(condition,"invnumberzku","SCCOUNTER.INVNUMBERZKU");
		_checkConditionToken(condition,"namezku","SCCOUNTER.NAMEZKU");
		_checkConditionToken(condition,"accountzku","SCCOUNTER.ACCOUNTZKU");
		_checkConditionToken(condition,"costzku","SCCOUNTER.COSTZKU");
		_checkConditionToken(condition,"sccodezku","SCCOUNTER.SCCODEZKU");
		_checkConditionToken(condition,"elementcode","SCCOUNTER.ELEMENTCODE");
		_checkConditionToken(condition,"phasity","SCCOUNTER.PHASITY");
		_checkConditionToken(condition,"costzku_b","SCCOUNTER.COSTZKU_B");
		_checkConditionToken(condition,"iszku","SCCOUNTER.ISZKU");
		_checkConditionToken(condition,"lschet","SCCOUNTER.LSCHET");
		_checkConditionToken(condition,"placeust","SCCOUNTER.PLACEUST");
		_checkConditionToken(condition,"priconndoc","SCCOUNTER.PRICONNDOC");
		_checkConditionToken(condition,"priconndate","SCCOUNTER.PRICONNDATE");
		_checkConditionToken(condition,"checkperiod","SCCOUNTER.CHECKPERIOD");
		_checkConditionToken(condition,"actinvitationnumber","SCCOUNTER.ACTINVITATIONNUMBER");
		_checkConditionToken(condition,"dateinvitation","SCCOUNTER.DATEINVITATION");
		_checkConditionToken(condition,"dateexpertise","SCCOUNTER.DATEEXPERTISE");
		_checkConditionToken(condition,"podrcodezku","SCCOUNTER.PODRCODEZKU");
		_checkConditionToken(condition,"fundingtype","SCCOUNTER.FUNDINGTYPE");
		_checkConditionToken(condition,"modify_time","SCCOUNTER.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
		_checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
		_checkConditionToken(condition,"kindref","KINDREFCODE");
		_checkConditionToken(condition,"kindref.code","KINDREFCODE");
		_checkConditionToken(condition,"zoneref","ZONEREFCODE");
		_checkConditionToken(condition,"zoneref.code","ZONEREFCODE");
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
	
	private void _collectAutoIncrementFields(SCCounter anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCCOUNTER", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCCOUNTER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCCOUNTER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCCOUNTER");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCCounterDAO
