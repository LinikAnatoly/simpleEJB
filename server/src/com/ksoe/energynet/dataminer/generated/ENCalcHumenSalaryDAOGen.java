
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
import com.ksoe.energynet.valueobject.ENCalcHumenSalary;
import com.ksoe.energynet.valueobject.filter.ENCalcHumenSalaryFilter;
import com.ksoe.energynet.valueobject.brief.ENCalcHumenSalaryShort;
import com.ksoe.energynet.valueobject.lists.ENCalcHumenSalaryShortList;


/**
 * DAO Object for ENCalcHumenSalary;
 *
 */

public class ENCalcHumenSalaryDAOGen extends GenericDataMiner {

	public ENCalcHumenSalaryDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCalcHumenSalaryDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCalcHumenSalary inObject) throws PersistenceException {
		ENCalcHumenSalary obj = new ENCalcHumenSalary();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.numberGen != obj.numberGen){
					return false;
				}

		if(inObject.classificationTypeNumber == null && obj.classificationTypeNumber == null){}
		else
			if(inObject.classificationTypeNumber == null || obj.classificationTypeNumber == null) return false;
			else
				if ( ! inObject.classificationTypeNumber.equals(obj.classificationTypeNumber)){
					return false;
				}

		if(inObject.positionName == null && obj.positionName == null){}
		else
			if(inObject.positionName == null || obj.positionName == null) return false;
			else
				if ( ! inObject.positionName.equals(obj.positionName)){
					return false;
				}

		if(inObject.timeGenMonth == null && obj.timeGenMonth == null){}
		else
			if(inObject.timeGenMonth == null || obj.timeGenMonth == null) return false;
			else
				if ( ! inObject.timeGenMonth.equals(obj.timeGenMonth)){
					return false;
				}

		if(inObject.timeGen == null && obj.timeGen == null){}
		else
			if(inObject.timeGen == null || obj.timeGen == null) return false;
			else
				if ( ! inObject.timeGen.equals(obj.timeGen)){
					return false;
				}

		if(inObject.salaryMonth == null && obj.salaryMonth == null){}
		else
			if(inObject.salaryMonth == null || obj.salaryMonth == null) return false;
			else
				if ( ! inObject.salaryMonth.equals(obj.salaryMonth)){
					return false;
				}

		if(inObject.priceHour == null && obj.priceHour == null){}
		else
			if(inObject.priceHour == null || obj.priceHour == null) return false;
			else
				if ( ! inObject.priceHour.equals(obj.priceHour)){
					return false;
				}

		if(inObject.salaryHour == null && obj.salaryHour == null){}
		else
			if(inObject.salaryHour == null || obj.salaryHour == null) return false;
			else
				if ( ! inObject.salaryHour.equals(obj.salaryHour)){
					return false;
				}

		if(inObject.salaryBonus == null && obj.salaryBonus == null){}
		else
			if(inObject.salaryBonus == null || obj.salaryBonus == null) return false;
			else
				if ( ! inObject.salaryBonus.equals(obj.salaryBonus)){
					return false;
				}

		if(inObject.salarySurcharge == null && obj.salarySurcharge == null){}
		else
			if(inObject.salarySurcharge == null || obj.salarySurcharge == null) return false;
			else
				if ( ! inObject.salarySurcharge.equals(obj.salarySurcharge)){
					return false;
				}

		if(inObject.salaryPremium == null && obj.salaryPremium == null){}
		else
			if(inObject.salaryPremium == null || obj.salaryPremium == null) return false;
			else
				if ( ! inObject.salaryPremium.equals(obj.salaryPremium)){
					return false;
				}

		if(inObject.salaryAdditional == null && obj.salaryAdditional == null){}
		else
			if(inObject.salaryAdditional == null || obj.salaryAdditional == null) return false;
			else
				if ( ! inObject.salaryAdditional.equals(obj.salaryAdditional)){
					return false;
				}

		if(inObject.salaryTotalBonus == null && obj.salaryTotalBonus == null){}
		else
			if(inObject.salaryTotalBonus == null || obj.salaryTotalBonus == null) return false;
			else
				if ( ! inObject.salaryTotalBonus.equals(obj.salaryTotalBonus)){
					return false;
				}

		if(inObject.salaryTotal == null && obj.salaryTotal == null){}
		else
			if(inObject.salaryTotal == null || obj.salaryTotal == null) return false;
			else
				if ( ! inObject.salaryTotal.equals(obj.salaryTotal)){
					return false;
				}

		if(inObject.percentBonus == null && obj.percentBonus == null){}
		else
			if(inObject.percentBonus == null || obj.percentBonus == null) return false;
			else
				if ( ! inObject.percentBonus.equals(obj.percentBonus)){
					return false;
				}

		if(inObject.percentSurcharge == null && obj.percentSurcharge == null){}
		else
			if(inObject.percentSurcharge == null || obj.percentSurcharge == null) return false;
			else
				if ( ! inObject.percentSurcharge.equals(obj.percentSurcharge)){
					return false;
				}

		if(inObject.percentPremium == null && obj.percentPremium == null){}
		else
			if(inObject.percentPremium == null || obj.percentPremium == null) return false;
			else
				if ( ! inObject.percentPremium.equals(obj.percentPremium)){
					return false;
				}

		if(inObject.percentAdditional == null && obj.percentAdditional == null){}
		else
			if(inObject.percentAdditional == null || obj.percentAdditional == null) return false;
			else
				if ( ! inObject.percentAdditional.equals(obj.percentAdditional)){
					return false;
				}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.plan2CTypeRef.code != obj.plan2CTypeRef.code){
			return false;
		}
		if (inObject.positionRef.code != obj.positionRef.code){
			return false;
		}
		return true;
	}

	public int add(ENCalcHumenSalary anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCalcHumenSalary anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCALCHUMENSALARY (CODE,NUMBERGEN,CLASSIFICATIONTYPENMBR,POSITIONNAME,TIMEGENMONTH,TIMEGEN,SALARYMONTH,PRICEHOUR,SALARYHOUR,SALARYBONUS,SALARYSURCHARGE,SALARYPREMIUM,SALARYADDITIONAL,SALARYTOTALBONUS,SALARYTOTAL,PERCENTBONUS,PERCENTSURCHARGE,PERCENTPREMIUM,PERCENTADDITIONAL,MODIFY_TIME,PLANREFCODE,PLAN2CTYPEREFCODE,POSITIONREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.numberGen != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.numberGen);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.classificationTypeNumber);
			statement.setString(4,anObject.positionName);
			if (anObject.timeGenMonth != null) {
				anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.timeGenMonth);
			if (anObject.timeGen != null) {
				anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.timeGen);
			if (anObject.salaryMonth != null) {
				anObject.salaryMonth = anObject.salaryMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7,anObject.salaryMonth);
			if (anObject.priceHour != null) {
				anObject.priceHour = anObject.priceHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8,anObject.priceHour);
			if (anObject.salaryHour != null) {
				anObject.salaryHour = anObject.salaryHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9,anObject.salaryHour);
			if (anObject.salaryBonus != null) {
				anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10,anObject.salaryBonus);
			if (anObject.salarySurcharge != null) {
				anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11,anObject.salarySurcharge);
			if (anObject.salaryPremium != null) {
				anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12,anObject.salaryPremium);
			if (anObject.salaryAdditional != null) {
				anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13,anObject.salaryAdditional);
			if (anObject.salaryTotalBonus != null) {
				anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.salaryTotalBonus);
			if (anObject.salaryTotal != null) {
				anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15,anObject.salaryTotal);
			if (anObject.percentBonus != null) {
				anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16,anObject.percentBonus);
			if (anObject.percentSurcharge != null) {
				anObject.percentSurcharge = anObject.percentSurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17,anObject.percentSurcharge);
			if (anObject.percentPremium != null) {
				anObject.percentPremium = anObject.percentPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18,anObject.percentPremium);
			if (anObject.percentAdditional != null) {
				anObject.percentAdditional = anObject.percentAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19,anObject.percentAdditional);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(20,null);
			} else {
				statement.setBigDecimal(20,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcHumenSalary.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(21,anObject.planRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.plan2CTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcHumenSalary.plan2CTypeRef.code%} = {%"+anObject.plan2CTypeRef.code+"%}");
				}
				statement.setInt(22,anObject.plan2CTypeRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}
			if (anObject.positionRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKPositionDAOGen(connection,getUserProfile()).exists(anObject.positionRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENCalcHumenSalary.positionRef.code%} = {%"+anObject.positionRef.code+"%}");
				}
				statement.setInt(23,anObject.positionRef.code);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENCalcHumenSalaryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCalcHumenSalary anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCalcHumenSalary anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENCalcHumenSalary oldObject = new ENCalcHumenSalary();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENCalcHumenSalary.modify_time_Field+" FROM  ENCALCHUMENSALARY WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLASSIFICATIONTYPENUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSITIONNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEGENMONTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYMONTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEHOUR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYHOUR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYSURCHARGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYPREMIUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYADDITIONAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYTOTALBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYTOTAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTSURCHARGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTPREMIUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTADDITIONAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLAN2CTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSITIONREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCALCHUMENSALARY SET  NUMBERGEN = ? , CLASSIFICATIONTYPENMBR = ? , POSITIONNAME = ? , TIMEGENMONTH = ? , TIMEGEN = ? , SALARYMONTH = ? , PRICEHOUR = ? , SALARYHOUR = ? , SALARYBONUS = ? , SALARYSURCHARGE = ? , SALARYPREMIUM = ? , SALARYADDITIONAL = ? , SALARYTOTALBONUS = ? , SALARYTOTAL = ? , PERCENTBONUS = ? , PERCENTSURCHARGE = ? , PERCENTPREMIUM = ? , PERCENTADDITIONAL = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLAN2CTYPEREFCODE = ? , POSITIONREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCALCHUMENSALARY SET ";
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
					if (anObject.numberGen != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.numberGen);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.classificationTypeNumber);
					statement.setString(3,anObject.positionName);
					if (anObject.timeGenMonth != null) {
						anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.timeGenMonth);
					if (anObject.timeGen != null) {
						anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.timeGen);
					if (anObject.salaryMonth != null) {
						anObject.salaryMonth = anObject.salaryMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6,anObject.salaryMonth);
					if (anObject.priceHour != null) {
						anObject.priceHour = anObject.priceHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7,anObject.priceHour);
					if (anObject.salaryHour != null) {
						anObject.salaryHour = anObject.salaryHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8,anObject.salaryHour);
					if (anObject.salaryBonus != null) {
						anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9,anObject.salaryBonus);
					if (anObject.salarySurcharge != null) {
						anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10,anObject.salarySurcharge);
					if (anObject.salaryPremium != null) {
						anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11,anObject.salaryPremium);
					if (anObject.salaryAdditional != null) {
						anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12,anObject.salaryAdditional);
					if (anObject.salaryTotalBonus != null) {
						anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.salaryTotalBonus);
					if (anObject.salaryTotal != null) {
						anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14,anObject.salaryTotal);
					if (anObject.percentBonus != null) {
						anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15,anObject.percentBonus);
					if (anObject.percentSurcharge != null) {
						anObject.percentSurcharge = anObject.percentSurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16,anObject.percentSurcharge);
					if (anObject.percentPremium != null) {
						anObject.percentPremium = anObject.percentPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17,anObject.percentPremium);
					if (anObject.percentAdditional != null) {
						anObject.percentAdditional = anObject.percentAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18,anObject.percentAdditional);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(19,null);
					} else {
						statement.setBigDecimal(19,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(20,anObject.planRef.code);
					} else {
						statement.setNull(20,java.sql.Types.INTEGER);
					}
					if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(21,anObject.plan2CTypeRef.code);
					} else {
						statement.setNull(21,java.sql.Types.INTEGER);
					}
					if (anObject.positionRef.code != Integer.MIN_VALUE) {
						statement.setInt(22,anObject.positionRef.code);
					} else {
						statement.setNull(22,java.sql.Types.INTEGER);
					}
					statement.setInt(23,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.numberGen);
							continue;
						}
						if("CLASSIFICATIONTYPENUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.classificationTypeNumber);
							continue;
						}
						if("POSITIONNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.positionName);
							continue;
						}
						if("TIMEGENMONTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeGenMonth != null) {
								anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeGenMonth);
							continue;
						}
						if("TIMEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeGen != null) {
								anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeGen);
							continue;
						}
						if("SALARYMONTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryMonth != null) {
								anObject.salaryMonth = anObject.salaryMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryMonth);
							continue;
						}
						if("PRICEHOUR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceHour != null) {
								anObject.priceHour = anObject.priceHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.priceHour);
							continue;
						}
						if("SALARYHOUR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryHour != null) {
								anObject.salaryHour = anObject.salaryHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryHour);
							continue;
						}
						if("SALARYBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryBonus != null) {
								anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryBonus);
							continue;
						}
						if("SALARYSURCHARGE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salarySurcharge != null) {
								anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salarySurcharge);
							continue;
						}
						if("SALARYPREMIUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryPremium != null) {
								anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryPremium);
							continue;
						}
						if("SALARYADDITIONAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryAdditional != null) {
								anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryAdditional);
							continue;
						}
						if("SALARYTOTALBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryTotalBonus != null) {
								anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryTotalBonus);
							continue;
						}
						if("SALARYTOTAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryTotal != null) {
								anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryTotal);
							continue;
						}
						if("PERCENTBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentBonus != null) {
								anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.percentBonus);
							continue;
						}
						if("PERCENTSURCHARGE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentSurcharge != null) {
								anObject.percentSurcharge = anObject.percentSurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.percentSurcharge);
							continue;
						}
						if("PERCENTPREMIUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentPremium != null) {
								anObject.percentPremium = anObject.percentPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.percentPremium);
							continue;
						}
						if("PERCENTADDITIONAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentAdditional != null) {
								anObject.percentAdditional = anObject.percentAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.percentAdditional);
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
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLAN2CTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.plan2CTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("POSITIONREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.positionRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.positionRef.code);
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

	} // end of save(ENCalcHumenSalary anObject,String[] anAttributes)


	public ENCalcHumenSalaryShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCalcHumenSalary filterObject = new ENCalcHumenSalary();
		Vector<ENCalcHumenSalaryShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCalcHumenSalaryShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENCalcHumenSalary filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.classificationTypeNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.positionName, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeGenMonth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryMonth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceHour, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryHour, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salarySurcharge, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryPremium, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryAdditional, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryTotalBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryTotal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentSurcharge, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentPremium, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentAdditional, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.plan2CTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.positionRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENCalcHumenSalaryFilter filter) {
		String out = buildCondition((ENCalcHumenSalary)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCalcHumenSalary filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCalcHumenSalary.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.numberGen, ENCalcHumenSalary.numberGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.classificationTypeNumber, ENCalcHumenSalary.classificationTypeNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.positionName, ENCalcHumenSalary.positionName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeGenMonth, ENCalcHumenSalary.timeGenMonth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeGen, ENCalcHumenSalary.timeGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryMonth, ENCalcHumenSalary.salaryMonth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceHour, ENCalcHumenSalary.priceHour_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryHour, ENCalcHumenSalary.salaryHour_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryBonus, ENCalcHumenSalary.salaryBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salarySurcharge, ENCalcHumenSalary.salarySurcharge_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryPremium, ENCalcHumenSalary.salaryPremium_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryAdditional, ENCalcHumenSalary.salaryAdditional_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryTotalBonus, ENCalcHumenSalary.salaryTotalBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryTotal, ENCalcHumenSalary.salaryTotal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentBonus, ENCalcHumenSalary.percentBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentSurcharge, ENCalcHumenSalary.percentSurcharge_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentPremium, ENCalcHumenSalary.percentPremium_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentAdditional, ENCalcHumenSalary.percentAdditional_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENCalcHumenSalary.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENCalcHumenSalary.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.plan2CTypeRef.code, ENCalcHumenSalary.plan2CTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.positionRef.code, ENCalcHumenSalary.positionRef_QFielld, out);
		}
		return out;
	}

	public ENCalcHumenSalaryShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCalcHumenSalaryShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCalcHumenSalaryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCalcHumenSalaryShortList getFilteredList(ENCalcHumenSalary filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCalcHumenSalaryShortList getScrollableFilteredList(ENCalcHumenSalary aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCalcHumenSalaryShortList getScrollableFilteredList(ENCalcHumenSalary aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCalcHumenSalaryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCalcHumenSalaryShortList getScrollableFilteredList(ENCalcHumenSalaryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENCalcHumenSalaryShortList getScrollableFilteredList(ENCalcHumenSalaryFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENCalcHumenSalaryShortList getScrollableFilteredList(ENCalcHumenSalary aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcHumenSalaryShortList result = new ENCalcHumenSalaryShortList();
		ENCalcHumenSalaryShort anObject;
		result.list = new Vector<ENCalcHumenSalaryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCHUMENSALARY.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCHUMENSALARY.CODE"+
			",ENCALCHUMENSALARY.NUMBERGEN"+
			",ENCALCHUMENSALARY.CLASSIFICATIONTYPENMBR"+
			",ENCALCHUMENSALARY.POSITIONNAME"+
			",ENCALCHUMENSALARY.TIMEGENMONTH"+
			",ENCALCHUMENSALARY.TIMEGEN"+
			",ENCALCHUMENSALARY.SALARYMONTH"+
			",ENCALCHUMENSALARY.PRICEHOUR"+
			",ENCALCHUMENSALARY.SALARYHOUR"+
			",ENCALCHUMENSALARY.SALARYBONUS"+
			",ENCALCHUMENSALARY.SALARYSURCHARGE"+
			",ENCALCHUMENSALARY.SALARYPREMIUM"+
			",ENCALCHUMENSALARY.SALARYADDITIONAL"+
			",ENCALCHUMENSALARY.SALARYTOTALBONUS"+
			",ENCALCHUMENSALARY.SALARYTOTAL"+
			",ENCALCHUMENSALARY.PERCENTBONUS"+
			",ENCALCHUMENSALARY.PERCENTSURCHARGE"+
			",ENCALCHUMENSALARY.PERCENTPREMIUM"+
			",ENCALCHUMENSALARY.PERCENTADDITIONAL"+
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
			", ENPLANWORK2CLASSFCTNTP.CODE " +
			", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
			", ENPLANWORK2CLASSFCTNTP.USERGEN " +
			", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
			", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
			", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
			", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
			", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
			", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
			", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
			", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
			", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
			", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
			", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
			", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
			", ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT " +
			", TKPOSITION.CODE " +
			", TKPOSITION.NAME " +
			", TKPOSITION.SAFETYGROUP " +
			", TKPOSITION.RANK " +
			", TKPOSITION.SHORTNAME " +
		" FROM ENCALCHUMENSALARY " +
			", ENPLANWORK " +
			", ENPLANWORK2CLASSFCTNTP " +
			", TKPOSITION " +
		"";
		whereStr = " ENPLANWORK.CODE = ENCALCHUMENSALARY.PLANREFCODE" ; //+
		whereStr += " AND ENPLANWORK2CLASSFCTNTP.CODE = ENCALCHUMENSALARY.PLAN2CTYPEREFCODE" ; //+
		whereStr += " AND TKPOSITION.CODE = ENCALCHUMENSALARY.POSITIONREFCODE" ; //+

	
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
				anObject = new ENCalcHumenSalaryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.numberGen = Integer.MIN_VALUE;
				}
				anObject.classificationTypeNumber = set.getString(3);
				anObject.positionName = set.getString(4);
				anObject.timeGenMonth = set.getBigDecimal(5);
				if(anObject.timeGenMonth != null) {
					anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeGen = set.getBigDecimal(6);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryMonth = set.getBigDecimal(7);
				if(anObject.salaryMonth != null) {
					anObject.salaryMonth = anObject.salaryMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceHour = set.getBigDecimal(8);
				if(anObject.priceHour != null) {
					anObject.priceHour = anObject.priceHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHour = set.getBigDecimal(9);
				if(anObject.salaryHour != null) {
					anObject.salaryHour = anObject.salaryHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryBonus = set.getBigDecimal(10);
				if(anObject.salaryBonus != null) {
					anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salarySurcharge = set.getBigDecimal(11);
				if(anObject.salarySurcharge != null) {
					anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryPremium = set.getBigDecimal(12);
				if(anObject.salaryPremium != null) {
					anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryAdditional = set.getBigDecimal(13);
				if(anObject.salaryAdditional != null) {
					anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalBonus = set.getBigDecimal(14);
				if(anObject.salaryTotalBonus != null) {
					anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotal = set.getBigDecimal(15);
				if(anObject.salaryTotal != null) {
					anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentBonus = set.getBigDecimal(16);
				if(anObject.percentBonus != null) {
					anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentSurcharge = set.getBigDecimal(17);
				if(anObject.percentSurcharge != null) {
					anObject.percentSurcharge = anObject.percentSurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentPremium = set.getBigDecimal(18);
				if(anObject.percentPremium != null) {
					anObject.percentPremium = anObject.percentPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentAdditional = set.getBigDecimal(19);
				if(anObject.percentAdditional != null) {
					anObject.percentAdditional = anObject.percentAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.planRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(21);
				anObject.planRefDateStart = set.getDate(22);
				anObject.planRefDateFinal = set.getDate(23);
				anObject.planRefYearGen = set.getInt(24);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(25);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(26);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(27);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(28);
				anObject.planRefDateEdit = set.getDate(29);
				anObject.planRefWorkOrderNumber = set.getString(30);
				anObject.planRefDateWorkOrder = set.getDate(31);
				anObject.planRefPriConnectionNumber = set.getString(32);
				anObject.planRefDateEndPriConnection = set.getDate(33);
				anObject.planRefInvestWorksDescription = set.getString(34);
				anObject.planRefServicesFSideFinId = set.getInt(35);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(36);
				anObject.planRefTotalTimeHours = set.getBigDecimal(37);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(38);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(39);
				anObject.plan2CTypeRefCode = set.getInt(40);
				if(set.wasNull()) {
					anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefCountGen = set.getBigDecimal(41);
				if(anObject.plan2CTypeRefCountGen != null) {
					anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefUserGen = set.getString(42);
				anObject.plan2CTypeRefDateEdit = set.getDate(43);
				anObject.plan2CTypeRefMachineHours = set.getBigDecimal(44);
				if(anObject.plan2CTypeRefMachineHours != null) {
					anObject.plan2CTypeRefMachineHours = anObject.plan2CTypeRefMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefRelocationKm = set.getBigDecimal(45);
				if(anObject.plan2CTypeRefRelocationKm != null) {
					anObject.plan2CTypeRefRelocationKm = anObject.plan2CTypeRefRelocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefTransportationLoad = set.getBigDecimal(46);
				if(anObject.plan2CTypeRefTransportationLoad != null) {
					anObject.plan2CTypeRefTransportationLoad = anObject.plan2CTypeRefTransportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefIsPrintOnKmOrMH = set.getInt(47);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsPrintOnKmOrMH = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefCostWorksContractor = set.getBigDecimal(48);
				if(anObject.plan2CTypeRefCostWorksContractor != null) {
					anObject.plan2CTypeRefCostWorksContractor = anObject.plan2CTypeRefCostWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefDateGen = set.getDate(49);
				anObject.plan2CTypeRefTimeStart = set.getTimestamp(50);
				anObject.plan2CTypeRefTimeFinal = set.getTimestamp(51);
				anObject.plan2CTypeRefCodeVirtualBrigade = set.getInt(52);
				if(set.wasNull()) {
					anObject.plan2CTypeRefCodeVirtualBrigade = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefIsJobsByTime = set.getInt(53);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsJobsByTime = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefIsVisitClient = set.getInt(54);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsVisitClient = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefProductionExpensesPercent = set.getBigDecimal(55);
				if(anObject.plan2CTypeRefProductionExpensesPercent != null) {
					anObject.plan2CTypeRefProductionExpensesPercent = anObject.plan2CTypeRefProductionExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.positionRefCode = set.getInt(56);
				if(set.wasNull()) {
					anObject.positionRefCode = Integer.MIN_VALUE;
				}
				anObject.positionRefName = set.getString(57);
				anObject.positionRefSafetyGroup = set.getString(58);
				anObject.positionRefRank = set.getString(59);
				anObject.positionRefShortName = set.getString(60);

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
	
	public int[] getFilteredCodeArray(ENCalcHumenSalaryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCalcHumenSalaryFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCalcHumenSalary aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCALCHUMENSALARY.CODE FROM ENCALCHUMENSALARY";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCHUMENSALARY.CODE";
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

	public ENCalcHumenSalary getObject(int uid) throws PersistenceException {
		ENCalcHumenSalary result = new ENCalcHumenSalary();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENCalcHumenSalary anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENCALCHUMENSALARY.CODE, ENCALCHUMENSALARY.NUMBERGEN, ENCALCHUMENSALARY.CLASSIFICATIONTYPENMBR, ENCALCHUMENSALARY.POSITIONNAME, ENCALCHUMENSALARY.TIMEGENMONTH, ENCALCHUMENSALARY.TIMEGEN, ENCALCHUMENSALARY.SALARYMONTH, ENCALCHUMENSALARY.PRICEHOUR, ENCALCHUMENSALARY.SALARYHOUR, ENCALCHUMENSALARY.SALARYBONUS, ENCALCHUMENSALARY.SALARYSURCHARGE, ENCALCHUMENSALARY.SALARYPREMIUM, ENCALCHUMENSALARY.SALARYADDITIONAL, ENCALCHUMENSALARY.SALARYTOTALBONUS, ENCALCHUMENSALARY.SALARYTOTAL, ENCALCHUMENSALARY.PERCENTBONUS, ENCALCHUMENSALARY.PERCENTSURCHARGE, ENCALCHUMENSALARY.PERCENTPREMIUM, ENCALCHUMENSALARY.PERCENTADDITIONAL, ENCALCHUMENSALARY.MODIFY_TIME, ENCALCHUMENSALARY.PLANREFCODE, ENCALCHUMENSALARY.PLAN2CTYPEREFCODE, ENCALCHUMENSALARY.POSITIONREFCODE "
			+" FROM ENCALCHUMENSALARY WHERE ENCALCHUMENSALARY.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberGen = set.getInt(2);
				if (set.wasNull()) {
					anObject.numberGen = Integer.MIN_VALUE;
				}
				anObject.classificationTypeNumber = set.getString(3);
				anObject.positionName = set.getString(4);
				anObject.timeGenMonth = set.getBigDecimal(5);
				if(anObject.timeGenMonth != null) {
					anObject.timeGenMonth = anObject.timeGenMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeGen = set.getBigDecimal(6);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryMonth = set.getBigDecimal(7);
				if(anObject.salaryMonth != null) {
					anObject.salaryMonth = anObject.salaryMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceHour = set.getBigDecimal(8);
				if(anObject.priceHour != null) {
					anObject.priceHour = anObject.priceHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHour = set.getBigDecimal(9);
				if(anObject.salaryHour != null) {
					anObject.salaryHour = anObject.salaryHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryBonus = set.getBigDecimal(10);
				if(anObject.salaryBonus != null) {
					anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salarySurcharge = set.getBigDecimal(11);
				if(anObject.salarySurcharge != null) {
					anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryPremium = set.getBigDecimal(12);
				if(anObject.salaryPremium != null) {
					anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryAdditional = set.getBigDecimal(13);
				if(anObject.salaryAdditional != null) {
					anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalBonus = set.getBigDecimal(14);
				if(anObject.salaryTotalBonus != null) {
					anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotal = set.getBigDecimal(15);
				if(anObject.salaryTotal != null) {
					anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentBonus = set.getBigDecimal(16);
				if(anObject.percentBonus != null) {
					anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentSurcharge = set.getBigDecimal(17);
				if(anObject.percentSurcharge != null) {
					anObject.percentSurcharge = anObject.percentSurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentPremium = set.getBigDecimal(18);
				if(anObject.percentPremium != null) {
					anObject.percentPremium = anObject.percentPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentAdditional = set.getBigDecimal(19);
				if(anObject.percentAdditional != null) {
					anObject.percentAdditional = anObject.percentAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(20);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.plan2CTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.positionRef.code = set.getInt(23);
				if (set.wasNull()) {
					anObject.positionRef.code = Integer.MIN_VALUE;
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
					anObject.setPlan2CTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.plan2CTypeRef.code));
				}
				if(anObject.positionRef.code != Integer.MIN_VALUE) {
					anObject.setPositionRef(
						new com.ksoe.techcard.dataminer.generated.TKPositionDAOGen(connection,getUserProfile()).getRef(anObject.positionRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENCalcHumenSalaryRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCalcHumenSalaryRef ref = new com.ksoe.energynet.valueobject.references.ENCalcHumenSalaryRef();
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

		selectStr = "DELETE FROM  ENCALCHUMENSALARY WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCalcHumenSalary object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCalcHumenSalary.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcHumenSalary.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENCalcHumenSalary.remove%} access denied");
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
	
	public long count(ENCalcHumenSalaryFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCalcHumenSalaryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCalcHumenSalaryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCALCHUMENSALARY", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCalcHumenSalaryFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCALCHUMENSALARY");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcHumenSalary.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENCalcHumenSalary.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCALCHUMENSALARY.CODE FROM  ENCALCHUMENSALARY WHERE  ENCALCHUMENSALARY.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCALCHUMENSALARY.CODE");
		_checkConditionToken(condition,"numbergen","ENCALCHUMENSALARY.NUMBERGEN");
		_checkConditionToken(condition,"classificationtypenumber","ENCALCHUMENSALARY.CLASSIFICATIONTYPENMBR");
		_checkConditionToken(condition,"positionname","ENCALCHUMENSALARY.POSITIONNAME");
		_checkConditionToken(condition,"timegenmonth","ENCALCHUMENSALARY.TIMEGENMONTH");
		_checkConditionToken(condition,"timegen","ENCALCHUMENSALARY.TIMEGEN");
		_checkConditionToken(condition,"salarymonth","ENCALCHUMENSALARY.SALARYMONTH");
		_checkConditionToken(condition,"pricehour","ENCALCHUMENSALARY.PRICEHOUR");
		_checkConditionToken(condition,"salaryhour","ENCALCHUMENSALARY.SALARYHOUR");
		_checkConditionToken(condition,"salarybonus","ENCALCHUMENSALARY.SALARYBONUS");
		_checkConditionToken(condition,"salarysurcharge","ENCALCHUMENSALARY.SALARYSURCHARGE");
		_checkConditionToken(condition,"salarypremium","ENCALCHUMENSALARY.SALARYPREMIUM");
		_checkConditionToken(condition,"salaryadditional","ENCALCHUMENSALARY.SALARYADDITIONAL");
		_checkConditionToken(condition,"salarytotalbonus","ENCALCHUMENSALARY.SALARYTOTALBONUS");
		_checkConditionToken(condition,"salarytotal","ENCALCHUMENSALARY.SALARYTOTAL");
		_checkConditionToken(condition,"percentbonus","ENCALCHUMENSALARY.PERCENTBONUS");
		_checkConditionToken(condition,"percentsurcharge","ENCALCHUMENSALARY.PERCENTSURCHARGE");
		_checkConditionToken(condition,"percentpremium","ENCALCHUMENSALARY.PERCENTPREMIUM");
		_checkConditionToken(condition,"percentadditional","ENCALCHUMENSALARY.PERCENTADDITIONAL");
		_checkConditionToken(condition,"modify_time","ENCALCHUMENSALARY.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"plan2ctyperef","PLAN2CTYPEREFCODE");
		_checkConditionToken(condition,"plan2ctyperef.code","PLAN2CTYPEREFCODE");
		_checkConditionToken(condition,"positionref","POSITIONREFCODE");
		_checkConditionToken(condition,"positionref.code","POSITIONREFCODE");
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
	
	private void _collectAutoIncrementFields(ENCalcHumenSalary anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCALCHUMENSALARY", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCALCHUMENSALARY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCALCHUMENSALARY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCALCHUMENSALARY");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCalcHumenSalaryDAO
