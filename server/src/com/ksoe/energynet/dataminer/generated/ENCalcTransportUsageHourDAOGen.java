
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENCalcTransportUsageHour;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageHourFilter;
import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageHourShort;
import com.ksoe.energynet.valueobject.lists.ENCalcTransportUsageHourShortList;


/**
 * DAO Object for ENCalcTransportUsageHour;
 *
 */

public class ENCalcTransportUsageHourDAOGen extends GenericDataMiner {

	public ENCalcTransportUsageHourDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCalcTransportUsageHourDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCalcTransportUsageHour inObject) throws PersistenceException {
		ENCalcTransportUsageHour obj = new ENCalcTransportUsageHour();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.salaryMonthDriver == null && obj.salaryMonthDriver == null){}
		else
			if(inObject.salaryMonthDriver == null || obj.salaryMonthDriver == null) return false;
			else
				if ( ! inObject.salaryMonthDriver.equals(obj.salaryMonthDriver)){
					return false;
				}

		if(inObject.normWorkTimeMonth == null && obj.normWorkTimeMonth == null){}
		else
			if(inObject.normWorkTimeMonth == null || obj.normWorkTimeMonth == null) return false;
			else
				if ( ! inObject.normWorkTimeMonth.equals(obj.normWorkTimeMonth)){
					return false;
				}

		if(inObject.salaryHourDriver == null && obj.salaryHourDriver == null){}
		else
			if(inObject.salaryHourDriver == null || obj.salaryHourDriver == null) return false;
			else
				if ( ! inObject.salaryHourDriver.equals(obj.salaryHourDriver)){
					return false;
				}

		if(inObject.salaryChargeHourDriver == null && obj.salaryChargeHourDriver == null){}
		else
			if(inObject.salaryChargeHourDriver == null || obj.salaryChargeHourDriver == null) return false;
			else
				if ( ! inObject.salaryChargeHourDriver.equals(obj.salaryChargeHourDriver)){
					return false;
				}

		if(inObject.salaryTotalHourDriver == null && obj.salaryTotalHourDriver == null){}
		else
			if(inObject.salaryTotalHourDriver == null || obj.salaryTotalHourDriver == null) return false;
			else
				if ( ! inObject.salaryTotalHourDriver.equals(obj.salaryTotalHourDriver)){
					return false;
				}

		if(inObject.costMachine == null && obj.costMachine == null){}
		else
			if(inObject.costMachine == null || obj.costMachine == null) return false;
			else
				if ( ! inObject.costMachine.equals(obj.costMachine)){
					return false;
				}

		if(inObject.amortizationYearMachine == null && obj.amortizationYearMachine == null){}
		else
			if(inObject.amortizationYearMachine == null || obj.amortizationYearMachine == null) return false;
			else
				if ( ! inObject.amortizationYearMachine.equals(obj.amortizationYearMachine)){
					return false;
				}

		if(inObject.amortizationHourMachine == null && obj.amortizationHourMachine == null){}
		else
			if(inObject.amortizationHourMachine == null || obj.amortizationHourMachine == null) return false;
			else
				if ( ! inObject.amortizationHourMachine.equals(obj.amortizationHourMachine)){
					return false;
				}

		if(inObject.fuelExpensesMachine == null && obj.fuelExpensesMachine == null){}
		else
			if(inObject.fuelExpensesMachine == null || obj.fuelExpensesMachine == null) return false;
			else
				if ( ! inObject.fuelExpensesMachine.equals(obj.fuelExpensesMachine)){
					return false;
				}

		if(inObject.annualRepairCostsPercent == null && obj.annualRepairCostsPercent == null){}
		else
			if(inObject.annualRepairCostsPercent == null || obj.annualRepairCostsPercent == null) return false;
			else
				if ( ! inObject.annualRepairCostsPercent.equals(obj.annualRepairCostsPercent)){
					return false;
				}

		if(inObject.annualRepairCosts == null && obj.annualRepairCosts == null){}
		else
			if(inObject.annualRepairCosts == null || obj.annualRepairCosts == null) return false;
			else
				if ( ! inObject.annualRepairCosts.equals(obj.annualRepairCosts)){
					return false;
				}

		if(inObject.repairCostsPerHour == null && obj.repairCostsPerHour == null){}
		else
			if(inObject.repairCostsPerHour == null || obj.repairCostsPerHour == null) return false;
			else
				if ( ! inObject.repairCostsPerHour.equals(obj.repairCostsPerHour)){
					return false;
				}

		if(inObject.costTotalHourMachine == null && obj.costTotalHourMachine == null){}
		else
			if(inObject.costTotalHourMachine == null || obj.costTotalHourMachine == null) return false;
			else
				if ( ! inObject.costTotalHourMachine.equals(obj.costTotalHourMachine)){
					return false;
				}

		if(inObject.productionCosts == null && obj.productionCosts == null){}
		else
			if(inObject.productionCosts == null || obj.productionCosts == null) return false;
			else
				if ( ! inObject.productionCosts.equals(obj.productionCosts)){
					return false;
				}

		if(inObject.administrativeCosts == null && obj.administrativeCosts == null){}
		else
			if(inObject.administrativeCosts == null || obj.administrativeCosts == null) return false;
			else
				if ( ! inObject.administrativeCosts.equals(obj.administrativeCosts)){
					return false;
				}

		if(inObject.profitRate == null && obj.profitRate == null){}
		else
			if(inObject.profitRate == null || obj.profitRate == null) return false;
			else
				if ( ! inObject.profitRate.equals(obj.profitRate)){
					return false;
				}

		if(inObject.costPerKilometer == null && obj.costPerKilometer == null){}
		else
			if(inObject.costPerKilometer == null || obj.costPerKilometer == null) return false;
			else
				if ( ! inObject.costPerKilometer.equals(obj.costPerKilometer)){
					return false;
				}

		if(inObject.commentPerKilometer == null && obj.commentPerKilometer == null){}
		else
			if(inObject.commentPerKilometer == null || obj.commentPerKilometer == null) return false;
			else
				if ( ! inObject.commentPerKilometer.equals(obj.commentPerKilometer)){
					return false;
				}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.tkTransportRef.code != obj.tkTransportRef.code){
			return false;
		}
		return true;
	}

	public int add(ENCalcTransportUsageHour anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCalcTransportUsageHour anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCALCTRANSPORTUSAGEHR (CODE,SALARYMONTHDRIVER,NORMWORKTIMEMONTH,SALARYHOURDRIVER,SALARYCHARGEHOURDRIVER,SALARYTOTALHOURDRIVER,COSTMACHINE,AMORTIZATIONYEARMACHIN,AMORTIZATIONHOURMACHIN,FUELEXPENSESMACHINE,ANNUALREPAIRCOSTSPRCNT,ANNUALREPAIRCOSTS,REPAIRCOSTSPERHOUR,COSTTOTALHOURMACHINE,PRODUCTIONCOSTS,ADMINISTRATIVECOSTS,PROFITRATE,COSTPERKILOMETER,COMMENTPERKILOMETER,MODIFY_TIME,PLANREFCODE,TKTRANSPORTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.salaryMonthDriver != null) {
				anObject.salaryMonthDriver = anObject.salaryMonthDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.salaryMonthDriver);
			if (anObject.normWorkTimeMonth != null) {
				anObject.normWorkTimeMonth = anObject.normWorkTimeMonth.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.normWorkTimeMonth);
			if (anObject.salaryHourDriver != null) {
				anObject.salaryHourDriver = anObject.salaryHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.salaryHourDriver);
			if (anObject.salaryChargeHourDriver != null) {
				anObject.salaryChargeHourDriver = anObject.salaryChargeHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.salaryChargeHourDriver);
			if (anObject.salaryTotalHourDriver != null) {
				anObject.salaryTotalHourDriver = anObject.salaryTotalHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.salaryTotalHourDriver);
			if (anObject.costMachine != null) {
				anObject.costMachine = anObject.costMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.costMachine);
			if (anObject.amortizationYearMachine != null) {
				anObject.amortizationYearMachine = anObject.amortizationYearMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.amortizationYearMachine);
			if (anObject.amortizationHourMachine != null) {
				anObject.amortizationHourMachine = anObject.amortizationHourMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.amortizationHourMachine);
			if (anObject.fuelExpensesMachine != null) {
				anObject.fuelExpensesMachine = anObject.fuelExpensesMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.fuelExpensesMachine);
			if (anObject.annualRepairCostsPercent != null) {
				anObject.annualRepairCostsPercent = anObject.annualRepairCostsPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.annualRepairCostsPercent);
			if (anObject.annualRepairCosts != null) {
				anObject.annualRepairCosts = anObject.annualRepairCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.annualRepairCosts);
			if (anObject.repairCostsPerHour != null) {
				anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13, anObject.repairCostsPerHour);
			if (anObject.costTotalHourMachine != null) {
				anObject.costTotalHourMachine = anObject.costTotalHourMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14, anObject.costTotalHourMachine);
			if (anObject.productionCosts != null) {
				anObject.productionCosts = anObject.productionCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.productionCosts);
			if (anObject.administrativeCosts != null) {
				anObject.administrativeCosts = anObject.administrativeCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.administrativeCosts);
			if (anObject.profitRate != null) {
				anObject.profitRate = anObject.profitRate.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17, anObject.profitRate);
			if (anObject.costPerKilometer != null) {
				anObject.costPerKilometer = anObject.costPerKilometer.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.costPerKilometer);
			statement.setString(19, anObject.commentPerKilometer);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(20, null);
			} else {
				statement.setBigDecimal(20, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				statement.setInt(21,anObject.planRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.tkTransportRef.code != Integer.MIN_VALUE){
				statement.setInt(22,anObject.tkTransportRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENCalcTransportUsageHourDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCalcTransportUsageHour anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCalcTransportUsageHour anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENCalcTransportUsageHour oldObject = new ENCalcTransportUsageHour();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENCalcTransportUsageHour.modify_time_Field+" FROM  ENCALCTRANSPORTUSAGEHR WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("SALARYMONTHDRIVER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NORMWORKTIMEMONTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYHOURDRIVER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYCHARGEHOURDRIVER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYTOTALHOURDRIVER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTMACHINE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AMORTIZATIONYEARMACHINE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AMORTIZATIONHOURMACHINE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUELEXPENSESMACHINE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ANNUALREPAIRCOSTSPERCENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ANNUALREPAIRCOSTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REPAIRCOSTSPERHOUR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTTOTALHOURMACHINE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRODUCTIONCOSTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADMINISTRATIVECOSTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PROFITRATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTPERKILOMETER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTPERKILOMETER") == 0) {
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
					if(fieldNameStr.compareTo("TKTRANSPORTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCALCTRANSPORTUSAGEHR SET  SALARYMONTHDRIVER = ? , NORMWORKTIMEMONTH = ? , SALARYHOURDRIVER = ? , SALARYCHARGEHOURDRIVER = ? , SALARYTOTALHOURDRIVER = ? , COSTMACHINE = ? , AMORTIZATIONYEARMACHIN = ? , AMORTIZATIONHOURMACHIN = ? , FUELEXPENSESMACHINE = ? , ANNUALREPAIRCOSTSPRCNT = ? , ANNUALREPAIRCOSTS = ? , REPAIRCOSTSPERHOUR = ? , COSTTOTALHOURMACHINE = ? , PRODUCTIONCOSTS = ? , ADMINISTRATIVECOSTS = ? , PROFITRATE = ? , COSTPERKILOMETER = ? , COMMENTPERKILOMETER = ? , MODIFY_TIME = ? , PLANREFCODE = ? , TKTRANSPORTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCALCTRANSPORTUSAGEHOUR SET ";
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
					if (anObject.salaryMonthDriver != null) {
						anObject.salaryMonthDriver = anObject.salaryMonthDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.salaryMonthDriver);
					if (anObject.normWorkTimeMonth != null) {
						anObject.normWorkTimeMonth = anObject.normWorkTimeMonth.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.normWorkTimeMonth);
					if (anObject.salaryHourDriver != null) {
						anObject.salaryHourDriver = anObject.salaryHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.salaryHourDriver);
					if (anObject.salaryChargeHourDriver != null) {
						anObject.salaryChargeHourDriver = anObject.salaryChargeHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.salaryChargeHourDriver);
					if (anObject.salaryTotalHourDriver != null) {
						anObject.salaryTotalHourDriver = anObject.salaryTotalHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.salaryTotalHourDriver);
					if (anObject.costMachine != null) {
						anObject.costMachine = anObject.costMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.costMachine);
					if (anObject.amortizationYearMachine != null) {
						anObject.amortizationYearMachine = anObject.amortizationYearMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.amortizationYearMachine);
					if (anObject.amortizationHourMachine != null) {
						anObject.amortizationHourMachine = anObject.amortizationHourMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.amortizationHourMachine);
					if (anObject.fuelExpensesMachine != null) {
						anObject.fuelExpensesMachine = anObject.fuelExpensesMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.fuelExpensesMachine);
					if (anObject.annualRepairCostsPercent != null) {
						anObject.annualRepairCostsPercent = anObject.annualRepairCostsPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.annualRepairCostsPercent);
					if (anObject.annualRepairCosts != null) {
						anObject.annualRepairCosts = anObject.annualRepairCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.annualRepairCosts);
					if (anObject.repairCostsPerHour != null) {
						anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12, anObject.repairCostsPerHour);
					if (anObject.costTotalHourMachine != null) {
						anObject.costTotalHourMachine = anObject.costTotalHourMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13, anObject.costTotalHourMachine);
					if (anObject.productionCosts != null) {
						anObject.productionCosts = anObject.productionCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.productionCosts);
					if (anObject.administrativeCosts != null) {
						anObject.administrativeCosts = anObject.administrativeCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.administrativeCosts);
					if (anObject.profitRate != null) {
						anObject.profitRate = anObject.profitRate.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16, anObject.profitRate);
					if (anObject.costPerKilometer != null) {
						anObject.costPerKilometer = anObject.costPerKilometer.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.costPerKilometer);
					statement.setString(18, anObject.commentPerKilometer);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(19, null);
					} else {
						statement.setBigDecimal(19, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(20, anObject.planRef.code);
					} else {
						statement.setNull(20, java.sql.Types.INTEGER);
					}
					if (anObject.tkTransportRef.code != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.tkTransportRef.code);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					statement.setInt(22, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SALARYMONTHDRIVER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryMonthDriver != null) {
								anObject.salaryMonthDriver = anObject.salaryMonthDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.salaryMonthDriver);
							continue;
						}
						if("NORMWORKTIMEMONTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.normWorkTimeMonth != null) {
								anObject.normWorkTimeMonth = anObject.normWorkTimeMonth.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.normWorkTimeMonth);
							continue;
						}
						if("SALARYHOURDRIVER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryHourDriver != null) {
								anObject.salaryHourDriver = anObject.salaryHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.salaryHourDriver);
							continue;
						}
						if("SALARYCHARGEHOURDRIVER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryChargeHourDriver != null) {
								anObject.salaryChargeHourDriver = anObject.salaryChargeHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.salaryChargeHourDriver);
							continue;
						}
						if("SALARYTOTALHOURDRIVER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryTotalHourDriver != null) {
								anObject.salaryTotalHourDriver = anObject.salaryTotalHourDriver.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.salaryTotalHourDriver);
							continue;
						}
						if("COSTMACHINE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costMachine != null) {
								anObject.costMachine = anObject.costMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costMachine);
							continue;
						}
						if("AMORTIZATIONYEARMACHINE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.amortizationYearMachine != null) {
								anObject.amortizationYearMachine = anObject.amortizationYearMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.amortizationYearMachine);
							continue;
						}
						if("AMORTIZATIONHOURMACHINE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.amortizationHourMachine != null) {
								anObject.amortizationHourMachine = anObject.amortizationHourMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.amortizationHourMachine);
							continue;
						}
						if("FUELEXPENSESMACHINE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fuelExpensesMachine != null) {
								anObject.fuelExpensesMachine = anObject.fuelExpensesMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.fuelExpensesMachine);
							continue;
						}
						if("ANNUALREPAIRCOSTSPERCENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.annualRepairCostsPercent != null) {
								anObject.annualRepairCostsPercent = anObject.annualRepairCostsPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.annualRepairCostsPercent);
							continue;
						}
						if("ANNUALREPAIRCOSTS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.annualRepairCosts != null) {
								anObject.annualRepairCosts = anObject.annualRepairCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.annualRepairCosts);
							continue;
						}
						if("REPAIRCOSTSPERHOUR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.repairCostsPerHour != null) {
								anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.repairCostsPerHour);
							continue;
						}
						if("COSTTOTALHOURMACHINE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costTotalHourMachine != null) {
								anObject.costTotalHourMachine = anObject.costTotalHourMachine.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costTotalHourMachine);
							continue;
						}
						if("PRODUCTIONCOSTS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.productionCosts != null) {
								anObject.productionCosts = anObject.productionCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.productionCosts);
							continue;
						}
						if("ADMINISTRATIVECOSTS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.administrativeCosts != null) {
								anObject.administrativeCosts = anObject.administrativeCosts.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.administrativeCosts);
							continue;
						}
						if("PROFITRATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.profitRate != null) {
								anObject.profitRate = anObject.profitRate.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.profitRate);
							continue;
						}
						if("COSTPERKILOMETER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costPerKilometer != null) {
								anObject.costPerKilometer = anObject.costPerKilometer.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costPerKilometer);
							continue;
						}
						if("COMMENTPERKILOMETER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentPerKilometer);
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
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.planRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TKTRANSPORTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tkTransportRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.tkTransportRef.code);
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

	} // end of save(ENCalcTransportUsageHour anObject,String[] anAttributes)


	public ENCalcTransportUsageHourShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCalcTransportUsageHour filterObject = new ENCalcTransportUsageHour();
		Vector<ENCalcTransportUsageHourShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCalcTransportUsageHourShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENCalcTransportUsageHour filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryMonthDriver, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.normWorkTimeMonth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryHourDriver, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryChargeHourDriver, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryTotalHourDriver, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costMachine, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.amortizationYearMachine, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.amortizationHourMachine, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.fuelExpensesMachine, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.annualRepairCostsPercent, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.annualRepairCosts, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.repairCostsPerHour, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costTotalHourMachine, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.productionCosts, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.administrativeCosts, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.profitRate, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costPerKilometer, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentPerKilometer, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tkTransportRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENCalcTransportUsageHourFilter filter) {
		String out = buildCondition((ENCalcTransportUsageHour)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCalcTransportUsageHour filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCalcTransportUsageHour.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryMonthDriver, ENCalcTransportUsageHour.salaryMonthDriver_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.normWorkTimeMonth, ENCalcTransportUsageHour.normWorkTimeMonth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryHourDriver, ENCalcTransportUsageHour.salaryHourDriver_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryChargeHourDriver, ENCalcTransportUsageHour.salaryChargeHourDriver_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryTotalHourDriver, ENCalcTransportUsageHour.salaryTotalHourDriver_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costMachine, ENCalcTransportUsageHour.costMachine_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.amortizationYearMachine, ENCalcTransportUsageHour.amortizationYearMachine_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.amortizationHourMachine, ENCalcTransportUsageHour.amortizationHourMachine_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.fuelExpensesMachine, ENCalcTransportUsageHour.fuelExpensesMachine_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.annualRepairCostsPercent, ENCalcTransportUsageHour.annualRepairCostsPercent_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.annualRepairCosts, ENCalcTransportUsageHour.annualRepairCosts_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.repairCostsPerHour, ENCalcTransportUsageHour.repairCostsPerHour_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costTotalHourMachine, ENCalcTransportUsageHour.costTotalHourMachine_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.productionCosts, ENCalcTransportUsageHour.productionCosts_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.administrativeCosts, ENCalcTransportUsageHour.administrativeCosts_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.profitRate, ENCalcTransportUsageHour.profitRate_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costPerKilometer, ENCalcTransportUsageHour.costPerKilometer_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentPerKilometer, ENCalcTransportUsageHour.commentPerKilometer_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENCalcTransportUsageHour.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENCalcTransportUsageHour.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tkTransportRef.code, ENCalcTransportUsageHour.tkTransportRef_QFielld, out);
		}
		return out;
	}

	public ENCalcTransportUsageHourShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCalcTransportUsageHourShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCalcTransportUsageHourShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCalcTransportUsageHourShortList getFilteredList(ENCalcTransportUsageHour filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCalcTransportUsageHourShortList getScrollableFilteredList(ENCalcTransportUsageHour aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCalcTransportUsageHourShortList getScrollableFilteredList(ENCalcTransportUsageHour aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCalcTransportUsageHourShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCalcTransportUsageHourShortList getScrollableFilteredList(ENCalcTransportUsageHourFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENCalcTransportUsageHourShortList getScrollableFilteredList(ENCalcTransportUsageHourFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENCalcTransportUsageHourShortList getScrollableFilteredList(ENCalcTransportUsageHour aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcTransportUsageHourShortList result = new ENCalcTransportUsageHourShortList();
		ENCalcTransportUsageHourShort anObject;
		result.list = new Vector<ENCalcTransportUsageHourShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCTRANSPORTUSAGEHR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCTRANSPORTUSAGEHR.CODE"+
			",ENCALCTRANSPORTUSAGEHR.SALARYMONTHDRIVER"+
			",ENCALCTRANSPORTUSAGEHR.NORMWORKTIMEMONTH"+
			",ENCALCTRANSPORTUSAGEHR.SALARYHOURDRIVER"+
			",ENCALCTRANSPORTUSAGEHR.SALARYCHARGEHOURDRIVER"+
			",ENCALCTRANSPORTUSAGEHR.SALARYTOTALHOURDRIVER"+
			",ENCALCTRANSPORTUSAGEHR.COSTMACHINE"+
			",ENCALCTRANSPORTUSAGEHR.AMORTIZATIONYEARMACHIN"+
			",ENCALCTRANSPORTUSAGEHR.AMORTIZATIONHOURMACHIN"+
			",ENCALCTRANSPORTUSAGEHR.FUELEXPENSESMACHINE"+
			",ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTSPRCNT"+
			",ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTS"+
			",ENCALCTRANSPORTUSAGEHR.REPAIRCOSTSPERHOUR"+
			",ENCALCTRANSPORTUSAGEHR.COSTTOTALHOURMACHINE"+
			",ENCALCTRANSPORTUSAGEHR.PRODUCTIONCOSTS"+
			",ENCALCTRANSPORTUSAGEHR.ADMINISTRATIVECOSTS"+
			",ENCALCTRANSPORTUSAGEHR.PROFITRATE"+
			",ENCALCTRANSPORTUSAGEHR.COSTPERKILOMETER"+
			",ENCALCTRANSPORTUSAGEHR.COMMENTPERKILOMETER"+
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
			", TKTRANSPORT.CODE " +
			", TKTRANSPORT.NAME " +
		" FROM ENCALCTRANSPORTUSAGEHR " +
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENCALCTRANSPORTUSAGEHR.PLANREFCODE "+
			" LEFT JOIN TKTRANSPORT on TKTRANSPORT.CODE = ENCALCTRANSPORTUSAGEHR.TKTRANSPORTREFCODE "+
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
				anObject = new ENCalcTransportUsageHourShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.salaryMonthDriver = set.getBigDecimal(2);
				if(anObject.salaryMonthDriver != null) {
					anObject.salaryMonthDriver = anObject.salaryMonthDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.normWorkTimeMonth = set.getBigDecimal(3);
				if(anObject.normWorkTimeMonth != null) {
					anObject.normWorkTimeMonth = anObject.normWorkTimeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHourDriver = set.getBigDecimal(4);
				if(anObject.salaryHourDriver != null) {
					anObject.salaryHourDriver = anObject.salaryHourDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryChargeHourDriver = set.getBigDecimal(5);
				if(anObject.salaryChargeHourDriver != null) {
					anObject.salaryChargeHourDriver = anObject.salaryChargeHourDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalHourDriver = set.getBigDecimal(6);
				if(anObject.salaryTotalHourDriver != null) {
					anObject.salaryTotalHourDriver = anObject.salaryTotalHourDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costMachine = set.getBigDecimal(7);
				if(anObject.costMachine != null) {
					anObject.costMachine = anObject.costMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.amortizationYearMachine = set.getBigDecimal(8);
				if(anObject.amortizationYearMachine != null) {
					anObject.amortizationYearMachine = anObject.amortizationYearMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.amortizationHourMachine = set.getBigDecimal(9);
				if(anObject.amortizationHourMachine != null) {
					anObject.amortizationHourMachine = anObject.amortizationHourMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fuelExpensesMachine = set.getBigDecimal(10);
				if(anObject.fuelExpensesMachine != null) {
					anObject.fuelExpensesMachine = anObject.fuelExpensesMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.annualRepairCostsPercent = set.getBigDecimal(11);
				if(anObject.annualRepairCostsPercent != null) {
					anObject.annualRepairCostsPercent = anObject.annualRepairCostsPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.annualRepairCosts = set.getBigDecimal(12);
				if(anObject.annualRepairCosts != null) {
					anObject.annualRepairCosts = anObject.annualRepairCosts.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.repairCostsPerHour = set.getBigDecimal(13);
				if(anObject.repairCostsPerHour != null) {
					anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotalHourMachine = set.getBigDecimal(14);
				if(anObject.costTotalHourMachine != null) {
					anObject.costTotalHourMachine = anObject.costTotalHourMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.productionCosts = set.getBigDecimal(15);
				if(anObject.productionCosts != null) {
					anObject.productionCosts = anObject.productionCosts.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.administrativeCosts = set.getBigDecimal(16);
				if(anObject.administrativeCosts != null) {
					anObject.administrativeCosts = anObject.administrativeCosts.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.profitRate = set.getBigDecimal(17);
				if(anObject.profitRate != null) {
					anObject.profitRate = anObject.profitRate.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costPerKilometer = set.getBigDecimal(18);
				if(anObject.costPerKilometer != null) {
					anObject.costPerKilometer = anObject.costPerKilometer.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentPerKilometer = set.getString(19);

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
				anObject.tkTransportRefCode = set.getInt(40);
				if(set.wasNull()) {
					anObject.tkTransportRefCode = Integer.MIN_VALUE;
				}
				anObject.tkTransportRefName = set.getString(41);

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
	
	public int[] getFilteredCodeArray(ENCalcTransportUsageHourFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCalcTransportUsageHourFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCalcTransportUsageHour aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCALCTRANSPORTUSAGEHR.CODE FROM ENCALCTRANSPORTUSAGEHR";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCTRANSPORTUSAGEHR.CODE";
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


	public ENCalcTransportUsageHour getObject(int uid) throws PersistenceException {
		ENCalcTransportUsageHour result = new ENCalcTransportUsageHour();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENCalcTransportUsageHour anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENCALCTRANSPORTUSAGEHR.CODE, ENCALCTRANSPORTUSAGEHR.SALARYMONTHDRIVER, ENCALCTRANSPORTUSAGEHR.NORMWORKTIMEMONTH, ENCALCTRANSPORTUSAGEHR.SALARYHOURDRIVER, ENCALCTRANSPORTUSAGEHR.SALARYCHARGEHOURDRIVER, ENCALCTRANSPORTUSAGEHR.SALARYTOTALHOURDRIVER, ENCALCTRANSPORTUSAGEHR.COSTMACHINE, ENCALCTRANSPORTUSAGEHR.AMORTIZATIONYEARMACHIN, ENCALCTRANSPORTUSAGEHR.AMORTIZATIONHOURMACHIN, ENCALCTRANSPORTUSAGEHR.FUELEXPENSESMACHINE, ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTSPRCNT, ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTS, ENCALCTRANSPORTUSAGEHR.REPAIRCOSTSPERHOUR, ENCALCTRANSPORTUSAGEHR.COSTTOTALHOURMACHINE, ENCALCTRANSPORTUSAGEHR.PRODUCTIONCOSTS, ENCALCTRANSPORTUSAGEHR.ADMINISTRATIVECOSTS, ENCALCTRANSPORTUSAGEHR.PROFITRATE, ENCALCTRANSPORTUSAGEHR.COSTPERKILOMETER, ENCALCTRANSPORTUSAGEHR.COMMENTPERKILOMETER, ENCALCTRANSPORTUSAGEHR.MODIFY_TIME, ENCALCTRANSPORTUSAGEHR.PLANREFCODE, ENCALCTRANSPORTUSAGEHR.TKTRANSPORTREFCODE "
			+" FROM ENCALCTRANSPORTUSAGEHR WHERE ENCALCTRANSPORTUSAGEHR.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.salaryMonthDriver = set.getBigDecimal(2);
				if(anObject.salaryMonthDriver != null) {
					anObject.salaryMonthDriver = anObject.salaryMonthDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.normWorkTimeMonth = set.getBigDecimal(3);
				if(anObject.normWorkTimeMonth != null) {
					anObject.normWorkTimeMonth = anObject.normWorkTimeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryHourDriver = set.getBigDecimal(4);
				if(anObject.salaryHourDriver != null) {
					anObject.salaryHourDriver = anObject.salaryHourDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryChargeHourDriver = set.getBigDecimal(5);
				if(anObject.salaryChargeHourDriver != null) {
					anObject.salaryChargeHourDriver = anObject.salaryChargeHourDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalHourDriver = set.getBigDecimal(6);
				if(anObject.salaryTotalHourDriver != null) {
					anObject.salaryTotalHourDriver = anObject.salaryTotalHourDriver.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costMachine = set.getBigDecimal(7);
				if(anObject.costMachine != null) {
					anObject.costMachine = anObject.costMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.amortizationYearMachine = set.getBigDecimal(8);
				if(anObject.amortizationYearMachine != null) {
					anObject.amortizationYearMachine = anObject.amortizationYearMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.amortizationHourMachine = set.getBigDecimal(9);
				if(anObject.amortizationHourMachine != null) {
					anObject.amortizationHourMachine = anObject.amortizationHourMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fuelExpensesMachine = set.getBigDecimal(10);
				if(anObject.fuelExpensesMachine != null) {
					anObject.fuelExpensesMachine = anObject.fuelExpensesMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.annualRepairCostsPercent = set.getBigDecimal(11);
				if(anObject.annualRepairCostsPercent != null) {
					anObject.annualRepairCostsPercent = anObject.annualRepairCostsPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.annualRepairCosts = set.getBigDecimal(12);
				if(anObject.annualRepairCosts != null) {
					anObject.annualRepairCosts = anObject.annualRepairCosts.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.repairCostsPerHour = set.getBigDecimal(13);
				if(anObject.repairCostsPerHour != null) {
					anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotalHourMachine = set.getBigDecimal(14);
				if(anObject.costTotalHourMachine != null) {
					anObject.costTotalHourMachine = anObject.costTotalHourMachine.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.productionCosts = set.getBigDecimal(15);
				if(anObject.productionCosts != null) {
					anObject.productionCosts = anObject.productionCosts.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.administrativeCosts = set.getBigDecimal(16);
				if(anObject.administrativeCosts != null) {
					anObject.administrativeCosts = anObject.administrativeCosts.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.profitRate = set.getBigDecimal(17);
				if(anObject.profitRate != null) {
					anObject.profitRate = anObject.profitRate.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costPerKilometer = set.getBigDecimal(18);
				if(anObject.costPerKilometer != null) {
					anObject.costPerKilometer = anObject.costPerKilometer.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentPerKilometer = set.getString(19);
				anObject.modify_time = set.getLong(20);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.tkTransportRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.tkTransportRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENCalcTransportUsageHourRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCalcTransportUsageHourRef ref = new com.ksoe.energynet.valueobject.references.ENCalcTransportUsageHourRef();
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

		selectStr = "DELETE FROM  ENCALCTRANSPORTUSAGEHR WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCalcTransportUsageHour object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCalcTransportUsageHour.getObject%} access denied");
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
	
	public long count(ENCalcTransportUsageHourFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCalcTransportUsageHourFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCalcTransportUsageHourFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCALCTRANSPORTUSAGEHR", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENCALCTRANSPORTUSAGEHR WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCalcTransportUsageHourFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCALCTRANSPORTUSAGEHR");
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
		
		selectStr =
			"SELECT  ENCALCTRANSPORTUSAGEHR.CODE FROM  ENCALCTRANSPORTUSAGEHR WHERE  ENCALCTRANSPORTUSAGEHR.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCALCTRANSPORTUSAGEHR.CODE");
		_checkConditionToken(condition,"salarymonthdriver","ENCALCTRANSPORTUSAGEHR.SALARYMONTHDRIVER");
		_checkConditionToken(condition,"normworktimemonth","ENCALCTRANSPORTUSAGEHR.NORMWORKTIMEMONTH");
		_checkConditionToken(condition,"salaryhourdriver","ENCALCTRANSPORTUSAGEHR.SALARYHOURDRIVER");
		_checkConditionToken(condition,"salarychargehourdriver","ENCALCTRANSPORTUSAGEHR.SALARYCHARGEHOURDRIVER");
		_checkConditionToken(condition,"salarytotalhourdriver","ENCALCTRANSPORTUSAGEHR.SALARYTOTALHOURDRIVER");
		_checkConditionToken(condition,"costmachine","ENCALCTRANSPORTUSAGEHR.COSTMACHINE");
		_checkConditionToken(condition,"amortizationyearmachine","ENCALCTRANSPORTUSAGEHR.AMORTIZATIONYEARMACHIN");
		_checkConditionToken(condition,"amortizationhourmachine","ENCALCTRANSPORTUSAGEHR.AMORTIZATIONHOURMACHIN");
		_checkConditionToken(condition,"fuelexpensesmachine","ENCALCTRANSPORTUSAGEHR.FUELEXPENSESMACHINE");
		_checkConditionToken(condition,"annualrepaircostspercent","ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTSPRCNT");
		_checkConditionToken(condition,"annualrepaircosts","ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTS");
		_checkConditionToken(condition,"repaircostsperhour","ENCALCTRANSPORTUSAGEHR.REPAIRCOSTSPERHOUR");
		_checkConditionToken(condition,"costtotalhourmachine","ENCALCTRANSPORTUSAGEHR.COSTTOTALHOURMACHINE");
		_checkConditionToken(condition,"productioncosts","ENCALCTRANSPORTUSAGEHR.PRODUCTIONCOSTS");
		_checkConditionToken(condition,"administrativecosts","ENCALCTRANSPORTUSAGEHR.ADMINISTRATIVECOSTS");
		_checkConditionToken(condition,"profitrate","ENCALCTRANSPORTUSAGEHR.PROFITRATE");
		_checkConditionToken(condition,"costperkilometer","ENCALCTRANSPORTUSAGEHR.COSTPERKILOMETER");
		_checkConditionToken(condition,"commentperkilometer","ENCALCTRANSPORTUSAGEHR.COMMENTPERKILOMETER");
		_checkConditionToken(condition,"modify_time","ENCALCTRANSPORTUSAGEHR.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"tktransportref","TKTRANSPORTREFCODE");
		_checkConditionToken(condition,"tktransportref.code","TKTRANSPORTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENCalcTransportUsageHour anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCALCTRANSPORTUSAGEHR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCALCTRANSPORTUSAGEHR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCALCTRANSPORTUSAGEHR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCALCTRANSPORTUSAGEHR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCalcTransportUsageHourDAO
