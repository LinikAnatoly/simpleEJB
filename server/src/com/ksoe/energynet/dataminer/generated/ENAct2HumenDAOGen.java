
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
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
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.brief.ENAct2HumenShort;
import com.ksoe.energynet.valueobject.lists.ENAct2HumenShortList;


/**
 * DAO Object for ENAct2Humen;
 *
 */

public class ENAct2HumenDAOGen extends GenericDataMiner {

	public ENAct2HumenDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAct2HumenDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAct2Humen inObject) throws PersistenceException {
		ENAct2Humen obj = new ENAct2Humen();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.orederNum != obj.orederNum){
					return false;
				}

		if(inObject.tabNumber == null && obj.tabNumber == null){}
		else
			if(inObject.tabNumber == null || obj.tabNumber == null) return false;
			else
				if ( ! inObject.tabNumber.equals(obj.tabNumber)){
					return false;
				}

		if(inObject.fio == null && obj.fio == null){}
		else
			if(inObject.fio == null || obj.fio == null) return false;
			else
				if ( ! inObject.fio.equals(obj.fio)){
					return false;
				}

		if(inObject.salary == null && obj.salary == null){}
		else
			if(inObject.salary == null || obj.salary == null) return false;
			else
				if ( ! inObject.salary.equals(obj.salary)){
					return false;
				}

		if(inObject.timeMonth == null && obj.timeMonth == null){}
		else
			if(inObject.timeMonth == null || obj.timeMonth == null) return false;
			else
				if ( ! inObject.timeMonth.equals(obj.timeMonth)){
					return false;
				}

		if(inObject.daysMonth == null && obj.daysMonth == null){}
		else
			if(inObject.daysMonth == null || obj.daysMonth == null) return false;
			else
				if ( ! inObject.daysMonth.equals(obj.daysMonth)){
					return false;
				}

		if(inObject.salaryHours == null && obj.salaryHours == null){}
		else
			if(inObject.salaryHours == null || obj.salaryHours == null) return false;
			else
				if ( ! inObject.salaryHours.equals(obj.salaryHours)){
					return false;
				}

		if(inObject.timeWork == null && obj.timeWork == null){}
		else
			if(inObject.timeWork == null || obj.timeWork == null) return false;
			else
				if ( ! inObject.timeWork.equals(obj.timeWork)){
					return false;
				}

		if(inObject.timeObjectWork == null && obj.timeObjectWork == null){}
		else
			if(inObject.timeObjectWork == null || obj.timeObjectWork == null) return false;
			else
				if ( ! inObject.timeObjectWork.equals(obj.timeObjectWork)){
					return false;
				}

		if(inObject.timeWorkFact == null && obj.timeWorkFact == null){}
		else
			if(inObject.timeWorkFact == null || obj.timeWorkFact == null) return false;
			else
				if ( ! inObject.timeWorkFact.equals(obj.timeWorkFact)){
					return false;
				}

		if(inObject.timeDelivery == null && obj.timeDelivery == null){}
		else
			if(inObject.timeDelivery == null || obj.timeDelivery == null) return false;
			else
				if ( ! inObject.timeDelivery.equals(obj.timeDelivery)){
					return false;
				}

		if(inObject.paysWork == null && obj.paysWork == null){}
		else
			if(inObject.paysWork == null || obj.paysWork == null) return false;
			else
				if ( ! inObject.paysWork.equals(obj.paysWork)){
					return false;
				}

		if(inObject.bonus == null && obj.bonus == null){}
		else
			if(inObject.bonus == null || obj.bonus == null) return false;
			else
				if ( ! inObject.bonus.equals(obj.bonus)){
					return false;
				}

		if(inObject.salaryHoursBonus == null && obj.salaryHoursBonus == null){}
		else
			if(inObject.salaryHoursBonus == null || obj.salaryHoursBonus == null) return false;
			else
				if ( ! inObject.salaryHoursBonus.equals(obj.salaryHoursBonus)){
					return false;
				}

		if(inObject.paysWorkBonus == null && obj.paysWorkBonus == null){}
		else
			if(inObject.paysWorkBonus == null || obj.paysWorkBonus == null) return false;
			else
				if ( ! inObject.paysWorkBonus.equals(obj.paysWorkBonus)){
					return false;
				}

		if(inObject.chargePercent == null && obj.chargePercent == null){}
		else
			if(inObject.chargePercent == null || obj.chargePercent == null) return false;
			else
				if ( ! inObject.chargePercent.equals(obj.chargePercent)){
					return false;
				}

		if(inObject.chargeSum == null && obj.chargeSum == null){}
		else
			if(inObject.chargeSum == null || obj.chargeSum == null) return false;
			else
				if ( ! inObject.chargeSum.equals(obj.chargeSum)){
					return false;
				}

		if(inObject.balans == null && obj.balans == null){}
		else
			if(inObject.balans == null || obj.balans == null) return false;
			else
				if ( ! inObject.balans.equals(obj.balans)){
					return false;
				}

		if(inObject.podrcod == null && obj.podrcod == null){}
		else
			if(inObject.podrcod == null || obj.podrcod == null) return false;
			else
				if ( ! inObject.podrcod.equals(obj.podrcod)){
					return false;
				}

		if(inObject.cehId == null && obj.cehId == null){}
		else
			if(inObject.cehId == null || obj.cehId == null) return false;
			else
				if ( ! inObject.cehId.equals(obj.cehId)){
					return false;
				}

		if(inObject.payWorkCou == null && obj.payWorkCou == null){}
		else
			if(inObject.payWorkCou == null || obj.payWorkCou == null) return false;
			else
				if ( ! inObject.payWorkCou.equals(obj.payWorkCou)){
					return false;
				}
		if (inObject.humenKindRef.code != obj.humenKindRef.code){
			return false;
		}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		if (inObject.chargeRef.code != obj.chargeRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAct2Humen anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAct2Humen anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACT2HUMEN (CODE,OREDERNUM,TABNUMBER,FIO,SALARY,TIMEMONTH,DAYSMONTH,SALARYHOURS,TIMEWORK,TIMEOBJECTWORK,TIMEWORKFACT,TIMEDELIVERY,PAYSWORK,BONUS,SALARYHOURSBONUS,PAYSWORKBONUS,CHARGEPERCENT,CHARGESUM,BALANS,PODRCOD,CEHID,MODIFY_TIME,PAYWORKCOU,HUMENKINDREFCODE,ACTREFCODE,CHARGEREFCODE,PLANREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.orederNum != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.orederNum);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.tabNumber);
			statement.setString(4,anObject.fio);
			if (anObject.salary != null) {
				anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.salary);
			if (anObject.timeMonth != null) {
				anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.timeMonth);
			if (anObject.daysMonth != null) {
				anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7,anObject.daysMonth);
			if (anObject.salaryHours != null) {
				anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8,anObject.salaryHours);
			if (anObject.timeWork != null) {
				anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9,anObject.timeWork);
			if (anObject.timeObjectWork != null) {
				anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10,anObject.timeObjectWork);
			if (anObject.timeWorkFact != null) {
				anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11,anObject.timeWorkFact);
			if (anObject.timeDelivery != null) {
				anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12,anObject.timeDelivery);
			if (anObject.paysWork != null) {
				anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13,anObject.paysWork);
			if (anObject.bonus != null) {
				anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.bonus);
			if (anObject.salaryHoursBonus != null) {
				anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15,anObject.salaryHoursBonus);
			if (anObject.paysWorkBonus != null) {
				anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16,anObject.paysWorkBonus);
			if (anObject.chargePercent != null) {
				anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17,anObject.chargePercent);
			if (anObject.chargeSum != null) {
				anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18,anObject.chargeSum);
			statement.setString(19,anObject.balans);
			statement.setString(20,anObject.podrcod);
			statement.setString(21,anObject.cehId);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(22,null);
			} else {
				statement.setBigDecimal(22,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.payWorkCou != null) {
				anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23,anObject.payWorkCou);
			if (anObject.humenKindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENHumenItemKindDAOGen(connection,getUserProfile()).exists(anObject.humenKindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2Humen.humenKindRef.code%} = {%"+anObject.humenKindRef.code+"%}");
				}
				statement.setInt(24,anObject.humenKindRef.code);
			} else {
				statement.setNull(24,java.sql.Types.INTEGER);
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2Humen.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(25,anObject.actRef.code);
			} else {
				statement.setNull(25,java.sql.Types.INTEGER);
			}
			if (anObject.chargeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).exists(anObject.chargeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2Humen.chargeRef.code%} = {%"+anObject.chargeRef.code+"%}");
				}
				statement.setInt(26,anObject.chargeRef.code);
			} else {
				statement.setNull(26,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2Humen.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(27,anObject.planRef.code);
			} else {
				statement.setNull(27,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENAct2HumenDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAct2Humen anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAct2Humen anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENAct2Humen oldObject = new ENAct2Humen();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENAct2Humen.modify_time_Field+" FROM  ENACT2HUMEN WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("OREDERNUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TABNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEMONTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DAYSMONTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEOBJECTWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEWORKFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEDELIVERY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PAYSWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYHOURSBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PAYSWORKBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHARGEPERCENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHARGESUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BALANS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PODRCOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CEHID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PAYWORKCOU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HUMENKINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHARGEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACT2HUMEN SET  OREDERNUM = ? , TABNUMBER = ? , FIO = ? , SALARY = ? , TIMEMONTH = ? , DAYSMONTH = ? , SALARYHOURS = ? , TIMEWORK = ? , TIMEOBJECTWORK = ? , TIMEWORKFACT = ? , TIMEDELIVERY = ? , PAYSWORK = ? , BONUS = ? , SALARYHOURSBONUS = ? , PAYSWORKBONUS = ? , CHARGEPERCENT = ? , CHARGESUM = ? , BALANS = ? , PODRCOD = ? , CEHID = ? , MODIFY_TIME = ? , PAYWORKCOU = ? , HUMENKINDREFCODE = ? , ACTREFCODE = ? , CHARGEREFCODE = ? , PLANREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACT2HUMEN SET ";
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
					if (anObject.orederNum != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.orederNum);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.tabNumber);
					statement.setString(3,anObject.fio);
					if (anObject.salary != null) {
						anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.salary);
					if (anObject.timeMonth != null) {
						anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.timeMonth);
					if (anObject.daysMonth != null) {
						anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6,anObject.daysMonth);
					if (anObject.salaryHours != null) {
						anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7,anObject.salaryHours);
					if (anObject.timeWork != null) {
						anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8,anObject.timeWork);
					if (anObject.timeObjectWork != null) {
						anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9,anObject.timeObjectWork);
					if (anObject.timeWorkFact != null) {
						anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10,anObject.timeWorkFact);
					if (anObject.timeDelivery != null) {
						anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11,anObject.timeDelivery);
					if (anObject.paysWork != null) {
						anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12,anObject.paysWork);
					if (anObject.bonus != null) {
						anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.bonus);
					if (anObject.salaryHoursBonus != null) {
						anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14,anObject.salaryHoursBonus);
					if (anObject.paysWorkBonus != null) {
						anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15,anObject.paysWorkBonus);
					if (anObject.chargePercent != null) {
						anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16,anObject.chargePercent);
					if (anObject.chargeSum != null) {
						anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17,anObject.chargeSum);
					statement.setString(18,anObject.balans);
					statement.setString(19,anObject.podrcod);
					statement.setString(20,anObject.cehId);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(21,null);
					} else {
						statement.setBigDecimal(21,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.payWorkCou != null) {
						anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22,anObject.payWorkCou);
					if (anObject.humenKindRef.code != Integer.MIN_VALUE) {
						statement.setInt(23,anObject.humenKindRef.code);
					} else {
						statement.setNull(23,java.sql.Types.INTEGER);
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(24,anObject.actRef.code);
					} else {
						statement.setNull(24,java.sql.Types.INTEGER);
					}
					if (anObject.chargeRef.code != Integer.MIN_VALUE) {
						statement.setInt(25,anObject.chargeRef.code);
					} else {
						statement.setNull(25,java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(26,anObject.planRef.code);
					} else {
						statement.setNull(26,java.sql.Types.INTEGER);
					}
					statement.setInt(27,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("OREDERNUM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.orederNum);
							continue;
						}
						if("TABNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.tabNumber);
							continue;
						}
						if("FIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.fio);
							continue;
						}
						if("SALARY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salary != null) {
								anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salary);
							continue;
						}
						if("TIMEMONTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeMonth != null) {
								anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeMonth);
							continue;
						}
						if("DAYSMONTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.daysMonth != null) {
								anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.daysMonth);
							continue;
						}
						if("SALARYHOURS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryHours != null) {
								anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryHours);
							continue;
						}
						if("TIMEWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeWork != null) {
								anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeWork);
							continue;
						}
						if("TIMEOBJECTWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeObjectWork != null) {
								anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeObjectWork);
							continue;
						}
						if("TIMEWORKFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeWorkFact != null) {
								anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeWorkFact);
							continue;
						}
						if("TIMEDELIVERY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeDelivery != null) {
								anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeDelivery);
							continue;
						}
						if("PAYSWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.paysWork != null) {
								anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.paysWork);
							continue;
						}
						if("BONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.bonus != null) {
								anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.bonus);
							continue;
						}
						if("SALARYHOURSBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryHoursBonus != null) {
								anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryHoursBonus);
							continue;
						}
						if("PAYSWORKBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.paysWorkBonus != null) {
								anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.paysWorkBonus);
							continue;
						}
						if("CHARGEPERCENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.chargePercent != null) {
								anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.chargePercent);
							continue;
						}
						if("CHARGESUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.chargeSum != null) {
								anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.chargeSum);
							continue;
						}
						if("BALANS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.balans);
							continue;
						}
						if("PODRCOD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.podrcod);
							continue;
						}
						if("CEHID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.cehId);
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
						if("PAYWORKCOU".compareTo((String)fields.get(i)) == 0) {
							if (anObject.payWorkCou != null) {
								anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.payWorkCou);
							continue;
						}
						if("HUMENKINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.humenKindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.humenKindRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CHARGEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.chargeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.chargeRef.code);
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

	} // end of save(ENAct2Humen anObject,String[] anAttributes)


	public ENAct2HumenShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAct2Humen filterObject = new ENAct2Humen();
		Vector<ENAct2HumenShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAct2HumenShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAct2Humen filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.orederNum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tabNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.fio, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salary, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeMonth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.daysMonth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryHours, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeObjectWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeWorkFact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeDelivery, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.paysWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.bonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryHoursBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.paysWorkBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.chargePercent, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.chargeSum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.balans, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.podrcod, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.cehId, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.payWorkCou, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.humenKindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.chargeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAct2HumenFilter filter) {
		String out = buildCondition((ENAct2Humen)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAct2Humen filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAct2Humen.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.orederNum, ENAct2Humen.orederNum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tabNumber, ENAct2Humen.tabNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.fio, ENAct2Humen.fio_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salary, ENAct2Humen.salary_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeMonth, ENAct2Humen.timeMonth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.daysMonth, ENAct2Humen.daysMonth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryHours, ENAct2Humen.salaryHours_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeWork, ENAct2Humen.timeWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeObjectWork, ENAct2Humen.timeObjectWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeWorkFact, ENAct2Humen.timeWorkFact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeDelivery, ENAct2Humen.timeDelivery_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.paysWork, ENAct2Humen.paysWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.bonus, ENAct2Humen.bonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryHoursBonus, ENAct2Humen.salaryHoursBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.paysWorkBonus, ENAct2Humen.paysWorkBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.chargePercent, ENAct2Humen.chargePercent_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.chargeSum, ENAct2Humen.chargeSum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.balans, ENAct2Humen.balans_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.podrcod, ENAct2Humen.podrcod_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.cehId, ENAct2Humen.cehId_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENAct2Humen.modify_time_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.payWorkCou, ENAct2Humen.payWorkCou_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.humenKindRef.code, ENAct2Humen.humenKindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENAct2Humen.actRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.chargeRef.code, ENAct2Humen.chargeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENAct2Humen.planRef_QFielld, out);
		}
		return out;
	}

	public ENAct2HumenShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAct2HumenShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAct2HumenShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAct2HumenShortList getFilteredList(ENAct2Humen filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAct2HumenShortList getScrollableFilteredList(ENAct2Humen aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAct2HumenShortList getScrollableFilteredList(ENAct2Humen aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAct2HumenShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAct2HumenShortList getScrollableFilteredList(ENAct2HumenFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAct2HumenShortList getScrollableFilteredList(ENAct2HumenFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAct2HumenShortList getScrollableFilteredList(ENAct2Humen aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENAct2HumenShortList result = new ENAct2HumenShortList();
		ENAct2HumenShort anObject;
		result.list = new Vector<ENAct2HumenShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2HUMEN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT2HUMEN.CODE"+
			",ENACT2HUMEN.OREDERNUM"+
			",ENACT2HUMEN.TABNUMBER"+
			",ENACT2HUMEN.FIO"+
			",ENACT2HUMEN.SALARY"+
			",ENACT2HUMEN.TIMEMONTH"+
			",ENACT2HUMEN.DAYSMONTH"+
			",ENACT2HUMEN.SALARYHOURS"+
			",ENACT2HUMEN.TIMEWORK"+
			",ENACT2HUMEN.TIMEOBJECTWORK"+
			",ENACT2HUMEN.TIMEWORKFACT"+
			",ENACT2HUMEN.TIMEDELIVERY"+
			",ENACT2HUMEN.PAYSWORK"+
			",ENACT2HUMEN.BONUS"+
			",ENACT2HUMEN.SALARYHOURSBONUS"+
			",ENACT2HUMEN.PAYSWORKBONUS"+
			",ENACT2HUMEN.CHARGEPERCENT"+
			",ENACT2HUMEN.CHARGESUM"+
			",ENACT2HUMEN.BALANS"+
			",ENACT2HUMEN.PODRCOD"+
			",ENACT2HUMEN.CEHID"+
			",ENACT2HUMEN.PAYWORKCOU"+
			", ENHUMENITEMKIND.CODE " +
			", ENHUMENITEMKIND.NAME " +
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINDOCCODE " +
			", ENACT.FINDOCMECHANICCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", FINCHARGETYPE.CODE " +
			", FINCHARGETYPE.NAME " +
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
		" FROM ENACT2HUMEN " +
			", ENHUMENITEMKIND " +
			", ENACT " +
			", FINCHARGETYPE " +
			", ENPLANWORK " +
		"";
		whereStr = " ENHUMENITEMKIND.CODE = ENACT2HUMEN.HUMENKINDREFCODE" ; //+
		whereStr += " AND ENACT.CODE = ENACT2HUMEN.ACTREFCODE" ; //+
		whereStr += " AND FINCHARGETYPE.CODE = ENACT2HUMEN.CHARGEREFCODE" ; //+
		whereStr += " AND ENPLANWORK.CODE = ENACT2HUMEN.PLANREFCODE" ; //+

	
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
				anObject = new ENAct2HumenShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.orederNum = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.orederNum = Integer.MIN_VALUE;
				}
				anObject.tabNumber = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.salary = set.getBigDecimal(5);
				if(anObject.salary != null) {
					anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeMonth = set.getBigDecimal(6);
				if(anObject.timeMonth != null) {
					anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.daysMonth = set.getBigDecimal(7);
				if(anObject.daysMonth != null) {
					anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHours = set.getBigDecimal(8);
				if(anObject.salaryHours != null) {
					anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeWork = set.getBigDecimal(9);
				if(anObject.timeWork != null) {
					anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeObjectWork = set.getBigDecimal(10);
				if(anObject.timeObjectWork != null) {
					anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeWorkFact = set.getBigDecimal(11);
				if(anObject.timeWorkFact != null) {
					anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeDelivery = set.getBigDecimal(12);
				if(anObject.timeDelivery != null) {
					anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.paysWork = set.getBigDecimal(13);
				if(anObject.paysWork != null) {
					anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.bonus = set.getBigDecimal(14);
				if(anObject.bonus != null) {
					anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHoursBonus = set.getBigDecimal(15);
				if(anObject.salaryHoursBonus != null) {
					anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.paysWorkBonus = set.getBigDecimal(16);
				if(anObject.paysWorkBonus != null) {
					anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.chargePercent = set.getBigDecimal(17);
				if(anObject.chargePercent != null) {
					anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.chargeSum = set.getBigDecimal(18);
				if(anObject.chargeSum != null) {
					anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.balans = set.getString(19);
				anObject.podrcod = set.getString(20);
				anObject.cehId = set.getString(21);
				anObject.payWorkCou = set.getBigDecimal(22);
				if(anObject.payWorkCou != null) {
					anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.humenKindRefCode = set.getInt(23);
				if(set.wasNull()) {
					anObject.humenKindRefCode = Integer.MIN_VALUE;
				}
				anObject.humenKindRefName = set.getString(24);
				anObject.actRefCode = set.getInt(25);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(26);
				anObject.actRefDateGen = set.getDate(27);
				anObject.actRefFinDocCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.actRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinDocMechanicCode = set.getInt(29);
				if(set.wasNull()) {
					anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinMolName = set.getString(30);
				anObject.actRefFinMechanicName = set.getString(31);
				anObject.actRefInvNumber = set.getString(32);
				anObject.actRefUserGen = set.getString(33);
				anObject.actRefDateEdit = set.getDate(34);
				anObject.actRefDateAct = set.getDate(35);
				anObject.chargeRefCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.chargeRefCode = Integer.MIN_VALUE;
				}
				anObject.chargeRefName = set.getString(37);
				anObject.planRefCode = set.getInt(38);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(39);
				anObject.planRefDateStart = set.getDate(40);
				anObject.planRefDateFinal = set.getDate(41);
				anObject.planRefYearGen = set.getInt(42);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(43);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(44);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(45);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(46);
				anObject.planRefDateEdit = set.getDate(47);
				anObject.planRefWorkOrderNumber = set.getString(48);
				anObject.planRefDateWorkOrder = set.getDate(49);
				anObject.planRefPriConnectionNumber = set.getString(50);
				anObject.planRefDateEndPriConnection = set.getDate(51);
				anObject.planRefInvestWorksDescription = set.getString(52);
				anObject.planRefServicesFSideFinId = set.getInt(53);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(54);
				anObject.planRefTotalTimeHours = set.getBigDecimal(55);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(56);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(57);

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
	
	public int[] getFilteredCodeArray(ENAct2HumenFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENAct2HumenFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAct2Humen aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT2HUMEN.CODE FROM ENACT2HUMEN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2HUMEN.CODE";
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

	public ENAct2Humen getObject(int uid) throws PersistenceException {
		ENAct2Humen result = new ENAct2Humen();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENAct2Humen anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENACT2HUMEN.CODE, ENACT2HUMEN.OREDERNUM, ENACT2HUMEN.TABNUMBER, ENACT2HUMEN.FIO, ENACT2HUMEN.SALARY, ENACT2HUMEN.TIMEMONTH, ENACT2HUMEN.DAYSMONTH, ENACT2HUMEN.SALARYHOURS, ENACT2HUMEN.TIMEWORK, ENACT2HUMEN.TIMEOBJECTWORK, ENACT2HUMEN.TIMEWORKFACT, ENACT2HUMEN.TIMEDELIVERY, ENACT2HUMEN.PAYSWORK, ENACT2HUMEN.BONUS, ENACT2HUMEN.SALARYHOURSBONUS, ENACT2HUMEN.PAYSWORKBONUS, ENACT2HUMEN.CHARGEPERCENT, ENACT2HUMEN.CHARGESUM, ENACT2HUMEN.BALANS, ENACT2HUMEN.PODRCOD, ENACT2HUMEN.CEHID, ENACT2HUMEN.MODIFY_TIME, ENACT2HUMEN.PAYWORKCOU, ENACT2HUMEN.HUMENKINDREFCODE, ENACT2HUMEN.ACTREFCODE, ENACT2HUMEN.CHARGEREFCODE, ENACT2HUMEN.PLANREFCODE "
			+" FROM ENACT2HUMEN WHERE ENACT2HUMEN.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.orederNum = set.getInt(2);
				if (set.wasNull()) {
					anObject.orederNum = Integer.MIN_VALUE;
				}
				anObject.tabNumber = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.salary = set.getBigDecimal(5);
				if(anObject.salary != null) {
					anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeMonth = set.getBigDecimal(6);
				if(anObject.timeMonth != null) {
					anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.daysMonth = set.getBigDecimal(7);
				if(anObject.daysMonth != null) {
					anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHours = set.getBigDecimal(8);
				if(anObject.salaryHours != null) {
					anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeWork = set.getBigDecimal(9);
				if(anObject.timeWork != null) {
					anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeObjectWork = set.getBigDecimal(10);
				if(anObject.timeObjectWork != null) {
					anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeWorkFact = set.getBigDecimal(11);
				if(anObject.timeWorkFact != null) {
					anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeDelivery = set.getBigDecimal(12);
				if(anObject.timeDelivery != null) {
					anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.paysWork = set.getBigDecimal(13);
				if(anObject.paysWork != null) {
					anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.bonus = set.getBigDecimal(14);
				if(anObject.bonus != null) {
					anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHoursBonus = set.getBigDecimal(15);
				if(anObject.salaryHoursBonus != null) {
					anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.paysWorkBonus = set.getBigDecimal(16);
				if(anObject.paysWorkBonus != null) {
					anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.chargePercent = set.getBigDecimal(17);
				if(anObject.chargePercent != null) {
					anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.chargeSum = set.getBigDecimal(18);
				if(anObject.chargeSum != null) {
					anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.balans = set.getString(19);
				anObject.podrcod = set.getString(20);
				anObject.cehId = set.getString(21);
				anObject.modify_time = set.getLong(22);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.payWorkCou = set.getBigDecimal(23);
				if(anObject.payWorkCou != null) {
					anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.humenKindRef.code = set.getInt(24);
				if (set.wasNull()) {
					anObject.humenKindRef.code = Integer.MIN_VALUE;
				}
				anObject.actRef.code = set.getInt(25);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
				}
				anObject.chargeRef.code = set.getInt(26);
				if (set.wasNull()) {
					anObject.chargeRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(27);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				if(anObject.humenKindRef.code != Integer.MIN_VALUE) {
					anObject.setHumenKindRef(
						new com.ksoe.energynet.dataminer.generated.ENHumenItemKindDAOGen(connection,getUserProfile()).getRef(anObject.humenKindRef.code));
				}
				if(anObject.actRef.code != Integer.MIN_VALUE) {
					anObject.setActRef(
						new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
				}
				if(anObject.chargeRef.code != Integer.MIN_VALUE) {
					anObject.setChargeRef(
						new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).getRef(anObject.chargeRef.code));
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENAct2HumenRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAct2HumenRef ref = new com.ksoe.energynet.valueobject.references.ENAct2HumenRef();
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

		selectStr = "DELETE FROM  ENACT2HUMEN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAct2Humen object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAct2Humen.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2Humen.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAct2Humen.remove%} access denied");
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
	
	public long count(ENAct2HumenFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAct2HumenFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAct2HumenFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACT2HUMEN", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAct2HumenFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACT2HUMEN");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2Humen.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct2Humen.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACT2HUMEN.CODE FROM  ENACT2HUMEN WHERE  ENACT2HUMEN.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACT2HUMEN.CODE");
		_checkConditionToken(condition,"oredernum","ENACT2HUMEN.OREDERNUM");
		_checkConditionToken(condition,"tabnumber","ENACT2HUMEN.TABNUMBER");
		_checkConditionToken(condition,"fio","ENACT2HUMEN.FIO");
		_checkConditionToken(condition,"salary","ENACT2HUMEN.SALARY");
		_checkConditionToken(condition,"timemonth","ENACT2HUMEN.TIMEMONTH");
		_checkConditionToken(condition,"daysmonth","ENACT2HUMEN.DAYSMONTH");
		_checkConditionToken(condition,"salaryhours","ENACT2HUMEN.SALARYHOURS");
		_checkConditionToken(condition,"timework","ENACT2HUMEN.TIMEWORK");
		_checkConditionToken(condition,"timeobjectwork","ENACT2HUMEN.TIMEOBJECTWORK");
		_checkConditionToken(condition,"timeworkfact","ENACT2HUMEN.TIMEWORKFACT");
		_checkConditionToken(condition,"timedelivery","ENACT2HUMEN.TIMEDELIVERY");
		_checkConditionToken(condition,"payswork","ENACT2HUMEN.PAYSWORK");
		_checkConditionToken(condition,"bonus","ENACT2HUMEN.BONUS");
		_checkConditionToken(condition,"salaryhoursbonus","ENACT2HUMEN.SALARYHOURSBONUS");
		_checkConditionToken(condition,"paysworkbonus","ENACT2HUMEN.PAYSWORKBONUS");
		_checkConditionToken(condition,"chargepercent","ENACT2HUMEN.CHARGEPERCENT");
		_checkConditionToken(condition,"chargesum","ENACT2HUMEN.CHARGESUM");
		_checkConditionToken(condition,"balans","ENACT2HUMEN.BALANS");
		_checkConditionToken(condition,"podrcod","ENACT2HUMEN.PODRCOD");
		_checkConditionToken(condition,"cehid","ENACT2HUMEN.CEHID");
		_checkConditionToken(condition,"modify_time","ENACT2HUMEN.MODIFY_TIME");
		_checkConditionToken(condition,"payworkcou","ENACT2HUMEN.PAYWORKCOU");
		// relationship conditions
		_checkConditionToken(condition,"humenkindref","HUMENKINDREFCODE");
		_checkConditionToken(condition,"humenkindref.code","HUMENKINDREFCODE");
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
		_checkConditionToken(condition,"chargeref","CHARGEREFCODE");
		_checkConditionToken(condition,"chargeref.code","CHARGEREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
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
	
	private void _collectAutoIncrementFields(ENAct2Humen anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACT2HUMEN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACT2HUMEN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACT2HUMEN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACT2HUMEN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAct2HumenDAO
