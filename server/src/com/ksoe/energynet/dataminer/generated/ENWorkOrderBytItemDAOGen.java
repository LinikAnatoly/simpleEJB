
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
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderBytItemShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderBytItemShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENWorkOrderBytItem;
 *
 */

public class ENWorkOrderBytItemDAOGen extends GenericDataMiner {

	public ENWorkOrderBytItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENWorkOrderBytItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENWorkOrderBytItem inObject) throws PersistenceException {
		ENWorkOrderBytItem obj = new ENWorkOrderBytItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.contractNumberServices == null && obj.contractNumberServices == null){}
		else
			if(inObject.contractNumberServices == null || obj.contractNumberServices == null) return false;
			else
				if ( ! inObject.contractNumberServices.equals(obj.contractNumberServices)){
					return false;
				}

		if(inObject.accountNumber == null && obj.accountNumber == null){}
		else
			if(inObject.accountNumber == null || obj.accountNumber == null) return false;
			else
				if ( ! inObject.accountNumber.equals(obj.accountNumber)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.customerName == null && obj.customerName == null){}
		else
			if(inObject.customerName == null || obj.customerName == null) return false;
			else
				if ( ! inObject.customerName.equals(obj.customerName)){
					return false;
				}

		if(inObject.address == null && obj.address == null){}
		else
			if(inObject.address == null || obj.address == null) return false;
			else
				if ( ! inObject.address.equals(obj.address)){
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

		if(inObject.seal == null && obj.seal == null){}
		else
			if(inObject.seal == null || obj.seal == null) return false;
			else
				if ( ! inObject.seal.equals(obj.seal)){
					return false;
				}

		if(inObject.phone == null && obj.phone == null){}
		else
			if(inObject.phone == null || obj.phone == null) return false;
			else
				if ( ! inObject.phone.equals(obj.phone)){
					return false;
				}

		if (inObject.statuscode != obj.statuscode){
					return false;
				}

		if (inObject.rpCode != obj.rpCode){
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

		if (inObject.rpStatusCode != obj.rpStatusCode){
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

		if(inObject.placecounter == null && obj.placecounter == null){}
		else
			if(inObject.placecounter == null || obj.placecounter == null) return false;
			else
				if ( ! inObject.placecounter.equals(obj.placecounter)){
					return false;
				}

		if (inObject.rpIsWorking != obj.rpIsWorking){
					return false;
				}

		if(inObject.recordPointName == null && obj.recordPointName == null){}
		else
			if(inObject.recordPointName == null || obj.recordPointName == null) return false;
			else
				if ( ! inObject.recordPointName.equals(obj.recordPointName)){
					return false;
				}

		if(inObject.routeBytName == null && obj.routeBytName == null){}
		else
			if(inObject.routeBytName == null || obj.routeBytName == null) return false;
			else
				if ( ! inObject.routeBytName.equals(obj.routeBytName)){
					return false;
				}

		if(inObject.routeBytNumbergen == null && obj.routeBytNumbergen == null){}
		else
			if(inObject.routeBytNumbergen == null || obj.routeBytNumbergen == null) return false;
			else
				if ( ! inObject.routeBytNumbergen.equals(obj.routeBytNumbergen)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.userEdit == null && obj.userEdit == null){}
		else
			if(inObject.userEdit == null || obj.userEdit == null) return false;
			else
				if ( ! inObject.userEdit.equals(obj.userEdit)){
					return false;
				}

		if (inObject.factCode != obj.factCode){
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
		if (inObject.workOrderBytRef.code != obj.workOrderBytRef.code){
			return false;
		}
		if (inObject.humenItemRef.code != obj.humenItemRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.planItemRef.code != obj.planItemRef.code){
			return false;
		}
		if (inObject.finWorker.code != obj.finWorker.code){
			return false;
		}
		if (inObject.recordPointBytRef.code != obj.recordPointBytRef.code){
			return false;
		}
		if (inObject.recordPointPromRef.code != obj.recordPointPromRef.code){
			return false;
		}
		if (inObject.routeBytRef.code != obj.routeBytRef.code){
			return false;
		}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.scCounterRef.code != obj.scCounterRef.code){
			return false;
		}
		return true;
	}

	public int add(ENWorkOrderBytItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENWorkOrderBytItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENWORKORDERBYTITEM (CODE,CONTRACTNUMBERSERVICES,ACCOUNTNUMBER,NAME,CUSTOMERNAME,ADDRESS,INVNUMBER,SERIALNUMBER,SEAL,PHONE,STATUSCODE,RPCODE,DATECOUNTERINST,DATECOUNTERCHECK,COUNTERTYPE,CLASSACCURACY,CHECKPERIOD,RPSTATUSCODE,PHASITY,DATECHECK,CHECKPERIOD1,PLACECOUNTER,RPISWORKING,RECORDPOINTNAME,ROUTEBYTNAME,ROUTEBYTNUMBERGEN,COMMENTGEN,DATEADD,DATEEDIT,USERADD,USEREDIT,MODIFY_TIME,FACTCODE,COUNTERCAPACITY,COUNTERVOLTAGENOMINAL,COUNTERDATEPRODUCT,WORKORDERBYTREFCODE,HUMENITEMREFCODE,PLANREFCODE,PLANITEMREFCODE,FINWORKERCODE,RECORDPOINTBYTREFCODE,RECORDPOINTPROMREFCODE,ROUTEBYTREFCODE,SERVICESOBJECTREFCODE,SCCOUNTERREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.contractNumberServices);
			statement.setString(3,anObject.accountNumber);
			statement.setString(4,anObject.name);
			statement.setString(5,anObject.customerName);
			statement.setString(6,anObject.address);
			statement.setString(7,anObject.invNumber);
			statement.setString(8,anObject.serialNumber);
			statement.setString(9,anObject.seal);
			statement.setString(10,anObject.phone);
			if (anObject.statuscode != Integer.MIN_VALUE ) {
				statement.setInt(11,anObject.statuscode);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.rpCode != Integer.MIN_VALUE ) {
				statement.setInt(12,anObject.rpCode);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.dateCounterInst == null) {
				statement.setDate(13,null);
			} else {
				statement.setDate(13,new java.sql.Date(anObject.dateCounterInst.getTime()));
			}
			if (anObject.dateCounterCheck == null) {
				statement.setDate(14,null);
			} else {
				statement.setDate(14,new java.sql.Date(anObject.dateCounterCheck.getTime()));
			}
			statement.setString(15,anObject.counterType);
			if (anObject.classAccuracy != null) {
				anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16,anObject.classAccuracy);
			if (anObject.checkperiod != null) {
				anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17,anObject.checkperiod);
			if (anObject.rpStatusCode != Integer.MIN_VALUE ) {
				statement.setInt(18,anObject.rpStatusCode);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.phasity != null) {
				anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19,anObject.phasity);
			if (anObject.datecheck == null) {
				statement.setDate(20,null);
			} else {
				statement.setDate(20,new java.sql.Date(anObject.datecheck.getTime()));
			}
			if (anObject.checkperiod1 != null) {
				anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21,anObject.checkperiod1);
			statement.setString(22,anObject.placecounter);
			if (anObject.rpIsWorking != Integer.MIN_VALUE ) {
				statement.setInt(23,anObject.rpIsWorking);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}
			statement.setString(24,anObject.recordPointName);
			statement.setString(25,anObject.routeBytName);
			statement.setString(26,anObject.routeBytNumbergen);
			statement.setString(27,anObject.commentGen);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(28,null);
			} else {
				statement.setTimestamp(28,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setTimestamp(29,null);
			} else {
				statement.setTimestamp(29,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(30,anObject.userAdd);
			statement.setString(31,anObject.userEdit);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(32,null);
			} else {
				statement.setBigDecimal(32,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.factCode != Integer.MIN_VALUE ) {
				statement.setInt(33,anObject.factCode);
			} else {
				statement.setNull(33,java.sql.Types.INTEGER);
			}
			if (anObject.counterCapacity != Integer.MIN_VALUE ) {
				statement.setInt(34,anObject.counterCapacity);
			} else {
				statement.setNull(34,java.sql.Types.INTEGER);
			}
			if (anObject.counterVoltageNominal != null) {
				anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(35,anObject.counterVoltageNominal);
			if (anObject.counterDateProduct == null) {
				statement.setDate(36,null);
			} else {
				statement.setDate(36,new java.sql.Date(anObject.counterDateProduct.getTime()));
			}
			if (anObject.workOrderBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.workOrderBytRef.code%} = {%"+anObject.workOrderBytRef.code+"%}");
				}
				statement.setInt(37,anObject.workOrderBytRef.code);
			} else {
				statement.setNull(37,java.sql.Types.INTEGER);
			}
			if (anObject.humenItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENHumenItemDAOGen(connection,getUserProfile()).exists(anObject.humenItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.humenItemRef.code%} = {%"+anObject.humenItemRef.code+"%}");
				}
				statement.setInt(38,anObject.humenItemRef.code);
			} else {
				statement.setNull(38,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(39,anObject.planRef.code);
			} else {
				statement.setNull(39,java.sql.Types.INTEGER);
			}
			if (anObject.planItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).exists(anObject.planItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.planItemRef.code%} = {%"+anObject.planItemRef.code+"%}");
				}
				statement.setInt(40,anObject.planItemRef.code);
			} else {
				statement.setNull(40,java.sql.Types.INTEGER);
			}
			if (anObject.finWorker.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.finWorker.code%} = {%"+anObject.finWorker.code+"%}");
				}
				statement.setInt(41,anObject.finWorker.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}
			if (anObject.recordPointBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENRecordPointBytDAOGen(connection,getUserProfile()).exists(anObject.recordPointBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.recordPointBytRef.code%} = {%"+anObject.recordPointBytRef.code+"%}");
				}
				statement.setInt(42,anObject.recordPointBytRef.code);
			} else {
				statement.setNull(42,java.sql.Types.INTEGER);
			}
			if (anObject.recordPointPromRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENRecordPointPromDAOGen(connection,getUserProfile()).exists(anObject.recordPointPromRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.recordPointPromRef.code%} = {%"+anObject.recordPointPromRef.code+"%}");
				}
				statement.setInt(43,anObject.recordPointPromRef.code);
			} else {
				statement.setNull(43,java.sql.Types.INTEGER);
			}
			if (anObject.routeBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENRouteBytDAOGen(connection,getUserProfile()).exists(anObject.routeBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.routeBytRef.code%} = {%"+anObject.routeBytRef.code+"%}");
				}
				statement.setInt(44,anObject.routeBytRef.code);
			} else {
				statement.setNull(44,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(45,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(45,java.sql.Types.INTEGER);
			}
			if (anObject.scCounterRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCCounterDAOGen(connection,getUserProfile()).exists(anObject.scCounterRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrderBytItem.scCounterRef.code%} = {%"+anObject.scCounterRef.code+"%}");
				}
				statement.setInt(46,anObject.scCounterRef.code);
			} else {
				statement.setNull(46,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENWorkOrderBytItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENWorkOrderBytItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENWorkOrderBytItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENWorkOrderBytItem oldObject = new ENWorkOrderBytItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENWorkOrderBytItem.modify_time_Field+" FROM  ENWORKORDERBYTITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CONTRACTNUMBERSERVICES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADDRESS") == 0) {
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
					if(fieldNameStr.compareTo("SEAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RPCODE") == 0) {
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
					if(fieldNameStr.compareTo("RPSTATUSCODE") == 0) {
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
					if(fieldNameStr.compareTo("PLACECOUNTER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RPISWORKING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ROUTEBYTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ROUTEBYTNUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEREDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FACTCODE") == 0) {
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
					if(fieldNameStr.compareTo("WORKORDERBYTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HUMENITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINWORKER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTBYTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RECORDPOINTPROMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ROUTEBYTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SCCOUNTERREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENWORKORDERBYTITEM SET  CONTRACTNUMBERSERVICES = ? , ACCOUNTNUMBER = ? , NAME = ? , CUSTOMERNAME = ? , ADDRESS = ? , INVNUMBER = ? , SERIALNUMBER = ? , SEAL = ? , PHONE = ? , STATUSCODE = ? , RPCODE = ? , DATECOUNTERINST = ? , DATECOUNTERCHECK = ? , COUNTERTYPE = ? , CLASSACCURACY = ? , CHECKPERIOD = ? , RPSTATUSCODE = ? , PHASITY = ? , DATECHECK = ? , CHECKPERIOD1 = ? , PLACECOUNTER = ? , RPISWORKING = ? , RECORDPOINTNAME = ? , ROUTEBYTNAME = ? , ROUTEBYTNUMBERGEN = ? , COMMENTGEN = ? , DATEADD = ? , DATEEDIT = ? , USERADD = ? , USEREDIT = ? , MODIFY_TIME = ? , FACTCODE = ? , COUNTERCAPACITY = ? , COUNTERVOLTAGENOMINAL = ? , COUNTERDATEPRODUCT = ? , WORKORDERBYTREFCODE = ? , HUMENITEMREFCODE = ? , PLANREFCODE = ? , PLANITEMREFCODE = ? , FINWORKERCODE = ? , RECORDPOINTBYTREFCODE = ? , RECORDPOINTPROMREFCODE = ? , ROUTEBYTREFCODE = ? , SERVICESOBJECTREFCODE = ? , SCCOUNTERREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENWORKORDERBYTITEM SET ";
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
					statement.setString(1,anObject.contractNumberServices);
					statement.setString(2,anObject.accountNumber);
					statement.setString(3,anObject.name);
					statement.setString(4,anObject.customerName);
					statement.setString(5,anObject.address);
					statement.setString(6,anObject.invNumber);
					statement.setString(7,anObject.serialNumber);
					statement.setString(8,anObject.seal);
					statement.setString(9,anObject.phone);
					if (anObject.statuscode != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.statuscode);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.rpCode != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.rpCode);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					if (anObject.dateCounterInst == null) {
						statement.setDate(12,null);
					} else {
						statement.setDate(12,new java.sql.Date(anObject.dateCounterInst.getTime()));
					}
					if (anObject.dateCounterCheck == null) {
						statement.setDate(13,null);
					} else {
						statement.setDate(13,new java.sql.Date(anObject.dateCounterCheck.getTime()));
					}
					statement.setString(14,anObject.counterType);
					if (anObject.classAccuracy != null) {
						anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15,anObject.classAccuracy);
					if (anObject.checkperiod != null) {
						anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16,anObject.checkperiod);
					if (anObject.rpStatusCode != Integer.MIN_VALUE) {
						statement.setInt(17,anObject.rpStatusCode);
					} else {
						statement.setNull(17,java.sql.Types.INTEGER);
					}
					if (anObject.phasity != null) {
						anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18,anObject.phasity);
					if (anObject.datecheck == null) {
						statement.setDate(19,null);
					} else {
						statement.setDate(19,new java.sql.Date(anObject.datecheck.getTime()));
					}
					if (anObject.checkperiod1 != null) {
						anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20,anObject.checkperiod1);
					statement.setString(21,anObject.placecounter);
					if (anObject.rpIsWorking != Integer.MIN_VALUE) {
						statement.setInt(22,anObject.rpIsWorking);
					} else {
						statement.setNull(22,java.sql.Types.INTEGER);
					}
					statement.setString(23,anObject.recordPointName);
					statement.setString(24,anObject.routeBytName);
					statement.setString(25,anObject.routeBytNumbergen);
					statement.setString(26,anObject.commentGen);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(27,null);
					} else {
						statement.setTimestamp(27,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setTimestamp(28,null);
					} else {
						statement.setTimestamp(28,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(29,anObject.userAdd);
					statement.setString(30,anObject.userEdit);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(31,null);
					} else {
						statement.setBigDecimal(31,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.factCode != Integer.MIN_VALUE) {
						statement.setInt(32,anObject.factCode);
					} else {
						statement.setNull(32,java.sql.Types.INTEGER);
					}
					if (anObject.counterCapacity != Integer.MIN_VALUE) {
						statement.setInt(33,anObject.counterCapacity);
					} else {
						statement.setNull(33,java.sql.Types.INTEGER);
					}
					if (anObject.counterVoltageNominal != null) {
						anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(34,anObject.counterVoltageNominal);
					if (anObject.counterDateProduct == null) {
						statement.setDate(35,null);
					} else {
						statement.setDate(35,new java.sql.Date(anObject.counterDateProduct.getTime()));
					}
					if (anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
						statement.setInt(36,anObject.workOrderBytRef.code);
					} else {
						statement.setNull(36,java.sql.Types.INTEGER);
					}
					if (anObject.humenItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(37,anObject.humenItemRef.code);
					} else {
						statement.setNull(37,java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(38,anObject.planRef.code);
					} else {
						statement.setNull(38,java.sql.Types.INTEGER);
					}
					if (anObject.planItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(39,anObject.planItemRef.code);
					} else {
						statement.setNull(39,java.sql.Types.INTEGER);
					}
					if (anObject.finWorker.code != Integer.MIN_VALUE) {
						statement.setInt(40,anObject.finWorker.code);
					} else {
						statement.setNull(40,java.sql.Types.INTEGER);
					}
					if (anObject.recordPointBytRef.code != Integer.MIN_VALUE) {
						statement.setInt(41,anObject.recordPointBytRef.code);
					} else {
						statement.setNull(41,java.sql.Types.INTEGER);
					}
					if (anObject.recordPointPromRef.code != Integer.MIN_VALUE) {
						statement.setInt(42,anObject.recordPointPromRef.code);
					} else {
						statement.setNull(42,java.sql.Types.INTEGER);
					}
					if (anObject.routeBytRef.code != Integer.MIN_VALUE) {
						statement.setInt(43,anObject.routeBytRef.code);
					} else {
						statement.setNull(43,java.sql.Types.INTEGER);
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(44,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(44,java.sql.Types.INTEGER);
					}
					if (anObject.scCounterRef.code != Integer.MIN_VALUE) {
						statement.setInt(45,anObject.scCounterRef.code);
					} else {
						statement.setNull(45,java.sql.Types.INTEGER);
					}
					statement.setInt(46,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTRACTNUMBERSERVICES".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.contractNumberServices);
							continue;
						}
						if("ACCOUNTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.accountNumber);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("CUSTOMERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.customerName);
							continue;
						}
						if("ADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.address);
							continue;
						}
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.invNumber);
							continue;
						}
						if("SERIALNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.serialNumber);
							continue;
						}
						if("SEAL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.seal);
							continue;
						}
						if("PHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.phone);
							continue;
						}
						if("STATUSCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.statuscode);
							continue;
						}
						if("RPCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.rpCode);
							continue;
						}
						if("DATECOUNTERINST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateCounterInst == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateCounterInst.getTime()));
							}
							continue;
						}
						if("DATECOUNTERCHECK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateCounterCheck == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateCounterCheck.getTime()));
							}
							continue;
						}
						if("COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.counterType);
							continue;
						}
						if("CLASSACCURACY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.classAccuracy != null) {
								anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.classAccuracy);
							continue;
						}
						if("CHECKPERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.checkperiod != null) {
								anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.checkperiod);
							continue;
						}
						if("RPSTATUSCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.rpStatusCode);
							continue;
						}
						if("PHASITY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.phasity != null) {
								anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.phasity);
							continue;
						}
						if("DATECHECK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datecheck == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.datecheck.getTime()));
							}
							continue;
						}
						if("CHECKPERIOD1".compareTo((String)fields.get(i)) == 0) {
							if (anObject.checkperiod1 != null) {
								anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.checkperiod1);
							continue;
						}
						if("PLACECOUNTER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.placecounter);
							continue;
						}
						if("RPISWORKING".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.rpIsWorking);
							continue;
						}
						if("RECORDPOINTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.recordPointName);
							continue;
						}
						if("ROUTEBYTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.routeBytName);
							continue;
						}
						if("ROUTEBYTNUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.routeBytNumbergen);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
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
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userAdd);
							continue;
						}
						if("USEREDIT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userEdit);
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
						if("FACTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.factCode);
							continue;
						}
						if("COUNTERCAPACITY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.counterCapacity);
							continue;
						}
						if("COUNTERVOLTAGENOMINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.counterVoltageNominal != null) {
								anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.counterVoltageNominal);
							continue;
						}
						if("COUNTERDATEPRODUCT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.counterDateProduct == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.counterDateProduct.getTime()));
							}
							continue;
						}
						if("WORKORDERBYTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.workOrderBytRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("HUMENITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.humenItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.humenItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FINWORKER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finWorker.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.finWorker.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("RECORDPOINTBYTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.recordPointBytRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.recordPointBytRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("RECORDPOINTPROMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.recordPointPromRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.recordPointPromRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ROUTEBYTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.routeBytRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.routeBytRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
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
						if("SCCOUNTERREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.scCounterRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.scCounterRef.code);
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

	} // end of save(ENWorkOrderBytItem anObject,String[] anAttributes)


	public ENWorkOrderBytItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENWorkOrderBytItem filterObject = new ENWorkOrderBytItem();
		Vector<ENWorkOrderBytItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENWorkOrderBytItemShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENWorkOrderBytItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumberServices, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accountNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.address, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.serialNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.seal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.phone, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statuscode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rpCode, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCounterInst, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateCounterCheck, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.classAccuracy, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.checkperiod, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rpStatusCode, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.phasity, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datecheck, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.checkperiod1, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.placecounter, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rpIsWorking, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recordPointName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.routeBytName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.routeBytNumbergen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.factCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.counterCapacity, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.counterVoltageNominal, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.counterDateProduct, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.workOrderBytRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.humenItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finWorker.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.recordPointBytRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.recordPointPromRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.routeBytRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.scCounterRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENWorkOrderBytItemFilter filter) {
		String out = buildCondition((ENWorkOrderBytItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENWorkOrderBytItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENWorkOrderBytItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumberServices, ENWorkOrderBytItem.contractNumberServices_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accountNumber, ENWorkOrderBytItem.accountNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENWorkOrderBytItem.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customerName, ENWorkOrderBytItem.customerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.address, ENWorkOrderBytItem.address_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENWorkOrderBytItem.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.serialNumber, ENWorkOrderBytItem.serialNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.seal, ENWorkOrderBytItem.seal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.phone, ENWorkOrderBytItem.phone_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statuscode, ENWorkOrderBytItem.statuscode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rpCode, ENWorkOrderBytItem.rpCode_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCounterInst, ENWorkOrderBytItem.dateCounterInst_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateCounterCheck, ENWorkOrderBytItem.dateCounterCheck_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, ENWorkOrderBytItem.counterType_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.classAccuracy, ENWorkOrderBytItem.classAccuracy_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.checkperiod, ENWorkOrderBytItem.checkperiod_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rpStatusCode, ENWorkOrderBytItem.rpStatusCode_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.phasity, ENWorkOrderBytItem.phasity_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datecheck, ENWorkOrderBytItem.datecheck_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.checkperiod1, ENWorkOrderBytItem.checkperiod1_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.placecounter, ENWorkOrderBytItem.placecounter_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rpIsWorking, ENWorkOrderBytItem.rpIsWorking_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recordPointName, ENWorkOrderBytItem.recordPointName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.routeBytName, ENWorkOrderBytItem.routeBytName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.routeBytNumbergen, ENWorkOrderBytItem.routeBytNumbergen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENWorkOrderBytItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENWorkOrderBytItem.dateAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENWorkOrderBytItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENWorkOrderBytItem.userAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userEdit, ENWorkOrderBytItem.userEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENWorkOrderBytItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.factCode, ENWorkOrderBytItem.factCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.counterCapacity, ENWorkOrderBytItem.counterCapacity_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.counterVoltageNominal, ENWorkOrderBytItem.counterVoltageNominal_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.counterDateProduct, ENWorkOrderBytItem.counterDateProduct_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.workOrderBytRef.code, ENWorkOrderBytItem.workOrderBytRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.humenItemRef.code, ENWorkOrderBytItem.humenItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENWorkOrderBytItem.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planItemRef.code, ENWorkOrderBytItem.planItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finWorker.code, ENWorkOrderBytItem.finWorker_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.recordPointBytRef.code, ENWorkOrderBytItem.recordPointBytRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.recordPointPromRef.code, ENWorkOrderBytItem.recordPointPromRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.routeBytRef.code, ENWorkOrderBytItem.routeBytRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENWorkOrderBytItem.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.scCounterRef.code, ENWorkOrderBytItem.scCounterRef_QFielld, out);
		}
		return out;
	}

	public ENWorkOrderBytItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENWorkOrderBytItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENWorkOrderBytItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENWorkOrderBytItemShortList getFilteredList(ENWorkOrderBytItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredList(ENWorkOrderBytItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredList(ENWorkOrderBytItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredList(ENWorkOrderBytItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredList(ENWorkOrderBytItemFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENWorkOrderBytItemShortList getScrollableFilteredList(ENWorkOrderBytItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENWorkOrderBytItemShortList result = new ENWorkOrderBytItemShortList();
		ENWorkOrderBytItemShort anObject;
		result.list = new Vector<ENWorkOrderBytItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENWORKORDERBYTITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENWORKORDERBYTITEM.CODE"+
			",ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES"+
			",ENWORKORDERBYTITEM.ACCOUNTNUMBER"+
			",ENWORKORDERBYTITEM.NAME"+
			",ENWORKORDERBYTITEM.CUSTOMERNAME"+
			",ENWORKORDERBYTITEM.ADDRESS"+
			",ENWORKORDERBYTITEM.INVNUMBER"+
			",ENWORKORDERBYTITEM.SERIALNUMBER"+
			",ENWORKORDERBYTITEM.SEAL"+
			",ENWORKORDERBYTITEM.PHONE"+
			",ENWORKORDERBYTITEM.STATUSCODE"+
			",ENWORKORDERBYTITEM.RPCODE"+
			",ENWORKORDERBYTITEM.DATECOUNTERINST"+
			",ENWORKORDERBYTITEM.DATECOUNTERCHECK"+
			",ENWORKORDERBYTITEM.COUNTERTYPE"+
			",ENWORKORDERBYTITEM.CLASSACCURACY"+
			",ENWORKORDERBYTITEM.CHECKPERIOD"+
			",ENWORKORDERBYTITEM.RPSTATUSCODE"+
			",ENWORKORDERBYTITEM.PHASITY"+
			",ENWORKORDERBYTITEM.DATECHECK"+
			",ENWORKORDERBYTITEM.CHECKPERIOD1"+
			",ENWORKORDERBYTITEM.PLACECOUNTER"+
			",ENWORKORDERBYTITEM.RPISWORKING"+
			",ENWORKORDERBYTITEM.RECORDPOINTNAME"+
			",ENWORKORDERBYTITEM.ROUTEBYTNAME"+
			",ENWORKORDERBYTITEM.ROUTEBYTNUMBERGEN"+
			",ENWORKORDERBYTITEM.COMMENTGEN"+
			",ENWORKORDERBYTITEM.DATEADD"+
			",ENWORKORDERBYTITEM.DATEEDIT"+
			",ENWORKORDERBYTITEM.USERADD"+
			",ENWORKORDERBYTITEM.USEREDIT"+
			",ENWORKORDERBYTITEM.FACTCODE"+
			",ENWORKORDERBYTITEM.COUNTERCAPACITY"+
			",ENWORKORDERBYTITEM.COUNTERVOLTAGENOMINAL"+
			",ENWORKORDERBYTITEM.COUNTERDATEPRODUCT"+
			", ENWORKORDERBYT.CODE " +
			", ENWORKORDERBYT.NUMBERGEN " +
			", ENWORKORDERBYT.DATEGEN " +
			", ENWORKORDERBYT.COMMENTGEN " +
			", ENWORKORDERBYT.DATEADD " +
			", ENWORKORDERBYT.DATEEDIT " +
			", ENWORKORDERBYT.USERADD " +
			", ENWORKORDERBYT.USEREDIT " +
			", ENHUMENITEM.CODE " +
			", ENHUMENITEM.COUNTGEN " +
			", ENHUMENITEM.COUNTFACT " +
			", ENHUMENITEM.COUNTFACTORIGINAL " +
			", ENHUMENITEM.PRICE " +
			", ENHUMENITEM.COST " +
			", ENHUMENITEM.USERGEN " +
			", ENHUMENITEM.DATEEDIT " +
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
			", ENPLANWORKITEM.CODE " +
			", ENPLANWORKITEM.COUNTGEN " +
			", ENPLANWORKITEM.TIMEGEN " +
			", ENPLANWORKITEM.COSTGEN " +
			", ENPLANWORKITEM.USERGEN " +
			", ENPLANWORKITEM.DATEEDIT " +
			", FINWORKER.CODE " +
			", FINWORKER.NAME " +
			", FINWORKER.TABNUMBER " +
			", FINWORKER.POSITIONNAME " +
			", FINWORKER.POSITIONCODE " +
			", FINWORKER.DEPARTMENTNAME " +
			", FINWORKER.DEPARTMENTCODE " +
			", FINWORKER.PRICEGEN " +
			", FINWORKER.CATEGOR " +
			", FINWORKER.FINCODE " +
			", FINWORKER.ISSENTASSIGNMENT " +
			", FINWORKER.CHARGEPERCENT " +
			", FINWORKER.CATEGORID " +
			", FINWORKER.CATEGORNAME " +
			", FINWORKER.WORKTIMEID " +
			", FINWORKER.POSITIONID " +
			", ENRECORDPOINTBYT.CODE " +
			", ENRECORDPOINTBYT.ACCOUNTNUMBER " +
			", ENRECORDPOINTBYT.CONTRACTDATE " +
			", ENRECORDPOINTBYT.NAME " +
			", ENRECORDPOINTBYT.ADDRESS " +
			", ENRECORDPOINTBYT.RPCODE " +
			", ENRECORDPOINTBYT.INVNUMBER " +
			", ENRECORDPOINTBYT.SERIALNUMBER " +
			", ENRECORDPOINTBYT.DATECOUNTERINST " +
			", ENRECORDPOINTBYT.DATECOUNTERCHECK " +
			", ENRECORDPOINTBYT.COUNTERTYPE " +
			", ENRECORDPOINTBYT.CLASSACCURACY " +
			", ENRECORDPOINTBYT.CHECKPERIOD " +
			", ENRECORDPOINTBYT.STATUSCODE " +
			", ENRECORDPOINTBYT.PHASITY " +
			", ENRECORDPOINTBYT.DATECHECK " +
			", ENRECORDPOINTBYT.CHECKPERIOD1 " +
			", ENRECORDPOINTBYT.PHONE " +
			", ENRECORDPOINTBYT.SEAL " +
			", ENRECORDPOINTBYT.PLACECOUNTER " +
			", ENRECORDPOINTBYT.ISWORKING " +
			", ENRECORDPOINTBYT.COUNTERCAPACITY " +
			", ENRECORDPOINTBYT.COUNTERVOLTAGENOMINAL " +
			", ENRECORDPOINTBYT.COUNTERDATEPRODUCT " +
			", ENRECORDPOINTPROM.CODE " +
			", ENRECORDPOINTPROM.ACCOUNTNUMBER " +
			", ENRECORDPOINTPROM.ACCOUNTNAME " +
			", ENRECORDPOINTPROM.COUNTERNUMBER " +
			", ENRECORDPOINTPROM.RECORDPOINTNAME " +
			", ENRECORDPOINTPROM.RECORDPOINTADDR " +
			", ENRECORDPOINTPROM.RECORDPOINTKINDNAME " +
			", ENRECORDPOINTPROM.RECORDPOINTCODE " +
			", ENRECORDPOINTPROM.FEEDER " +
			", ENRECORDPOINTPROM.SUBSTATION " +
			", ENRECORDPOINTPROM.INVNUMBER " +
			", ENRECORDPOINTPROM.DAYOFCALCULATION " +
			", ENRECORDPOINTPROM.INSPECTOR " +
			", ENRECORDPOINTPROM.DATECONTROL " +
			", ENRECORDPOINTPROM.DATETP " +
			", ENRECORDPOINTPROM.DATECOUNTERINST " +
			", ENRECORDPOINTPROM.DATECOUNTERCHECK " +
			", ENRECORDPOINTPROM.COUNTERTYPE " +
			", ENRECORDPOINTPROM.CLASSACCURACY " +
			", ENRECORDPOINTPROM.CHECKPERIOD " +
			", ENRECORDPOINTPROM.STATUSCODE " +
			", ENRECORDPOINTPROM.PHASITY " +
			", ENRECORDPOINTPROM.PHONE " +
			", ENRECORDPOINTPROM.SEAL " +
			", ENRECORDPOINTPROM.PLACECOUNTER " +
			", ENRECORDPOINTPROM.ISWORKING " +
			", ENRECORDPOINTPROM.COUNTERCAPACITY " +
			", ENRECORDPOINTPROM.COUNTERVOLTAGENOMINAL " +
			", ENRECORDPOINTPROM.COUNTERDATEPRODUCT " +
			", ENROUTEBYT.CODE " +
			", ENROUTEBYT.NAME " +
			", ENROUTEBYT.NUMBERGEN " +
			", ENROUTEBYT.ROUTECODE " +
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
			", SCCOUNTER.CODE " +
			", SCCOUNTER.INVNUMBER " +
			", SCCOUNTER.NAME " +
			", SCCOUNTER.BUILDNUMBER " +
			", SCCOUNTER.ACCOUNT " +
			", SCCOUNTER.DEPARTMETFKCODE " +
			", SCCOUNTER.MOLCODE " +
			", SCCOUNTER.DATEIN " +
			", SCCOUNTER.DATEBUILD " +
			", SCCOUNTER.DATECHECK " +
			", SCCOUNTER.COST " +
			", SCCOUNTER.SCCODE " +
			", SCCOUNTER.COUNTERTYPE " +
			", SCCOUNTER.INSTALLORDERNUMBER " +
			", SCCOUNTER.READING " +
			", SCCOUNTER.DATEEDIT " +
			", SCCOUNTER.ISLIQUID " +
			", SCCOUNTER.COSTOLD " +
		" FROM ENWORKORDERBYTITEM " +
			", ENWORKORDERBYT " +
			", ENHUMENITEM " +
			", ENPLANWORK " +
			", ENPLANWORKITEM " +
			", FINWORKER " +
			", ENRECORDPOINTBYT " +
			", ENRECORDPOINTPROM " +
			", ENROUTEBYT " +
			", ENSERVICESOBJECT " +
			", SCCOUNTER " +
		"";
		whereStr = " ENWORKORDERBYT.CODE = ENWORKORDERBYTITEM.WORKORDERBYTREFCODE" ; //+
		whereStr += " AND ENHUMENITEM.CODE = ENWORKORDERBYTITEM.HUMENITEMREFCODE" ; //+
		whereStr += " AND ENPLANWORK.CODE = ENWORKORDERBYTITEM.PLANREFCODE" ; //+
		whereStr += " AND ENPLANWORKITEM.CODE = ENWORKORDERBYTITEM.PLANITEMREFCODE" ; //+
		whereStr += " AND FINWORKER.CODE = ENWORKORDERBYTITEM.FINWORKERCODE" ; //+
		whereStr += " AND ENRECORDPOINTBYT.CODE = ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE" ; //+
		whereStr += " AND ENRECORDPOINTPROM.CODE = ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE" ; //+
		whereStr += " AND ENROUTEBYT.CODE = ENWORKORDERBYTITEM.ROUTEBYTREFCODE" ; //+
		whereStr += " AND ENSERVICESOBJECT.CODE = ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE" ; //+
		whereStr += " AND SCCOUNTER.CODE = ENWORKORDERBYTITEM.SCCOUNTERREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

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
				anObject = new ENWorkOrderBytItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumberServices = set.getString(2);
				anObject.accountNumber = set.getString(3);
				anObject.name = set.getString(4);
				anObject.customerName = set.getString(5);
				anObject.address = set.getString(6);
				anObject.invNumber = set.getString(7);
				anObject.serialNumber = set.getString(8);
				anObject.seal = set.getString(9);
				anObject.phone = set.getString(10);
				anObject.statuscode = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.rpCode = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.rpCode = Integer.MIN_VALUE;
				}
				anObject.dateCounterInst = set.getDate(13);
				anObject.dateCounterCheck = set.getDate(14);
				anObject.counterType = set.getString(15);
				anObject.classAccuracy = set.getBigDecimal(16);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(17);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rpStatusCode = set.getInt(18);
				if ( set.wasNull() ) {
					anObject.rpStatusCode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(19);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.datecheck = set.getDate(20);
				anObject.checkperiod1 = set.getBigDecimal(21);
				if(anObject.checkperiod1 != null) {
					anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.placecounter = set.getString(22);
				anObject.rpIsWorking = set.getInt(23);
				if ( set.wasNull() ) {
					anObject.rpIsWorking = Integer.MIN_VALUE;
				}
				anObject.recordPointName = set.getString(24);
				anObject.routeBytName = set.getString(25);
				anObject.routeBytNumbergen = set.getString(26);
				anObject.commentGen = set.getString(27);
				anObject.dateAdd = set.getTimestamp(28);
				anObject.dateEdit = set.getTimestamp(29);
				anObject.userAdd = set.getString(30);
				anObject.userEdit = set.getString(31);
				anObject.factCode = set.getInt(32);
				if ( set.wasNull() ) {
					anObject.factCode = Integer.MIN_VALUE;
				}
				anObject.counterCapacity = set.getInt(33);
				if ( set.wasNull() ) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(34);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(35);

				anObject.workOrderBytRefCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.workOrderBytRefCode = Integer.MIN_VALUE;
				}
				anObject.workOrderBytRefNumberGen = set.getString(37);
				anObject.workOrderBytRefDateGen = set.getDate(38);
				anObject.workOrderBytRefCommentGen = set.getString(39);
				anObject.workOrderBytRefDateAdd = set.getTimestamp(40);
				anObject.workOrderBytRefDateEdit = set.getTimestamp(41);
				anObject.workOrderBytRefUserAdd = set.getString(42);
				anObject.workOrderBytRefUserEdit = set.getString(43);
				anObject.humenItemRefCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.humenItemRefCode = Integer.MIN_VALUE;
				}
				anObject.humenItemRefCountGen = set.getBigDecimal(45);
				if(anObject.humenItemRefCountGen != null) {
					anObject.humenItemRefCountGen = anObject.humenItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.humenItemRefCountFact = set.getBigDecimal(46);
				if(anObject.humenItemRefCountFact != null) {
					anObject.humenItemRefCountFact = anObject.humenItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.humenItemRefCountFactOriginal = set.getBigDecimal(47);
				if(anObject.humenItemRefCountFactOriginal != null) {
					anObject.humenItemRefCountFactOriginal = anObject.humenItemRefCountFactOriginal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.humenItemRefPrice = set.getBigDecimal(48);
				if(anObject.humenItemRefPrice != null) {
					anObject.humenItemRefPrice = anObject.humenItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.humenItemRefCost = set.getBigDecimal(49);
				if(anObject.humenItemRefCost != null) {
					anObject.humenItemRefCost = anObject.humenItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.humenItemRefUserGen = set.getString(50);
				anObject.humenItemRefDateEdit = set.getDate(51);
				anObject.planRefCode = set.getInt(52);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(53);
				anObject.planRefDateStart = set.getDate(54);
				anObject.planRefDateFinal = set.getDate(55);
				anObject.planRefYearGen = set.getInt(56);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(57);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(58);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(59);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(60);
				anObject.planRefDateEdit = set.getDate(61);
				anObject.planRefWorkOrderNumber = set.getString(62);
				anObject.planRefDateWorkOrder = set.getDate(63);
				anObject.planRefPriConnectionNumber = set.getString(64);
				anObject.planRefDateEndPriConnection = set.getDate(65);
				anObject.planRefInvestWorksDescription = set.getString(66);
				anObject.planRefServicesFSideFinId = set.getInt(67);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(68);
				anObject.planRefTotalTimeHours = set.getBigDecimal(69);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(70);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(71);
				anObject.planItemRefCode = set.getInt(72);
				if(set.wasNull()) {
					anObject.planItemRefCode = Integer.MIN_VALUE;
				}
				anObject.planItemRefCountGen = set.getBigDecimal(73);
				if(anObject.planItemRefCountGen != null) {
					anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefTimeGen = set.getBigDecimal(74);
				if(anObject.planItemRefTimeGen != null) {
					anObject.planItemRefTimeGen = anObject.planItemRefTimeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefCostGen = set.getBigDecimal(75);
				if(anObject.planItemRefCostGen != null) {
					anObject.planItemRefCostGen = anObject.planItemRefCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefUserGen = set.getString(76);
				anObject.planItemRefDateEdit = set.getDate(77);
				anObject.finWorkerCode = set.getInt(78);
				if(set.wasNull()) {
					anObject.finWorkerCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerName = set.getString(79);
				anObject.finWorkerTabNumber = set.getString(80);
				anObject.finWorkerPositionName = set.getString(81);
				anObject.finWorkerPositionCode = set.getInt(82);
				if(set.wasNull()) {
					anObject.finWorkerPositionCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerDepartmentName = set.getString(83);
				anObject.finWorkerDepartmentCode = set.getString(84);
				anObject.finWorkerPriceGen = set.getBigDecimal(85);
				if(anObject.finWorkerPriceGen != null) {
					anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finWorkerCategor = set.getInt(86);
				if(set.wasNull()) {
					anObject.finWorkerCategor = Integer.MIN_VALUE;
				}
				anObject.finWorkerFinCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.finWorkerFinCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerIsSentAssignment = set.getInt(88);
				if(set.wasNull()) {
					anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
				}
				anObject.finWorkerChargePercent = set.getBigDecimal(89);
				if(anObject.finWorkerChargePercent != null) {
					anObject.finWorkerChargePercent = anObject.finWorkerChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finWorkerCategorId = set.getInt(90);
				if(set.wasNull()) {
					anObject.finWorkerCategorId = Integer.MIN_VALUE;
				}
				anObject.finWorkerCategorName = set.getString(91);
				anObject.finWorkerWorkTimeId = set.getString(92);
				anObject.finWorkerPositionId = set.getString(93);
				anObject.recordPointBytRefCode = set.getInt(94);
				if(set.wasNull()) {
					anObject.recordPointBytRefCode = Integer.MIN_VALUE;
				}
				anObject.recordPointBytRefAccountNumber = set.getString(95);
				anObject.recordPointBytRefContractDate = set.getDate(96);
				anObject.recordPointBytRefName = set.getString(97);
				anObject.recordPointBytRefAddress = set.getString(98);
				anObject.recordPointBytRefRpCode = set.getInt(99);
				if(set.wasNull()) {
					anObject.recordPointBytRefRpCode = Integer.MIN_VALUE;
				}
				anObject.recordPointBytRefInvNumber = set.getString(100);
				anObject.recordPointBytRefSerialNumber = set.getString(101);
				anObject.recordPointBytRefDateCounterInst = set.getDate(102);
				anObject.recordPointBytRefDateCounterCheck = set.getDate(103);
				anObject.recordPointBytRefCounterType = set.getString(104);
				anObject.recordPointBytRefClassAccuracy = set.getBigDecimal(105);
				if(anObject.recordPointBytRefClassAccuracy != null) {
					anObject.recordPointBytRefClassAccuracy = anObject.recordPointBytRefClassAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointBytRefCheckperiod = set.getBigDecimal(106);
				if(anObject.recordPointBytRefCheckperiod != null) {
					anObject.recordPointBytRefCheckperiod = anObject.recordPointBytRefCheckperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointBytRefStatuscode = set.getInt(107);
				if(set.wasNull()) {
					anObject.recordPointBytRefStatuscode = Integer.MIN_VALUE;
				}
				anObject.recordPointBytRefPhasity = set.getBigDecimal(108);
				if(anObject.recordPointBytRefPhasity != null) {
					anObject.recordPointBytRefPhasity = anObject.recordPointBytRefPhasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointBytRefDatecheck = set.getDate(109);
				anObject.recordPointBytRefCheckperiod1 = set.getBigDecimal(110);
				if(anObject.recordPointBytRefCheckperiod1 != null) {
					anObject.recordPointBytRefCheckperiod1 = anObject.recordPointBytRefCheckperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointBytRefPhone = set.getString(111);
				anObject.recordPointBytRefSeal = set.getString(112);
				anObject.recordPointBytRefPlacecounter = set.getString(113);
				anObject.recordPointBytRefIsworking = set.getInt(114);
				if(set.wasNull()) {
					anObject.recordPointBytRefIsworking = Integer.MIN_VALUE;
				}
				anObject.recordPointBytRefCounterCapacity = set.getInt(115);
				if(set.wasNull()) {
					anObject.recordPointBytRefCounterCapacity = Integer.MIN_VALUE;
				}
				anObject.recordPointBytRefCounterVoltageNominal = set.getBigDecimal(116);
				if(anObject.recordPointBytRefCounterVoltageNominal != null) {
					anObject.recordPointBytRefCounterVoltageNominal = anObject.recordPointBytRefCounterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointBytRefCounterDateProduct = set.getDate(117);
				anObject.recordPointPromRefCode = set.getInt(118);
				if(set.wasNull()) {
					anObject.recordPointPromRefCode = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRefAccountNumber = set.getString(119);
				anObject.recordPointPromRefAccountName = set.getString(120);
				anObject.recordPointPromRefCounterNumber = set.getString(121);
				anObject.recordPointPromRefRecordPointName = set.getString(122);
				anObject.recordPointPromRefRecordPointAddr = set.getString(123);
				anObject.recordPointPromRefRecordPointKindName = set.getString(124);
				anObject.recordPointPromRefRecordPointCode = set.getInt(125);
				if(set.wasNull()) {
					anObject.recordPointPromRefRecordPointCode = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRefFeeder = set.getString(126);
				anObject.recordPointPromRefSubstation = set.getString(127);
				anObject.recordPointPromRefInvNumber = set.getString(128);
				anObject.recordPointPromRefDayofcalculation = set.getInt(129);
				if(set.wasNull()) {
					anObject.recordPointPromRefDayofcalculation = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRefInspector = set.getString(130);
				anObject.recordPointPromRefDatecontrol = set.getDate(131);
				anObject.recordPointPromRefDatetp = set.getDate(132);
				anObject.recordPointPromRefDateCounterInst = set.getDate(133);
				anObject.recordPointPromRefDateCounterCheck = set.getDate(134);
				anObject.recordPointPromRefCounterType = set.getString(135);
				anObject.recordPointPromRefClassAccuracy = set.getBigDecimal(136);
				if(anObject.recordPointPromRefClassAccuracy != null) {
					anObject.recordPointPromRefClassAccuracy = anObject.recordPointPromRefClassAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointPromRefCheckperiod = set.getBigDecimal(137);
				if(anObject.recordPointPromRefCheckperiod != null) {
					anObject.recordPointPromRefCheckperiod = anObject.recordPointPromRefCheckperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointPromRefStatuscode = set.getInt(138);
				if(set.wasNull()) {
					anObject.recordPointPromRefStatuscode = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRefPhasity = set.getBigDecimal(139);
				if(anObject.recordPointPromRefPhasity != null) {
					anObject.recordPointPromRefPhasity = anObject.recordPointPromRefPhasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointPromRefPhone = set.getString(140);
				anObject.recordPointPromRefSeal = set.getString(141);
				anObject.recordPointPromRefPlacecounter = set.getString(142);
				anObject.recordPointPromRefIsworking = set.getInt(143);
				if(set.wasNull()) {
					anObject.recordPointPromRefIsworking = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRefCounterCapacity = set.getInt(144);
				if(set.wasNull()) {
					anObject.recordPointPromRefCounterCapacity = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRefCounterVoltageNominal = set.getBigDecimal(145);
				if(anObject.recordPointPromRefCounterVoltageNominal != null) {
					anObject.recordPointPromRefCounterVoltageNominal = anObject.recordPointPromRefCounterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.recordPointPromRefCounterDateProduct = set.getDate(146);
				anObject.routeBytRefCode = set.getInt(147);
				if(set.wasNull()) {
					anObject.routeBytRefCode = Integer.MIN_VALUE;
				}
				anObject.routeBytRefName = set.getString(148);
				anObject.routeBytRefNumbergen = set.getString(149);
				anObject.routeBytRefRouteCode = set.getInt(150);
				if(set.wasNull()) {
					anObject.routeBytRefRouteCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCode = set.getInt(151);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(152);
				anObject.servicesObjectRefContractDate = set.getDate(153);
				anObject.servicesObjectRefName = set.getString(154);
				anObject.servicesObjectRefPartnerCode = set.getString(155);
				anObject.servicesObjectRefFinDocCode = set.getString(156);
				anObject.servicesObjectRefFinDocID = set.getInt(157);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(158);
				anObject.servicesObjectRefContractNumberServices = set.getString(159);
				anObject.servicesObjectRefContractDateServices = set.getDate(160);
				anObject.servicesObjectRefContragentName = set.getString(161);
				anObject.servicesObjectRefContragentAddress = set.getString(162);
				anObject.servicesObjectRefContragentAddressWork = set.getString(163);
				anObject.servicesObjectRefContragentOkpo = set.getString(164);
				anObject.servicesObjectRefContragentBankAccount = set.getString(165);
				anObject.servicesObjectRefContragentBankName = set.getString(166);
				anObject.servicesObjectRefContragentBankMfo = set.getString(167);
				anObject.servicesObjectRefContragentBossName = set.getString(168);
				anObject.servicesObjectRefContragentPassport = set.getString(169);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(170);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(171);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(172);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(173);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(174);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(175);
				anObject.servicesObjectRefDateEdit = set.getDate(176);
				anObject.servicesObjectRefWarrantDate = set.getDate(177);
				anObject.servicesObjectRefWarrantNumber = set.getString(178);
				anObject.servicesObjectRefWarrantFIO = set.getString(179);
				anObject.servicesObjectRefRegionalType = set.getInt(180);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(181);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(182);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(183);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(184);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(185);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(186);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(187);
				anObject.servicesObjectRefContragentObjectWork = set.getString(188);
				anObject.servicesObjectRefIsNoPay = set.getInt(189);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(190);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(191);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(192);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(193);
				anObject.servicesObjectRefPartnerId = set.getInt(194);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(195);
				anObject.servicesObjectRefActTransferNumber = set.getString(196);
				anObject.servicesObjectRefActTransferDate = set.getDate(197);
				anObject.servicesObjectRefResposible = set.getString(198);
				anObject.servicesObjectRefResposiblePosition = set.getString(199);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(200);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(201);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(202);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(203);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(204);
				anObject.servicesObjectRefTabNumber = set.getString(205);
				anObject.servicesObjectRefCitiesList = set.getString(206);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(207);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(208);
				anObject.servicesObjectRefCnPackCode = set.getInt(209);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(210);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(211);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.scCounterRefCode = set.getInt(212);
				if(set.wasNull()) {
					anObject.scCounterRefCode = Integer.MIN_VALUE;
				}
				anObject.scCounterRefInvNumber = set.getString(213);
				anObject.scCounterRefName = set.getString(214);
				anObject.scCounterRefBuildNumber = set.getString(215);
				anObject.scCounterRefAccount = set.getString(216);
				anObject.scCounterRefDepartmetFKCode = set.getString(217);
				anObject.scCounterRefMolCode = set.getString(218);
				anObject.scCounterRefDateIn = set.getDate(219);
				anObject.scCounterRefDateBuild = set.getDate(220);
				anObject.scCounterRefDateCheck = set.getDate(221);
				anObject.scCounterRefCost = set.getBigDecimal(222);
				if(anObject.scCounterRefCost != null) {
					anObject.scCounterRefCost = anObject.scCounterRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCounterRefScCode = set.getInt(223);
				if(set.wasNull()) {
					anObject.scCounterRefScCode = Integer.MIN_VALUE;
				}
				anObject.scCounterRefCounterType = set.getString(224);
				anObject.scCounterRefInstallOrderNumber = set.getString(225);
				anObject.scCounterRefReading = set.getString(226);
				anObject.scCounterRefDateEdit = set.getTimestamp(227);
				anObject.scCounterRefIsliquid = set.getInt(228);
				if(set.wasNull()) {
					anObject.scCounterRefIsliquid = Integer.MIN_VALUE;
				}
				anObject.scCounterRefCostOld = set.getBigDecimal(229);
				if(anObject.scCounterRefCostOld != null) {
					anObject.scCounterRefCostOld = anObject.scCounterRefCostOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
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

	public int[] getFilteredCodeArray(ENWorkOrderBytItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENWorkOrderBytItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENWORKORDERBYTITEM.CODE FROM ENWORKORDERBYTITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENWORKORDERBYTITEM.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		if (whereStr.length() > 0) {
		whereStr += " AND " + buildCondition(aFilterObject);}
		else {
			whereStr = buildCondition(aFilterObject);
		}

		if(condition.length() != 0) {
			if(whereStr.length() != 0) {
				whereStr = whereStr + " AND ";
			}
			whereStr = whereStr + " (" + condition + ")";
		}

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

	public ENWorkOrderBytItem getObject(int uid) throws PersistenceException {
		ENWorkOrderBytItem result = new ENWorkOrderBytItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENWorkOrderBytItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENWORKORDERBYTITEM.CODE, ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES, ENWORKORDERBYTITEM.ACCOUNTNUMBER, ENWORKORDERBYTITEM.NAME, ENWORKORDERBYTITEM.CUSTOMERNAME, ENWORKORDERBYTITEM.ADDRESS, ENWORKORDERBYTITEM.INVNUMBER, ENWORKORDERBYTITEM.SERIALNUMBER, ENWORKORDERBYTITEM.SEAL, ENWORKORDERBYTITEM.PHONE, ENWORKORDERBYTITEM.STATUSCODE, ENWORKORDERBYTITEM.RPCODE, ENWORKORDERBYTITEM.DATECOUNTERINST, ENWORKORDERBYTITEM.DATECOUNTERCHECK, ENWORKORDERBYTITEM.COUNTERTYPE, ENWORKORDERBYTITEM.CLASSACCURACY, ENWORKORDERBYTITEM.CHECKPERIOD, ENWORKORDERBYTITEM.RPSTATUSCODE, ENWORKORDERBYTITEM.PHASITY, ENWORKORDERBYTITEM.DATECHECK, ENWORKORDERBYTITEM.CHECKPERIOD1, ENWORKORDERBYTITEM.PLACECOUNTER, ENWORKORDERBYTITEM.RPISWORKING, ENWORKORDERBYTITEM.RECORDPOINTNAME, ENWORKORDERBYTITEM.ROUTEBYTNAME, ENWORKORDERBYTITEM.ROUTEBYTNUMBERGEN, ENWORKORDERBYTITEM.COMMENTGEN, ENWORKORDERBYTITEM.DATEADD, ENWORKORDERBYTITEM.DATEEDIT, ENWORKORDERBYTITEM.USERADD, ENWORKORDERBYTITEM.USEREDIT, ENWORKORDERBYTITEM.MODIFY_TIME, ENWORKORDERBYTITEM.FACTCODE, ENWORKORDERBYTITEM.COUNTERCAPACITY, ENWORKORDERBYTITEM.COUNTERVOLTAGENOMINAL, ENWORKORDERBYTITEM.COUNTERDATEPRODUCT, ENWORKORDERBYTITEM.WORKORDERBYTREFCODE, ENWORKORDERBYTITEM.HUMENITEMREFCODE, ENWORKORDERBYTITEM.PLANREFCODE, ENWORKORDERBYTITEM.PLANITEMREFCODE, ENWORKORDERBYTITEM.FINWORKERCODE, ENWORKORDERBYTITEM.RECORDPOINTBYTREFCODE, ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE, ENWORKORDERBYTITEM.ROUTEBYTREFCODE, ENWORKORDERBYTITEM.SERVICESOBJECTREFCODE, ENWORKORDERBYTITEM.SCCOUNTERREFCODE "
			+" FROM ENWORKORDERBYTITEM WHERE ENWORKORDERBYTITEM.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {

				anObject.code = set.getInt(1);
				anObject.contractNumberServices = set.getString(2);
				anObject.accountNumber = set.getString(3);
				anObject.name = set.getString(4);
				anObject.customerName = set.getString(5);
				anObject.address = set.getString(6);
				anObject.invNumber = set.getString(7);
				anObject.serialNumber = set.getString(8);
				anObject.seal = set.getString(9);
				anObject.phone = set.getString(10);
				anObject.statuscode = set.getInt(11);
				if (set.wasNull()) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.rpCode = set.getInt(12);
				if (set.wasNull()) {
					anObject.rpCode = Integer.MIN_VALUE;
				}
				anObject.dateCounterInst = set.getDate(13);
				anObject.dateCounterCheck = set.getDate(14);
				anObject.counterType = set.getString(15);
				anObject.classAccuracy = set.getBigDecimal(16);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(17);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rpStatusCode = set.getInt(18);
				if (set.wasNull()) {
					anObject.rpStatusCode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(19);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.datecheck = set.getDate(20);
				anObject.checkperiod1 = set.getBigDecimal(21);
				if(anObject.checkperiod1 != null) {
					anObject.checkperiod1 = anObject.checkperiod1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.placecounter = set.getString(22);
				anObject.rpIsWorking = set.getInt(23);
				if (set.wasNull()) {
					anObject.rpIsWorking = Integer.MIN_VALUE;
				}
				anObject.recordPointName = set.getString(24);
				anObject.routeBytName = set.getString(25);
				anObject.routeBytNumbergen = set.getString(26);
				anObject.commentGen = set.getString(27);
				anObject.dateAdd = set.getTimestamp(28);
				anObject.dateEdit = set.getTimestamp(29);
				anObject.userAdd = set.getString(30);
				anObject.userEdit = set.getString(31);
				anObject.modify_time = set.getLong(32);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.factCode = set.getInt(33);
				if (set.wasNull()) {
					anObject.factCode = Integer.MIN_VALUE;
				}
				anObject.counterCapacity = set.getInt(34);
				if (set.wasNull()) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(35);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(36);
				anObject.workOrderBytRef.code = set.getInt(37);
				if (set.wasNull()) {
					anObject.workOrderBytRef.code = Integer.MIN_VALUE;
				}
				anObject.humenItemRef.code = set.getInt(38);
				if (set.wasNull()) {
					anObject.humenItemRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(39);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.planItemRef.code = set.getInt(40);
				if (set.wasNull()) {
					anObject.planItemRef.code = Integer.MIN_VALUE;
				}
				anObject.finWorker.code = set.getInt(41);
				if (set.wasNull()) {
					anObject.finWorker.code = Integer.MIN_VALUE;
				}
				anObject.recordPointBytRef.code = set.getInt(42);
				if (set.wasNull()) {
					anObject.recordPointBytRef.code = Integer.MIN_VALUE;
				}
				anObject.recordPointPromRef.code = set.getInt(43);
				if (set.wasNull()) {
					anObject.recordPointPromRef.code = Integer.MIN_VALUE;
				}
				anObject.routeBytRef.code = set.getInt(44);
				if (set.wasNull()) {
					anObject.routeBytRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(45);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.scCounterRef.code = set.getInt(46);
				if (set.wasNull()) {
					anObject.scCounterRef.code = Integer.MIN_VALUE;
				}
				if(anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
					anObject.setWorkOrderBytRef(
						new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).getRef(anObject.workOrderBytRef.code));
				}
				if(anObject.humenItemRef.code != Integer.MIN_VALUE) {
					anObject.setHumenItemRef(
						new com.ksoe.energynet.dataminer.generated.ENHumenItemDAOGen(connection,getUserProfile()).getRef(anObject.humenItemRef.code));
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.planItemRef.code != Integer.MIN_VALUE) {
					anObject.setPlanItemRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).getRef(anObject.planItemRef.code));
				}
				if(anObject.finWorker.code != Integer.MIN_VALUE) {
					anObject.setFinWorker(
						new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker.code));
				}
				if(anObject.recordPointBytRef.code != Integer.MIN_VALUE) {
					anObject.setRecordPointBytRef(
						new com.ksoe.energynet.dataminer.generated.ENRecordPointBytDAOGen(connection,getUserProfile()).getRef(anObject.recordPointBytRef.code));
				}
				if(anObject.recordPointPromRef.code != Integer.MIN_VALUE) {
					anObject.setRecordPointPromRef(
						new com.ksoe.energynet.dataminer.generated.ENRecordPointPromDAOGen(connection,getUserProfile()).getRef(anObject.recordPointPromRef.code));
				}
				if(anObject.routeBytRef.code != Integer.MIN_VALUE) {
					anObject.setRouteBytRef(
						new com.ksoe.energynet.dataminer.generated.ENRouteBytDAOGen(connection,getUserProfile()).getRef(anObject.routeBytRef.code));
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
				}
				if(anObject.scCounterRef.code != Integer.MIN_VALUE) {
					anObject.setScCounterRef(
						new com.ksoe.energynet.dataminer.generated.SCCounterDAOGen(connection,getUserProfile()).getRef(anObject.scCounterRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENWorkOrderBytItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENWorkOrderBytItemRef ref = new com.ksoe.energynet.valueobject.references.ENWorkOrderBytItemRef();
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

		selectStr = "DELETE FROM  ENWORKORDERBYTITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENWorkOrderBytItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENWorkOrderBytItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENWorkOrderBytItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENWorkOrderBytItem.remove%} access denied");
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

	public long count(ENWorkOrderBytItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENWorkOrderBytItemFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENWorkOrderBytItemFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENWORKORDERBYTITEM", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENWorkOrderBytItemFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENWORKORDERBYTITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWorkOrderBytItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENWorkOrderBytItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENWORKORDERBYTITEM.CODE FROM  ENWORKORDERBYTITEM WHERE  ENWORKORDERBYTITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENWORKORDERBYTITEM.CODE");
		_checkConditionToken(condition,"contractnumberservices","ENWORKORDERBYTITEM.CONTRACTNUMBERSERVICES");
		_checkConditionToken(condition,"accountnumber","ENWORKORDERBYTITEM.ACCOUNTNUMBER");
		_checkConditionToken(condition,"name","ENWORKORDERBYTITEM.NAME");
		_checkConditionToken(condition,"customername","ENWORKORDERBYTITEM.CUSTOMERNAME");
		_checkConditionToken(condition,"address","ENWORKORDERBYTITEM.ADDRESS");
		_checkConditionToken(condition,"invnumber","ENWORKORDERBYTITEM.INVNUMBER");
		_checkConditionToken(condition,"serialnumber","ENWORKORDERBYTITEM.SERIALNUMBER");
		_checkConditionToken(condition,"seal","ENWORKORDERBYTITEM.SEAL");
		_checkConditionToken(condition,"phone","ENWORKORDERBYTITEM.PHONE");
		_checkConditionToken(condition,"statuscode","ENWORKORDERBYTITEM.STATUSCODE");
		_checkConditionToken(condition,"rpcode","ENWORKORDERBYTITEM.RPCODE");
		_checkConditionToken(condition,"datecounterinst","ENWORKORDERBYTITEM.DATECOUNTERINST");
		_checkConditionToken(condition,"datecountercheck","ENWORKORDERBYTITEM.DATECOUNTERCHECK");
		_checkConditionToken(condition,"countertype","ENWORKORDERBYTITEM.COUNTERTYPE");
		_checkConditionToken(condition,"classaccuracy","ENWORKORDERBYTITEM.CLASSACCURACY");
		_checkConditionToken(condition,"checkperiod","ENWORKORDERBYTITEM.CHECKPERIOD");
		_checkConditionToken(condition,"rpstatuscode","ENWORKORDERBYTITEM.RPSTATUSCODE");
		_checkConditionToken(condition,"phasity","ENWORKORDERBYTITEM.PHASITY");
		_checkConditionToken(condition,"datecheck","ENWORKORDERBYTITEM.DATECHECK");
		_checkConditionToken(condition,"checkperiod1","ENWORKORDERBYTITEM.CHECKPERIOD1");
		_checkConditionToken(condition,"placecounter","ENWORKORDERBYTITEM.PLACECOUNTER");
		_checkConditionToken(condition,"rpisworking","ENWORKORDERBYTITEM.RPISWORKING");
		_checkConditionToken(condition,"recordpointname","ENWORKORDERBYTITEM.RECORDPOINTNAME");
		_checkConditionToken(condition,"routebytname","ENWORKORDERBYTITEM.ROUTEBYTNAME");
		_checkConditionToken(condition,"routebytnumbergen","ENWORKORDERBYTITEM.ROUTEBYTNUMBERGEN");
		_checkConditionToken(condition,"commentgen","ENWORKORDERBYTITEM.COMMENTGEN");
		_checkConditionToken(condition,"dateadd","ENWORKORDERBYTITEM.DATEADD");
		_checkConditionToken(condition,"dateedit","ENWORKORDERBYTITEM.DATEEDIT");
		_checkConditionToken(condition,"useradd","ENWORKORDERBYTITEM.USERADD");
		_checkConditionToken(condition,"useredit","ENWORKORDERBYTITEM.USEREDIT");
		_checkConditionToken(condition,"modify_time","ENWORKORDERBYTITEM.MODIFY_TIME");
		_checkConditionToken(condition,"factcode","ENWORKORDERBYTITEM.FACTCODE");
		_checkConditionToken(condition,"countercapacity","ENWORKORDERBYTITEM.COUNTERCAPACITY");
		_checkConditionToken(condition,"countervoltagenominal","ENWORKORDERBYTITEM.COUNTERVOLTAGENOMINAL");
		_checkConditionToken(condition,"counterdateproduct","ENWORKORDERBYTITEM.COUNTERDATEPRODUCT");
		// relationship conditions
		_checkConditionToken(condition,"workorderbytref","WORKORDERBYTREFCODE");
		_checkConditionToken(condition,"workorderbytref.code","WORKORDERBYTREFCODE");
		_checkConditionToken(condition,"humenitemref","HUMENITEMREFCODE");
		_checkConditionToken(condition,"humenitemref.code","HUMENITEMREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"planitemref","PLANITEMREFCODE");
		_checkConditionToken(condition,"planitemref.code","PLANITEMREFCODE");
		_checkConditionToken(condition,"finworker","FINWORKERCODE");
		_checkConditionToken(condition,"finworker.code","FINWORKERCODE");
		_checkConditionToken(condition,"recordpointbytref","RECORDPOINTBYTREFCODE");
		_checkConditionToken(condition,"recordpointbytref.code","RECORDPOINTBYTREFCODE");
		_checkConditionToken(condition,"recordpointpromref","RECORDPOINTPROMREFCODE");
		_checkConditionToken(condition,"recordpointpromref.code","RECORDPOINTPROMREFCODE");
		_checkConditionToken(condition,"routebytref","ROUTEBYTREFCODE");
		_checkConditionToken(condition,"routebytref.code","ROUTEBYTREFCODE");
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"sccounterref","SCCOUNTERREFCODE");
		_checkConditionToken(condition,"sccounterref.code","SCCOUNTERREFCODE");
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

	/*private */ protected void _collectAutoIncrementFields(ENWorkOrderBytItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENWORKORDERBYTITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENWORKORDERBYTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENWORKORDERBYTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENWORKORDERBYTITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENWorkOrderBytItemDAO
