
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
import com.ksoe.energynet.valueobject.ENBonusListItem;
import com.ksoe.energynet.valueobject.filter.ENBonusListItemFilter;
import com.ksoe.energynet.valueobject.brief.ENBonusListItemShort;
import com.ksoe.energynet.valueobject.lists.ENBonusListItemShortList;


/**
 * DAO Object for ENBonusListItem;
 *
 */

public class ENBonusListItemDAOGen extends GenericDataMiner {

	public ENBonusListItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBonusListItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBonusListItem inObject) throws PersistenceException {
		ENBonusListItem obj = new ENBonusListItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.podrId == null && obj.podrId == null){}
		else
			if(inObject.podrId == null || obj.podrId == null) return false;
			else
				if ( ! inObject.podrId.equals(obj.podrId)){
					return false;
				}

		if(inObject.podrName == null && obj.podrName == null){}
		else
			if(inObject.podrName == null || obj.podrName == null) return false;
			else
				if ( ! inObject.podrName.equals(obj.podrName)){
					return false;
				}

		if(inObject.fio == null && obj.fio == null){}
		else
			if(inObject.fio == null || obj.fio == null) return false;
			else
				if ( ! inObject.fio.equals(obj.fio)){
					return false;
				}

		if(inObject.tabNumber == null && obj.tabNumber == null){}
		else
			if(inObject.tabNumber == null || obj.tabNumber == null) return false;
			else
				if ( ! inObject.tabNumber.equals(obj.tabNumber)){
					return false;
				}

		if(inObject.positionId == null && obj.positionId == null){}
		else
			if(inObject.positionId == null || obj.positionId == null) return false;
			else
				if ( ! inObject.positionId.equals(obj.positionId)){
					return false;
				}

		if(inObject.positionName == null && obj.positionName == null){}
		else
			if(inObject.positionName == null || obj.positionName == null) return false;
			else
				if ( ! inObject.positionName.equals(obj.positionName)){
					return false;
				}

		if(inObject.fundWorkTime == null && obj.fundWorkTime == null){}
		else
			if(inObject.fundWorkTime == null || obj.fundWorkTime == null) return false;
			else
				if ( ! inObject.fundWorkTime.equals(obj.fundWorkTime)){
					return false;
				}

		if(inObject.workTimeFact == null && obj.workTimeFact == null){}
		else
			if(inObject.workTimeFact == null || obj.workTimeFact == null) return false;
			else
				if ( ! inObject.workTimeFact.equals(obj.workTimeFact)){
					return false;
				}

		if(inObject.hoursWorkedWithStaff == null && obj.hoursWorkedWithStaff == null){}
		else
			if(inObject.hoursWorkedWithStaff == null || obj.hoursWorkedWithStaff == null) return false;
			else
				if ( ! inObject.hoursWorkedWithStaff.equals(obj.hoursWorkedWithStaff)){
					return false;
				}

		if(inObject.timeDelivery == null && obj.timeDelivery == null){}
		else
			if(inObject.timeDelivery == null || obj.timeDelivery == null) return false;
			else
				if ( ! inObject.timeDelivery.equals(obj.timeDelivery)){
					return false;
				}

		if(inObject.hoursWorkedPlan == null && obj.hoursWorkedPlan == null){}
		else
			if(inObject.hoursWorkedPlan == null || obj.hoursWorkedPlan == null) return false;
			else
				if ( ! inObject.hoursWorkedPlan.equals(obj.hoursWorkedPlan)){
					return false;
				}

		if(inObject.hoursWorkedNotPlan == null && obj.hoursWorkedNotPlan == null){}
		else
			if(inObject.hoursWorkedNotPlan == null || obj.hoursWorkedNotPlan == null) return false;
			else
				if ( ! inObject.hoursWorkedNotPlan.equals(obj.hoursWorkedNotPlan)){
					return false;
				}

		if(inObject.hoursWorkedSum == null && obj.hoursWorkedSum == null){}
		else
			if(inObject.hoursWorkedSum == null || obj.hoursWorkedSum == null) return false;
			else
				if ( ! inObject.hoursWorkedSum.equals(obj.hoursWorkedSum)){
					return false;
				}

		if(inObject.percentLoadWork == null && obj.percentLoadWork == null){}
		else
			if(inObject.percentLoadWork == null || obj.percentLoadWork == null) return false;
			else
				if ( ! inObject.percentLoadWork.equals(obj.percentLoadWork)){
					return false;
				}

		if(inObject.percentLoadByPlanWork == null && obj.percentLoadByPlanWork == null){}
		else
			if(inObject.percentLoadByPlanWork == null || obj.percentLoadByPlanWork == null) return false;
			else
				if ( ! inObject.percentLoadByPlanWork.equals(obj.percentLoadByPlanWork)){
					return false;
				}

		if(inObject.percentLoadByNotPlanWork == null && obj.percentLoadByNotPlanWork == null){}
		else
			if(inObject.percentLoadByNotPlanWork == null || obj.percentLoadByNotPlanWork == null) return false;
			else
				if ( ! inObject.percentLoadByNotPlanWork.equals(obj.percentLoadByNotPlanWork)){
					return false;
				}

		if(inObject.percentBonus == null && obj.percentBonus == null){}
		else
			if(inObject.percentBonus == null || obj.percentBonus == null) return false;
			else
				if ( ! inObject.percentBonus.equals(obj.percentBonus)){
					return false;
				}

		if(inObject.coefficient == null && obj.coefficient == null){}
		else
			if(inObject.coefficient == null || obj.coefficient == null) return false;
			else
				if ( ! inObject.coefficient.equals(obj.coefficient)){
					return false;
				}

		if(inObject.percentBonusForCharging == null && obj.percentBonusForCharging == null){}
		else
			if(inObject.percentBonusForCharging == null || obj.percentBonusForCharging == null) return false;
			else
				if ( ! inObject.percentBonusForCharging.equals(obj.percentBonusForCharging)){
					return false;
				}

		if(inObject.countFactWorkedDays == null && obj.countFactWorkedDays == null){}
		else
			if(inObject.countFactWorkedDays == null || obj.countFactWorkedDays == null) return false;
			else
				if ( ! inObject.countFactWorkedDays.equals(obj.countFactWorkedDays)){
					return false;
				}

		if(inObject.tradeCategoryId == null && obj.tradeCategoryId == null){}
		else
			if(inObject.tradeCategoryId == null || obj.tradeCategoryId == null) return false;
			else
				if ( ! inObject.tradeCategoryId.equals(obj.tradeCategoryId)){
					return false;
				}

		if(inObject.dateStart == null && obj.dateStart == null){} else 
			if(inObject.dateStart == null || obj.dateStart == null) return false;
			else
				if (inObject.dateStart.compareTo(obj.dateStart) != 0){
					return false;
				}

		if(inObject.dateFinal == null && obj.dateFinal == null){} else 
			if(inObject.dateFinal == null || obj.dateFinal == null) return false;
			else
				if (inObject.dateFinal.compareTo(obj.dateFinal) != 0){
					return false;
				}

		if(inObject.noWayOutFromPeriod == null && obj.noWayOutFromPeriod == null){}
		else
			if(inObject.noWayOutFromPeriod == null || obj.noWayOutFromPeriod == null) return false;
			else
				if ( ! inObject.noWayOutFromPeriod.equals(obj.noWayOutFromPeriod)){
					return false;
				}

		if(inObject.summaCompensation == null && obj.summaCompensation == null){}
		else
			if(inObject.summaCompensation == null || obj.summaCompensation == null) return false;
			else
				if ( ! inObject.summaCompensation.equals(obj.summaCompensation)){
					return false;
				}

		if(inObject.coefficientQuality == null && obj.coefficientQuality == null){}
		else
			if(inObject.coefficientQuality == null || obj.coefficientQuality == null) return false;
			else
				if ( ! inObject.coefficientQuality.equals(obj.coefficientQuality)){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
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

		if(inObject.reasonInvalid == null && obj.reasonInvalid == null){}
		else
			if(inObject.reasonInvalid == null || obj.reasonInvalid == null) return false;
			else
				if ( ! inObject.reasonInvalid.equals(obj.reasonInvalid)){
					return false;
				}

		if(inObject.userSetInvalid == null && obj.userSetInvalid == null){}
		else
			if(inObject.userSetInvalid == null || obj.userSetInvalid == null) return false;
			else
				if ( ! inObject.userSetInvalid.equals(obj.userSetInvalid)){
					return false;
				}

		if(inObject.dateSetInvalid == null && obj.dateSetInvalid == null){} else 
			if(inObject.dateSetInvalid == null || obj.dateSetInvalid == null) return false;
			else
				if (inObject.dateSetInvalid.compareTo(obj.dateSetInvalid) != 0){
					return false;
				}
		if (inObject.bonusList.code != obj.bonusList.code){
			return false;
		}
		if (inObject.status.code != obj.status.code){
			return false;
		}
		return true;
	}

	public int add(ENBonusListItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBonusListItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBONUSLISTITEM (CODE,PODRID,PODRNAME,FIO,TABNUMBER,POSITIONID,POSITIONNAME,FUNDWORKTIME,WORKTIMEFACT,HOURSWORKEDWITHSTAFF,TIMEDELIVERY,HOURSWORKEDPLAN,HOURSWORKEDNOTPLAN,HOURSWORKEDSUM,PERCENTLOADWORK,PERCENTLOADBYPLANWORK,PERCENTLOADBYNOTPLNWRK,PERCENTBONUS,COEFFICIENT,PERCENTBONUSFORCHARGNG,COUNTFACTWORKEDDAYS,TRADECATEGORYID,DATESTART,DATEFINAL,NOWAYOUTFROMPERIOD,SUMMACOMPENSATION,COEFFICIENTQUALITY,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,REASONINVALID,USERSETINVALID,DATESETINVALID,BONUSLISTCODE,STATUSCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.podrId);
			statement.setString(3, anObject.podrName);
			statement.setString(4, anObject.fio);
			statement.setString(5, anObject.tabNumber);
			statement.setString(6, anObject.positionId);
			statement.setString(7, anObject.positionName);
			if (anObject.fundWorkTime != null) {
				anObject.fundWorkTime = anObject.fundWorkTime.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.fundWorkTime);
			if (anObject.workTimeFact != null) {
				anObject.workTimeFact = anObject.workTimeFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.workTimeFact);
			if (anObject.hoursWorkedWithStaff != null) {
				anObject.hoursWorkedWithStaff = anObject.hoursWorkedWithStaff.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.hoursWorkedWithStaff);
			if (anObject.timeDelivery != null) {
				anObject.timeDelivery = anObject.timeDelivery.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.timeDelivery);
			if (anObject.hoursWorkedPlan != null) {
				anObject.hoursWorkedPlan = anObject.hoursWorkedPlan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.hoursWorkedPlan);
			if (anObject.hoursWorkedNotPlan != null) {
				anObject.hoursWorkedNotPlan = anObject.hoursWorkedNotPlan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13, anObject.hoursWorkedNotPlan);
			if (anObject.hoursWorkedSum != null) {
				anObject.hoursWorkedSum = anObject.hoursWorkedSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14, anObject.hoursWorkedSum);
			if (anObject.percentLoadWork != null) {
				anObject.percentLoadWork = anObject.percentLoadWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.percentLoadWork);
			if (anObject.percentLoadByPlanWork != null) {
				anObject.percentLoadByPlanWork = anObject.percentLoadByPlanWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.percentLoadByPlanWork);
			if (anObject.percentLoadByNotPlanWork != null) {
				anObject.percentLoadByNotPlanWork = anObject.percentLoadByNotPlanWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17, anObject.percentLoadByNotPlanWork);
			if (anObject.percentBonus != null) {
				anObject.percentBonus = anObject.percentBonus.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.percentBonus);
			if (anObject.coefficient != null) {
				anObject.coefficient = anObject.coefficient.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19, anObject.coefficient);
			if (anObject.percentBonusForCharging != null) {
				anObject.percentBonusForCharging = anObject.percentBonusForCharging.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.percentBonusForCharging);
			if (anObject.countFactWorkedDays != null) {
				anObject.countFactWorkedDays = anObject.countFactWorkedDays.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.countFactWorkedDays);
			statement.setString(22, anObject.tradeCategoryId);
			if (anObject.dateStart == null) {
				statement.setDate(23, null);
			} else {
				statement.setDate(23, new java.sql.Date(anObject.dateStart.getTime()));
			}
			if (anObject.dateFinal == null) {
				statement.setDate(24, null);
			} else {
				statement.setDate(24, new java.sql.Date(anObject.dateFinal.getTime()));
			}
			if (anObject.noWayOutFromPeriod != null) {
				anObject.noWayOutFromPeriod = anObject.noWayOutFromPeriod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(25, anObject.noWayOutFromPeriod);
			if (anObject.summaCompensation != null) {
				anObject.summaCompensation = anObject.summaCompensation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26, anObject.summaCompensation);
			if (anObject.coefficientQuality != null) {
				anObject.coefficientQuality = anObject.coefficientQuality.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(27, anObject.coefficientQuality);
			statement.setString(28, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(29, null);
			} else {
				statement.setTimestamp(29, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(30, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(31, null);
			} else {
				statement.setTimestamp(31, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(32, null);
			} else {
				statement.setBigDecimal(32, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(33, anObject.reasonInvalid);
			statement.setString(34, anObject.userSetInvalid);
			if (anObject.dateSetInvalid == null) {
				statement.setTimestamp(35, null);
			} else {
				statement.setTimestamp(35, new java.sql.Timestamp(anObject.dateSetInvalid.getTime()));
			}
			if (anObject.bonusList.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENBonusListDAOGen(connection,getUserProfile()).exists(anObject.bonusList.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBonusListItem.bonusList.code%} = {%"+anObject.bonusList.code+"%}");
				}
				statement.setInt(36,anObject.bonusList.code);
			} else {
				statement.setNull(36,java.sql.Types.INTEGER);
			}
			if (anObject.status.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENBonusListItemStatusDAOGen(connection,getUserProfile()).exists(anObject.status.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBonusListItem.status.code%} = {%"+anObject.status.code+"%}");
				}
				statement.setInt(37,anObject.status.code);
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
			throw new PersistenceException("Error in method {%ENBonusListItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBonusListItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBonusListItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENBonusListItem oldObject = new ENBonusListItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENBonusListItem.modify_time_Field+" FROM  ENBONUSLISTITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("PODRID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PODRNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TABNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSITIONID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSITIONNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUNDWORKTIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WORKTIMEFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSWORKEDWITHSTAFF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEDELIVERY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSWORKEDPLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSWORKEDNOTPLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSWORKEDSUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTLOADWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTLOADBYPLANWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTLOADBYNOTPLANWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COEFFICIENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTBONUSFORCHARGING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTFACTWORKEDDAYS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRADECATEGORYID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NOWAYOUTFROMPERIOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMACOMPENSATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COEFFICIENTQUALITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
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
					if(fieldNameStr.compareTo("REASONINVALID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERSETINVALID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATESETINVALID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BONUSLIST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBONUSLISTITEM SET  PODRID = ? , PODRNAME = ? , FIO = ? , TABNUMBER = ? , POSITIONID = ? , POSITIONNAME = ? , FUNDWORKTIME = ? , WORKTIMEFACT = ? , HOURSWORKEDWITHSTAFF = ? , TIMEDELIVERY = ? , HOURSWORKEDPLAN = ? , HOURSWORKEDNOTPLAN = ? , HOURSWORKEDSUM = ? , PERCENTLOADWORK = ? , PERCENTLOADBYPLANWORK = ? , PERCENTLOADBYNOTPLNWRK = ? , PERCENTBONUS = ? , COEFFICIENT = ? , PERCENTBONUSFORCHARGNG = ? , COUNTFACTWORKEDDAYS = ? , TRADECATEGORYID = ? , DATESTART = ? , DATEFINAL = ? , NOWAYOUTFROMPERIOD = ? , SUMMACOMPENSATION = ? , COEFFICIENTQUALITY = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , REASONINVALID = ? , USERSETINVALID = ? , DATESETINVALID = ? , BONUSLISTCODE = ? , STATUSCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBONUSLISTITEM SET ";
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
					statement.setString(1, anObject.podrId);
					statement.setString(2, anObject.podrName);
					statement.setString(3, anObject.fio);
					statement.setString(4, anObject.tabNumber);
					statement.setString(5, anObject.positionId);
					statement.setString(6, anObject.positionName);
					if (anObject.fundWorkTime != null) {
						anObject.fundWorkTime = anObject.fundWorkTime.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.fundWorkTime);
					if (anObject.workTimeFact != null) {
						anObject.workTimeFact = anObject.workTimeFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.workTimeFact);
					if (anObject.hoursWorkedWithStaff != null) {
						anObject.hoursWorkedWithStaff = anObject.hoursWorkedWithStaff.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.hoursWorkedWithStaff);
					if (anObject.timeDelivery != null) {
						anObject.timeDelivery = anObject.timeDelivery.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.timeDelivery);
					if (anObject.hoursWorkedPlan != null) {
						anObject.hoursWorkedPlan = anObject.hoursWorkedPlan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.hoursWorkedPlan);
					if (anObject.hoursWorkedNotPlan != null) {
						anObject.hoursWorkedNotPlan = anObject.hoursWorkedNotPlan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12, anObject.hoursWorkedNotPlan);
					if (anObject.hoursWorkedSum != null) {
						anObject.hoursWorkedSum = anObject.hoursWorkedSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13, anObject.hoursWorkedSum);
					if (anObject.percentLoadWork != null) {
						anObject.percentLoadWork = anObject.percentLoadWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.percentLoadWork);
					if (anObject.percentLoadByPlanWork != null) {
						anObject.percentLoadByPlanWork = anObject.percentLoadByPlanWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.percentLoadByPlanWork);
					if (anObject.percentLoadByNotPlanWork != null) {
						anObject.percentLoadByNotPlanWork = anObject.percentLoadByNotPlanWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16, anObject.percentLoadByNotPlanWork);
					if (anObject.percentBonus != null) {
						anObject.percentBonus = anObject.percentBonus.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.percentBonus);
					if (anObject.coefficient != null) {
						anObject.coefficient = anObject.coefficient.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18, anObject.coefficient);
					if (anObject.percentBonusForCharging != null) {
						anObject.percentBonusForCharging = anObject.percentBonusForCharging.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.percentBonusForCharging);
					if (anObject.countFactWorkedDays != null) {
						anObject.countFactWorkedDays = anObject.countFactWorkedDays.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.countFactWorkedDays);
					statement.setString(21, anObject.tradeCategoryId);
					if (anObject.dateStart == null) {
						statement.setDate(22, null);
					} else {
						statement.setDate(22, new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinal == null) {
						statement.setDate(23, null);
					} else {
						statement.setDate(23, new java.sql.Date(anObject.dateFinal.getTime()));
					}
					if (anObject.noWayOutFromPeriod != null) {
						anObject.noWayOutFromPeriod = anObject.noWayOutFromPeriod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(24, anObject.noWayOutFromPeriod);
					if (anObject.summaCompensation != null) {
						anObject.summaCompensation = anObject.summaCompensation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25, anObject.summaCompensation);
					if (anObject.coefficientQuality != null) {
						anObject.coefficientQuality = anObject.coefficientQuality.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(26, anObject.coefficientQuality);
					statement.setString(27, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(28, null);
					} else {
						statement.setTimestamp(28, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(29, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(30, null);
					} else {
						statement.setTimestamp(30, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(31, null);
					} else {
						statement.setBigDecimal(31, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(32, anObject.reasonInvalid);
					statement.setString(33, anObject.userSetInvalid);
					if (anObject.dateSetInvalid == null) {
						statement.setTimestamp(34, null);
					} else {
						statement.setTimestamp(34, new java.sql.Timestamp(anObject.dateSetInvalid.getTime()));
					}
					if (anObject.bonusList.code != Integer.MIN_VALUE) {
						statement.setInt(35, anObject.bonusList.code);
					} else {
						statement.setNull(35, java.sql.Types.INTEGER);
					}
					if (anObject.status.code != Integer.MIN_VALUE) {
						statement.setInt(36, anObject.status.code);
					} else {
						statement.setNull(36, java.sql.Types.INTEGER);
					}
					statement.setInt(37, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PODRID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.podrId);
							continue;
						}
						if("PODRNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.podrName);
							continue;
						}
						if("FIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.fio);
							continue;
						}
						if("TABNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.tabNumber);
							continue;
						}
						if("POSITIONID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.positionId);
							continue;
						}
						if("POSITIONNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.positionName);
							continue;
						}
						if("FUNDWORKTIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fundWorkTime != null) {
								anObject.fundWorkTime = anObject.fundWorkTime.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.fundWorkTime);
							continue;
						}
						if("WORKTIMEFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.workTimeFact != null) {
								anObject.workTimeFact = anObject.workTimeFact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.workTimeFact);
							continue;
						}
						if("HOURSWORKEDWITHSTAFF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursWorkedWithStaff != null) {
								anObject.hoursWorkedWithStaff = anObject.hoursWorkedWithStaff.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursWorkedWithStaff);
							continue;
						}
						if("TIMEDELIVERY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeDelivery != null) {
								anObject.timeDelivery = anObject.timeDelivery.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.timeDelivery);
							continue;
						}
						if("HOURSWORKEDPLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursWorkedPlan != null) {
								anObject.hoursWorkedPlan = anObject.hoursWorkedPlan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursWorkedPlan);
							continue;
						}
						if("HOURSWORKEDNOTPLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursWorkedNotPlan != null) {
								anObject.hoursWorkedNotPlan = anObject.hoursWorkedNotPlan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursWorkedNotPlan);
							continue;
						}
						if("HOURSWORKEDSUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursWorkedSum != null) {
								anObject.hoursWorkedSum = anObject.hoursWorkedSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursWorkedSum);
							continue;
						}
						if("PERCENTLOADWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentLoadWork != null) {
								anObject.percentLoadWork = anObject.percentLoadWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.percentLoadWork);
							continue;
						}
						if("PERCENTLOADBYPLANWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentLoadByPlanWork != null) {
								anObject.percentLoadByPlanWork = anObject.percentLoadByPlanWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.percentLoadByPlanWork);
							continue;
						}
						if("PERCENTLOADBYNOTPLANWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentLoadByNotPlanWork != null) {
								anObject.percentLoadByNotPlanWork = anObject.percentLoadByNotPlanWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.percentLoadByNotPlanWork);
							continue;
						}
						if("PERCENTBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentBonus != null) {
								anObject.percentBonus = anObject.percentBonus.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.percentBonus);
							continue;
						}
						if("COEFFICIENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.coefficient != null) {
								anObject.coefficient = anObject.coefficient.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.coefficient);
							continue;
						}
						if("PERCENTBONUSFORCHARGING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentBonusForCharging != null) {
								anObject.percentBonusForCharging = anObject.percentBonusForCharging.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.percentBonusForCharging);
							continue;
						}
						if("COUNTFACTWORKEDDAYS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countFactWorkedDays != null) {
								anObject.countFactWorkedDays = anObject.countFactWorkedDays.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countFactWorkedDays);
							continue;
						}
						if("TRADECATEGORYID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.tradeCategoryId);
							continue;
						}
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateStart.getTime()));
							}
							continue;
						}
						if("DATEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFinal == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFinal.getTime()));
							}
							continue;
						}
						if("NOWAYOUTFROMPERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.noWayOutFromPeriod != null) {
								anObject.noWayOutFromPeriod = anObject.noWayOutFromPeriod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.noWayOutFromPeriod);
							continue;
						}
						if("SUMMACOMPENSATION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaCompensation != null) {
								anObject.summaCompensation = anObject.summaCompensation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summaCompensation);
							continue;
						}
						if("COEFFICIENTQUALITY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.coefficientQuality != null) {
								anObject.coefficientQuality = anObject.coefficientQuality.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.coefficientQuality);
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("REASONINVALID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reasonInvalid);
							continue;
						}
						if("USERSETINVALID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userSetInvalid);
							continue;
						}
						if("DATESETINVALID".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateSetInvalid == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateSetInvalid.getTime()));
							}
							continue;
						}
						if("BONUSLIST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.bonusList.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.bonusList.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("STATUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.status.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.status.code);
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

	} // end of save(ENBonusListItem anObject,String[] anAttributes)


	public ENBonusListItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBonusListItem filterObject = new ENBonusListItem();
		Vector<ENBonusListItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBonusListItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBonusListItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.podrId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.podrName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.fio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tabNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.positionId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.positionName, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.fundWorkTime, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.workTimeFact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursWorkedWithStaff, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeDelivery, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursWorkedPlan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursWorkedNotPlan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursWorkedSum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentLoadWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentLoadByPlanWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentLoadByNotPlanWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.coefficient, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentBonusForCharging, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countFactWorkedDays, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tradeCategoryId, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.noWayOutFromPeriod, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaCompensation, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.coefficientQuality, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reasonInvalid, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userSetInvalid, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateSetInvalid, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.bonusList.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.status.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBonusListItemFilter filter) {
		String out = buildCondition((ENBonusListItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBonusListItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBonusListItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.podrId, ENBonusListItem.podrId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.podrName, ENBonusListItem.podrName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.fio, ENBonusListItem.fio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tabNumber, ENBonusListItem.tabNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.positionId, ENBonusListItem.positionId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.positionName, ENBonusListItem.positionName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.fundWorkTime, ENBonusListItem.fundWorkTime_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.workTimeFact, ENBonusListItem.workTimeFact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursWorkedWithStaff, ENBonusListItem.hoursWorkedWithStaff_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeDelivery, ENBonusListItem.timeDelivery_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursWorkedPlan, ENBonusListItem.hoursWorkedPlan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursWorkedNotPlan, ENBonusListItem.hoursWorkedNotPlan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursWorkedSum, ENBonusListItem.hoursWorkedSum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentLoadWork, ENBonusListItem.percentLoadWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentLoadByPlanWork, ENBonusListItem.percentLoadByPlanWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentLoadByNotPlanWork, ENBonusListItem.percentLoadByNotPlanWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentBonus, ENBonusListItem.percentBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.coefficient, ENBonusListItem.coefficient_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentBonusForCharging, ENBonusListItem.percentBonusForCharging_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countFactWorkedDays, ENBonusListItem.countFactWorkedDays_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tradeCategoryId, ENBonusListItem.tradeCategoryId_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, ENBonusListItem.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinal, ENBonusListItem.dateFinal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.noWayOutFromPeriod, ENBonusListItem.noWayOutFromPeriod_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaCompensation, ENBonusListItem.summaCompensation_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.coefficientQuality, ENBonusListItem.coefficientQuality_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENBonusListItem.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENBonusListItem.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENBonusListItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENBonusListItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENBonusListItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reasonInvalid, ENBonusListItem.reasonInvalid_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userSetInvalid, ENBonusListItem.userSetInvalid_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateSetInvalid, ENBonusListItem.dateSetInvalid_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.bonusList.code, ENBonusListItem.bonusList_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.status.code, ENBonusListItem.status_QFielld, out);
		}
		return out;
	}

	public ENBonusListItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBonusListItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBonusListItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBonusListItemShortList getFilteredList(ENBonusListItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBonusListItemShortList getScrollableFilteredList(ENBonusListItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBonusListItemShortList getScrollableFilteredList(ENBonusListItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBonusListItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBonusListItemShortList getScrollableFilteredList(ENBonusListItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBonusListItemShortList getScrollableFilteredList(ENBonusListItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBonusListItemShortList getScrollableFilteredList(ENBonusListItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBonusListItemShortList result = new ENBonusListItemShortList();
		ENBonusListItemShort anObject;
		result.list = new Vector<ENBonusListItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBONUSLISTITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBONUSLISTITEM.CODE"+
			",ENBONUSLISTITEM.PODRID"+
			",ENBONUSLISTITEM.PODRNAME"+
			",ENBONUSLISTITEM.FIO"+
			",ENBONUSLISTITEM.TABNUMBER"+
			",ENBONUSLISTITEM.POSITIONID"+
			",ENBONUSLISTITEM.POSITIONNAME"+
			",ENBONUSLISTITEM.FUNDWORKTIME"+
			",ENBONUSLISTITEM.WORKTIMEFACT"+
			",ENBONUSLISTITEM.HOURSWORKEDWITHSTAFF"+
			",ENBONUSLISTITEM.TIMEDELIVERY"+
			",ENBONUSLISTITEM.HOURSWORKEDPLAN"+
			",ENBONUSLISTITEM.HOURSWORKEDNOTPLAN"+
			",ENBONUSLISTITEM.HOURSWORKEDSUM"+
			",ENBONUSLISTITEM.PERCENTLOADWORK"+
			",ENBONUSLISTITEM.PERCENTLOADBYPLANWORK"+
			",ENBONUSLISTITEM.PERCENTLOADBYNOTPLNWRK"+
			",ENBONUSLISTITEM.PERCENTBONUS"+
			",ENBONUSLISTITEM.COEFFICIENT"+
			",ENBONUSLISTITEM.PERCENTBONUSFORCHARGNG"+
			",ENBONUSLISTITEM.COUNTFACTWORKEDDAYS"+
			",ENBONUSLISTITEM.TRADECATEGORYID"+
			",ENBONUSLISTITEM.DATESTART"+
			",ENBONUSLISTITEM.DATEFINAL"+
			",ENBONUSLISTITEM.NOWAYOUTFROMPERIOD"+
			",ENBONUSLISTITEM.SUMMACOMPENSATION"+
			",ENBONUSLISTITEM.COEFFICIENTQUALITY"+
			",ENBONUSLISTITEM.USERADD"+
			",ENBONUSLISTITEM.DATEADD"+
			",ENBONUSLISTITEM.USERGEN"+
			",ENBONUSLISTITEM.DATEEDIT"+
			",ENBONUSLISTITEM.REASONINVALID"+
			",ENBONUSLISTITEM.USERSETINVALID"+
			",ENBONUSLISTITEM.DATESETINVALID"+
			", ENBONUSLIST.CODE " +
			", ENBONUSLIST.NUMBERGEN " +
			", ENBONUSLIST.MONTHGEN " +
			", ENBONUSLIST.YEARGEN " +
			", ENBONUSLIST.USERADD " +
			", ENBONUSLIST.DATEADD " +
			", ENBONUSLIST.USERGEN " +
			", ENBONUSLIST.DATEEDIT " +
			", ENBONUSLISTITEMSTATUS.CODE " +
			", ENBONUSLISTITEMSTATUS.NAME " +
		" FROM ENBONUSLISTITEM " +
			" LEFT JOIN ENBONUSLIST on ENBONUSLIST.CODE = ENBONUSLISTITEM.BONUSLISTCODE "+
			" LEFT JOIN ENBONUSLISTITEMSTATUS on ENBONUSLISTITEMSTATUS.CODE = ENBONUSLISTITEM.STATUSCODE "+
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
				anObject = new ENBonusListItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.podrId = set.getString(2);
				anObject.podrName = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.tabNumber = set.getString(5);
				anObject.positionId = set.getString(6);
				anObject.positionName = set.getString(7);
				anObject.fundWorkTime = set.getBigDecimal(8);
				if(anObject.fundWorkTime != null) {
					anObject.fundWorkTime = anObject.fundWorkTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.workTimeFact = set.getBigDecimal(9);
				if(anObject.workTimeFact != null) {
					anObject.workTimeFact = anObject.workTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedWithStaff = set.getBigDecimal(10);
				if(anObject.hoursWorkedWithStaff != null) {
					anObject.hoursWorkedWithStaff = anObject.hoursWorkedWithStaff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeDelivery = set.getBigDecimal(11);
				if(anObject.timeDelivery != null) {
					anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedPlan = set.getBigDecimal(12);
				if(anObject.hoursWorkedPlan != null) {
					anObject.hoursWorkedPlan = anObject.hoursWorkedPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedNotPlan = set.getBigDecimal(13);
				if(anObject.hoursWorkedNotPlan != null) {
					anObject.hoursWorkedNotPlan = anObject.hoursWorkedNotPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedSum = set.getBigDecimal(14);
				if(anObject.hoursWorkedSum != null) {
					anObject.hoursWorkedSum = anObject.hoursWorkedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentLoadWork = set.getBigDecimal(15);
				if(anObject.percentLoadWork != null) {
					anObject.percentLoadWork = anObject.percentLoadWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentLoadByPlanWork = set.getBigDecimal(16);
				if(anObject.percentLoadByPlanWork != null) {
					anObject.percentLoadByPlanWork = anObject.percentLoadByPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentLoadByNotPlanWork = set.getBigDecimal(17);
				if(anObject.percentLoadByNotPlanWork != null) {
					anObject.percentLoadByNotPlanWork = anObject.percentLoadByNotPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentBonus = set.getBigDecimal(18);
				if(anObject.percentBonus != null) {
					anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficient = set.getBigDecimal(19);
				if(anObject.coefficient != null) {
					anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentBonusForCharging = set.getBigDecimal(20);
				if(anObject.percentBonusForCharging != null) {
					anObject.percentBonusForCharging = anObject.percentBonusForCharging.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countFactWorkedDays = set.getBigDecimal(21);
				if(anObject.countFactWorkedDays != null) {
					anObject.countFactWorkedDays = anObject.countFactWorkedDays.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tradeCategoryId = set.getString(22);
				anObject.dateStart = set.getDate(23);
				anObject.dateFinal = set.getDate(24);
				anObject.noWayOutFromPeriod = set.getBigDecimal(25);
				if(anObject.noWayOutFromPeriod != null) {
					anObject.noWayOutFromPeriod = anObject.noWayOutFromPeriod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaCompensation = set.getBigDecimal(26);
				if(anObject.summaCompensation != null) {
					anObject.summaCompensation = anObject.summaCompensation.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficientQuality = set.getBigDecimal(27);
				if(anObject.coefficientQuality != null) {
					anObject.coefficientQuality = anObject.coefficientQuality.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userAdd = set.getString(28);
				anObject.dateAdd = set.getTimestamp(29);
				anObject.userGen = set.getString(30);
				anObject.dateEdit = set.getTimestamp(31);
				anObject.reasonInvalid = set.getString(32);
				anObject.userSetInvalid = set.getString(33);
				anObject.dateSetInvalid = set.getTimestamp(34);

				anObject.bonusListCode = set.getInt(35);
				if(set.wasNull()) {
					anObject.bonusListCode = Integer.MIN_VALUE;
				}
				anObject.bonusListNumberGen = set.getString(36);
				anObject.bonusListMonthGen = set.getInt(37);
				if(set.wasNull()) {
					anObject.bonusListMonthGen = Integer.MIN_VALUE;
				}
				anObject.bonusListYearGen = set.getInt(38);
				if(set.wasNull()) {
					anObject.bonusListYearGen = Integer.MIN_VALUE;
				}
				anObject.bonusListUserAdd = set.getString(39);
				anObject.bonusListDateAdd = set.getTimestamp(40);
				anObject.bonusListUserGen = set.getString(41);
				anObject.bonusListDateEdit = set.getTimestamp(42);
				anObject.statusCode = set.getInt(43);
				if(set.wasNull()) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.statusName = set.getString(44);

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
	
	public int[] getFilteredCodeArray(ENBonusListItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBonusListItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBonusListItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBONUSLISTITEM.CODE FROM ENBONUSLISTITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBONUSLISTITEM.CODE";
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


	public ENBonusListItem getObject(int uid) throws PersistenceException {
		ENBonusListItem result = new ENBonusListItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENBonusListItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENBONUSLISTITEM.CODE, ENBONUSLISTITEM.PODRID, ENBONUSLISTITEM.PODRNAME, ENBONUSLISTITEM.FIO, ENBONUSLISTITEM.TABNUMBER, ENBONUSLISTITEM.POSITIONID, ENBONUSLISTITEM.POSITIONNAME, ENBONUSLISTITEM.FUNDWORKTIME, ENBONUSLISTITEM.WORKTIMEFACT, ENBONUSLISTITEM.HOURSWORKEDWITHSTAFF, ENBONUSLISTITEM.TIMEDELIVERY, ENBONUSLISTITEM.HOURSWORKEDPLAN, ENBONUSLISTITEM.HOURSWORKEDNOTPLAN, ENBONUSLISTITEM.HOURSWORKEDSUM, ENBONUSLISTITEM.PERCENTLOADWORK, ENBONUSLISTITEM.PERCENTLOADBYPLANWORK, ENBONUSLISTITEM.PERCENTLOADBYNOTPLNWRK, ENBONUSLISTITEM.PERCENTBONUS, ENBONUSLISTITEM.COEFFICIENT, ENBONUSLISTITEM.PERCENTBONUSFORCHARGNG, ENBONUSLISTITEM.COUNTFACTWORKEDDAYS, ENBONUSLISTITEM.TRADECATEGORYID, ENBONUSLISTITEM.DATESTART, ENBONUSLISTITEM.DATEFINAL, ENBONUSLISTITEM.NOWAYOUTFROMPERIOD, ENBONUSLISTITEM.SUMMACOMPENSATION, ENBONUSLISTITEM.COEFFICIENTQUALITY, ENBONUSLISTITEM.USERADD, ENBONUSLISTITEM.DATEADD, ENBONUSLISTITEM.USERGEN, ENBONUSLISTITEM.DATEEDIT, ENBONUSLISTITEM.MODIFY_TIME, ENBONUSLISTITEM.REASONINVALID, ENBONUSLISTITEM.USERSETINVALID, ENBONUSLISTITEM.DATESETINVALID, ENBONUSLISTITEM.BONUSLISTCODE, ENBONUSLISTITEM.STATUSCODE "
			+" FROM ENBONUSLISTITEM WHERE ENBONUSLISTITEM.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.podrId = set.getString(2);
				anObject.podrName = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.tabNumber = set.getString(5);
				anObject.positionId = set.getString(6);
				anObject.positionName = set.getString(7);
				anObject.fundWorkTime = set.getBigDecimal(8);
				if(anObject.fundWorkTime != null) {
					anObject.fundWorkTime = anObject.fundWorkTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.workTimeFact = set.getBigDecimal(9);
				if(anObject.workTimeFact != null) {
					anObject.workTimeFact = anObject.workTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedWithStaff = set.getBigDecimal(10);
				if(anObject.hoursWorkedWithStaff != null) {
					anObject.hoursWorkedWithStaff = anObject.hoursWorkedWithStaff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeDelivery = set.getBigDecimal(11);
				if(anObject.timeDelivery != null) {
					anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedPlan = set.getBigDecimal(12);
				if(anObject.hoursWorkedPlan != null) {
					anObject.hoursWorkedPlan = anObject.hoursWorkedPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedNotPlan = set.getBigDecimal(13);
				if(anObject.hoursWorkedNotPlan != null) {
					anObject.hoursWorkedNotPlan = anObject.hoursWorkedNotPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursWorkedSum = set.getBigDecimal(14);
				if(anObject.hoursWorkedSum != null) {
					anObject.hoursWorkedSum = anObject.hoursWorkedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentLoadWork = set.getBigDecimal(15);
				if(anObject.percentLoadWork != null) {
					anObject.percentLoadWork = anObject.percentLoadWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentLoadByPlanWork = set.getBigDecimal(16);
				if(anObject.percentLoadByPlanWork != null) {
					anObject.percentLoadByPlanWork = anObject.percentLoadByPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentLoadByNotPlanWork = set.getBigDecimal(17);
				if(anObject.percentLoadByNotPlanWork != null) {
					anObject.percentLoadByNotPlanWork = anObject.percentLoadByNotPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentBonus = set.getBigDecimal(18);
				if(anObject.percentBonus != null) {
					anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficient = set.getBigDecimal(19);
				if(anObject.coefficient != null) {
					anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentBonusForCharging = set.getBigDecimal(20);
				if(anObject.percentBonusForCharging != null) {
					anObject.percentBonusForCharging = anObject.percentBonusForCharging.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countFactWorkedDays = set.getBigDecimal(21);
				if(anObject.countFactWorkedDays != null) {
					anObject.countFactWorkedDays = anObject.countFactWorkedDays.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tradeCategoryId = set.getString(22);
				anObject.dateStart = set.getDate(23);
				anObject.dateFinal = set.getDate(24);
				anObject.noWayOutFromPeriod = set.getBigDecimal(25);
				if(anObject.noWayOutFromPeriod != null) {
					anObject.noWayOutFromPeriod = anObject.noWayOutFromPeriod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaCompensation = set.getBigDecimal(26);
				if(anObject.summaCompensation != null) {
					anObject.summaCompensation = anObject.summaCompensation.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficientQuality = set.getBigDecimal(27);
				if(anObject.coefficientQuality != null) {
					anObject.coefficientQuality = anObject.coefficientQuality.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userAdd = set.getString(28);
				anObject.dateAdd = set.getTimestamp(29);
				anObject.userGen = set.getString(30);
				anObject.dateEdit = set.getTimestamp(31);
				anObject.modify_time = set.getLong(32);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.reasonInvalid = set.getString(33);
				anObject.userSetInvalid = set.getString(34);
				anObject.dateSetInvalid = set.getTimestamp(35);
				anObject.bonusList.code = set.getInt(36);
				if (set.wasNull()) {
					anObject.bonusList.code = Integer.MIN_VALUE;
				}
				anObject.status.code = set.getInt(37);
				if (set.wasNull()) {
					anObject.status.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBonusListItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBonusListItemRef ref = new com.ksoe.energynet.valueobject.references.ENBonusListItemRef();
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

		selectStr = "DELETE FROM  ENBONUSLISTITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBonusListItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBonusListItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENBonusListItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENBonusListItem.remove%} access denied");
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
	
	public long count(ENBonusListItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBonusListItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBonusListItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBONUSLISTITEM", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBonusListItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBONUSLISTITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBonusListItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBonusListItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENBONUSLISTITEM.CODE FROM  ENBONUSLISTITEM WHERE  ENBONUSLISTITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBONUSLISTITEM.CODE");
		_checkConditionToken(condition,"podrid","ENBONUSLISTITEM.PODRID");
		_checkConditionToken(condition,"podrname","ENBONUSLISTITEM.PODRNAME");
		_checkConditionToken(condition,"fio","ENBONUSLISTITEM.FIO");
		_checkConditionToken(condition,"tabnumber","ENBONUSLISTITEM.TABNUMBER");
		_checkConditionToken(condition,"positionid","ENBONUSLISTITEM.POSITIONID");
		_checkConditionToken(condition,"positionname","ENBONUSLISTITEM.POSITIONNAME");
		_checkConditionToken(condition,"fundworktime","ENBONUSLISTITEM.FUNDWORKTIME");
		_checkConditionToken(condition,"worktimefact","ENBONUSLISTITEM.WORKTIMEFACT");
		_checkConditionToken(condition,"hoursworkedwithstaff","ENBONUSLISTITEM.HOURSWORKEDWITHSTAFF");
		_checkConditionToken(condition,"timedelivery","ENBONUSLISTITEM.TIMEDELIVERY");
		_checkConditionToken(condition,"hoursworkedplan","ENBONUSLISTITEM.HOURSWORKEDPLAN");
		_checkConditionToken(condition,"hoursworkednotplan","ENBONUSLISTITEM.HOURSWORKEDNOTPLAN");
		_checkConditionToken(condition,"hoursworkedsum","ENBONUSLISTITEM.HOURSWORKEDSUM");
		_checkConditionToken(condition,"percentloadwork","ENBONUSLISTITEM.PERCENTLOADWORK");
		_checkConditionToken(condition,"percentloadbyplanwork","ENBONUSLISTITEM.PERCENTLOADBYPLANWORK");
		_checkConditionToken(condition,"percentloadbynotplanwork","ENBONUSLISTITEM.PERCENTLOADBYNOTPLNWRK");
		_checkConditionToken(condition,"percentbonus","ENBONUSLISTITEM.PERCENTBONUS");
		_checkConditionToken(condition,"coefficient","ENBONUSLISTITEM.COEFFICIENT");
		_checkConditionToken(condition,"percentbonusforcharging","ENBONUSLISTITEM.PERCENTBONUSFORCHARGNG");
		_checkConditionToken(condition,"countfactworkeddays","ENBONUSLISTITEM.COUNTFACTWORKEDDAYS");
		_checkConditionToken(condition,"tradecategoryid","ENBONUSLISTITEM.TRADECATEGORYID");
		_checkConditionToken(condition,"datestart","ENBONUSLISTITEM.DATESTART");
		_checkConditionToken(condition,"datefinal","ENBONUSLISTITEM.DATEFINAL");
		_checkConditionToken(condition,"nowayoutfromperiod","ENBONUSLISTITEM.NOWAYOUTFROMPERIOD");
		_checkConditionToken(condition,"summacompensation","ENBONUSLISTITEM.SUMMACOMPENSATION");
		_checkConditionToken(condition,"coefficientquality","ENBONUSLISTITEM.COEFFICIENTQUALITY");
		_checkConditionToken(condition,"useradd","ENBONUSLISTITEM.USERADD");
		_checkConditionToken(condition,"dateadd","ENBONUSLISTITEM.DATEADD");
		_checkConditionToken(condition,"usergen","ENBONUSLISTITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENBONUSLISTITEM.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENBONUSLISTITEM.MODIFY_TIME");
		_checkConditionToken(condition,"reasoninvalid","ENBONUSLISTITEM.REASONINVALID");
		_checkConditionToken(condition,"usersetinvalid","ENBONUSLISTITEM.USERSETINVALID");
		_checkConditionToken(condition,"datesetinvalid","ENBONUSLISTITEM.DATESETINVALID");
		// relationship conditions
		_checkConditionToken(condition,"bonuslist","BONUSLISTCODE");
		_checkConditionToken(condition,"bonuslist.code","BONUSLISTCODE");
		_checkConditionToken(condition,"status","STATUSCODE");
		_checkConditionToken(condition,"status.code","STATUSCODE");
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
	
	private void _collectAutoIncrementFields(ENBonusListItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBONUSLISTITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBONUSLISTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBONUSLISTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBONUSLISTITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBonusListItemDAO
