
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
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.brief.ENTechConditionsObjectsShort;
import com.ksoe.energynet.valueobject.lists.ENTechConditionsObjectsShortList;


/**
 * DAO Object for ENTechConditionsObjects;
 *
 */

public class ENTechConditionsObjectsDAOGen extends GenericDataMiner {

	public ENTechConditionsObjectsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTechConditionsObjectsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTechConditionsObjects inObject) throws PersistenceException {
		ENTechConditionsObjects obj = new ENTechConditionsObjects();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberGen == null && obj.numberGen == null){}
		else
			if(inObject.numberGen == null || obj.numberGen == null) return false;
			else
				if ( ! inObject.numberGen.equals(obj.numberGen)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.customer == null && obj.customer == null){}
		else
			if(inObject.customer == null || obj.customer == null) return false;
			else
				if ( ! inObject.customer.equals(obj.customer)){
					return false;
				}

		if(inObject.building == null && obj.building == null){}
		else
			if(inObject.building == null || obj.building == null) return false;
			else
				if ( ! inObject.building.equals(obj.building)){
					return false;
				}

		if(inObject.address == null && obj.address == null){}
		else
			if(inObject.address == null || obj.address == null) return false;
			else
				if ( ! inObject.address.equals(obj.address)){
					return false;
				}

		if(inObject.tyCurrentPower == null && obj.tyCurrentPower == null){}
		else
			if(inObject.tyCurrentPower == null || obj.tyCurrentPower == null) return false;
			else
				if ( ! inObject.tyCurrentPower.equals(obj.tyCurrentPower)){
					return false;
				}

		if(inObject.tyServicesPower == null && obj.tyServicesPower == null){}
		else
			if(inObject.tyServicesPower == null || obj.tyServicesPower == null) return false;
			else
				if ( ! inObject.tyServicesPower.equals(obj.tyServicesPower)){
					return false;
				}

		if(inObject.connectionPowerPlaces == null && obj.connectionPowerPlaces == null){}
		else
			if(inObject.connectionPowerPlaces == null || obj.connectionPowerPlaces == null) return false;
			else
				if ( ! inObject.connectionPowerPlaces.equals(obj.connectionPowerPlaces)){
					return false;
				}

		if(inObject.connectionPowerPlacesNum == null && obj.connectionPowerPlacesNum == null){}
		else
			if(inObject.connectionPowerPlacesNum == null || obj.connectionPowerPlacesNum == null) return false;
			else
				if ( ! inObject.connectionPowerPlacesNum.equals(obj.connectionPowerPlacesNum)){
					return false;
				}

		if(inObject.connectionPowerPoint == null && obj.connectionPowerPoint == null){}
		else
			if(inObject.connectionPowerPoint == null || obj.connectionPowerPoint == null) return false;
			else
				if ( ! inObject.connectionPowerPoint.equals(obj.connectionPowerPoint)){
					return false;
				}

		if(inObject.connectionPowerPointNum == null && obj.connectionPowerPointNum == null){}
		else
			if(inObject.connectionPowerPointNum == null || obj.connectionPowerPointNum == null) return false;
			else
				if ( ! inObject.connectionPowerPointNum.equals(obj.connectionPowerPointNum)){
					return false;
				}

		if(inObject.connectionSource == null && obj.connectionSource == null){}
		else
			if(inObject.connectionSource == null || obj.connectionSource == null) return false;
			else
				if ( ! inObject.connectionSource.equals(obj.connectionSource)){
					return false;
				}

		if(inObject.connectionSourceNum == null && obj.connectionSourceNum == null){}
		else
			if(inObject.connectionSourceNum == null || obj.connectionSourceNum == null) return false;
			else
				if ( ! inObject.connectionSourceNum.equals(obj.connectionSourceNum)){
					return false;
				}

		if(inObject.cat1CurrentPower == null && obj.cat1CurrentPower == null){}
		else
			if(inObject.cat1CurrentPower == null || obj.cat1CurrentPower == null) return false;
			else
				if ( ! inObject.cat1CurrentPower.equals(obj.cat1CurrentPower)){
					return false;
				}

		if(inObject.cat2CurrentPower == null && obj.cat2CurrentPower == null){}
		else
			if(inObject.cat2CurrentPower == null || obj.cat2CurrentPower == null) return false;
			else
				if ( ! inObject.cat2CurrentPower.equals(obj.cat2CurrentPower)){
					return false;
				}

		if(inObject.cat3CurrentPower == null && obj.cat3CurrentPower == null){}
		else
			if(inObject.cat3CurrentPower == null || obj.cat3CurrentPower == null) return false;
			else
				if ( ! inObject.cat3CurrentPower.equals(obj.cat3CurrentPower)){
					return false;
				}

		if(inObject.cat1ServicesPower == null && obj.cat1ServicesPower == null){}
		else
			if(inObject.cat1ServicesPower == null || obj.cat1ServicesPower == null) return false;
			else
				if ( ! inObject.cat1ServicesPower.equals(obj.cat1ServicesPower)){
					return false;
				}

		if(inObject.cat2ServicesPower == null && obj.cat2ServicesPower == null){}
		else
			if(inObject.cat2ServicesPower == null || obj.cat2ServicesPower == null) return false;
			else
				if ( ! inObject.cat2ServicesPower.equals(obj.cat2ServicesPower)){
					return false;
				}

		if(inObject.cat3ServicesPower == null && obj.cat3ServicesPower == null){}
		else
			if(inObject.cat3ServicesPower == null || obj.cat3ServicesPower == null) return false;
			else
				if ( ! inObject.cat3ServicesPower.equals(obj.cat3ServicesPower)){
					return false;
				}

		if(inObject.tyServicesPowerWaterHeating == null && obj.tyServicesPowerWaterHeating == null){}
		else
			if(inObject.tyServicesPowerWaterHeating == null || obj.tyServicesPowerWaterHeating == null) return false;
			else
				if ( ! inObject.tyServicesPowerWaterHeating.equals(obj.tyServicesPowerWaterHeating)){
					return false;
				}

		if(inObject.tyServicesPowerHeating == null && obj.tyServicesPowerHeating == null){}
		else
			if(inObject.tyServicesPowerHeating == null || obj.tyServicesPowerHeating == null) return false;
			else
				if ( ! inObject.tyServicesPowerHeating.equals(obj.tyServicesPowerHeating)){
					return false;
				}

		if(inObject.tyServicesPowerCooker == null && obj.tyServicesPowerCooker == null){}
		else
			if(inObject.tyServicesPowerCooker == null || obj.tyServicesPowerCooker == null) return false;
			else
				if ( ! inObject.tyServicesPowerCooker.equals(obj.tyServicesPowerCooker)){
					return false;
				}

		if (inObject.voltageCurrent != obj.voltageCurrent){
					return false;
				}

		if (inObject.voltageServices != obj.voltageServices){
					return false;
				}

		if(inObject.powerGeneration == null && obj.powerGeneration == null){}
		else
			if(inObject.powerGeneration == null || obj.powerGeneration == null) return false;
			else
				if ( ! inObject.powerGeneration.equals(obj.powerGeneration)){
					return false;
				}

		if (inObject.yearGen != obj.yearGen){
					return false;
				}

		if(inObject.performer == null && obj.performer == null){}
		else
			if(inObject.performer == null || obj.performer == null) return false;
			else
				if ( ! inObject.performer.equals(obj.performer)){
					return false;
				}

		if(inObject.performerPhone == null && obj.performerPhone == null){}
		else
			if(inObject.performerPhone == null || obj.performerPhone == null) return false;
			else
				if ( ! inObject.performerPhone.equals(obj.performerPhone)){
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

		if (inObject.securityZone != obj.securityZone){
					return false;
				}

		if(inObject.objectSecurityZone == null && obj.objectSecurityZone == null){}
		else
			if(inObject.objectSecurityZone == null || obj.objectSecurityZone == null) return false;
			else
				if ( ! inObject.objectSecurityZone.equals(obj.objectSecurityZone)){
					return false;
				}

		if (inObject.identNumber != obj.identNumber){
					return false;
				}

		if(inObject.dateChangeTU == null && obj.dateChangeTU == null){} else 
			if(inObject.dateChangeTU == null || obj.dateChangeTU == null) return false;
			else
				if (inObject.dateChangeTU.compareTo(obj.dateChangeTU) != 0){
					return false;
				}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.department.code != obj.department.code){
			return false;
		}
		if (inObject.categoryRef.code != obj.categoryRef.code){
			return false;
		}
		if (inObject.powerPointRef.code != obj.powerPointRef.code){
			return false;
		}
		return true;
	}

	public int add(ENTechConditionsObjects anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTechConditionsObjects anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENTECHCONDITIONSOBJCTS (CODE,NUMBERGEN,DATEGEN,CUSTOMER,BUILDING,ADDRESS,TYCURRENTPOWER,TYSERVICESPOWER,CONNECTIONPOWERPLACES,CONNECTIONPOWERPLACSNM,CONNECTIONPOWERPOINT,CONNECTIONPOWERPOINTNM,CONNECTIONSOURCE,CONNECTIONSOURCENUM,CAT1CURRENTPOWER,CAT2CURRENTPOWER,CAT3CURRENTPOWER,CAT1SERVICESPOWER,CAT2SERVICESPOWER,CAT3SERVICESPOWER,TYSERVICESPOWERWTRHTNG,TYSERVICESPOWERHEATING,TYSERVICESPOWERCOOKER,VOLTAGECURRENT,VOLTAGESERVICES,POWERGENERATION,YEARGEN,PERFORMER,PERFORMERPHONE,USERGEN,DATEEDIT,DOMAIN_INFO,MODIFY_TIME,SECURITYZONE,OBJECTSECURITYZONE,IDENTNUMBER,DATECHANGETU,ELEMENTCODE,DEPARTMENTCODE,CATEGORYREFCODE,POWERPOINTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberGen);
			if (anObject.dateGen == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
			}
			statement.setString(4, anObject.customer);
			statement.setString(5, anObject.building);
			statement.setString(6, anObject.address);
			if (anObject.tyCurrentPower != null) {
				anObject.tyCurrentPower = anObject.tyCurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.tyCurrentPower);
			if (anObject.tyServicesPower != null) {
				anObject.tyServicesPower = anObject.tyServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.tyServicesPower);
			statement.setString(9, anObject.connectionPowerPlaces);
			statement.setString(10, anObject.connectionPowerPlacesNum);
			statement.setString(11, anObject.connectionPowerPoint);
			statement.setString(12, anObject.connectionPowerPointNum);
			statement.setString(13, anObject.connectionSource);
			statement.setString(14, anObject.connectionSourceNum);
			if (anObject.cat1CurrentPower != null) {
				anObject.cat1CurrentPower = anObject.cat1CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.cat1CurrentPower);
			if (anObject.cat2CurrentPower != null) {
				anObject.cat2CurrentPower = anObject.cat2CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.cat2CurrentPower);
			if (anObject.cat3CurrentPower != null) {
				anObject.cat3CurrentPower = anObject.cat3CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17, anObject.cat3CurrentPower);
			if (anObject.cat1ServicesPower != null) {
				anObject.cat1ServicesPower = anObject.cat1ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.cat1ServicesPower);
			if (anObject.cat2ServicesPower != null) {
				anObject.cat2ServicesPower = anObject.cat2ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19, anObject.cat2ServicesPower);
			if (anObject.cat3ServicesPower != null) {
				anObject.cat3ServicesPower = anObject.cat3ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.cat3ServicesPower);
			if (anObject.tyServicesPowerWaterHeating != null) {
				anObject.tyServicesPowerWaterHeating = anObject.tyServicesPowerWaterHeating.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.tyServicesPowerWaterHeating);
			if (anObject.tyServicesPowerHeating != null) {
				anObject.tyServicesPowerHeating = anObject.tyServicesPowerHeating.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(22, anObject.tyServicesPowerHeating);
			if (anObject.tyServicesPowerCooker != null) {
				anObject.tyServicesPowerCooker = anObject.tyServicesPowerCooker.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23, anObject.tyServicesPowerCooker);
			if (anObject.voltageCurrent != Integer.MIN_VALUE ) {
				statement.setInt(24, anObject.voltageCurrent);
			} else {
				statement.setNull(24, java.sql.Types.INTEGER);
			}
			if (anObject.voltageServices != Integer.MIN_VALUE ) {
				statement.setInt(25, anObject.voltageServices);
			} else {
				statement.setNull(25, java.sql.Types.INTEGER);
			}
			if (anObject.powerGeneration != null) {
				anObject.powerGeneration = anObject.powerGeneration.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26, anObject.powerGeneration);
			if (anObject.yearGen != Integer.MIN_VALUE ) {
				statement.setInt(27, anObject.yearGen);
			} else {
				statement.setNull(27, java.sql.Types.INTEGER);
			}
			statement.setString(28, anObject.performer);
			statement.setString(29, anObject.performerPhone);
			statement.setString(30, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(31, null);
			} else {
				statement.setDate(31, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			statement.setString(32, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(33, null);
			} else {
				statement.setBigDecimal(33, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.securityZone != Integer.MIN_VALUE ) {
				statement.setInt(34, anObject.securityZone);
			} else {
				statement.setNull(34, java.sql.Types.INTEGER);
			}
			statement.setString(35, anObject.objectSecurityZone);
			if (anObject.identNumber != Integer.MIN_VALUE ) {
				statement.setInt(36, anObject.identNumber);
			} else {
				statement.setNull(36, java.sql.Types.INTEGER);
			}
			if (anObject.dateChangeTU == null) {
				statement.setDate(37, null);
			} else {
				statement.setDate(37, new java.sql.Date(anObject.dateChangeTU.getTime()));
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				statement.setInt(38,anObject.element.code);
			} else {
				statement.setNull(38,java.sql.Types.INTEGER);
			}
			if (anObject.department.code != Integer.MIN_VALUE){
				statement.setInt(39,anObject.department.code);
			} else {
				statement.setNull(39,java.sql.Types.INTEGER);
			}
			if (anObject.categoryRef.code != Integer.MIN_VALUE){
				statement.setInt(40,anObject.categoryRef.code);
			} else {
				statement.setNull(40,java.sql.Types.INTEGER);
			}
			if (anObject.powerPointRef.code != Integer.MIN_VALUE){
				statement.setInt(41,anObject.powerPointRef.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTechConditionsObjectsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTechConditionsObjects anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTechConditionsObjects anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTechConditionsObjects oldObject = new ENTechConditionsObjects();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTechConditionsObjects.modify_time_Field + "," + ENTechConditionsObjects.domain_info_Field+" FROM  ENTECHCONDITIONSOBJCTS WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CUSTOMER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYCURRENTPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSERVICESPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONPOWERPLACES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONPOWERPLACESNUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONPOWERPOINT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONPOWERPOINTNUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONSOURCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONSOURCENUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAT1CURRENTPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAT2CURRENTPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAT3CURRENTPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAT1SERVICESPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAT2SERVICESPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAT3SERVICESPOWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSERVICESPOWERWATERHEATING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSERVICESPOWERHEATING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYSERVICESPOWERCOOKER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOLTAGECURRENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOLTAGESERVICES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POWERGENERATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("YEARGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERFORMER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERFORMERPHONE") == 0) {
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
					if(fieldNameStr.compareTo("SECURITYZONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECTSECURITYZONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("IDENTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECHANGETU") == 0) {
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
					if(fieldNameStr.compareTo("CATEGORYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POWERPOINTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTECHCONDITIONSOBJCTS SET  NUMBERGEN = ? , DATEGEN = ? , CUSTOMER = ? , BUILDING = ? , ADDRESS = ? , TYCURRENTPOWER = ? , TYSERVICESPOWER = ? , CONNECTIONPOWERPLACES = ? , CONNECTIONPOWERPLACSNM = ? , CONNECTIONPOWERPOINT = ? , CONNECTIONPOWERPOINTNM = ? , CONNECTIONSOURCE = ? , CONNECTIONSOURCENUM = ? , CAT1CURRENTPOWER = ? , CAT2CURRENTPOWER = ? , CAT3CURRENTPOWER = ? , CAT1SERVICESPOWER = ? , CAT2SERVICESPOWER = ? , CAT3SERVICESPOWER = ? , TYSERVICESPOWERWTRHTNG = ? , TYSERVICESPOWERHEATING = ? , TYSERVICESPOWERCOOKER = ? , VOLTAGECURRENT = ? , VOLTAGESERVICES = ? , POWERGENERATION = ? , YEARGEN = ? , PERFORMER = ? , PERFORMERPHONE = ? , USERGEN = ? , DATEEDIT = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , SECURITYZONE = ? , OBJECTSECURITYZONE = ? , IDENTNUMBER = ? , DATECHANGETU = ? , ELEMENTCODE = ? , DEPARTMENTCODE = ? , CATEGORYREFCODE = ? , POWERPOINTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTECHCONDITIONSOBJECTS SET ";
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
					statement.setString(1, anObject.numberGen);
					if (anObject.dateGen == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateGen.getTime()));
					}
					statement.setString(3, anObject.customer);
					statement.setString(4, anObject.building);
					statement.setString(5, anObject.address);
					if (anObject.tyCurrentPower != null) {
						anObject.tyCurrentPower = anObject.tyCurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.tyCurrentPower);
					if (anObject.tyServicesPower != null) {
						anObject.tyServicesPower = anObject.tyServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.tyServicesPower);
					statement.setString(8, anObject.connectionPowerPlaces);
					statement.setString(9, anObject.connectionPowerPlacesNum);
					statement.setString(10, anObject.connectionPowerPoint);
					statement.setString(11, anObject.connectionPowerPointNum);
					statement.setString(12, anObject.connectionSource);
					statement.setString(13, anObject.connectionSourceNum);
					if (anObject.cat1CurrentPower != null) {
						anObject.cat1CurrentPower = anObject.cat1CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.cat1CurrentPower);
					if (anObject.cat2CurrentPower != null) {
						anObject.cat2CurrentPower = anObject.cat2CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.cat2CurrentPower);
					if (anObject.cat3CurrentPower != null) {
						anObject.cat3CurrentPower = anObject.cat3CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16, anObject.cat3CurrentPower);
					if (anObject.cat1ServicesPower != null) {
						anObject.cat1ServicesPower = anObject.cat1ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.cat1ServicesPower);
					if (anObject.cat2ServicesPower != null) {
						anObject.cat2ServicesPower = anObject.cat2ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18, anObject.cat2ServicesPower);
					if (anObject.cat3ServicesPower != null) {
						anObject.cat3ServicesPower = anObject.cat3ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.cat3ServicesPower);
					if (anObject.tyServicesPowerWaterHeating != null) {
						anObject.tyServicesPowerWaterHeating = anObject.tyServicesPowerWaterHeating.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.tyServicesPowerWaterHeating);
					if (anObject.tyServicesPowerHeating != null) {
						anObject.tyServicesPowerHeating = anObject.tyServicesPowerHeating.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(21, anObject.tyServicesPowerHeating);
					if (anObject.tyServicesPowerCooker != null) {
						anObject.tyServicesPowerCooker = anObject.tyServicesPowerCooker.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22, anObject.tyServicesPowerCooker);
					if (anObject.voltageCurrent != Integer.MIN_VALUE) {
						statement.setInt(23, anObject.voltageCurrent);
					} else {
						statement.setNull(23, java.sql.Types.INTEGER);
					}
					if (anObject.voltageServices != Integer.MIN_VALUE) {
						statement.setInt(24, anObject.voltageServices);
					} else {
						statement.setNull(24, java.sql.Types.INTEGER);
					}
					if (anObject.powerGeneration != null) {
						anObject.powerGeneration = anObject.powerGeneration.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25, anObject.powerGeneration);
					if (anObject.yearGen != Integer.MIN_VALUE) {
						statement.setInt(26, anObject.yearGen);
					} else {
						statement.setNull(26, java.sql.Types.INTEGER);
					}
					statement.setString(27, anObject.performer);
					statement.setString(28, anObject.performerPhone);
					statement.setString(29, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(30, null);
					} else {
						statement.setDate(30, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					statement.setString(31, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(32, null);
					} else {
						statement.setBigDecimal(32, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.securityZone != Integer.MIN_VALUE) {
						statement.setInt(33, anObject.securityZone);
					} else {
						statement.setNull(33, java.sql.Types.INTEGER);
					}
					statement.setString(34, anObject.objectSecurityZone);
					if (anObject.identNumber != Integer.MIN_VALUE) {
						statement.setInt(35, anObject.identNumber);
					} else {
						statement.setNull(35, java.sql.Types.INTEGER);
					}
					if (anObject.dateChangeTU == null) {
						statement.setDate(36, null);
					} else {
						statement.setDate(36, new java.sql.Date(anObject.dateChangeTU.getTime()));
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(37, anObject.element.code);
					} else {
						statement.setNull(37, java.sql.Types.INTEGER);
					}
					if (anObject.department.code != Integer.MIN_VALUE) {
						statement.setInt(38, anObject.department.code);
					} else {
						statement.setNull(38, java.sql.Types.INTEGER);
					}
					if (anObject.categoryRef.code != Integer.MIN_VALUE) {
						statement.setInt(39, anObject.categoryRef.code);
					} else {
						statement.setNull(39, java.sql.Types.INTEGER);
					}
					if (anObject.powerPointRef.code != Integer.MIN_VALUE) {
						statement.setInt(40, anObject.powerPointRef.code);
					} else {
						statement.setNull(40, java.sql.Types.INTEGER);
					}
					statement.setInt(41, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberGen);
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
						if("CUSTOMER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.customer);
							continue;
						}
						if("BUILDING".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.building);
							continue;
						}
						if("ADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.address);
							continue;
						}
						if("TYCURRENTPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyCurrentPower != null) {
								anObject.tyCurrentPower = anObject.tyCurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.tyCurrentPower);
							continue;
						}
						if("TYSERVICESPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyServicesPower != null) {
								anObject.tyServicesPower = anObject.tyServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.tyServicesPower);
							continue;
						}
						if("CONNECTIONPOWERPLACES".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionPowerPlaces);
							continue;
						}
						if("CONNECTIONPOWERPLACESNUM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionPowerPlacesNum);
							continue;
						}
						if("CONNECTIONPOWERPOINT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionPowerPoint);
							continue;
						}
						if("CONNECTIONPOWERPOINTNUM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionPowerPointNum);
							continue;
						}
						if("CONNECTIONSOURCE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionSource);
							continue;
						}
						if("CONNECTIONSOURCENUM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionSourceNum);
							continue;
						}
						if("CAT1CURRENTPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cat1CurrentPower != null) {
								anObject.cat1CurrentPower = anObject.cat1CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cat1CurrentPower);
							continue;
						}
						if("CAT2CURRENTPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cat2CurrentPower != null) {
								anObject.cat2CurrentPower = anObject.cat2CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cat2CurrentPower);
							continue;
						}
						if("CAT3CURRENTPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cat3CurrentPower != null) {
								anObject.cat3CurrentPower = anObject.cat3CurrentPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cat3CurrentPower);
							continue;
						}
						if("CAT1SERVICESPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cat1ServicesPower != null) {
								anObject.cat1ServicesPower = anObject.cat1ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cat1ServicesPower);
							continue;
						}
						if("CAT2SERVICESPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cat2ServicesPower != null) {
								anObject.cat2ServicesPower = anObject.cat2ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cat2ServicesPower);
							continue;
						}
						if("CAT3SERVICESPOWER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cat3ServicesPower != null) {
								anObject.cat3ServicesPower = anObject.cat3ServicesPower.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cat3ServicesPower);
							continue;
						}
						if("TYSERVICESPOWERWATERHEATING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyServicesPowerWaterHeating != null) {
								anObject.tyServicesPowerWaterHeating = anObject.tyServicesPowerWaterHeating.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.tyServicesPowerWaterHeating);
							continue;
						}
						if("TYSERVICESPOWERHEATING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyServicesPowerHeating != null) {
								anObject.tyServicesPowerHeating = anObject.tyServicesPowerHeating.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.tyServicesPowerHeating);
							continue;
						}
						if("TYSERVICESPOWERCOOKER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tyServicesPowerCooker != null) {
								anObject.tyServicesPowerCooker = anObject.tyServicesPowerCooker.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.tyServicesPowerCooker);
							continue;
						}
						if("VOLTAGECURRENT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.voltageCurrent);
							continue;
						}
						if("VOLTAGESERVICES".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.voltageServices);
							continue;
						}
						if("POWERGENERATION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.powerGeneration != null) {
								anObject.powerGeneration = anObject.powerGeneration.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.powerGeneration);
							continue;
						}
						if("YEARGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.yearGen);
							continue;
						}
						if("PERFORMER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.performer);
							continue;
						}
						if("PERFORMERPHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.performerPhone);
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
						if("SECURITYZONE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.securityZone);
							continue;
						}
						if("OBJECTSECURITYZONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.objectSecurityZone);
							continue;
						}
						if("IDENTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.identNumber);
							continue;
						}
						if("DATECHANGETU".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateChangeTU == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateChangeTU.getTime()));
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
						if("DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.department.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.department.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CATEGORYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.categoryRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.categoryRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("POWERPOINTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.powerPointRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.powerPointRef.code);
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

	} // end of save(ENTechConditionsObjects anObject,String[] anAttributes)


	public ENTechConditionsObjectsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTechConditionsObjects filterObject = new ENTechConditionsObjects();
		Vector<ENTechConditionsObjectsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTechConditionsObjectsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTechConditionsObjects filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customer, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.building, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.address, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyCurrentPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyServicesPower, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionPowerPlaces, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionPowerPlacesNum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionPowerPoint, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionPowerPointNum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionSource, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionSourceNum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cat1CurrentPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cat2CurrentPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cat3CurrentPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cat1ServicesPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cat2ServicesPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cat3ServicesPower, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyServicesPowerWaterHeating, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyServicesPowerHeating, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.tyServicesPowerCooker, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.voltageCurrent, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.voltageServices, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.powerGeneration, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.yearGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.performer, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.performerPhone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.securityZone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.objectSecurityZone, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.identNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateChangeTU, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.department.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.categoryRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.powerPointRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTechConditionsObjectsFilter filter) {
		String out = buildCondition((ENTechConditionsObjects)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTechConditionsObjects filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTechConditionsObjects.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberGen, ENTechConditionsObjects.numberGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENTechConditionsObjects.dateGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customer, ENTechConditionsObjects.customer_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.building, ENTechConditionsObjects.building_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.address, ENTechConditionsObjects.address_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyCurrentPower, ENTechConditionsObjects.tyCurrentPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyServicesPower, ENTechConditionsObjects.tyServicesPower_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionPowerPlaces, ENTechConditionsObjects.connectionPowerPlaces_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionPowerPlacesNum, ENTechConditionsObjects.connectionPowerPlacesNum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionPowerPoint, ENTechConditionsObjects.connectionPowerPoint_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionPowerPointNum, ENTechConditionsObjects.connectionPowerPointNum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionSource, ENTechConditionsObjects.connectionSource_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionSourceNum, ENTechConditionsObjects.connectionSourceNum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cat1CurrentPower, ENTechConditionsObjects.cat1CurrentPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cat2CurrentPower, ENTechConditionsObjects.cat2CurrentPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cat3CurrentPower, ENTechConditionsObjects.cat3CurrentPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cat1ServicesPower, ENTechConditionsObjects.cat1ServicesPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cat2ServicesPower, ENTechConditionsObjects.cat2ServicesPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cat3ServicesPower, ENTechConditionsObjects.cat3ServicesPower_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyServicesPowerWaterHeating, ENTechConditionsObjects.tyServicesPowerWaterHeating_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyServicesPowerHeating, ENTechConditionsObjects.tyServicesPowerHeating_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.tyServicesPowerCooker, ENTechConditionsObjects.tyServicesPowerCooker_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.voltageCurrent, ENTechConditionsObjects.voltageCurrent_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.voltageServices, ENTechConditionsObjects.voltageServices_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.powerGeneration, ENTechConditionsObjects.powerGeneration_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.yearGen, ENTechConditionsObjects.yearGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.performer, ENTechConditionsObjects.performer_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.performerPhone, ENTechConditionsObjects.performerPhone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENTechConditionsObjects.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENTechConditionsObjects.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENTechConditionsObjects.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTechConditionsObjects.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.securityZone, ENTechConditionsObjects.securityZone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectSecurityZone, ENTechConditionsObjects.objectSecurityZone_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.identNumber, ENTechConditionsObjects.identNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateChangeTU, ENTechConditionsObjects.dateChangeTU_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENTechConditionsObjects.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.department.code, ENTechConditionsObjects.department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.categoryRef.code, ENTechConditionsObjects.categoryRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.powerPointRef.code, ENTechConditionsObjects.powerPointRef_QFielld, out);
		}
		return out;
	}

	public ENTechConditionsObjectsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTechConditionsObjectsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTechConditionsObjectsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTechConditionsObjectsShortList getFilteredList(ENTechConditionsObjects filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjects aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjects aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTechConditionsObjectsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjectsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjectsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTechConditionsObjectsShortList getScrollableFilteredList(ENTechConditionsObjects aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTechConditionsObjectsShortList result = new ENTechConditionsObjectsShortList();
		ENTechConditionsObjectsShort anObject;
		result.list = new Vector<ENTechConditionsObjectsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHCONDITIONSOBJCTS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTECHCONDITIONSOBJCTS.CODE"+
			",ENTECHCONDITIONSOBJCTS.NUMBERGEN"+
			",ENTECHCONDITIONSOBJCTS.DATEGEN"+
			",ENTECHCONDITIONSOBJCTS.CUSTOMER"+
			",ENTECHCONDITIONSOBJCTS.BUILDING"+
			",ENTECHCONDITIONSOBJCTS.ADDRESS"+
			",ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE"+
			",ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM"+
			",ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING"+
			",ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER"+
			",ENTECHCONDITIONSOBJCTS.POWERGENERATION"+
			",ENTECHCONDITIONSOBJCTS.YEARGEN"+
			",ENTECHCONDITIONSOBJCTS.PERFORMER"+
			",ENTECHCONDITIONSOBJCTS.PERFORMERPHONE"+
			",ENTECHCONDITIONSOBJCTS.USERGEN"+
			",ENTECHCONDITIONSOBJCTS.DATEEDIT"+
			",ENTECHCONDITIONSOBJCTS.SECURITYZONE"+
			",ENTECHCONDITIONSOBJCTS.OBJECTSECURITYZONE"+
			",ENTECHCONDITIONSOBJCTS.IDENTNUMBER"+
			",ENTECHCONDITIONSOBJCTS.DATECHANGETU"+
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
			", ENPOWERRELIABILITYCTGR.CODE " +
			", ENPOWERRELIABILITYCTGR.NAME " +
			", ENPOWERRELIABILITYCTGR.COEF " +
			", ENCONNECTIONPOWERPOINT.CODE " +
			", ENCONNECTIONPOWERPOINT.NAME " +
			", ENCONNECTIONPOWERPOINT.COEF " +
		" FROM ENTECHCONDITIONSOBJCTS " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENTECHCONDITIONSOBJCTS.ELEMENTCODE "+
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENTECHCONDITIONSOBJCTS.DEPARTMENTCODE "+
			" LEFT JOIN ENPOWERRELIABILITYCTGR on ENPOWERRELIABILITYCTGR.CODE = ENTECHCONDITIONSOBJCTS.CATEGORYREFCODE "+
			" LEFT JOIN ENCONNECTIONPOWERPOINT on ENCONNECTIONPOWERPOINT.CODE = ENTECHCONDITIONSOBJCTS.POWERPOINTREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsObjects.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENTechConditionsObjectsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.customer = set.getString(4);
				anObject.building = set.getString(5);
				anObject.address = set.getString(6);
				anObject.tyCurrentPower = set.getBigDecimal(7);
				if(anObject.tyCurrentPower != null) {
					anObject.tyCurrentPower = anObject.tyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPower = set.getBigDecimal(8);
				if(anObject.tyServicesPower != null) {
					anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.connectionPowerPlaces = set.getString(9);
				anObject.connectionPowerPlacesNum = set.getString(10);
				anObject.connectionPowerPoint = set.getString(11);
				anObject.connectionPowerPointNum = set.getString(12);
				anObject.connectionSource = set.getString(13);
				anObject.connectionSourceNum = set.getString(14);
				anObject.cat1CurrentPower = set.getBigDecimal(15);
				if(anObject.cat1CurrentPower != null) {
					anObject.cat1CurrentPower = anObject.cat1CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat2CurrentPower = set.getBigDecimal(16);
				if(anObject.cat2CurrentPower != null) {
					anObject.cat2CurrentPower = anObject.cat2CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat3CurrentPower = set.getBigDecimal(17);
				if(anObject.cat3CurrentPower != null) {
					anObject.cat3CurrentPower = anObject.cat3CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat1ServicesPower = set.getBigDecimal(18);
				if(anObject.cat1ServicesPower != null) {
					anObject.cat1ServicesPower = anObject.cat1ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat2ServicesPower = set.getBigDecimal(19);
				if(anObject.cat2ServicesPower != null) {
					anObject.cat2ServicesPower = anObject.cat2ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat3ServicesPower = set.getBigDecimal(20);
				if(anObject.cat3ServicesPower != null) {
					anObject.cat3ServicesPower = anObject.cat3ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerWaterHeating = set.getBigDecimal(21);
				if(anObject.tyServicesPowerWaterHeating != null) {
					anObject.tyServicesPowerWaterHeating = anObject.tyServicesPowerWaterHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerHeating = set.getBigDecimal(22);
				if(anObject.tyServicesPowerHeating != null) {
					anObject.tyServicesPowerHeating = anObject.tyServicesPowerHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerCooker = set.getBigDecimal(23);
				if(anObject.tyServicesPowerCooker != null) {
					anObject.tyServicesPowerCooker = anObject.tyServicesPowerCooker.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.powerGeneration = set.getBigDecimal(24);
				if(anObject.powerGeneration != null) {
					anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.yearGen = set.getInt(25);
				if ( set.wasNull() ) {
					anObject.yearGen = Integer.MIN_VALUE;
				}
				anObject.performer = set.getString(26);
				anObject.performerPhone = set.getString(27);
				anObject.userGen = set.getString(28);
				anObject.dateEdit = set.getDate(29);
				anObject.securityZone = set.getInt(30);
				if ( set.wasNull() ) {
					anObject.securityZone = Integer.MIN_VALUE;
				}
				anObject.objectSecurityZone = set.getString(31);
				anObject.identNumber = set.getInt(32);
				if ( set.wasNull() ) {
					anObject.identNumber = Integer.MIN_VALUE;
				}
				anObject.dateChangeTU = set.getDate(33);

				anObject.elementCode = set.getInt(34);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.departmentCode = set.getInt(35);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(36);
				anObject.departmentDateStart = set.getDate(37);
				anObject.departmentDateFinal = set.getDate(38);
				anObject.departmentRenCode = set.getInt(39);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(40);
				anObject.departmentKau_table_id_1884 = set.getInt(41);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(42);
				anObject.departmentName_1884 = set.getString(43);
				anObject.departmentHrmorganizationid = set.getString(44);
				anObject.categoryRefCode = set.getInt(45);
				if(set.wasNull()) {
					anObject.categoryRefCode = Integer.MIN_VALUE;
				}
				anObject.categoryRefName = set.getString(46);
				anObject.categoryRefCoef = set.getBigDecimal(47);
				if(anObject.categoryRefCoef != null) {
					anObject.categoryRefCoef = anObject.categoryRefCoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.powerPointRefCode = set.getInt(48);
				if(set.wasNull()) {
					anObject.powerPointRefCode = Integer.MIN_VALUE;
				}
				anObject.powerPointRefName = set.getString(49);
				anObject.powerPointRefCoef = set.getBigDecimal(50);
				if(anObject.powerPointRefCoef != null) {
					anObject.powerPointRefCoef = anObject.powerPointRefCoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENTechConditionsObjectsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTechConditionsObjectsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTechConditionsObjects aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTECHCONDITIONSOBJCTS.CODE FROM ENTECHCONDITIONSOBJCTS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTECHCONDITIONSOBJCTS.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsObjects.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENTECHCONDITIONSOBJCTS.DOMAIN_INFO IS NOT NULL) ";
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


	public ENTechConditionsObjects getObject(int uid) throws PersistenceException {
		ENTechConditionsObjects result = new ENTechConditionsObjects();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENTechConditionsObjects anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENTechConditionsObjects anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENTechConditionsObjects anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENTechConditionsObjects.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENTECHCONDITIONSOBJCTS.CODE, ENTECHCONDITIONSOBJCTS.NUMBERGEN, ENTECHCONDITIONSOBJCTS.DATEGEN, ENTECHCONDITIONSOBJCTS.CUSTOMER, ENTECHCONDITIONSOBJCTS.BUILDING, ENTECHCONDITIONSOBJCTS.ADDRESS, ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER, ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER, ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES, ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM, ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT, ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM, ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE, ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM, ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER, ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER, ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER, ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER, ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER, ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER, ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG, ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING, ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER, ENTECHCONDITIONSOBJCTS.VOLTAGECURRENT, ENTECHCONDITIONSOBJCTS.VOLTAGESERVICES, ENTECHCONDITIONSOBJCTS.POWERGENERATION, ENTECHCONDITIONSOBJCTS.YEARGEN, ENTECHCONDITIONSOBJCTS.PERFORMER, ENTECHCONDITIONSOBJCTS.PERFORMERPHONE, ENTECHCONDITIONSOBJCTS.USERGEN, ENTECHCONDITIONSOBJCTS.DATEEDIT, ENTECHCONDITIONSOBJCTS.DOMAIN_INFO, ENTECHCONDITIONSOBJCTS.MODIFY_TIME, ENTECHCONDITIONSOBJCTS.SECURITYZONE, ENTECHCONDITIONSOBJCTS.OBJECTSECURITYZONE, ENTECHCONDITIONSOBJCTS.IDENTNUMBER, ENTECHCONDITIONSOBJCTS.DATECHANGETU, ENTECHCONDITIONSOBJCTS.ELEMENTCODE, ENTECHCONDITIONSOBJCTS.DEPARTMENTCODE, ENTECHCONDITIONSOBJCTS.CATEGORYREFCODE, ENTECHCONDITIONSOBJCTS.POWERPOINTREFCODE "
			+" FROM ENTECHCONDITIONSOBJCTS WHERE ENTECHCONDITIONSOBJCTS.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());
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
			
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.customer = set.getString(4);
				anObject.building = set.getString(5);
				anObject.address = set.getString(6);
				anObject.tyCurrentPower = set.getBigDecimal(7);
				if(anObject.tyCurrentPower != null) {
					anObject.tyCurrentPower = anObject.tyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPower = set.getBigDecimal(8);
				if(anObject.tyServicesPower != null) {
					anObject.tyServicesPower = anObject.tyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.connectionPowerPlaces = set.getString(9);
				anObject.connectionPowerPlacesNum = set.getString(10);
				anObject.connectionPowerPoint = set.getString(11);
				anObject.connectionPowerPointNum = set.getString(12);
				anObject.connectionSource = set.getString(13);
				anObject.connectionSourceNum = set.getString(14);
				anObject.cat1CurrentPower = set.getBigDecimal(15);
				if(anObject.cat1CurrentPower != null) {
					anObject.cat1CurrentPower = anObject.cat1CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat2CurrentPower = set.getBigDecimal(16);
				if(anObject.cat2CurrentPower != null) {
					anObject.cat2CurrentPower = anObject.cat2CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat3CurrentPower = set.getBigDecimal(17);
				if(anObject.cat3CurrentPower != null) {
					anObject.cat3CurrentPower = anObject.cat3CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat1ServicesPower = set.getBigDecimal(18);
				if(anObject.cat1ServicesPower != null) {
					anObject.cat1ServicesPower = anObject.cat1ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat2ServicesPower = set.getBigDecimal(19);
				if(anObject.cat2ServicesPower != null) {
					anObject.cat2ServicesPower = anObject.cat2ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cat3ServicesPower = set.getBigDecimal(20);
				if(anObject.cat3ServicesPower != null) {
					anObject.cat3ServicesPower = anObject.cat3ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerWaterHeating = set.getBigDecimal(21);
				if(anObject.tyServicesPowerWaterHeating != null) {
					anObject.tyServicesPowerWaterHeating = anObject.tyServicesPowerWaterHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerHeating = set.getBigDecimal(22);
				if(anObject.tyServicesPowerHeating != null) {
					anObject.tyServicesPowerHeating = anObject.tyServicesPowerHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tyServicesPowerCooker = set.getBigDecimal(23);
				if(anObject.tyServicesPowerCooker != null) {
					anObject.tyServicesPowerCooker = anObject.tyServicesPowerCooker.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.voltageCurrent = set.getInt(24);
				if (set.wasNull()) {
					anObject.voltageCurrent = Integer.MIN_VALUE;
				}
				anObject.voltageServices = set.getInt(25);
				if (set.wasNull()) {
					anObject.voltageServices = Integer.MIN_VALUE;
				}
				anObject.powerGeneration = set.getBigDecimal(26);
				if(anObject.powerGeneration != null) {
					anObject.powerGeneration = anObject.powerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.yearGen = set.getInt(27);
				if (set.wasNull()) {
					anObject.yearGen = Integer.MIN_VALUE;
				}
				anObject.performer = set.getString(28);
				anObject.performerPhone = set.getString(29);
				anObject.userGen = set.getString(30);
				anObject.dateEdit = set.getDate(31);
				anObject.domain_info = set.getString(32);
				anObject.modify_time = set.getLong(33);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.securityZone = set.getInt(34);
				if (set.wasNull()) {
					anObject.securityZone = Integer.MIN_VALUE;
				}
				anObject.objectSecurityZone = set.getString(35);
				anObject.identNumber = set.getInt(36);
				if (set.wasNull()) {
					anObject.identNumber = Integer.MIN_VALUE;
				}
				anObject.dateChangeTU = set.getDate(37);
				anObject.element.code = set.getInt(38);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.department.code = set.getInt(39);
				if (set.wasNull()) {
					anObject.department.code = Integer.MIN_VALUE;
				}
				anObject.categoryRef.code = set.getInt(40);
				if (set.wasNull()) {
					anObject.categoryRef.code = Integer.MIN_VALUE;
				}
				anObject.powerPointRef.code = set.getInt(41);
				if (set.wasNull()) {
					anObject.powerPointRef.code = Integer.MIN_VALUE;
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
				}
				if(anObject.department.code != Integer.MIN_VALUE) {
					anObject.setDepartment(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
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


	public com.ksoe.energynet.valueobject.references.ENTechConditionsObjectsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTechConditionsObjectsRef ref = new com.ksoe.energynet.valueobject.references.ENTechConditionsObjectsRef();
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

		selectStr = "DELETE FROM  ENTECHCONDITIONSOBJCTS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTechConditionsObjects object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTechConditionsObjects.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsObjects.remove%} access denied");
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
	
	public long count(ENTechConditionsObjectsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTechConditionsObjectsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTechConditionsObjectsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTECHCONDITIONSOBJCTS", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsObjects.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENTECHCONDITIONSOBJCTS.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENTECHCONDITIONSOBJCTS WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTechConditionsObjectsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTechConditionsObjectsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTECHCONDITIONSOBJCTS");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENTechConditionsObjects.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENTECHCONDITIONSOBJCTS.DOMAIN_INFO IS NOT NULL) ";
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechConditionsObjects.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTechConditionsObjects.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENTECHCONDITIONSOBJCTS.CODE FROM  ENTECHCONDITIONSOBJCTS WHERE  ENTECHCONDITIONSOBJCTS.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTECHCONDITIONSOBJCTS",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENTECHCONDITIONSOBJCTS.CODE");
		_checkConditionToken(condition,"numbergen","ENTECHCONDITIONSOBJCTS.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENTECHCONDITIONSOBJCTS.DATEGEN");
		_checkConditionToken(condition,"customer","ENTECHCONDITIONSOBJCTS.CUSTOMER");
		_checkConditionToken(condition,"building","ENTECHCONDITIONSOBJCTS.BUILDING");
		_checkConditionToken(condition,"address","ENTECHCONDITIONSOBJCTS.ADDRESS");
		_checkConditionToken(condition,"tycurrentpower","ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER");
		_checkConditionToken(condition,"tyservicespower","ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER");
		_checkConditionToken(condition,"connectionpowerplaces","ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES");
		_checkConditionToken(condition,"connectionpowerplacesnum","ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM");
		_checkConditionToken(condition,"connectionpowerpoint","ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT");
		_checkConditionToken(condition,"connectionpowerpointnum","ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM");
		_checkConditionToken(condition,"connectionsource","ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE");
		_checkConditionToken(condition,"connectionsourcenum","ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM");
		_checkConditionToken(condition,"cat1currentpower","ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER");
		_checkConditionToken(condition,"cat2currentpower","ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER");
		_checkConditionToken(condition,"cat3currentpower","ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER");
		_checkConditionToken(condition,"cat1servicespower","ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER");
		_checkConditionToken(condition,"cat2servicespower","ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER");
		_checkConditionToken(condition,"cat3servicespower","ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER");
		_checkConditionToken(condition,"tyservicespowerwaterheating","ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG");
		_checkConditionToken(condition,"tyservicespowerheating","ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING");
		_checkConditionToken(condition,"tyservicespowercooker","ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER");
		_checkConditionToken(condition,"voltagecurrent","ENTECHCONDITIONSOBJCTS.VOLTAGECURRENT");
		_checkConditionToken(condition,"voltageservices","ENTECHCONDITIONSOBJCTS.VOLTAGESERVICES");
		_checkConditionToken(condition,"powergeneration","ENTECHCONDITIONSOBJCTS.POWERGENERATION");
		_checkConditionToken(condition,"yeargen","ENTECHCONDITIONSOBJCTS.YEARGEN");
		_checkConditionToken(condition,"performer","ENTECHCONDITIONSOBJCTS.PERFORMER");
		_checkConditionToken(condition,"performerphone","ENTECHCONDITIONSOBJCTS.PERFORMERPHONE");
		_checkConditionToken(condition,"usergen","ENTECHCONDITIONSOBJCTS.USERGEN");
		_checkConditionToken(condition,"dateedit","ENTECHCONDITIONSOBJCTS.DATEEDIT");
		_checkConditionToken(condition,"domain_info","ENTECHCONDITIONSOBJCTS.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENTECHCONDITIONSOBJCTS.MODIFY_TIME");
		_checkConditionToken(condition,"securityzone","ENTECHCONDITIONSOBJCTS.SECURITYZONE");
		_checkConditionToken(condition,"objectsecurityzone","ENTECHCONDITIONSOBJCTS.OBJECTSECURITYZONE");
		_checkConditionToken(condition,"identnumber","ENTECHCONDITIONSOBJCTS.IDENTNUMBER");
		_checkConditionToken(condition,"datechangetu","ENTECHCONDITIONSOBJCTS.DATECHANGETU");
		// relationship conditions
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"department","DEPARTMENTCODE");
		_checkConditionToken(condition,"department.code","DEPARTMENTCODE");
		_checkConditionToken(condition,"categoryref","CATEGORYREFCODE");
		_checkConditionToken(condition,"categoryref.code","CATEGORYREFCODE");
		_checkConditionToken(condition,"powerpointref","POWERPOINTREFCODE");
		_checkConditionToken(condition,"powerpointref.code","POWERPOINTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENTechConditionsObjects anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTECHCONDITIONSOBJCTS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTECHCONDITIONSOBJCTS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTECHCONDITIONSOBJCTS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTECHCONDITIONSOBJCTS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTechConditionsObjectsDAO
