
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
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.brief.ENRecordPointPromShort;
import com.ksoe.energynet.valueobject.lists.ENRecordPointPromShortList;


/**
 * DAO Object for ENRecordPointProm;
 *
 */

public class ENRecordPointPromDAOGen extends GenericDataMiner {

	public ENRecordPointPromDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENRecordPointPromDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENRecordPointProm inObject) throws PersistenceException {
		ENRecordPointProm obj = new ENRecordPointProm();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.accountNumber == null && obj.accountNumber == null){}
		else
			if(inObject.accountNumber == null || obj.accountNumber == null) return false;
			else
				if ( ! inObject.accountNumber.equals(obj.accountNumber)){
					return false;
				}

		if(inObject.accountName == null && obj.accountName == null){}
		else
			if(inObject.accountName == null || obj.accountName == null) return false;
			else
				if ( ! inObject.accountName.equals(obj.accountName)){
					return false;
				}

		if (inObject.accountCode != obj.accountCode){
					return false;
				}

		if(inObject.counterNumber == null && obj.counterNumber == null){}
		else
			if(inObject.counterNumber == null || obj.counterNumber == null) return false;
			else
				if ( ! inObject.counterNumber.equals(obj.counterNumber)){
					return false;
				}

		if(inObject.recordPointName == null && obj.recordPointName == null){}
		else
			if(inObject.recordPointName == null || obj.recordPointName == null) return false;
			else
				if ( ! inObject.recordPointName.equals(obj.recordPointName)){
					return false;
				}

		if(inObject.recordPointAddr == null && obj.recordPointAddr == null){}
		else
			if(inObject.recordPointAddr == null || obj.recordPointAddr == null) return false;
			else
				if ( ! inObject.recordPointAddr.equals(obj.recordPointAddr)){
					return false;
				}

		if(inObject.recordPointKindName == null && obj.recordPointKindName == null){}
		else
			if(inObject.recordPointKindName == null || obj.recordPointKindName == null) return false;
			else
				if ( ! inObject.recordPointKindName.equals(obj.recordPointKindName)){
					return false;
				}

		if (inObject.recordPointCode != obj.recordPointCode){
					return false;
				}

		if(inObject.feeder == null && obj.feeder == null){}
		else
			if(inObject.feeder == null || obj.feeder == null) return false;
			else
				if ( ! inObject.feeder.equals(obj.feeder)){
					return false;
				}

		if(inObject.substation == null && obj.substation == null){}
		else
			if(inObject.substation == null || obj.substation == null) return false;
			else
				if ( ! inObject.substation.equals(obj.substation)){
					return false;
				}

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if (inObject.dayofcalculation != obj.dayofcalculation){
					return false;
				}

		if(inObject.inspector == null && obj.inspector == null){}
		else
			if(inObject.inspector == null || obj.inspector == null) return false;
			else
				if ( ! inObject.inspector.equals(obj.inspector)){
					return false;
				}

		if(inObject.datecontrol == null && obj.datecontrol == null){} else 
			if(inObject.datecontrol == null || obj.datecontrol == null) return false;
			else
				if (inObject.datecontrol.compareTo(obj.datecontrol) != 0){
					return false;
				}

		if(inObject.datetp == null && obj.datetp == null){} else 
			if(inObject.datetp == null || obj.datetp == null) return false;
			else
				if (inObject.datetp.compareTo(obj.datetp) != 0){
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

		if(inObject.contractDate == null && obj.contractDate == null){} else 
			if(inObject.contractDate == null || obj.contractDate == null) return false;
			else
				if (inObject.contractDate.compareTo(obj.contractDate) != 0){
					return false;
				}
		if (inObject.ren.code != obj.ren.code){
			return false;
		}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		return true;
	}

	public int add(ENRecordPointProm anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENRecordPointProm anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENRECORDPOINTPROM (CODE,ACCOUNTNUMBER,ACCOUNTNAME,ACCOUNTCODE,COUNTERNUMBER,RECORDPOINTNAME,RECORDPOINTADDR,RECORDPOINTKINDNAME,RECORDPOINTCODE,FEEDER,SUBSTATION,INVNUMBER,DAYOFCALCULATION,INSPECTOR,DATECONTROL,DATETP,DATECOUNTERINST,DATECOUNTERCHECK,COUNTERTYPE,CLASSACCURACY,CHECKPERIOD,STATUSCODE,PHASITY,PHONE,SEAL,PLACECOUNTER,ISWORKING,FIDERCODE,FIDERNAME,DOMAIN_INFO,MODIFY_TIME,COUNTERCAPACITY,COUNTERVOLTAGENOMINAL,COUNTERDATEPRODUCT,DISABLEPLAN,CODEEIC,TOWER,FEEDER04,DATEFIRSTCONSUMPTION,CONTRACTDATE,RENCODE,ELEMENTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.accountNumber);
			statement.setString(3, anObject.accountName);
			if (anObject.accountCode != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.accountCode);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			statement.setString(5, anObject.counterNumber);
			statement.setString(6, anObject.recordPointName);
			statement.setString(7, anObject.recordPointAddr);
			statement.setString(8, anObject.recordPointKindName);
			if (anObject.recordPointCode != Integer.MIN_VALUE ) {
				statement.setInt(9, anObject.recordPointCode);
			} else {
				statement.setNull(9, java.sql.Types.INTEGER);
			}
			statement.setString(10, anObject.feeder);
			statement.setString(11, anObject.substation);
			statement.setString(12, anObject.invNumber);
			if (anObject.dayofcalculation != Integer.MIN_VALUE ) {
				statement.setInt(13, anObject.dayofcalculation);
			} else {
				statement.setNull(13, java.sql.Types.INTEGER);
			}
			statement.setString(14, anObject.inspector);
			if (anObject.datecontrol == null) {
				statement.setDate(15, null);
			} else {
				statement.setDate(15, new java.sql.Date(anObject.datecontrol.getTime()));
			}
			if (anObject.datetp == null) {
				statement.setDate(16, null);
			} else {
				statement.setDate(16, new java.sql.Date(anObject.datetp.getTime()));
			}
			if (anObject.dateCounterInst == null) {
				statement.setDate(17, null);
			} else {
				statement.setDate(17, new java.sql.Date(anObject.dateCounterInst.getTime()));
			}
			if (anObject.dateCounterCheck == null) {
				statement.setDate(18, null);
			} else {
				statement.setDate(18, new java.sql.Date(anObject.dateCounterCheck.getTime()));
			}
			statement.setString(19, anObject.counterType);
			if (anObject.classAccuracy != null) {
				anObject.classAccuracy = anObject.classAccuracy.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.classAccuracy);
			if (anObject.checkperiod != null) {
				anObject.checkperiod = anObject.checkperiod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.checkperiod);
			if (anObject.statuscode != Integer.MIN_VALUE ) {
				statement.setInt(22, anObject.statuscode);
			} else {
				statement.setNull(22, java.sql.Types.INTEGER);
			}
			if (anObject.phasity != null) {
				anObject.phasity = anObject.phasity.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23, anObject.phasity);
			statement.setString(24, anObject.phone);
			statement.setString(25, anObject.seal);
			statement.setString(26, anObject.placecounter);
			if (anObject.isworking != Integer.MIN_VALUE ) {
				statement.setInt(27, anObject.isworking);
			} else {
				statement.setNull(27, java.sql.Types.INTEGER);
			}
			if (anObject.fiderCode != Integer.MIN_VALUE ) {
				statement.setInt(28, anObject.fiderCode);
			} else {
				statement.setNull(28, java.sql.Types.INTEGER);
			}
			statement.setString(29, anObject.fiderName);
			statement.setString(30, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(31, null);
			} else {
				statement.setBigDecimal(31, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.counterCapacity != Integer.MIN_VALUE ) {
				statement.setInt(32, anObject.counterCapacity);
			} else {
				statement.setNull(32, java.sql.Types.INTEGER);
			}
			if (anObject.counterVoltageNominal != null) {
				anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(33, anObject.counterVoltageNominal);
			if (anObject.counterDateProduct == null) {
				statement.setDate(34, null);
			} else {
				statement.setDate(34, new java.sql.Date(anObject.counterDateProduct.getTime()));
			}
			if (anObject.disablePlan != Integer.MIN_VALUE ) {
				statement.setInt(35, anObject.disablePlan);
			} else {
				statement.setNull(35, java.sql.Types.INTEGER);
			}
			statement.setString(36, anObject.codeEIC);
			statement.setString(37, anObject.tower);
			statement.setString(38, anObject.feeder04);
			if (anObject.dateFirstConsumption == null) {
				statement.setDate(39, null);
			} else {
				statement.setDate(39, new java.sql.Date(anObject.dateFirstConsumption.getTime()));
			}
			if (anObject.contractDate == null) {
				statement.setDate(40, null);
			} else {
				statement.setDate(40, new java.sql.Date(anObject.contractDate.getTime()));
			}
			if (anObject.ren.code != Integer.MIN_VALUE){
				statement.setInt(41,anObject.ren.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				statement.setInt(42,anObject.element.code);
			} else {
				statement.setNull(42,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENRecordPointPromDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENRecordPointProm anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENRecordPointProm anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENRecordPointProm oldObject = new ENRecordPointProm();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENRecordPointProm.modify_time_Field + "," + ENRecordPointProm.domain_info_Field+" FROM  ENRECORDPOINTPROM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("ACCOUNTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTADDR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTKINDNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FEEDER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUBSTATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DAYOFCALCULATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INSPECTOR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECONTROL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATETP") == 0) {
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
					if(fieldNameStr.compareTo("CONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENRECORDPOINTPROM SET  ACCOUNTNUMBER = ? , ACCOUNTNAME = ? , ACCOUNTCODE = ? , COUNTERNUMBER = ? , RECORDPOINTNAME = ? , RECORDPOINTADDR = ? , RECORDPOINTKINDNAME = ? , RECORDPOINTCODE = ? , FEEDER = ? , SUBSTATION = ? , INVNUMBER = ? , DAYOFCALCULATION = ? , INSPECTOR = ? , DATECONTROL = ? , DATETP = ? , DATECOUNTERINST = ? , DATECOUNTERCHECK = ? , COUNTERTYPE = ? , CLASSACCURACY = ? , CHECKPERIOD = ? , STATUSCODE = ? , PHASITY = ? , PHONE = ? , SEAL = ? , PLACECOUNTER = ? , ISWORKING = ? , FIDERCODE = ? , FIDERNAME = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , COUNTERCAPACITY = ? , COUNTERVOLTAGENOMINAL = ? , COUNTERDATEPRODUCT = ? , DISABLEPLAN = ? , CODEEIC = ? , TOWER = ? , FEEDER04 = ? , DATEFIRSTCONSUMPTION = ? , CONTRACTDATE = ? , RENCODE = ? , ELEMENTCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENRECORDPOINTPROM SET ";
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
					statement.setString(2, anObject.accountName);
					if (anObject.accountCode != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.accountCode);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setString(4, anObject.counterNumber);
					statement.setString(5, anObject.recordPointName);
					statement.setString(6, anObject.recordPointAddr);
					statement.setString(7, anObject.recordPointKindName);
					if (anObject.recordPointCode != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.recordPointCode);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					statement.setString(9, anObject.feeder);
					statement.setString(10, anObject.substation);
					statement.setString(11, anObject.invNumber);
					if (anObject.dayofcalculation != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.dayofcalculation);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					statement.setString(13, anObject.inspector);
					if (anObject.datecontrol == null) {
						statement.setDate(14, null);
					} else {
						statement.setDate(14, new java.sql.Date(anObject.datecontrol.getTime()));
					}
					if (anObject.datetp == null) {
						statement.setDate(15, null);
					} else {
						statement.setDate(15, new java.sql.Date(anObject.datetp.getTime()));
					}
					if (anObject.dateCounterInst == null) {
						statement.setDate(16, null);
					} else {
						statement.setDate(16, new java.sql.Date(anObject.dateCounterInst.getTime()));
					}
					if (anObject.dateCounterCheck == null) {
						statement.setDate(17, null);
					} else {
						statement.setDate(17, new java.sql.Date(anObject.dateCounterCheck.getTime()));
					}
					statement.setString(18, anObject.counterType);
					if (anObject.classAccuracy != null) {
						anObject.classAccuracy = anObject.classAccuracy.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.classAccuracy);
					if (anObject.checkperiod != null) {
						anObject.checkperiod = anObject.checkperiod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.checkperiod);
					if (anObject.statuscode != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.statuscode);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					if (anObject.phasity != null) {
						anObject.phasity = anObject.phasity.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22, anObject.phasity);
					statement.setString(23, anObject.phone);
					statement.setString(24, anObject.seal);
					statement.setString(25, anObject.placecounter);
					if (anObject.isworking != Integer.MIN_VALUE) {
						statement.setInt(26, anObject.isworking);
					} else {
						statement.setNull(26, java.sql.Types.INTEGER);
					}
					if (anObject.fiderCode != Integer.MIN_VALUE) {
						statement.setInt(27, anObject.fiderCode);
					} else {
						statement.setNull(27, java.sql.Types.INTEGER);
					}
					statement.setString(28, anObject.fiderName);
					statement.setString(29, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(30, null);
					} else {
						statement.setBigDecimal(30, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.counterCapacity != Integer.MIN_VALUE) {
						statement.setInt(31, anObject.counterCapacity);
					} else {
						statement.setNull(31, java.sql.Types.INTEGER);
					}
					if (anObject.counterVoltageNominal != null) {
						anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(32, anObject.counterVoltageNominal);
					if (anObject.counterDateProduct == null) {
						statement.setDate(33, null);
					} else {
						statement.setDate(33, new java.sql.Date(anObject.counterDateProduct.getTime()));
					}
					if (anObject.disablePlan != Integer.MIN_VALUE) {
						statement.setInt(34, anObject.disablePlan);
					} else {
						statement.setNull(34, java.sql.Types.INTEGER);
					}
					statement.setString(35, anObject.codeEIC);
					statement.setString(36, anObject.tower);
					statement.setString(37, anObject.feeder04);
					if (anObject.dateFirstConsumption == null) {
						statement.setDate(38, null);
					} else {
						statement.setDate(38, new java.sql.Date(anObject.dateFirstConsumption.getTime()));
					}
					if (anObject.contractDate == null) {
						statement.setDate(39, null);
					} else {
						statement.setDate(39, new java.sql.Date(anObject.contractDate.getTime()));
					}
					if (anObject.ren.code != Integer.MIN_VALUE) {
						statement.setInt(40, anObject.ren.code);
					} else {
						statement.setNull(40, java.sql.Types.INTEGER);
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(41, anObject.element.code);
					} else {
						statement.setNull(41, java.sql.Types.INTEGER);
					}
					statement.setInt(42, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("ACCOUNTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accountNumber);
							continue;
						}
						if("ACCOUNTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accountName);
							continue;
						}
						if("ACCOUNTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.accountCode);
							continue;
						}
						if("COUNTERNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.counterNumber);
							continue;
						}
						if("RECORDPOINTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.recordPointName);
							continue;
						}
						if("RECORDPOINTADDR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.recordPointAddr);
							continue;
						}
						if("RECORDPOINTKINDNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.recordPointKindName);
							continue;
						}
						if("RECORDPOINTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.recordPointCode);
							continue;
						}
						if("FEEDER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.feeder);
							continue;
						}
						if("SUBSTATION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.substation);
							continue;
						}
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invNumber);
							continue;
						}
						if("DAYOFCALCULATION".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dayofcalculation);
							continue;
						}
						if("INSPECTOR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.inspector);
							continue;
						}
						if("DATECONTROL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datecontrol == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datecontrol.getTime()));
							}
							continue;
						}
						if("DATETP".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datetp == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datetp.getTime()));
							}
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
						if("FIDERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.fiderCode);
							continue;
						}
						if("FIDERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.fiderName);
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
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.contractDate.getTime()));
							}
							continue;
						}
						if("REN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ren.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ren.code);
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

	} // end of save(ENRecordPointProm anObject,String[] anAttributes)


	public ENRecordPointPromShort getShortObject(int anObjectCode) throws PersistenceException {
		ENRecordPointProm filterObject = new ENRecordPointProm();
		Vector<ENRecordPointPromShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENRecordPointPromShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENRecordPointProm filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.accountCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recordPointName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recordPointAddr, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recordPointKindName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.recordPointCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.feeder, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.substation, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dayofcalculation, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.inspector, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datecontrol, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datetp, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCounterInst, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCounterCheck, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.classAccuracy, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.checkperiod, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statuscode, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.phasity, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.phone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.seal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.placecounter, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isworking, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fiderCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.fiderName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.counterCapacity, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.counterVoltageNominal, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.counterDateProduct, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.disablePlan, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codeEIC, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tower, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.feeder04, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFirstConsumption, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ren.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENRecordPointPromFilter filter) {
		String out = buildCondition((ENRecordPointProm)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENRecordPointProm filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENRecordPointProm.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountNumber, ENRecordPointProm.accountNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountName, ENRecordPointProm.accountName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.accountCode, ENRecordPointProm.accountCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterNumber, ENRecordPointProm.counterNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recordPointName, ENRecordPointProm.recordPointName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recordPointAddr, ENRecordPointProm.recordPointAddr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recordPointKindName, ENRecordPointProm.recordPointKindName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.recordPointCode, ENRecordPointProm.recordPointCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.feeder, ENRecordPointProm.feeder_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.substation, ENRecordPointProm.substation_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENRecordPointProm.invNumber_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dayofcalculation, ENRecordPointProm.dayofcalculation_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.inspector, ENRecordPointProm.inspector_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datecontrol, ENRecordPointProm.datecontrol_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datetp, ENRecordPointProm.datetp_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCounterInst, ENRecordPointProm.dateCounterInst_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCounterCheck, ENRecordPointProm.dateCounterCheck_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, ENRecordPointProm.counterType_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.classAccuracy, ENRecordPointProm.classAccuracy_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.checkperiod, ENRecordPointProm.checkperiod_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statuscode, ENRecordPointProm.statuscode_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.phasity, ENRecordPointProm.phasity_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.phone, ENRecordPointProm.phone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.seal, ENRecordPointProm.seal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.placecounter, ENRecordPointProm.placecounter_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isworking, ENRecordPointProm.isworking_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fiderCode, ENRecordPointProm.fiderCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.fiderName, ENRecordPointProm.fiderName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENRecordPointProm.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENRecordPointProm.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.counterCapacity, ENRecordPointProm.counterCapacity_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.counterVoltageNominal, ENRecordPointProm.counterVoltageNominal_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.counterDateProduct, ENRecordPointProm.counterDateProduct_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.disablePlan, ENRecordPointProm.disablePlan_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codeEIC, ENRecordPointProm.codeEIC_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tower, ENRecordPointProm.tower_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.feeder04, ENRecordPointProm.feeder04_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFirstConsumption, ENRecordPointProm.dateFirstConsumption_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENRecordPointProm.contractDate_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ren.code, ENRecordPointProm.ren_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENRecordPointProm.element_QFielld, out);
		}
		return out;
	}

	public ENRecordPointPromShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENRecordPointPromShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENRecordPointPromShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENRecordPointPromShortList getFilteredList(ENRecordPointProm filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointProm aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointProm aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENRecordPointPromShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointPromFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointPromFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointProm aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENRecordPointPromShortList result = new ENRecordPointPromShortList();
		ENRecordPointPromShort anObject;
		result.list = new Vector<ENRecordPointPromShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECORDPOINTPROM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENRECORDPOINTPROM.CODE"+
			",ENRECORDPOINTPROM.ACCOUNTNUMBER"+
			",ENRECORDPOINTPROM.ACCOUNTNAME"+
			",ENRECORDPOINTPROM.ACCOUNTCODE"+
			",ENRECORDPOINTPROM.COUNTERNUMBER"+
			",ENRECORDPOINTPROM.RECORDPOINTNAME"+
			",ENRECORDPOINTPROM.RECORDPOINTADDR"+
			",ENRECORDPOINTPROM.RECORDPOINTKINDNAME"+
			",ENRECORDPOINTPROM.RECORDPOINTCODE"+
			",ENRECORDPOINTPROM.FEEDER"+
			",ENRECORDPOINTPROM.SUBSTATION"+
			",ENRECORDPOINTPROM.INVNUMBER"+
			",ENRECORDPOINTPROM.DAYOFCALCULATION"+
			",ENRECORDPOINTPROM.INSPECTOR"+
			",ENRECORDPOINTPROM.DATECONTROL"+
			",ENRECORDPOINTPROM.DATETP"+
			",ENRECORDPOINTPROM.DATECOUNTERINST"+
			",ENRECORDPOINTPROM.DATECOUNTERCHECK"+
			",ENRECORDPOINTPROM.COUNTERTYPE"+
			",ENRECORDPOINTPROM.CLASSACCURACY"+
			",ENRECORDPOINTPROM.CHECKPERIOD"+
			",ENRECORDPOINTPROM.STATUSCODE"+
			",ENRECORDPOINTPROM.PHASITY"+
			",ENRECORDPOINTPROM.PHONE"+
			",ENRECORDPOINTPROM.SEAL"+
			",ENRECORDPOINTPROM.PLACECOUNTER"+
			",ENRECORDPOINTPROM.ISWORKING"+
			",ENRECORDPOINTPROM.FIDERCODE"+
			",ENRECORDPOINTPROM.FIDERNAME"+
			",ENRECORDPOINTPROM.COUNTERCAPACITY"+
			",ENRECORDPOINTPROM.COUNTERVOLTAGENOMINAL"+
			",ENRECORDPOINTPROM.COUNTERDATEPRODUCT"+
			",ENRECORDPOINTPROM.DISABLEPLAN"+
			",ENRECORDPOINTPROM.CODEEIC"+
			",ENRECORDPOINTPROM.TOWER"+
			",ENRECORDPOINTPROM.FEEDER04"+
			",ENRECORDPOINTPROM.DATEFIRSTCONSUMPTION"+
			",ENRECORDPOINTPROM.CONTRACTDATE"+
			", EPREN.CODE " +
			", EPREN.NAME " +
			", ENELEMENT.CODE " +
		" FROM ENRECORDPOINTPROM " +
			" LEFT JOIN EPREN on EPREN.CODE = ENRECORDPOINTPROM.RENCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENRECORDPOINTPROM.ELEMENTCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointProm.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTPROM",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENRecordPointPromShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.accountNumber = set.getString(2);
				anObject.accountName = set.getString(3);
				anObject.accountCode = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.accountCode = Integer.MIN_VALUE;
				}
				anObject.counterNumber = set.getString(5);
				anObject.recordPointName = set.getString(6);
				anObject.recordPointAddr = set.getString(7);
				anObject.recordPointKindName = set.getString(8);
				anObject.recordPointCode = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.recordPointCode = Integer.MIN_VALUE;
				}
				anObject.feeder = set.getString(10);
				anObject.substation = set.getString(11);
				anObject.invNumber = set.getString(12);
				anObject.dayofcalculation = set.getInt(13);
				if ( set.wasNull() ) {
					anObject.dayofcalculation = Integer.MIN_VALUE;
				}
				anObject.inspector = set.getString(14);
				anObject.datecontrol = set.getDate(15);
				anObject.datetp = set.getDate(16);
				anObject.dateCounterInst = set.getDate(17);
				anObject.dateCounterCheck = set.getDate(18);
				anObject.counterType = set.getString(19);
				anObject.classAccuracy = set.getBigDecimal(20);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(21);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.statuscode = set.getInt(22);
				if ( set.wasNull() ) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(23);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.phone = set.getString(24);
				anObject.seal = set.getString(25);
				anObject.placecounter = set.getString(26);
				anObject.isworking = set.getInt(27);
				if ( set.wasNull() ) {
					anObject.isworking = Integer.MIN_VALUE;
				}
				anObject.fiderCode = set.getInt(28);
				if ( set.wasNull() ) {
					anObject.fiderCode = Integer.MIN_VALUE;
				}
				anObject.fiderName = set.getString(29);
				anObject.counterCapacity = set.getInt(30);
				if ( set.wasNull() ) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(31);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(32);
				anObject.disablePlan = set.getInt(33);
				if ( set.wasNull() ) {
					anObject.disablePlan = Integer.MIN_VALUE;
				}
				anObject.codeEIC = set.getString(34);
				anObject.tower = set.getString(35);
				anObject.feeder04 = set.getString(36);
				anObject.dateFirstConsumption = set.getDate(37);
				anObject.contractDate = set.getDate(38);

				anObject.renCode = set.getInt(39);
				if(set.wasNull()) {
					anObject.renCode = Integer.MIN_VALUE;
				}
				anObject.renName = set.getString(40);
				anObject.elementCode = set.getInt(41);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENRecordPointPromFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENRecordPointPromFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENRecordPointProm aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENRECORDPOINTPROM.CODE FROM ENRECORDPOINTPROM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECORDPOINTPROM.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointProm.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTPROM",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENRECORDPOINTPROM.DOMAIN_INFO IS NOT NULL) ";
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


	public ENRecordPointProm getObject(int uid) throws PersistenceException {
		ENRecordPointProm result = new ENRecordPointProm();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENRecordPointProm anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENRecordPointProm anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENRecordPointProm anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENRecordPointProm.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENRECORDPOINTPROM.CODE, ENRECORDPOINTPROM.ACCOUNTNUMBER, ENRECORDPOINTPROM.ACCOUNTNAME, ENRECORDPOINTPROM.ACCOUNTCODE, ENRECORDPOINTPROM.COUNTERNUMBER, ENRECORDPOINTPROM.RECORDPOINTNAME, ENRECORDPOINTPROM.RECORDPOINTADDR, ENRECORDPOINTPROM.RECORDPOINTKINDNAME, ENRECORDPOINTPROM.RECORDPOINTCODE, ENRECORDPOINTPROM.FEEDER, ENRECORDPOINTPROM.SUBSTATION, ENRECORDPOINTPROM.INVNUMBER, ENRECORDPOINTPROM.DAYOFCALCULATION, ENRECORDPOINTPROM.INSPECTOR, ENRECORDPOINTPROM.DATECONTROL, ENRECORDPOINTPROM.DATETP, ENRECORDPOINTPROM.DATECOUNTERINST, ENRECORDPOINTPROM.DATECOUNTERCHECK, ENRECORDPOINTPROM.COUNTERTYPE, ENRECORDPOINTPROM.CLASSACCURACY, ENRECORDPOINTPROM.CHECKPERIOD, ENRECORDPOINTPROM.STATUSCODE, ENRECORDPOINTPROM.PHASITY, ENRECORDPOINTPROM.PHONE, ENRECORDPOINTPROM.SEAL, ENRECORDPOINTPROM.PLACECOUNTER, ENRECORDPOINTPROM.ISWORKING, ENRECORDPOINTPROM.FIDERCODE, ENRECORDPOINTPROM.FIDERNAME, ENRECORDPOINTPROM.DOMAIN_INFO, ENRECORDPOINTPROM.MODIFY_TIME, ENRECORDPOINTPROM.COUNTERCAPACITY, ENRECORDPOINTPROM.COUNTERVOLTAGENOMINAL, ENRECORDPOINTPROM.COUNTERDATEPRODUCT, ENRECORDPOINTPROM.DISABLEPLAN, ENRECORDPOINTPROM.CODEEIC, ENRECORDPOINTPROM.TOWER, ENRECORDPOINTPROM.FEEDER04, ENRECORDPOINTPROM.DATEFIRSTCONSUMPTION, ENRECORDPOINTPROM.CONTRACTDATE, ENRECORDPOINTPROM.RENCODE, ENRECORDPOINTPROM.ELEMENTCODE "
			+" FROM ENRECORDPOINTPROM WHERE ENRECORDPOINTPROM.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTPROM",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject.accountName = set.getString(3);
				anObject.accountCode = set.getInt(4);
				if (set.wasNull()) {
					anObject.accountCode = Integer.MIN_VALUE;
				}
				anObject.counterNumber = set.getString(5);
				anObject.recordPointName = set.getString(6);
				anObject.recordPointAddr = set.getString(7);
				anObject.recordPointKindName = set.getString(8);
				anObject.recordPointCode = set.getInt(9);
				if (set.wasNull()) {
					anObject.recordPointCode = Integer.MIN_VALUE;
				}
				anObject.feeder = set.getString(10);
				anObject.substation = set.getString(11);
				anObject.invNumber = set.getString(12);
				anObject.dayofcalculation = set.getInt(13);
				if (set.wasNull()) {
					anObject.dayofcalculation = Integer.MIN_VALUE;
				}
				anObject.inspector = set.getString(14);
				anObject.datecontrol = set.getDate(15);
				anObject.datetp = set.getDate(16);
				anObject.dateCounterInst = set.getDate(17);
				anObject.dateCounterCheck = set.getDate(18);
				anObject.counterType = set.getString(19);
				anObject.classAccuracy = set.getBigDecimal(20);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(21);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.statuscode = set.getInt(22);
				if (set.wasNull()) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(23);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.phone = set.getString(24);
				anObject.seal = set.getString(25);
				anObject.placecounter = set.getString(26);
				anObject.isworking = set.getInt(27);
				if (set.wasNull()) {
					anObject.isworking = Integer.MIN_VALUE;
				}
				anObject.fiderCode = set.getInt(28);
				if (set.wasNull()) {
					anObject.fiderCode = Integer.MIN_VALUE;
				}
				anObject.fiderName = set.getString(29);
				anObject.domain_info = set.getString(30);
				anObject.modify_time = set.getLong(31);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.counterCapacity = set.getInt(32);
				if (set.wasNull()) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(33);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(34);
				anObject.disablePlan = set.getInt(35);
				if (set.wasNull()) {
					anObject.disablePlan = Integer.MIN_VALUE;
				}
				anObject.codeEIC = set.getString(36);
				anObject.tower = set.getString(37);
				anObject.feeder04 = set.getString(38);
				anObject.dateFirstConsumption = set.getDate(39);
				anObject.contractDate = set.getDate(40);
				anObject.ren.code = set.getInt(41);
				if (set.wasNull()) {
					anObject.ren.code = Integer.MIN_VALUE;
				}
				anObject.element.code = set.getInt(42);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				if(anObject.ren.code != Integer.MIN_VALUE) {
					anObject.setRen(
						new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).getObject(anObject.ren.code));
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


	public com.ksoe.energynet.valueobject.references.ENRecordPointPromRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENRecordPointPromRef ref = new com.ksoe.energynet.valueobject.references.ENRecordPointPromRef();
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

		selectStr = "DELETE FROM  ENRECORDPOINTPROM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENRecordPointProm object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENRecordPointProm.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointProm.remove%} access denied");
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
	
	public long count(ENRecordPointPromFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENRecordPointPromFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENRecordPointPromFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENRECORDPOINTPROM", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointProm.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTPROM",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENRECORDPOINTPROM.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENRECORDPOINTPROM WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENRecordPointPromFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENRecordPointPromFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENRECORDPOINTPROM");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENRecordPointProm.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTPROM",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENRECORDPOINTPROM.DOMAIN_INFO IS NOT NULL) ";
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRecordPointProm.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRecordPointProm.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENRECORDPOINTPROM.CODE FROM  ENRECORDPOINTPROM WHERE  ENRECORDPOINTPROM.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENRECORDPOINTPROM",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENRECORDPOINTPROM.CODE");
		_checkConditionToken(condition,"accountnumber","ENRECORDPOINTPROM.ACCOUNTNUMBER");
		_checkConditionToken(condition,"accountname","ENRECORDPOINTPROM.ACCOUNTNAME");
		_checkConditionToken(condition,"accountcode","ENRECORDPOINTPROM.ACCOUNTCODE");
		_checkConditionToken(condition,"counternumber","ENRECORDPOINTPROM.COUNTERNUMBER");
		_checkConditionToken(condition,"recordpointname","ENRECORDPOINTPROM.RECORDPOINTNAME");
		_checkConditionToken(condition,"recordpointaddr","ENRECORDPOINTPROM.RECORDPOINTADDR");
		_checkConditionToken(condition,"recordpointkindname","ENRECORDPOINTPROM.RECORDPOINTKINDNAME");
		_checkConditionToken(condition,"recordpointcode","ENRECORDPOINTPROM.RECORDPOINTCODE");
		_checkConditionToken(condition,"feeder","ENRECORDPOINTPROM.FEEDER");
		_checkConditionToken(condition,"substation","ENRECORDPOINTPROM.SUBSTATION");
		_checkConditionToken(condition,"invnumber","ENRECORDPOINTPROM.INVNUMBER");
		_checkConditionToken(condition,"dayofcalculation","ENRECORDPOINTPROM.DAYOFCALCULATION");
		_checkConditionToken(condition,"inspector","ENRECORDPOINTPROM.INSPECTOR");
		_checkConditionToken(condition,"datecontrol","ENRECORDPOINTPROM.DATECONTROL");
		_checkConditionToken(condition,"datetp","ENRECORDPOINTPROM.DATETP");
		_checkConditionToken(condition,"datecounterinst","ENRECORDPOINTPROM.DATECOUNTERINST");
		_checkConditionToken(condition,"datecountercheck","ENRECORDPOINTPROM.DATECOUNTERCHECK");
		_checkConditionToken(condition,"countertype","ENRECORDPOINTPROM.COUNTERTYPE");
		_checkConditionToken(condition,"classaccuracy","ENRECORDPOINTPROM.CLASSACCURACY");
		_checkConditionToken(condition,"checkperiod","ENRECORDPOINTPROM.CHECKPERIOD");
		_checkConditionToken(condition,"statuscode","ENRECORDPOINTPROM.STATUSCODE");
		_checkConditionToken(condition,"phasity","ENRECORDPOINTPROM.PHASITY");
		_checkConditionToken(condition,"phone","ENRECORDPOINTPROM.PHONE");
		_checkConditionToken(condition,"seal","ENRECORDPOINTPROM.SEAL");
		_checkConditionToken(condition,"placecounter","ENRECORDPOINTPROM.PLACECOUNTER");
		_checkConditionToken(condition,"isworking","ENRECORDPOINTPROM.ISWORKING");
		_checkConditionToken(condition,"fidercode","ENRECORDPOINTPROM.FIDERCODE");
		_checkConditionToken(condition,"fidername","ENRECORDPOINTPROM.FIDERNAME");
		_checkConditionToken(condition,"domain_info","ENRECORDPOINTPROM.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENRECORDPOINTPROM.MODIFY_TIME");
		_checkConditionToken(condition,"countercapacity","ENRECORDPOINTPROM.COUNTERCAPACITY");
		_checkConditionToken(condition,"countervoltagenominal","ENRECORDPOINTPROM.COUNTERVOLTAGENOMINAL");
		_checkConditionToken(condition,"counterdateproduct","ENRECORDPOINTPROM.COUNTERDATEPRODUCT");
		_checkConditionToken(condition,"disableplan","ENRECORDPOINTPROM.DISABLEPLAN");
		_checkConditionToken(condition,"codeeic","ENRECORDPOINTPROM.CODEEIC");
		_checkConditionToken(condition,"tower","ENRECORDPOINTPROM.TOWER");
		_checkConditionToken(condition,"feeder04","ENRECORDPOINTPROM.FEEDER04");
		_checkConditionToken(condition,"datefirstconsumption","ENRECORDPOINTPROM.DATEFIRSTCONSUMPTION");
		_checkConditionToken(condition,"contractdate","ENRECORDPOINTPROM.CONTRACTDATE");
		// relationship conditions
		_checkConditionToken(condition,"ren","RENCODE");
		_checkConditionToken(condition,"ren.code","RENCODE");
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
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
	
	private void _collectAutoIncrementFields(ENRecordPointProm anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENRECORDPOINTPROM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENRECORDPOINTPROM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENRECORDPOINTPROM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENRECORDPOINTPROM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENRecordPointPromDAO
