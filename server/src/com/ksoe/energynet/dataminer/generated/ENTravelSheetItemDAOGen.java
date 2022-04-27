
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;


/**
 * DAO Object for ENTravelSheetItem;
 *
 */

public class ENTravelSheetItemDAOGen extends GenericDataMiner {

	public ENTravelSheetItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTravelSheetItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTravelSheetItem inObject) throws PersistenceException {
		ENTravelSheetItem obj = new ENTravelSheetItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.travelFrom == null && obj.travelFrom == null){}
		else
			if(inObject.travelFrom == null || obj.travelFrom == null) return false;
			else
				if ( ! inObject.travelFrom.equals(obj.travelFrom)){
					return false;
				}

		if(inObject.travelTo == null && obj.travelTo == null){}
		else
			if(inObject.travelTo == null || obj.travelTo == null) return false;
			else
				if ( ! inObject.travelTo.equals(obj.travelTo)){
					return false;
				}

		if(inObject.timeStart == null && obj.timeStart == null){} else 
			if(inObject.timeStart == null || obj.timeStart == null) return false;
			else
				if (inObject.timeStart.compareTo(obj.timeStart) != 0){
					return false;
				}

		if(inObject.timeFinal == null && obj.timeFinal == null){} else 
			if(inObject.timeFinal == null || obj.timeFinal == null) return false;
			else
				if (inObject.timeFinal.compareTo(obj.timeFinal) != 0){
					return false;
				}

		if(inObject.speedometerStart == null && obj.speedometerStart == null){}
		else
			if(inObject.speedometerStart == null || obj.speedometerStart == null) return false;
			else
				if ( ! inObject.speedometerStart.equals(obj.speedometerStart)){
					return false;
				}

		if(inObject.speedometerFinal == null && obj.speedometerFinal == null){}
		else
			if(inObject.speedometerFinal == null || obj.speedometerFinal == null) return false;
			else
				if ( ! inObject.speedometerFinal.equals(obj.speedometerFinal)){
					return false;
				}

		if(inObject.fuelCounterStart == null && obj.fuelCounterStart == null){}
		else
			if(inObject.fuelCounterStart == null || obj.fuelCounterStart == null) return false;
			else
				if ( ! inObject.fuelCounterStart.equals(obj.fuelCounterStart)){
					return false;
				}

		if(inObject.fuelCounterFinal == null && obj.fuelCounterFinal == null){}
		else
			if(inObject.fuelCounterFinal == null || obj.fuelCounterFinal == null) return false;
			else
				if ( ! inObject.fuelCounterFinal.equals(obj.fuelCounterFinal)){
					return false;
				}

		if(inObject.sumDistances == null && obj.sumDistances == null){}
		else
			if(inObject.sumDistances == null || obj.sumDistances == null) return false;
			else
				if ( ! inObject.sumDistances.equals(obj.sumDistances)){
					return false;
				}

		if(inObject.sumMachineHours == null && obj.sumMachineHours == null){}
		else
			if(inObject.sumMachineHours == null || obj.sumMachineHours == null) return false;
			else
				if ( ! inObject.sumMachineHours.equals(obj.sumMachineHours)){
					return false;
				}

		if(inObject.heatingTime == null && obj.heatingTime == null){}
		else
			if(inObject.heatingTime == null || obj.heatingTime == null) return false;
			else
				if ( ! inObject.heatingTime.equals(obj.heatingTime)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.rashodProbeg == null && obj.rashodProbeg == null){}
		else
			if(inObject.rashodProbeg == null || obj.rashodProbeg == null) return false;
			else
				if ( ! inObject.rashodProbeg.equals(obj.rashodProbeg)){
					return false;
				}

		if(inObject.rashodWork == null && obj.rashodWork == null){}
		else
			if(inObject.rashodWork == null || obj.rashodWork == null) return false;
			else
				if ( ! inObject.rashodWork.equals(obj.rashodWork)){
					return false;
				}

		if(inObject.transportKoef == null && obj.transportKoef == null){}
		else
			if(inObject.transportKoef == null || obj.transportKoef == null) return false;
			else
				if ( ! inObject.transportKoef.equals(obj.transportKoef)){
					return false;
				}

		if(inObject.distanceByGPS == null && obj.distanceByGPS == null){}
		else
			if(inObject.distanceByGPS == null || obj.distanceByGPS == null) return false;
			else
				if ( ! inObject.distanceByGPS.equals(obj.distanceByGPS)){
					return false;
				}

		if(inObject.hoursByGPS == null && obj.hoursByGPS == null){}
		else
			if(inObject.hoursByGPS == null || obj.hoursByGPS == null) return false;
			else
				if ( ! inObject.hoursByGPS.equals(obj.hoursByGPS)){
					return false;
				}

		if(inObject.hoursInMotionByGPS == null && obj.hoursInMotionByGPS == null){}
		else
			if(inObject.hoursInMotionByGPS == null || obj.hoursInMotionByGPS == null) return false;
			else
				if ( ! inObject.hoursInMotionByGPS.equals(obj.hoursInMotionByGPS)){
					return false;
				}

		if(inObject.hoursStopWorkByGPS == null && obj.hoursStopWorkByGPS == null){}
		else
			if(inObject.hoursStopWorkByGPS == null || obj.hoursStopWorkByGPS == null) return false;
			else
				if ( ! inObject.hoursStopWorkByGPS.equals(obj.hoursStopWorkByGPS)){
					return false;
				}

		if(inObject.hoursStopOffByGPS == null && obj.hoursStopOffByGPS == null){}
		else
			if(inObject.hoursStopOffByGPS == null || obj.hoursStopOffByGPS == null) return false;
			else
				if ( ! inObject.hoursStopOffByGPS.equals(obj.hoursStopOffByGPS)){
					return false;
				}

		if (inObject.travelOrder != obj.travelOrder){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.parentItemRef.code != obj.parentItemRef.code){
			return false;
		}
		if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.kindRef.code != obj.kindRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		return true;
	}

	public int add(ENTravelSheetItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTravelSheetItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTRAVELSHEETITEM (CODE,TRAVELFROM,TRAVELTO,TIMESTART,TIMEFINAL,SPEEDOMETERSTART,SPEEDOMETERFINAL,FUELCOUNTERSTART,FUELCOUNTERFINAL,SUMDISTANCES,SUMMACHINEHOURS,HEATINGTIME,COMMENTGEN,RASHODPROBEG,RASHODWORK,TRANSPORTKOEF,DISTANCEBYGPS,HOURSBYGPS,HOURSINMOTIONBYGPS,HOURSSTOPWORKBYGPS,HOURSSTOPOFFBYGPS,TRAVELORDER,DATEEDIT,USERGEN,MODIFY_TIME,PARENTITEMREFCODE,TRAVELSHEETREFCODE,PLANREFCODE,KINDREFCODE,STATUSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.travelFrom);
			statement.setString(3, anObject.travelTo);
			if (anObject.timeStart == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.timeStart.getTime()));
			}
			if (anObject.timeFinal == null) {
				statement.setTimestamp(5, null);
			} else {
				statement.setTimestamp(5, new java.sql.Timestamp(anObject.timeFinal.getTime()));
			}
			if (anObject.speedometerStart != null) {
				anObject.speedometerStart = anObject.speedometerStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.speedometerStart);
			if (anObject.speedometerFinal != null) {
				anObject.speedometerFinal = anObject.speedometerFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.speedometerFinal);
			if (anObject.fuelCounterStart != null) {
				anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.fuelCounterStart);
			if (anObject.fuelCounterFinal != null) {
				anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.fuelCounterFinal);
			if (anObject.sumDistances != null) {
				anObject.sumDistances = anObject.sumDistances.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.sumDistances);
			if (anObject.sumMachineHours != null) {
				anObject.sumMachineHours = anObject.sumMachineHours.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.sumMachineHours);
			if (anObject.heatingTime != null) {
				anObject.heatingTime = anObject.heatingTime.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.heatingTime);
			statement.setString(13, anObject.commentGen);
			if (anObject.rashodProbeg != null) {
				anObject.rashodProbeg = anObject.rashodProbeg.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14, anObject.rashodProbeg);
			if (anObject.rashodWork != null) {
				anObject.rashodWork = anObject.rashodWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.rashodWork);
			if (anObject.transportKoef != null) {
				anObject.transportKoef = anObject.transportKoef.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.transportKoef);
			if (anObject.distanceByGPS != null) {
				anObject.distanceByGPS = anObject.distanceByGPS.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17, anObject.distanceByGPS);
			if (anObject.hoursByGPS != null) {
				anObject.hoursByGPS = anObject.hoursByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.hoursByGPS);
			if (anObject.hoursInMotionByGPS != null) {
				anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19, anObject.hoursInMotionByGPS);
			if (anObject.hoursStopWorkByGPS != null) {
				anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.hoursStopWorkByGPS);
			if (anObject.hoursStopOffByGPS != null) {
				anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.hoursStopOffByGPS);
			if (anObject.travelOrder != Integer.MIN_VALUE ) {
				statement.setInt(22, anObject.travelOrder);
			} else {
				statement.setNull(22, java.sql.Types.INTEGER);
			}
			if (anObject.dateEdit == null) {
				statement.setTimestamp(23, null);
			} else {
				statement.setTimestamp(23, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(24, anObject.userGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(25, null);
			} else {
				statement.setBigDecimal(25, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.parentItemRef.code != Integer.MIN_VALUE){
				statement.setInt(26,anObject.parentItemRef.code);
			} else {
				statement.setNull(26,java.sql.Types.INTEGER);
			}
			if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
				statement.setInt(27,anObject.travelSheetRef.code);
			} else {
				statement.setNull(27,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				statement.setInt(28,anObject.planRef.code);
			} else {
				statement.setNull(28,java.sql.Types.INTEGER);
			}
			if (anObject.kindRef.code != Integer.MIN_VALUE){
				statement.setInt(29,anObject.kindRef.code);
			} else {
				statement.setNull(29,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(30,anObject.statusRef.code);
			} else {
				statement.setNull(30,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTravelSheetItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTravelSheetItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTravelSheetItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTravelSheetItem oldObject = new ENTravelSheetItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTravelSheetItem.modify_time_Field+" FROM  ENTRAVELSHEETITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("TRAVELFROM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELTO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SPEEDOMETERSTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SPEEDOMETERFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUELCOUNTERSTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUELCOUNTERFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMDISTANCES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMACHINEHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HEATINGTIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RASHODPROBEG") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RASHODWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORTKOEF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DISTANCEBYGPS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSBYGPS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSINMOTIONBYGPS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSSTOPWORKBYGPS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("HOURSSTOPOFFBYGPS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELORDER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELSHEETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTRAVELSHEETITEM SET  TRAVELFROM = ? , TRAVELTO = ? , TIMESTART = ? , TIMEFINAL = ? , SPEEDOMETERSTART = ? , SPEEDOMETERFINAL = ? , FUELCOUNTERSTART = ? , FUELCOUNTERFINAL = ? , SUMDISTANCES = ? , SUMMACHINEHOURS = ? , HEATINGTIME = ? , COMMENTGEN = ? , RASHODPROBEG = ? , RASHODWORK = ? , TRANSPORTKOEF = ? , DISTANCEBYGPS = ? , HOURSBYGPS = ? , HOURSINMOTIONBYGPS = ? , HOURSSTOPWORKBYGPS = ? , HOURSSTOPOFFBYGPS = ? , TRAVELORDER = ? , DATEEDIT = ? , USERGEN = ? , MODIFY_TIME = ? , PARENTITEMREFCODE = ? , TRAVELSHEETREFCODE = ? , PLANREFCODE = ? , KINDREFCODE = ? , STATUSREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTRAVELSHEETITEM SET ";
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
					statement.setString(1, anObject.travelFrom);
					statement.setString(2, anObject.travelTo);
					if (anObject.timeStart == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.timeStart.getTime()));
					}
					if (anObject.timeFinal == null) {
						statement.setTimestamp(4, null);
					} else {
						statement.setTimestamp(4, new java.sql.Timestamp(anObject.timeFinal.getTime()));
					}
					if (anObject.speedometerStart != null) {
						anObject.speedometerStart = anObject.speedometerStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.speedometerStart);
					if (anObject.speedometerFinal != null) {
						anObject.speedometerFinal = anObject.speedometerFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.speedometerFinal);
					if (anObject.fuelCounterStart != null) {
						anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.fuelCounterStart);
					if (anObject.fuelCounterFinal != null) {
						anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.fuelCounterFinal);
					if (anObject.sumDistances != null) {
						anObject.sumDistances = anObject.sumDistances.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.sumDistances);
					if (anObject.sumMachineHours != null) {
						anObject.sumMachineHours = anObject.sumMachineHours.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.sumMachineHours);
					if (anObject.heatingTime != null) {
						anObject.heatingTime = anObject.heatingTime.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.heatingTime);
					statement.setString(12, anObject.commentGen);
					if (anObject.rashodProbeg != null) {
						anObject.rashodProbeg = anObject.rashodProbeg.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13, anObject.rashodProbeg);
					if (anObject.rashodWork != null) {
						anObject.rashodWork = anObject.rashodWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.rashodWork);
					if (anObject.transportKoef != null) {
						anObject.transportKoef = anObject.transportKoef.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.transportKoef);
					if (anObject.distanceByGPS != null) {
						anObject.distanceByGPS = anObject.distanceByGPS.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16, anObject.distanceByGPS);
					if (anObject.hoursByGPS != null) {
						anObject.hoursByGPS = anObject.hoursByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.hoursByGPS);
					if (anObject.hoursInMotionByGPS != null) {
						anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18, anObject.hoursInMotionByGPS);
					if (anObject.hoursStopWorkByGPS != null) {
						anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.hoursStopWorkByGPS);
					if (anObject.hoursStopOffByGPS != null) {
						anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.hoursStopOffByGPS);
					if (anObject.travelOrder != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.travelOrder);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					if (anObject.dateEdit == null) {
						statement.setTimestamp(22, null);
					} else {
						statement.setTimestamp(22, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(23, anObject.userGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(24, null);
					} else {
						statement.setBigDecimal(24, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.parentItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(25, anObject.parentItemRef.code);
					} else {
						statement.setNull(25, java.sql.Types.INTEGER);
					}
					if (anObject.travelSheetRef.code != Integer.MIN_VALUE) {
						statement.setInt(26, anObject.travelSheetRef.code);
					} else {
						statement.setNull(26, java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(27, anObject.planRef.code);
					} else {
						statement.setNull(27, java.sql.Types.INTEGER);
					}
					if (anObject.kindRef.code != Integer.MIN_VALUE) {
						statement.setInt(28, anObject.kindRef.code);
					} else {
						statement.setNull(28, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(29, anObject.statusRef.code);
					} else {
						statement.setNull(29, java.sql.Types.INTEGER);
					}
					statement.setInt(30, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TRAVELFROM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.travelFrom);
							continue;
						}
						if("TRAVELTO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.travelTo);
							continue;
						}
						if("TIMESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeStart == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.timeStart.getTime()));
							}
							continue;
						}
						if("TIMEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeFinal == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.timeFinal.getTime()));
							}
							continue;
						}
						if("SPEEDOMETERSTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.speedometerStart != null) {
								anObject.speedometerStart = anObject.speedometerStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.speedometerStart);
							continue;
						}
						if("SPEEDOMETERFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.speedometerFinal != null) {
								anObject.speedometerFinal = anObject.speedometerFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.speedometerFinal);
							continue;
						}
						if("FUELCOUNTERSTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fuelCounterStart != null) {
								anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.fuelCounterStart);
							continue;
						}
						if("FUELCOUNTERFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fuelCounterFinal != null) {
								anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.fuelCounterFinal);
							continue;
						}
						if("SUMDISTANCES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumDistances != null) {
								anObject.sumDistances = anObject.sumDistances.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumDistances);
							continue;
						}
						if("SUMMACHINEHOURS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumMachineHours != null) {
								anObject.sumMachineHours = anObject.sumMachineHours.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumMachineHours);
							continue;
						}
						if("HEATINGTIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.heatingTime != null) {
								anObject.heatingTime = anObject.heatingTime.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.heatingTime);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("RASHODPROBEG".compareTo((String)fields.get(i)) == 0) {
							if (anObject.rashodProbeg != null) {
								anObject.rashodProbeg = anObject.rashodProbeg.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.rashodProbeg);
							continue;
						}
						if("RASHODWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.rashodWork != null) {
								anObject.rashodWork = anObject.rashodWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.rashodWork);
							continue;
						}
						if("TRANSPORTKOEF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transportKoef != null) {
								anObject.transportKoef = anObject.transportKoef.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.transportKoef);
							continue;
						}
						if("DISTANCEBYGPS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.distanceByGPS != null) {
								anObject.distanceByGPS = anObject.distanceByGPS.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.distanceByGPS);
							continue;
						}
						if("HOURSBYGPS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursByGPS != null) {
								anObject.hoursByGPS = anObject.hoursByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursByGPS);
							continue;
						}
						if("HOURSINMOTIONBYGPS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursInMotionByGPS != null) {
								anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursInMotionByGPS);
							continue;
						}
						if("HOURSSTOPWORKBYGPS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursStopWorkByGPS != null) {
								anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursStopWorkByGPS);
							continue;
						}
						if("HOURSSTOPOFFBYGPS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.hoursStopOffByGPS != null) {
								anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.hoursStopOffByGPS);
							continue;
						}
						if("TRAVELORDER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.travelOrder);
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
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("PARENTITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.parentItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.parentItemRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRAVELSHEETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.travelSheetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.travelSheetRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
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
						if("KINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.kindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.kindRef.code);
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

	} // end of save(ENTravelSheetItem anObject,String[] anAttributes)


	public ENTravelSheetItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTravelSheetItem filterObject = new ENTravelSheetItem();
		Vector<ENTravelSheetItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTravelSheetItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTravelSheetItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.travelFrom, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.travelTo, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeStart, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeFinal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.speedometerStart, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.speedometerFinal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.fuelCounterStart, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.fuelCounterFinal, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumDistances, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumMachineHours, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.heatingTime, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.rashodProbeg, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.rashodWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.transportKoef, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.distanceByGPS, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursByGPS, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursInMotionByGPS, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursStopWorkByGPS, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.hoursStopOffByGPS, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.travelOrder, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.travelSheetRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTravelSheetItemFilter filter) {
		String out = buildCondition((ENTravelSheetItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTravelSheetItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTravelSheetItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.travelFrom, ENTravelSheetItem.travelFrom_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.travelTo, ENTravelSheetItem.travelTo_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeStart, ENTravelSheetItem.timeStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeFinal, ENTravelSheetItem.timeFinal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.speedometerStart, ENTravelSheetItem.speedometerStart_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.speedometerFinal, ENTravelSheetItem.speedometerFinal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.fuelCounterStart, ENTravelSheetItem.fuelCounterStart_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.fuelCounterFinal, ENTravelSheetItem.fuelCounterFinal_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumDistances, ENTravelSheetItem.sumDistances_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumMachineHours, ENTravelSheetItem.sumMachineHours_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.heatingTime, ENTravelSheetItem.heatingTime_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENTravelSheetItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.rashodProbeg, ENTravelSheetItem.rashodProbeg_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.rashodWork, ENTravelSheetItem.rashodWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.transportKoef, ENTravelSheetItem.transportKoef_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.distanceByGPS, ENTravelSheetItem.distanceByGPS_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursByGPS, ENTravelSheetItem.hoursByGPS_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursInMotionByGPS, ENTravelSheetItem.hoursInMotionByGPS_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursStopWorkByGPS, ENTravelSheetItem.hoursStopWorkByGPS_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.hoursStopOffByGPS, ENTravelSheetItem.hoursStopOffByGPS_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.travelOrder, ENTravelSheetItem.travelOrder_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENTravelSheetItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENTravelSheetItem.userGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTravelSheetItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentItemRef.code, ENTravelSheetItem.parentItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.travelSheetRef.code, ENTravelSheetItem.travelSheetRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENTravelSheetItem.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kindRef.code, ENTravelSheetItem.kindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENTravelSheetItem.statusRef_QFielld, out);
		}
		return out;
	}

	public ENTravelSheetItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTravelSheetItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTravelSheetItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTravelSheetItemShortList getFilteredList(ENTravelSheetItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTravelSheetItemShortList getScrollableFilteredList(ENTravelSheetItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTravelSheetItemShortList result = new ENTravelSheetItemShortList();
		ENTravelSheetItemShort anObject;
		result.list = new Vector<ENTravelSheetItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRAVELSHEETITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTRAVELSHEETITEM.CODE"+
			",ENTRAVELSHEETITEM.TRAVELFROM"+
			",ENTRAVELSHEETITEM.TRAVELTO"+
			",ENTRAVELSHEETITEM.TIMESTART"+
			",ENTRAVELSHEETITEM.TIMEFINAL"+
			",ENTRAVELSHEETITEM.SPEEDOMETERSTART"+
			",ENTRAVELSHEETITEM.SPEEDOMETERFINAL"+
			",ENTRAVELSHEETITEM.FUELCOUNTERSTART"+
			",ENTRAVELSHEETITEM.FUELCOUNTERFINAL"+
			",ENTRAVELSHEETITEM.SUMDISTANCES"+
			",ENTRAVELSHEETITEM.SUMMACHINEHOURS"+
			",ENTRAVELSHEETITEM.HEATINGTIME"+
			",ENTRAVELSHEETITEM.RASHODPROBEG"+
			",ENTRAVELSHEETITEM.RASHODWORK"+
			",ENTRAVELSHEETITEM.TRANSPORTKOEF"+
			",ENTRAVELSHEETITEM.DISTANCEBYGPS"+
			",ENTRAVELSHEETITEM.HOURSBYGPS"+
			",ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS"+
			",ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS"+
			",ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS"+
			",ENTRAVELSHEETITEM.TRAVELORDER"+
			",ENTRAVELSHEETITEM.DATEEDIT"+
			",ENTRAVELSHEETITEM.USERGEN"+
			", ENTRAVELSHEETITEM.CODE " +
			", ENTRAVELSHEETITEM.TRAVELFROM " +
			", ENTRAVELSHEETITEM.TRAVELTO " +
			", ENTRAVELSHEETITEM.TIMESTART " +
			", ENTRAVELSHEETITEM.TIMEFINAL " +
			", ENTRAVELSHEETITEM.SPEEDOMETERSTART " +
			", ENTRAVELSHEETITEM.SPEEDOMETERFINAL " +
			", ENTRAVELSHEETITEM.FUELCOUNTERSTART " +
			", ENTRAVELSHEETITEM.FUELCOUNTERFINAL " +
			", ENTRAVELSHEETITEM.SUMDISTANCES " +
			", ENTRAVELSHEETITEM.SUMMACHINEHOURS " +
			", ENTRAVELSHEETITEM.HEATINGTIME " +
			", ENTRAVELSHEETITEM.RASHODPROBEG " +
			", ENTRAVELSHEETITEM.RASHODWORK " +
			", ENTRAVELSHEETITEM.TRANSPORTKOEF " +
			", ENTRAVELSHEETITEM.DISTANCEBYGPS " +
			", ENTRAVELSHEETITEM.HOURSBYGPS " +
			", ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS " +
			", ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS " +
			", ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS " +
			", ENTRAVELSHEETITEM.TRAVELORDER " +
			", ENTRAVELSHEETITEM.DATEEDIT " +
			", ENTRAVELSHEETITEM.USERGEN " +
			", ENTRAVELSHEET.CODE " +
			", ENTRAVELSHEET.NUMBERGEN " +
			", ENTRAVELSHEET.DATESTART " +
			", ENTRAVELSHEET.DATEFINAL " +
			", ENTRAVELSHEET.SPEEDOMETERSTART " +
			", ENTRAVELSHEET.SPEEDOMETERFINAL " +
			", ENTRAVELSHEET.FUELCOUNTERSTART " +
			", ENTRAVELSHEET.FUELCOUNTERFINAL " +
			", ENTRAVELSHEET.TIMESTART " +
			", ENTRAVELSHEET.TIMEFINAL " +
			", ENTRAVELSHEET.DATEEDIT " +
			", ENTRAVELSHEET.USERGEN " +
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
			", ENTRAVELSHEETITEMKIND.CODE " +
			", ENTRAVELSHEETITEMKIND.NAME " +
			", ENTRAVELSHEETITEMSTATS.CODE " +
			", ENTRAVELSHEETITEMSTATS.NAME " +
		" FROM ENTRAVELSHEETITEM " +
			" LEFT JOIN ENTRAVELSHEETITEM on ENTRAVELSHEETITEM.CODE = ENTRAVELSHEETITEM.PARENTITEMREFCODE "+
			" LEFT JOIN ENTRAVELSHEET on ENTRAVELSHEET.CODE = ENTRAVELSHEETITEM.TRAVELSHEETREFCODE "+
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENTRAVELSHEETITEM.PLANREFCODE "+
			" LEFT JOIN ENTRAVELSHEETITEMKIND on ENTRAVELSHEETITEMKIND.CODE = ENTRAVELSHEETITEM.KINDREFCODE "+
			" LEFT JOIN ENTRAVELSHEETITEMSTATS on ENTRAVELSHEETITEMSTATS.CODE = ENTRAVELSHEETITEM.STATUSREFCODE "+
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
				anObject = new ENTravelSheetItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.travelFrom = set.getString(2);
				anObject.travelTo = set.getString(3);
				anObject.timeStart = set.getTimestamp(4);
				anObject.timeFinal = set.getTimestamp(5);
				anObject.speedometerStart = set.getBigDecimal(6);
				if(anObject.speedometerStart != null) {
					anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.speedometerFinal = set.getBigDecimal(7);
				if(anObject.speedometerFinal != null) {
					anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fuelCounterStart = set.getBigDecimal(8);
				if(anObject.fuelCounterStart != null) {
					anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fuelCounterFinal = set.getBigDecimal(9);
				if(anObject.fuelCounterFinal != null) {
					anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumDistances = set.getBigDecimal(10);
				if(anObject.sumDistances != null) {
					anObject.sumDistances = anObject.sumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumMachineHours = set.getBigDecimal(11);
				if(anObject.sumMachineHours != null) {
					anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.heatingTime = set.getBigDecimal(12);
				if(anObject.heatingTime != null) {
					anObject.heatingTime = anObject.heatingTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rashodProbeg = set.getBigDecimal(13);
				if(anObject.rashodProbeg != null) {
					anObject.rashodProbeg = anObject.rashodProbeg.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rashodWork = set.getBigDecimal(14);
				if(anObject.rashodWork != null) {
					anObject.rashodWork = anObject.rashodWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportKoef = set.getBigDecimal(15);
				if(anObject.transportKoef != null) {
					anObject.transportKoef = anObject.transportKoef.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distanceByGPS = set.getBigDecimal(16);
				if(anObject.distanceByGPS != null) {
					anObject.distanceByGPS = anObject.distanceByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursByGPS = set.getBigDecimal(17);
				if(anObject.hoursByGPS != null) {
					anObject.hoursByGPS = anObject.hoursByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursInMotionByGPS = set.getBigDecimal(18);
				if(anObject.hoursInMotionByGPS != null) {
					anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursStopWorkByGPS = set.getBigDecimal(19);
				if(anObject.hoursStopWorkByGPS != null) {
					anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursStopOffByGPS = set.getBigDecimal(20);
				if(anObject.hoursStopOffByGPS != null) {
					anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelOrder = set.getInt(21);
				if ( set.wasNull() ) {
					anObject.travelOrder = Integer.MIN_VALUE;
				}
				anObject.dateEdit = set.getTimestamp(22);
				anObject.userGen = set.getString(23);

				anObject.parentItemRefCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.parentItemRefCode = Integer.MIN_VALUE;
				}
				anObject.parentItemRefTravelFrom = set.getString(25);
				anObject.parentItemRefTravelTo = set.getString(26);
				anObject.parentItemRefTimeStart = set.getTimestamp(27);
				anObject.parentItemRefTimeFinal = set.getTimestamp(28);
				anObject.parentItemRefSpeedometerStart = set.getBigDecimal(29);
				if(anObject.parentItemRefSpeedometerStart != null) {
					anObject.parentItemRefSpeedometerStart = anObject.parentItemRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefSpeedometerFinal = set.getBigDecimal(30);
				if(anObject.parentItemRefSpeedometerFinal != null) {
					anObject.parentItemRefSpeedometerFinal = anObject.parentItemRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefFuelCounterStart = set.getBigDecimal(31);
				if(anObject.parentItemRefFuelCounterStart != null) {
					anObject.parentItemRefFuelCounterStart = anObject.parentItemRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefFuelCounterFinal = set.getBigDecimal(32);
				if(anObject.parentItemRefFuelCounterFinal != null) {
					anObject.parentItemRefFuelCounterFinal = anObject.parentItemRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefSumDistances = set.getBigDecimal(33);
				if(anObject.parentItemRefSumDistances != null) {
					anObject.parentItemRefSumDistances = anObject.parentItemRefSumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefSumMachineHours = set.getBigDecimal(34);
				if(anObject.parentItemRefSumMachineHours != null) {
					anObject.parentItemRefSumMachineHours = anObject.parentItemRefSumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefHeatingTime = set.getBigDecimal(35);
				if(anObject.parentItemRefHeatingTime != null) {
					anObject.parentItemRefHeatingTime = anObject.parentItemRefHeatingTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefRashodProbeg = set.getBigDecimal(36);
				if(anObject.parentItemRefRashodProbeg != null) {
					anObject.parentItemRefRashodProbeg = anObject.parentItemRefRashodProbeg.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefRashodWork = set.getBigDecimal(37);
				if(anObject.parentItemRefRashodWork != null) {
					anObject.parentItemRefRashodWork = anObject.parentItemRefRashodWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefTransportKoef = set.getBigDecimal(38);
				if(anObject.parentItemRefTransportKoef != null) {
					anObject.parentItemRefTransportKoef = anObject.parentItemRefTransportKoef.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefDistanceByGPS = set.getBigDecimal(39);
				if(anObject.parentItemRefDistanceByGPS != null) {
					anObject.parentItemRefDistanceByGPS = anObject.parentItemRefDistanceByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefHoursByGPS = set.getBigDecimal(40);
				if(anObject.parentItemRefHoursByGPS != null) {
					anObject.parentItemRefHoursByGPS = anObject.parentItemRefHoursByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefHoursInMotionByGPS = set.getBigDecimal(41);
				if(anObject.parentItemRefHoursInMotionByGPS != null) {
					anObject.parentItemRefHoursInMotionByGPS = anObject.parentItemRefHoursInMotionByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefHoursStopWorkByGPS = set.getBigDecimal(42);
				if(anObject.parentItemRefHoursStopWorkByGPS != null) {
					anObject.parentItemRefHoursStopWorkByGPS = anObject.parentItemRefHoursStopWorkByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefHoursStopOffByGPS = set.getBigDecimal(43);
				if(anObject.parentItemRefHoursStopOffByGPS != null) {
					anObject.parentItemRefHoursStopOffByGPS = anObject.parentItemRefHoursStopOffByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentItemRefTravelOrder = set.getInt(44);
				if(set.wasNull()) {
					anObject.parentItemRefTravelOrder = Integer.MIN_VALUE;
				}
				anObject.parentItemRefDateEdit = set.getTimestamp(45);
				anObject.parentItemRefUserGen = set.getString(46);
				anObject.travelSheetRefCode = set.getInt(47);
				if(set.wasNull()) {
					anObject.travelSheetRefCode = Integer.MIN_VALUE;
				}
				anObject.travelSheetRefNumberGen = set.getString(48);
				anObject.travelSheetRefDateStart = set.getDate(49);
				anObject.travelSheetRefDateFinal = set.getDate(50);
				anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(51);
				if(anObject.travelSheetRefSpeedometerStart != null) {
					anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(52);
				if(anObject.travelSheetRefSpeedometerFinal != null) {
					anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(53);
				if(anObject.travelSheetRefFuelCounterStart != null) {
					anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(54);
				if(anObject.travelSheetRefFuelCounterFinal != null) {
					anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefTimeStart = set.getTimestamp(55);
				anObject.travelSheetRefTimeFinal = set.getTimestamp(56);
				anObject.travelSheetRefDateEdit = set.getTimestamp(57);
				anObject.travelSheetRefUserGen = set.getString(58);
				anObject.planRefCode = set.getInt(59);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(60);
				anObject.planRefDateStart = set.getDate(61);
				anObject.planRefDateFinal = set.getDate(62);
				anObject.planRefYearGen = set.getInt(63);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(64);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(65);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(66);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(67);
				anObject.planRefDateEdit = set.getDate(68);
				anObject.planRefWorkOrderNumber = set.getString(69);
				anObject.planRefDateWorkOrder = set.getDate(70);
				anObject.planRefPriConnectionNumber = set.getString(71);
				anObject.planRefDateEndPriConnection = set.getDate(72);
				anObject.planRefInvestWorksDescription = set.getString(73);
				anObject.planRefServicesFSideFinId = set.getInt(74);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(75);
				anObject.planRefTotalTimeHours = set.getBigDecimal(76);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(77);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(78);
				anObject.kindRefCode = set.getInt(79);
				if(set.wasNull()) {
					anObject.kindRefCode = Integer.MIN_VALUE;
				}
				anObject.kindRefName = set.getString(80);
				anObject.statusRefCode = set.getInt(81);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(82);

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
	
	public int[] getFilteredCodeArray(ENTravelSheetItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTravelSheetItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTravelSheetItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTRAVELSHEETITEM.CODE FROM ENTRAVELSHEETITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRAVELSHEETITEM.CODE";
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


	public ENTravelSheetItem getObject(int uid) throws PersistenceException {
		ENTravelSheetItem result = new ENTravelSheetItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENTravelSheetItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENTRAVELSHEETITEM.CODE, ENTRAVELSHEETITEM.TRAVELFROM, ENTRAVELSHEETITEM.TRAVELTO, ENTRAVELSHEETITEM.TIMESTART, ENTRAVELSHEETITEM.TIMEFINAL, ENTRAVELSHEETITEM.SPEEDOMETERSTART, ENTRAVELSHEETITEM.SPEEDOMETERFINAL, ENTRAVELSHEETITEM.FUELCOUNTERSTART, ENTRAVELSHEETITEM.FUELCOUNTERFINAL, ENTRAVELSHEETITEM.SUMDISTANCES, ENTRAVELSHEETITEM.SUMMACHINEHOURS, ENTRAVELSHEETITEM.HEATINGTIME, ENTRAVELSHEETITEM.COMMENTGEN, ENTRAVELSHEETITEM.RASHODPROBEG, ENTRAVELSHEETITEM.RASHODWORK, ENTRAVELSHEETITEM.TRANSPORTKOEF, ENTRAVELSHEETITEM.DISTANCEBYGPS, ENTRAVELSHEETITEM.HOURSBYGPS, ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS, ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS, ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS, ENTRAVELSHEETITEM.TRAVELORDER, ENTRAVELSHEETITEM.DATEEDIT, ENTRAVELSHEETITEM.USERGEN, ENTRAVELSHEETITEM.MODIFY_TIME, ENTRAVELSHEETITEM.PARENTITEMREFCODE, ENTRAVELSHEETITEM.TRAVELSHEETREFCODE, ENTRAVELSHEETITEM.PLANREFCODE, ENTRAVELSHEETITEM.KINDREFCODE, ENTRAVELSHEETITEM.STATUSREFCODE "
			+" FROM ENTRAVELSHEETITEM WHERE ENTRAVELSHEETITEM.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.travelFrom = set.getString(2);
				anObject.travelTo = set.getString(3);
				anObject.timeStart = set.getTimestamp(4);
				anObject.timeFinal = set.getTimestamp(5);
				anObject.speedometerStart = set.getBigDecimal(6);
				if(anObject.speedometerStart != null) {
					anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.speedometerFinal = set.getBigDecimal(7);
				if(anObject.speedometerFinal != null) {
					anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fuelCounterStart = set.getBigDecimal(8);
				if(anObject.fuelCounterStart != null) {
					anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fuelCounterFinal = set.getBigDecimal(9);
				if(anObject.fuelCounterFinal != null) {
					anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumDistances = set.getBigDecimal(10);
				if(anObject.sumDistances != null) {
					anObject.sumDistances = anObject.sumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumMachineHours = set.getBigDecimal(11);
				if(anObject.sumMachineHours != null) {
					anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.heatingTime = set.getBigDecimal(12);
				if(anObject.heatingTime != null) {
					anObject.heatingTime = anObject.heatingTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentGen = set.getString(13);
				anObject.rashodProbeg = set.getBigDecimal(14);
				if(anObject.rashodProbeg != null) {
					anObject.rashodProbeg = anObject.rashodProbeg.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rashodWork = set.getBigDecimal(15);
				if(anObject.rashodWork != null) {
					anObject.rashodWork = anObject.rashodWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportKoef = set.getBigDecimal(16);
				if(anObject.transportKoef != null) {
					anObject.transportKoef = anObject.transportKoef.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distanceByGPS = set.getBigDecimal(17);
				if(anObject.distanceByGPS != null) {
					anObject.distanceByGPS = anObject.distanceByGPS.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursByGPS = set.getBigDecimal(18);
				if(anObject.hoursByGPS != null) {
					anObject.hoursByGPS = anObject.hoursByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursInMotionByGPS = set.getBigDecimal(19);
				if(anObject.hoursInMotionByGPS != null) {
					anObject.hoursInMotionByGPS = anObject.hoursInMotionByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursStopWorkByGPS = set.getBigDecimal(20);
				if(anObject.hoursStopWorkByGPS != null) {
					anObject.hoursStopWorkByGPS = anObject.hoursStopWorkByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.hoursStopOffByGPS = set.getBigDecimal(21);
				if(anObject.hoursStopOffByGPS != null) {
					anObject.hoursStopOffByGPS = anObject.hoursStopOffByGPS.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelOrder = set.getInt(22);
				if (set.wasNull()) {
					anObject.travelOrder = Integer.MIN_VALUE;
				}
				anObject.dateEdit = set.getTimestamp(23);
				anObject.userGen = set.getString(24);
				anObject.modify_time = set.getLong(25);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.parentItemRef.code = set.getInt(26);
				if (set.wasNull()) {
					anObject.parentItemRef.code = Integer.MIN_VALUE;
				}
				anObject.travelSheetRef.code = set.getInt(27);
				if (set.wasNull()) {
					anObject.travelSheetRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(28);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.kindRef.code = set.getInt(29);
				if (set.wasNull()) {
					anObject.kindRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(30);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENTravelSheetItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTravelSheetItemRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetItemRef();
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

		selectStr = "DELETE FROM  ENTRAVELSHEETITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTravelSheetItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTravelSheetItem.getObject%} access denied");
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
	
	public long count(ENTravelSheetItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTravelSheetItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTravelSheetItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTRAVELSHEETITEM", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENTRAVELSHEETITEM WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTravelSheetItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTravelSheetItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTRAVELSHEETITEM");
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
			"SELECT  ENTRAVELSHEETITEM.CODE FROM  ENTRAVELSHEETITEM WHERE  ENTRAVELSHEETITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTRAVELSHEETITEM.CODE");
		_checkConditionToken(condition,"travelfrom","ENTRAVELSHEETITEM.TRAVELFROM");
		_checkConditionToken(condition,"travelto","ENTRAVELSHEETITEM.TRAVELTO");
		_checkConditionToken(condition,"timestart","ENTRAVELSHEETITEM.TIMESTART");
		_checkConditionToken(condition,"timefinal","ENTRAVELSHEETITEM.TIMEFINAL");
		_checkConditionToken(condition,"speedometerstart","ENTRAVELSHEETITEM.SPEEDOMETERSTART");
		_checkConditionToken(condition,"speedometerfinal","ENTRAVELSHEETITEM.SPEEDOMETERFINAL");
		_checkConditionToken(condition,"fuelcounterstart","ENTRAVELSHEETITEM.FUELCOUNTERSTART");
		_checkConditionToken(condition,"fuelcounterfinal","ENTRAVELSHEETITEM.FUELCOUNTERFINAL");
		_checkConditionToken(condition,"sumdistances","ENTRAVELSHEETITEM.SUMDISTANCES");
		_checkConditionToken(condition,"summachinehours","ENTRAVELSHEETITEM.SUMMACHINEHOURS");
		_checkConditionToken(condition,"heatingtime","ENTRAVELSHEETITEM.HEATINGTIME");
		_checkConditionToken(condition,"commentgen","ENTRAVELSHEETITEM.COMMENTGEN");
		_checkConditionToken(condition,"rashodprobeg","ENTRAVELSHEETITEM.RASHODPROBEG");
		_checkConditionToken(condition,"rashodwork","ENTRAVELSHEETITEM.RASHODWORK");
		_checkConditionToken(condition,"transportkoef","ENTRAVELSHEETITEM.TRANSPORTKOEF");
		_checkConditionToken(condition,"distancebygps","ENTRAVELSHEETITEM.DISTANCEBYGPS");
		_checkConditionToken(condition,"hoursbygps","ENTRAVELSHEETITEM.HOURSBYGPS");
		_checkConditionToken(condition,"hoursinmotionbygps","ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS");
		_checkConditionToken(condition,"hoursstopworkbygps","ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS");
		_checkConditionToken(condition,"hoursstopoffbygps","ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS");
		_checkConditionToken(condition,"travelorder","ENTRAVELSHEETITEM.TRAVELORDER");
		_checkConditionToken(condition,"dateedit","ENTRAVELSHEETITEM.DATEEDIT");
		_checkConditionToken(condition,"usergen","ENTRAVELSHEETITEM.USERGEN");
		_checkConditionToken(condition,"modify_time","ENTRAVELSHEETITEM.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"parentitemref","PARENTITEMREFCODE");
		_checkConditionToken(condition,"parentitemref.code","PARENTITEMREFCODE");
		_checkConditionToken(condition,"travelsheetref","TRAVELSHEETREFCODE");
		_checkConditionToken(condition,"travelsheetref.code","TRAVELSHEETREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"kindref","KINDREFCODE");
		_checkConditionToken(condition,"kindref.code","KINDREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
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
	
	private void _collectAutoIncrementFields(ENTravelSheetItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTRAVELSHEETITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRAVELSHEETITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRAVELSHEETITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTRAVELSHEETITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTravelSheetItemDAO
