
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
import com.ksoe.energynet.valueobject.ENRecordPointByt;
import com.ksoe.energynet.valueobject.filter.ENRecordPointBytFilter;
import com.ksoe.energynet.valueobject.brief.ENRecordPointBytShort;
import com.ksoe.energynet.valueobject.lists.ENRecordPointBytShortList;


/**
 * DAO Object for ENRecordPointByt;
 *
 */

public class ENRecordPointBytDAOGen extends GenericDataMiner {

	public ENRecordPointBytDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENRecordPointBytDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENRecordPointByt inObject) throws PersistenceException {
		ENRecordPointByt obj = new ENRecordPointByt();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.accountNumber == null && obj.accountNumber == null){}
		else
			if(inObject.accountNumber == null || obj.accountNumber == null) return false;
			else
				if ( ! inObject.accountNumber.equals(obj.accountNumber)){
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

		if(inObject.address == null && obj.address == null){}
		else
			if(inObject.address == null || obj.address == null) return false;
			else
				if ( ! inObject.address.equals(obj.address)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if (inObject.rpCode != obj.rpCode){
					return false;
				}

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if(inObject.serialNumber == null && obj.serialNumber == null){}
		else
			if(inObject.serialNumber == null || obj.serialNumber == null) return false;
			else
				if ( ! inObject.serialNumber.equals(obj.serialNumber)){
					return false;
				}

		if(inObject.dateCounterInst == null && obj.dateCounterInst == null){} else 
			if(inObject.dateCounterInst == null || obj.dateCounterInst == null) return false;
			else
				if (inObject.dateCounterInst.compareTo(obj.dateCounterInst) != 0){
					return false;
				}

		if(inObject.dateCounterCheck == null && obj.dateCounterCheck == null){} else 
			if(inObject.dateCounterCheck == null || obj.dateCounterCheck == null) return false;
			else
				if (inObject.dateCounterCheck.compareTo(obj.dateCounterCheck) != 0){
					return false;
				}

		if(inObject.counterType == null && obj.counterType == null){}
		else
			if(inObject.counterType == null || obj.counterType == null) return false;
			else
				if ( ! inObject.counterType.equals(obj.counterType)){
					return false;
				}

		if(inObject.classAccuracy == null && obj.classAccuracy == null){}
		else
			if(inObject.classAccuracy == null || obj.classAccuracy == null) return false;
			else
				if ( ! inObject.classAccuracy.equals(obj.classAccuracy)){
					return false;
				}

		if(inObject.checkperiod == null && obj.checkperiod == null){}
		else
			if(inObject.checkperiod == null || obj.checkperiod == null) return false;
			else
				if ( ! inObject.checkperiod.equals(obj.checkperiod)){
					return false;
				}

		if (inObject.statuscode != obj.statuscode){
					return false;
				}

		if(inObject.phasity == null && obj.phasity == null){}
		else
			if(inObject.phasity == null || obj.phasity == null) return false;
			else
				if ( ! inObject.phasity.equals(obj.phasity)){
					return false;
				}

		if(inObject.datecheck == null && obj.datecheck == null){} else 
			if(inObject.datecheck == null || obj.datecheck == null) return false;
			else
				if (inObject.datecheck.compareTo(obj.datecheck) != 0){
					return false;
				}

		if(inObject.checkperiod1 == null && obj.checkperiod1 == null){}
		else
			if(inObject.checkperiod1 == null || obj.checkperiod1 == null) return false;
			else
				if ( ! inObject.checkperiod1.equals(obj.checkperiod1)){
					return false;
				}

		if(inObject.phone == null && obj.phone == null){}
		else
			if(inObject.phone == null || obj.phone == null) return false;
			else
				if ( ! inObject.phone.equals(obj.phone)){
					return false;
				}

		if(inObject.seal == null && obj.seal == null){}
		else
			if(inObject.seal == null || obj.seal == null) return false;
			else
				if ( ! inObject.seal.equals(obj.seal)){
					return false;
				}

		if(inObject.placecounter == null && obj.placecounter == null){}
		else
			if(inObject.placecounter == null || obj.placecounter == null) return false;
			else
				if ( ! inObject.placecounter.equals(obj.placecounter)){
					return false;
				}

		if (inObject.isworking != obj.isworking){
					return false;
				}

		if (inObject.counterCapacity != obj.counterCapacity){
					return false;
				}

		if(inObject.counterVoltageNominal == null && obj.counterVoltageNominal == null){}
		else
			if(inObject.counterVoltageNominal == null || obj.counterVoltageNominal == null) return false;
			else
				if ( ! inObject.counterVoltageNominal.equals(obj.counterVoltageNominal)){
					return false;
				}

		if(inObject.counterDateProduct == null && obj.counterDateProduct == null){} else 
			if(inObject.counterDateProduct == null || obj.counterDateProduct == null) return false;
			else
				if (inObject.counterDateProduct.compareTo(obj.counterDateProduct) != 0){
					return false;
				}

		if (inObject.areaType != obj.areaType){
					return false;
				}

		if (inObject.fiderCode != obj.fiderCode){
					return false;
				}

		if(inObject.fiderName == null && obj.fiderName == null){}
		else
			if(inObject.fiderName == null || obj.fiderName == null) return false;
			else
				if ( ! inObject.fiderName.equals(obj.fiderName)){
					return false;
				}

		if (inObject.disablePlan != obj.disablePlan){
					return false;
				}

		if(inObject.codeEIC == null && obj.codeEIC == null){}
		else
			if(inObject.codeEIC == null || obj.codeEIC == null) return false;
			else
				if ( ! inObject.codeEIC.equals(obj.codeEIC)){
					return false;
				}

		if(inObject.tower == null && obj.tower == null){}
		else
			if(inObject.tower == null || obj.tower == null) return false;
			else
				if ( ! inObject.tower.equals(obj.tower)){
					return false;
				}

		if(inObject.feeder04 == null && obj.feeder04 == null){}
		else
			if(inObject.feeder04 == null || obj.feeder04 == null) return false;
			else
				if ( ! inObject.feeder04.equals(obj.feeder04)){
					return false;
				}

		if(inObject.dateFirstConsumption == null && obj.dateFirstConsumption == null){} else 
			if(inObject.dateFirstConsumption == null || obj.dateFirstConsumption == null) return false;
			else
				if (inObject.dateFirstConsumption.compareTo(obj.dateFirstConsumption) != 0){
					return false;
				}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.siteRef.code != obj.siteRef.code){
			return false;
		}
		
		if(inObject.prevCounterCheck == null && obj.prevCounterCheck == null){} else 
			if(inObject.prevCounterCheck == null || obj.prevCounterCheck == null) return false;
			else
				if (inObject.prevCounterCheck.compareTo(obj.prevCounterCheck) != 0){
					return false;
				}

		if (inObject.prevCheckPeriod != obj.prevCheckPeriod){
			return false;
		}
		
		return true;
	}

	public int add(ENRecordPointByt anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENRecordPointByt anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENRECORDPOINTBYT (CODE,ACCOUNTNUMBER,CONTRACTDATE,NAME,ADDRESS,COMMENTGEN,RPCODE,DOMAIN_INFO,MODIFY_TIME,INVNUMBER,SERIALNUMBER,DATECOUNTERINST,DATECOUNTERCHECK,COUNTERTYPE,CLASSACCURACY,CHECKPERIOD,STATUSCODE,PHASITY,DATECHECK,CHECKPERIOD1,PHONE,SEAL,PLACECOUNTER,ISWORKING,COUNTERCAPACITY,COUNTERVOLTAGENOMINAL,COUNTERDATEPRODUCT,AREATYPE,FIDERCODE,FIDERNAME,DISABLEPLAN,CODEEIC,TOWER,FEEDER04,DATEFIRSTCONSUMPTION,ELEMENTCODE,SITEREFCODE,PREVCOUNTERCHECK,PREVCHECKPERIOD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.accountNumber);
			if (anObject.contractDate == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(4, anObject.name);
			statement.setString(5, anObject.address);
			statement.setString(6, anObject.commentGen);
			if (anObject.rpCode != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.rpCode);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setString(8, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(9, null);
			} else {
				statement.setBigDecimal(9, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(10, anObject.invNumber);
			statement.setString(11, anObject.serialNumber);
			if (anObject.dateCounterInst == null) {
				statement.setDate(12, null);
			} else {
				statement.setDate(12, new java.sql.Date(anObject.dateCounterInst.getTime()));
			}
			if (anObject.dateCounterCheck == null) {
				statement.setDate(13, null);
			} else {
				statement.setDate(13, new java.sql.Date(anObject.dateCounterCheck.getTime()));
			}
			statement.setString(14, anObject.counterType);
			if (anObject.classAccuracy != null) {
				anObject.classAccuracy = anObject.classAccuracy.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.classAccuracy);
			if (anObject.checkperiod != null) {
				anObject.checkperiod = anObject.checkperiod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.checkperiod);
			if (anObject.statuscode != Integer.MIN_VALUE ) {
				statement.setInt(17, anObject.statuscode);
			} else {
				statement.setNull(17, java.sql.Types.INTEGER);
			}
			if (anObject.phasity != null) {
				anObject.phasity = anObject.phasity.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.phasity);
			if (anObject.datecheck == null) {
				statement.setDate(19, null);
			} else {
				statement.setDate(19, new java.sql.Date(anObject.datecheck.getTime()));
			}
			if (anObject.checkperiod1 != null) {
				anObject.checkperiod1 = anObject.checkperiod1.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.checkperiod1);
			statement.setString(21, anObject.phone);
			statement.setString(22, anObject.seal);
			statement.setString(23, anObject.placecounter);
			if (anObject.isworking != Integer.MIN_VALUE ) {
				statement.setInt(24, anObject.isworking);
			} else {
				statement.setNull(24, java.sql.Types.INTEGER);
			}
			if (anObject.counterCapacity != Integer.MIN_VALUE ) {
				statement.setInt(25, anObject.counterCapacity);
			} else {
				statement.setNull(25, java.sql.Types.INTEGER);
			}
			if (anObject.counterVoltageNominal != null) {
				anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26, anObject.counterVoltageNominal);
			if (anObject.counterDateProduct == null) {
				statement.setDate(27, null);
			} else {
				statement.setDate(27, new java.sql.Date(anObject.counterDateProduct.getTime()));
			}
			if (anObject.areaType != Integer.MIN_VALUE ) {
				statement.setInt(28, anObject.areaType);
			} else {
				statement.setNull(28, java.sql.Types.INTEGER);
			}
			if (anObject.fiderCode != Integer.MIN_VALUE ) {
				statement.setInt(29, anObject.fiderCode);
			} else {
				statement.setNull(29, java.sql.Types.INTEGER);
			}
			statement.setString(30, anObject.fiderName);
			if (anObject.disablePlan != Integer.MIN_VALUE ) {
				statement.setInt(31, anObject.disablePlan);
			} else {
				statement.setNull(31, java.sql.Types.INTEGER);
			}
			statement.setString(32, anObject.codeEIC);
			statement.setString(33, anObject.tower);
			statement.setString(34, anObject.feeder04);
			if (anObject.dateFirstConsumption == null) {
				statement.setDate(35, null);
			} else {
				statement.setDate(35, new java.sql.Date(anObject.dateFirstConsumption.getTime()));
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				statement.setInt(36,anObject.element.code);
			} else {
				statement.setNull(36,java.sql.Types.INTEGER);
			}
			if (anObject.siteRef.code != Integer.MIN_VALUE){
				statement.setInt(37,anObject.siteRef.code);
			} else {
				statement.setNull(37,java.sql.Types.INTEGER);
			}

			if (anObject.prevCounterCheck == null) {
				statement.setDate(38, null);
			} else {
				statement.setDate(38, new java.sql.Date(anObject.prevCounterCheck.getTime()));
			}

			if (anObject.prevCheckPeriod != Integer.MIN_VALUE ) {
				statement.setInt(39, anObject.prevCheckPeriod);
			} else {
				statement.setNull(39, java.sql.Types.INTEGER);
			}

			
			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENRecordPointBytDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENRecordPointByt anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENRecordPointByt anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENRecordPointByt oldObject = new ENRecordPointByt();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENRecordPointByt.modify_time_Field + "," + ENRecordPointByt.domain_info_Field+" FROM  ENRECORDPOINTBYT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("ACCOUNTNUMBER") == 0) {
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
					if(fieldNameStr.compareTo("ADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RPCODE") == 0) {
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
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERIALNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECOUNTERINST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECOUNTERCHECK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLASSACCURACY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHECKPERIOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHASITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECHECK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHECKPERIOD1") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SEAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLACECOUNTER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISWORKING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERCAPACITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERVOLTAGENOMINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERDATEPRODUCT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AREATYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FIDERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FIDERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DISABLEPLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CODEEIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FEEDER04") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFIRSTCONSUMPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SITEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PREVCOUNTERCHECK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PREVCHECKPERIOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}

				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENRECORDPOINTBYT SET  ACCOUNTNUMBER = ? , CONTRACTDATE = ? , NAME = ? , ADDRESS = ? , COMMENTGEN = ? , RPCODE = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , INVNUMBER = ? , SERIALNUMBER = ? , DATECOUNTERINST = ? , DATECOUNTERCHECK = ? , COUNTERTYPE = ? , CLASSACCURACY = ? , CHECKPERIOD = ? , STATUSCODE = ? , PHASITY = ? , DATECHECK = ? , CHECKPERIOD1 = ? , PHONE = ? , SEAL = ? , PLACECOUNTER = ? , ISWORKING = ? , COUNTERCAPACITY = ? , COUNTERVOLTAGENOMINAL = ? , COUNTERDATEPRODUCT = ? , AREATYPE = ? , FIDERCODE = ? , FIDERNAME = ? , DISABLEPLAN = ? , CODEEIC = ? , TOWER = ? , FEEDER04 = ? , DATEFIRSTCONSUMPTION = ? , ELEMENTCODE = ? , SITEREFCODE = ? , PREVCOUNTERCHECK = ? , PREVCHECKPERIOD = ? "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENRECORDPOINTBYT SET ";
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
					statement.setString(1, anObject.accountNumber);
					if (anObject.contractDate == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(3, anObject.name);
					statement.setString(4, anObject.address);
					statement.setString(5, anObject.commentGen);
					if (anObject.rpCode != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.rpCode);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setString(7, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(8, null);
					} else {
						statement.setBigDecimal(8, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(9, anObject.invNumber);
					statement.setString(10, anObject.serialNumber);
					if (anObject.dateCounterInst == null) {
						statement.setDate(11, null);
					} else {
						statement.setDate(11, new java.sql.Date(anObject.dateCounterInst.getTime()));
					}
					if (anObject.dateCounterCheck == null) {
						statement.setDate(12, null);
					} else {
						statement.setDate(12, new java.sql.Date(anObject.dateCounterCheck.getTime()));
					}
					statement.setString(13, anObject.counterType);
					if (anObject.classAccuracy != null) {
						anObject.classAccuracy = anObject.classAccuracy.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.classAccuracy);
					if (anObject.checkperiod != null) {
						anObject.checkperiod = anObject.checkperiod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.checkperiod);
					if (anObject.statuscode != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.statuscode);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					if (anObject.phasity != null) {
						anObject.phasity = anObject.phasity.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.phasity);
					if (anObject.datecheck == null) {
						statement.setDate(18, null);
					} else {
						statement.setDate(18, new java.sql.Date(anObject.datecheck.getTime()));
					}
					if (anObject.checkperiod1 != null) {
						anObject.checkperiod1 = anObject.checkperiod1.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.checkperiod1);
					statement.setString(20, anObject.phone);
					statement.setString(21, anObject.seal);
					statement.setString(22, anObject.placecounter);
					if (anObject.isworking != Integer.MIN_VALUE) {
						statement.setInt(23, anObject.isworking);
					} else {
						statement.setNull(23, java.sql.Types.INTEGER);
					}
					if (anObject.counterCapacity != Integer.MIN_VALUE) {
						statement.setInt(24, anObject.counterCapacity);
					} else {
						statement.setNull(24, java.sql.Types.INTEGER);
					}
					if (anObject.counterVoltageNominal != null) {
						anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25, anObject.counterVoltageNominal);
					if (anObject.counterDateProduct == null) {
						statement.setDate(26, null);
					} else {
						statement.setDate(26, new java.sql.Date(anObject.counterDateProduct.getTime()));
					}
					if (anObject.areaType != Integer.MIN_VALUE) {
						statement.setInt(27, anObject.areaType);
					} else {
						statement.setNull(27, java.sql.Types.INTEGER);
					}
					if (anObject.fiderCode != Integer.MIN_VALUE) {
						statement.setInt(28, anObject.fiderCode);
					} else {
						statement.setNull(28, java.sql.Types.INTEGER);
					}
					statement.setString(29, anObject.fiderName);
					if (anObject.disablePlan != Integer.MIN_VALUE) {
						statement.setInt(30, anObject.disablePlan);
					} else {
						statement.setNull(30, java.sql.Types.INTEGER);
					}
					statement.setString(31, anObject.codeEIC);
					statement.setString(32, anObject.tower);
					statement.setString(33, anObject.feeder04);
					if (anObject.dateFirstConsumption == null) {
						statement.setDate(34, null);
					} else {
						statement.setDate(34, new java.sql.Date(anObject.dateFirstConsumption.getTime()));
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(35, anObject.element.code);
					} else {
						statement.setNull(35, java.sql.Types.INTEGER);
					}
					if (anObject.siteRef.code != Integer.MIN_VALUE) {
						statement.setInt(36, anObject.siteRef.code);
					} else {
						statement.setNull(36, java.sql.Types.INTEGER);
					}
					
					if (anObject.prevCounterCheck == null) {
						statement.setDate(37, null);
					} else {
						statement.setDate(37, new java.sql.Date(anObject.prevCounterCheck.getTime()));
					}
					
					if (anObject.prevCheckPeriod != Integer.MIN_VALUE) {
						statement.setInt(38, anObject.prevCheckPeriod);
					} else {
						statement.setNull(38, java.sql.Types.INTEGER);
					}
					
					statement.setInt(39, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("ACCOUNTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accountNumber);
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
						if("ADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.address);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("RPCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.rpCode);
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
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invNumber);
							continue;
						}
						if("SERIALNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.serialNumber);
							continue;
						}
						if("DATECOUNTERINST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateCounterInst == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateCounterInst.getTime()));
							}
							continue;
						}
						if("DATECOUNTERCHECK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateCounterCheck == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateCounterCheck.getTime()));
							}
							continue;
						}
						if("COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.counterType);
							continue;
						}
						if("CLASSACCURACY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.classAccuracy != null) {
								anObject.classAccuracy = anObject.classAccuracy.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.classAccuracy);
							continue;
						}
						if("CHECKPERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.checkperiod != null) {
								anObject.checkperiod = anObject.checkperiod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.checkperiod);
							continue;
						}
						if("STATUSCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.statuscode);
							continue;
						}
						if("PHASITY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.phasity != null) {
								anObject.phasity = anObject.phasity.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.phasity);
							continue;
						}
						if("DATECHECK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datecheck == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datecheck.getTime()));
							}
							continue;
						}
						if("CHECKPERIOD1".compareTo((String)fields.get(i)) == 0) {
							if (anObject.checkperiod1 != null) {
								anObject.checkperiod1 = anObject.checkperiod1.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.checkperiod1);
							continue;
						}
						if("PHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.phone);
							continue;
						}
						if("SEAL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.seal);
							continue;
						}
						if("PLACECOUNTER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.placecounter);
							continue;
						}
						if("ISWORKING".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isworking);
							continue;
						}
						if("COUNTERCAPACITY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.counterCapacity);
							continue;
						}
						if("COUNTERVOLTAGENOMINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.counterVoltageNominal != null) {
								anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.counterVoltageNominal);
							continue;
						}
						if("COUNTERDATEPRODUCT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.counterDateProduct == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.counterDateProduct.getTime()));
							}
							continue;
						}
						if("AREATYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.areaType);
							continue;
						}
						if("FIDERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.fiderCode);
							continue;
						}
						if("FIDERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.fiderName);
							continue;
						}
						if("DISABLEPLAN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.disablePlan);
							continue;
						}
						if("CODEEIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.codeEIC);
							continue;
						}
						if("TOWER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.tower);
							continue;
						}
						if("FEEDER04".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.feeder04);
							continue;
						}
						if("DATEFIRSTCONSUMPTION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFirstConsumption == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFirstConsumption.getTime()));
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
						if("SITEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.siteRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.siteRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PREVCOUNTERCHECK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.prevCounterCheck == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.prevCounterCheck.getTime()));
							}
							continue;
						}
						
						if("PREVCHECKPERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.prevCheckPeriod != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.prevCheckPeriod);
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

	} // end of save(ENRecordPointByt anObject,String[] anAttributes)


	public ENRecordPointBytShort getShortObject(int anObjectCode) throws PersistenceException {
		ENRecordPointByt filterObject = new ENRecordPointByt();
		Vector<ENRecordPointBytShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENRecordPointBytShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENRecordPointByt filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.address, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rpCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.serialNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCounterInst, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCounterCheck, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.classAccuracy, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.checkperiod, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statuscode, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.phasity, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datecheck, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.checkperiod1, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.phone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.seal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.placecounter, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isworking, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.counterCapacity, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.counterVoltageNominal, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.counterDateProduct, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.areaType, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fiderCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.fiderName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.disablePlan, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codeEIC, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tower, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.feeder04, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFirstConsumption, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.siteRef.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.prevCounterCheck, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.prevCheckPeriod, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENRecordPointBytFilter filter) {
		String out = buildCondition((ENRecordPointByt)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENRecordPointByt filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENRecordPointByt.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountNumber, ENRecordPointByt.accountNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENRecordPointByt.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENRecordPointByt.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.address, ENRecordPointByt.address_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENRecordPointByt.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rpCode, ENRecordPointByt.rpCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENRecordPointByt.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENRecordPointByt.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENRecordPointByt.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.serialNumber, ENRecordPointByt.serialNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCounterInst, ENRecordPointByt.dateCounterInst_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCounterCheck, ENRecordPointByt.dateCounterCheck_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, ENRecordPointByt.counterType_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.classAccuracy, ENRecordPointByt.classAccuracy_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.checkperiod, ENRecordPointByt.checkperiod_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statuscode, ENRecordPointByt.statuscode_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.phasity, ENRecordPointByt.phasity_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datecheck, ENRecordPointByt.datecheck_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.checkperiod1, ENRecordPointByt.checkperiod1_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.phone, ENRecordPointByt.phone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.seal, ENRecordPointByt.seal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.placecounter, ENRecordPointByt.placecounter_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isworking, ENRecordPointByt.isworking_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.counterCapacity, ENRecordPointByt.counterCapacity_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.counterVoltageNominal, ENRecordPointByt.counterVoltageNominal_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.counterDateProduct, ENRecordPointByt.counterDateProduct_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.areaType, ENRecordPointByt.areaType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fiderCode, ENRecordPointByt.fiderCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.fiderName, ENRecordPointByt.fiderName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.disablePlan, ENRecordPointByt.disablePlan_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codeEIC, ENRecordPointByt.codeEIC_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tower, ENRecordPointByt.tower_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.feeder04, ENRecordPointByt.feeder04_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFirstConsumption, ENRecordPointByt.dateFirstConsumption_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENRecordPointByt.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.siteRef.code, ENRecordPointByt.siteRef_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.prevCounterCheck, ENRecordPointByt.prevCounterCheck_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.prevCheckPeriod, ENRecordPointByt.prevCheckPeriod_QFielld, out);
		}
		return out;
	}

	public ENRecordPointBytShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENRecordPointBytShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENRecordPointBytShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENRecordPointBytShortList getFilteredList(ENRecordPointByt filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointByt aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointByt aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENRecordPointBytShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointBytFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointBytFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENRecordPointBytShortList getScrollableFilteredList(ENRecordPointByt aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENRecordPointBytShortList result = new ENRecordPointBytShortList();
		ENRecordPointBytShort anObject;
		result.list = new Vector<ENRecordPointBytShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECORDPOINTBYT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENRECORDPOINTBYT.CODE"+
			",ENRECORDPOINTBYT.ACCOUNTNUMBER"+
			",ENRECORDPOINTBYT.CONTRACTDATE"+
			",ENRECORDPOINTBYT.NAME"+
			",ENRECORDPOINTBYT.ADDRESS"+
			",ENRECORDPOINTBYT.RPCODE"+
			",ENRECORDPOINTBYT.INVNUMBER"+
			",ENRECORDPOINTBYT.SERIALNUMBER"+
			",ENRECORDPOINTBYT.DATECOUNTERINST"+
			",ENRECORDPOINTBYT.DATECOUNTERCHECK"+
			",ENRECORDPOINTBYT.COUNTERTYPE"+
			",ENRECORDPOINTBYT.CLASSACCURACY"+
			",ENRECORDPOINTBYT.CHECKPERIOD"+
			",ENRECORDPOINTBYT.STATUSCODE"+
			",ENRECORDPOINTBYT.PHASITY"+
			",ENRECORDPOINTBYT.DATECHECK"+
			",ENRECORDPOINTBYT.CHECKPERIOD1"+
			",ENRECORDPOINTBYT.PHONE"+
			",ENRECORDPOINTBYT.SEAL"+
			",ENRECORDPOINTBYT.PLACECOUNTER"+
			",ENRECORDPOINTBYT.ISWORKING"+
			",ENRECORDPOINTBYT.COUNTERCAPACITY"+
			",ENRECORDPOINTBYT.COUNTERVOLTAGENOMINAL"+
			",ENRECORDPOINTBYT.COUNTERDATEPRODUCT"+
			",ENRECORDPOINTBYT.AREATYPE"+
			",ENRECORDPOINTBYT.FIDERCODE"+
			",ENRECORDPOINTBYT.FIDERNAME"+
			",ENRECORDPOINTBYT.DISABLEPLAN"+
			",ENRECORDPOINTBYT.CODEEIC"+
			",ENRECORDPOINTBYT.TOWER"+
			",ENRECORDPOINTBYT.FEEDER04"+
			",ENRECORDPOINTBYT.DATEFIRSTCONSUMPTION"+
			", ENELEMENT.CODE " +
			", ENSITE.CODE " +
			", ENSITE.NAME " +
			", ENSITE.SITEADDRESS " +
			", ENSITE.SITEPHONE " +
			",ENRECORDPOINTBYT.PREVCOUNTERCHECK"+
			",ENRECORDPOINTBYT.PREVCHECKPERIOD"+
		" FROM ENRECORDPOINTBYT " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENRECORDPOINTBYT.ELEMENTCODE "+
			" LEFT JOIN ENSITE on ENSITE.CODE = ENRECORDPOINTBYT.SITEREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointByt.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTBYT",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENRecordPointBytShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.accountNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.name = set.getString(4);
				anObject.address = set.getString(5);
				anObject.rpCode = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.rpCode = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(7);
				anObject.serialNumber = set.getString(8);
				anObject.dateCounterInst = set.getDate(9);
				anObject.dateCounterCheck = set.getDate(10);
				anObject.counterType = set.getString(11);
				anObject.classAccuracy = set.getBigDecimal(12);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(13);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.statuscode = set.getInt(14);
				if ( set.wasNull() ) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(15);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.datecheck = set.getDate(16);
				anObject.checkperiod1 = set.getBigDecimal(17);
				if(anObject.checkperiod1 != null) {
					anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.phone = set.getString(18);
				anObject.seal = set.getString(19);
				anObject.placecounter = set.getString(20);
				anObject.isworking = set.getInt(21);
				if ( set.wasNull() ) {
					anObject.isworking = Integer.MIN_VALUE;
				}
				anObject.counterCapacity = set.getInt(22);
				if ( set.wasNull() ) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(23);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(24);
				anObject.areaType = set.getInt(25);
				if ( set.wasNull() ) {
					anObject.areaType = Integer.MIN_VALUE;
				}
				anObject.fiderCode = set.getInt(26);
				if ( set.wasNull() ) {
					anObject.fiderCode = Integer.MIN_VALUE;
				}
				anObject.fiderName = set.getString(27);
				anObject.disablePlan = set.getInt(28);
				if ( set.wasNull() ) {
					anObject.disablePlan = Integer.MIN_VALUE;
				}
				anObject.codeEIC = set.getString(29);
				anObject.tower = set.getString(30);
				anObject.feeder04 = set.getString(31);
				anObject.dateFirstConsumption = set.getDate(32);

				anObject.elementCode = set.getInt(33);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.siteRefCode = set.getInt(34);
				if(set.wasNull()) {
					anObject.siteRefCode = Integer.MIN_VALUE;
				}
				anObject.siteRefName = set.getString(35);
				anObject.siteRefSiteaddress = set.getString(36);
				anObject.siteRefSitephone = set.getString(37);
				anObject.prevCounterCheck = set.getDate(38);
				anObject.prevCheckPeriod = set.getInt(39);
				if(set.wasNull()) {
					anObject.prevCheckPeriod = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENRecordPointBytFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENRecordPointBytFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENRecordPointByt aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENRECORDPOINTBYT.CODE FROM ENRECORDPOINTBYT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECORDPOINTBYT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointByt.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTBYT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENRECORDPOINTBYT.DOMAIN_INFO IS NOT NULL) ";
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


	public ENRecordPointByt getObject(int uid) throws PersistenceException {
		ENRecordPointByt result = new ENRecordPointByt();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENRecordPointByt anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENRecordPointByt anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENRecordPointByt anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENRecordPointByt.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENRECORDPOINTBYT.CODE, ENRECORDPOINTBYT.ACCOUNTNUMBER, ENRECORDPOINTBYT.CONTRACTDATE, ENRECORDPOINTBYT.NAME, ENRECORDPOINTBYT.ADDRESS, ENRECORDPOINTBYT.COMMENTGEN, ENRECORDPOINTBYT.RPCODE, ENRECORDPOINTBYT.DOMAIN_INFO, ENRECORDPOINTBYT.MODIFY_TIME, ENRECORDPOINTBYT.INVNUMBER, ENRECORDPOINTBYT.SERIALNUMBER, ENRECORDPOINTBYT.DATECOUNTERINST, ENRECORDPOINTBYT.DATECOUNTERCHECK, ENRECORDPOINTBYT.COUNTERTYPE, ENRECORDPOINTBYT.CLASSACCURACY, ENRECORDPOINTBYT.CHECKPERIOD, ENRECORDPOINTBYT.STATUSCODE, ENRECORDPOINTBYT.PHASITY, ENRECORDPOINTBYT.DATECHECK, ENRECORDPOINTBYT.CHECKPERIOD1, ENRECORDPOINTBYT.PHONE, ENRECORDPOINTBYT.SEAL, ENRECORDPOINTBYT.PLACECOUNTER, ENRECORDPOINTBYT.ISWORKING, ENRECORDPOINTBYT.COUNTERCAPACITY, ENRECORDPOINTBYT.COUNTERVOLTAGENOMINAL, ENRECORDPOINTBYT.COUNTERDATEPRODUCT, ENRECORDPOINTBYT.AREATYPE, ENRECORDPOINTBYT.FIDERCODE, ENRECORDPOINTBYT.FIDERNAME, ENRECORDPOINTBYT.DISABLEPLAN, ENRECORDPOINTBYT.CODEEIC, ENRECORDPOINTBYT.TOWER, ENRECORDPOINTBYT.FEEDER04, ENRECORDPOINTBYT.DATEFIRSTCONSUMPTION, ENRECORDPOINTBYT.ELEMENTCODE, ENRECORDPOINTBYT.SITEREFCODE, ENRECORDPOINTBYT.PREVCOUNTERCHECK, ENRECORDPOINTBYT.PREVCHECKPERIOD "
			+" FROM ENRECORDPOINTBYT WHERE ENRECORDPOINTBYT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTBYT",segregationInfo,getUserProfile().getDomainInfo());
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
			
				anObject.accountNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.name = set.getString(4);
				anObject.address = set.getString(5);
				anObject.commentGen = set.getString(6);
				anObject.rpCode = set.getInt(7);
				if (set.wasNull()) {
					anObject.rpCode = Integer.MIN_VALUE;
				}
				anObject.domain_info = set.getString(8);
				anObject.modify_time = set.getLong(9);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.invNumber = set.getString(10);
				anObject.serialNumber = set.getString(11);
				anObject.dateCounterInst = set.getDate(12);
				anObject.dateCounterCheck = set.getDate(13);
				anObject.counterType = set.getString(14);
				anObject.classAccuracy = set.getBigDecimal(15);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(16);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.statuscode = set.getInt(17);
				if (set.wasNull()) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(18);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.datecheck = set.getDate(19);
				anObject.checkperiod1 = set.getBigDecimal(20);
				if(anObject.checkperiod1 != null) {
					anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.phone = set.getString(21);
				anObject.seal = set.getString(22);
				anObject.placecounter = set.getString(23);
				anObject.isworking = set.getInt(24);
				if (set.wasNull()) {
					anObject.isworking = Integer.MIN_VALUE;
				}
				anObject.counterCapacity = set.getInt(25);
				if (set.wasNull()) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(26);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(27);
				anObject.areaType = set.getInt(28);
				if (set.wasNull()) {
					anObject.areaType = Integer.MIN_VALUE;
				}
				anObject.fiderCode = set.getInt(29);
				if (set.wasNull()) {
					anObject.fiderCode = Integer.MIN_VALUE;
				}
				anObject.fiderName = set.getString(30);
				anObject.disablePlan = set.getInt(31);
				if (set.wasNull()) {
					anObject.disablePlan = Integer.MIN_VALUE;
				}
				anObject.codeEIC = set.getString(32);
				anObject.tower = set.getString(33);
				anObject.feeder04 = set.getString(34);
				anObject.dateFirstConsumption = set.getDate(35);
				anObject.element.code = set.getInt(36);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.siteRef.code = set.getInt(37);
				if (set.wasNull()) {
					anObject.siteRef.code = Integer.MIN_VALUE;
				}
				
				anObject.prevCounterCheck = set.getDate(38);

				anObject.prevCheckPeriod = set.getInt(39);
				if (set.wasNull()) {
					anObject.prevCheckPeriod = Integer.MIN_VALUE;
				}
				
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
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


	public com.ksoe.energynet.valueobject.references.ENRecordPointBytRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENRecordPointBytRef ref = new com.ksoe.energynet.valueobject.references.ENRecordPointBytRef();
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

		selectStr = "DELETE FROM  ENRECORDPOINTBYT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENRecordPointByt object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENRecordPointByt.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointByt.remove%} access denied");
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
	
	public long count(ENRecordPointBytFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENRecordPointBytFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENRecordPointBytFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENRECORDPOINTBYT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointByt.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTBYT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENRECORDPOINTBYT.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENRECORDPOINTBYT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENRecordPointBytFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENRecordPointBytFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENRECORDPOINTBYT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENRecordPointByt.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTBYT",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENRECORDPOINTBYT.DOMAIN_INFO IS NOT NULL) ";
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointByt.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENRECORDPOINTBYT.CODE FROM  ENRECORDPOINTBYT WHERE  ENRECORDPOINTBYT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTBYT",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENRECORDPOINTBYT.CODE");
		_checkConditionToken(condition,"accountnumber","ENRECORDPOINTBYT.ACCOUNTNUMBER");
		_checkConditionToken(condition,"contractdate","ENRECORDPOINTBYT.CONTRACTDATE");
		_checkConditionToken(condition,"name","ENRECORDPOINTBYT.NAME");
		_checkConditionToken(condition,"address","ENRECORDPOINTBYT.ADDRESS");
		_checkConditionToken(condition,"commentgen","ENRECORDPOINTBYT.COMMENTGEN");
		_checkConditionToken(condition,"rpcode","ENRECORDPOINTBYT.RPCODE");
		_checkConditionToken(condition,"domain_info","ENRECORDPOINTBYT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENRECORDPOINTBYT.MODIFY_TIME");
		_checkConditionToken(condition,"invnumber","ENRECORDPOINTBYT.INVNUMBER");
		_checkConditionToken(condition,"serialnumber","ENRECORDPOINTBYT.SERIALNUMBER");
		_checkConditionToken(condition,"datecounterinst","ENRECORDPOINTBYT.DATECOUNTERINST");
		_checkConditionToken(condition,"datecountercheck","ENRECORDPOINTBYT.DATECOUNTERCHECK");
		_checkConditionToken(condition,"countertype","ENRECORDPOINTBYT.COUNTERTYPE");
		_checkConditionToken(condition,"classaccuracy","ENRECORDPOINTBYT.CLASSACCURACY");
		_checkConditionToken(condition,"checkperiod","ENRECORDPOINTBYT.CHECKPERIOD");
		_checkConditionToken(condition,"statuscode","ENRECORDPOINTBYT.STATUSCODE");
		_checkConditionToken(condition,"phasity","ENRECORDPOINTBYT.PHASITY");
		_checkConditionToken(condition,"datecheck","ENRECORDPOINTBYT.DATECHECK");
		_checkConditionToken(condition,"checkperiod1","ENRECORDPOINTBYT.CHECKPERIOD1");
		_checkConditionToken(condition,"phone","ENRECORDPOINTBYT.PHONE");
		_checkConditionToken(condition,"seal","ENRECORDPOINTBYT.SEAL");
		_checkConditionToken(condition,"placecounter","ENRECORDPOINTBYT.PLACECOUNTER");
		_checkConditionToken(condition,"isworking","ENRECORDPOINTBYT.ISWORKING");
		_checkConditionToken(condition,"countercapacity","ENRECORDPOINTBYT.COUNTERCAPACITY");
		_checkConditionToken(condition,"countervoltagenominal","ENRECORDPOINTBYT.COUNTERVOLTAGENOMINAL");
		_checkConditionToken(condition,"counterdateproduct","ENRECORDPOINTBYT.COUNTERDATEPRODUCT");
		_checkConditionToken(condition,"areatype","ENRECORDPOINTBYT.AREATYPE");
		_checkConditionToken(condition,"fidercode","ENRECORDPOINTBYT.FIDERCODE");
		_checkConditionToken(condition,"fidername","ENRECORDPOINTBYT.FIDERNAME");
		_checkConditionToken(condition,"disableplan","ENRECORDPOINTBYT.DISABLEPLAN");
		_checkConditionToken(condition,"codeeic","ENRECORDPOINTBYT.CODEEIC");
		_checkConditionToken(condition,"tower","ENRECORDPOINTBYT.TOWER");
		_checkConditionToken(condition,"feeder04","ENRECORDPOINTBYT.FEEDER04");
		_checkConditionToken(condition,"datefirstconsumption","ENRECORDPOINTBYT.DATEFIRSTCONSUMPTION");
		_checkConditionToken(condition,"prevcountercheck","ENRECORDPOINTBYT.PREVCOUNTERCHECK");
		_checkConditionToken(condition,"prevcheckperiod","ENRECORDPOINTBYT.PREVCHECKPERIOD");
		// relationship conditions
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"siteref","SITEREFCODE");
		_checkConditionToken(condition,"siteref.code","SITEREFCODE");
		
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
	
	private void _collectAutoIncrementFields(ENRecordPointByt anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENRECORDPOINTBYT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENRECORDPOINTBYT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENRECORDPOINTBYT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENRECORDPOINTBYT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENRecordPointBytDAO
