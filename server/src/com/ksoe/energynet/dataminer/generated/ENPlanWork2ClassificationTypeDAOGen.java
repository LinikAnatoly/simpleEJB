
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
import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ClassificationTypeFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ClassificationTypeShort;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ClassificationTypeShortList;


/**
 * DAO Object for ENPlanWork2ClassificationType;
 *
 */

public class ENPlanWork2ClassificationTypeDAOGen extends GenericDataMiner {

	public ENPlanWork2ClassificationTypeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPlanWork2ClassificationTypeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPlanWork2ClassificationType inObject) throws PersistenceException {
		ENPlanWork2ClassificationType obj = new ENPlanWork2ClassificationType();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
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

		if(inObject.machineHours == null && obj.machineHours == null){}
		else
			if(inObject.machineHours == null || obj.machineHours == null) return false;
			else
				if ( ! inObject.machineHours.equals(obj.machineHours)){
					return false;
				}

		if(inObject.relocationKm == null && obj.relocationKm == null){}
		else
			if(inObject.relocationKm == null || obj.relocationKm == null) return false;
			else
				if ( ! inObject.relocationKm.equals(obj.relocationKm)){
					return false;
				}

		if(inObject.transportationLoad == null && obj.transportationLoad == null){}
		else
			if(inObject.transportationLoad == null || obj.transportationLoad == null) return false;
			else
				if ( ! inObject.transportationLoad.equals(obj.transportationLoad)){
					return false;
				}

		if (inObject.isPrintOnKmOrMH != obj.isPrintOnKmOrMH){
					return false;
				}

		if(inObject.costWorksContractor == null && obj.costWorksContractor == null){}
		else
			if(inObject.costWorksContractor == null || obj.costWorksContractor == null) return false;
			else
				if ( ! inObject.costWorksContractor.equals(obj.costWorksContractor)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
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

		if (inObject.codeVirtualBrigade != obj.codeVirtualBrigade){
					return false;
				}

		if (inObject.isJobsByTime != obj.isJobsByTime){
					return false;
				}

		if (inObject.isVisitClient != obj.isVisitClient){
					return false;
				}

		if(inObject.productionExpensesPercent == null && obj.productionExpensesPercent == null){}
		else
			if(inObject.productionExpensesPercent == null || obj.productionExpensesPercent == null) return false;
			else
				if ( ! inObject.productionExpensesPercent.equals(obj.productionExpensesPercent)){
					return false;
				}

		if(inObject.administrativeExpensesPercent == null && obj.administrativeExpensesPercent == null){}
		else
			if(inObject.administrativeExpensesPercent == null || obj.administrativeExpensesPercent == null) return false;
			else
				if ( ! inObject.administrativeExpensesPercent.equals(obj.administrativeExpensesPercent)){
					return false;
				}

		if (inObject.servicePaymentKind != obj.servicePaymentKind){
					return false;
				}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.classificationTypeRef.code != obj.classificationTypeRef.code){
			return false;
		}
		if (inObject.connectionWorkTypeRef.code != obj.connectionWorkTypeRef.code){
			return false;
		}
		if (inObject.calcKindRef.code != obj.calcKindRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPlanWork2ClassificationType anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPlanWork2ClassificationType anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPLANWORK2CLASSFCTNTP (CODE,COUNTGEN,COMMENTGEN,USERGEN,DATEEDIT,MACHINEHOURS,RELOCATIONKM,TRANSPORTATIONLOAD,ISPRINTONKMORMH,COSTWORKSCONTRACTOR,DATEGEN,TIMESTART,TIMEFINAL,CODEVIRTUALBRIGADE,ISJOBSBYTIME,ISVISITCLIENT,PRODUCTIONEXPENSSPRCNT,ADMINISTRATVXPNSSPRCNT,MODIFY_TIME,SERVICEPAYMENTKIND,PLANREFCODE,CLASSIFICATIONTYPERFCD,CONNECTIONWORKTYPERFCD,CALCKINDREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.countGen);
			statement.setString(3, anObject.commentGen);
			statement.setString(4, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.machineHours != null) {
				anObject.machineHours = anObject.machineHours.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.machineHours);
			if (anObject.relocationKm != null) {
				anObject.relocationKm = anObject.relocationKm.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.relocationKm);
			if (anObject.transportationLoad != null) {
				anObject.transportationLoad = anObject.transportationLoad.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.transportationLoad);
			if (anObject.isPrintOnKmOrMH != Integer.MIN_VALUE ) {
				statement.setInt(9, anObject.isPrintOnKmOrMH);
			} else {
				statement.setNull(9, java.sql.Types.INTEGER);
			}
			if (anObject.costWorksContractor != null) {
				anObject.costWorksContractor = anObject.costWorksContractor.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.costWorksContractor);
			if (anObject.dateGen == null) {
				statement.setDate(11, null);
			} else {
				statement.setDate(11, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.timeStart == null) {
				statement.setTimestamp(12, null);
			} else {
				statement.setTimestamp(12, new java.sql.Timestamp(anObject.timeStart.getTime()));
			}
			if (anObject.timeFinal == null) {
				statement.setTimestamp(13, null);
			} else {
				statement.setTimestamp(13, new java.sql.Timestamp(anObject.timeFinal.getTime()));
			}
			if (anObject.codeVirtualBrigade != Integer.MIN_VALUE ) {
				statement.setInt(14, anObject.codeVirtualBrigade);
			} else {
				statement.setNull(14, java.sql.Types.INTEGER);
			}
			if (anObject.isJobsByTime != Integer.MIN_VALUE ) {
				statement.setInt(15, anObject.isJobsByTime);
			} else {
				statement.setNull(15, java.sql.Types.INTEGER);
			}
			if (anObject.isVisitClient != Integer.MIN_VALUE ) {
				statement.setInt(16, anObject.isVisitClient);
			} else {
				statement.setNull(16, java.sql.Types.INTEGER);
			}
			if (anObject.productionExpensesPercent != null) {
				anObject.productionExpensesPercent = anObject.productionExpensesPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17, anObject.productionExpensesPercent);
			if (anObject.administrativeExpensesPercent != null) {
				anObject.administrativeExpensesPercent = anObject.administrativeExpensesPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.administrativeExpensesPercent);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(19, null);
			} else {
				statement.setBigDecimal(19, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.servicePaymentKind != Integer.MIN_VALUE ) {
				statement.setInt(20, anObject.servicePaymentKind);
			} else {
				statement.setNull(20, java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(21,anObject.planRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.classificationTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.classificationTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENPlanWork2ClassificationType.classificationTypeRef.code%} = {%"+anObject.classificationTypeRef.code+"%}");
				}
				statement.setInt(22,anObject.classificationTypeRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}
			if (anObject.connectionWorkTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionWorkTypeDAOGen(connection,getUserProfile()).exists(anObject.connectionWorkTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType.connectionWorkTypeRef.code%} = {%"+anObject.connectionWorkTypeRef.code+"%}");
				}
				statement.setInt(23,anObject.connectionWorkTypeRef.code);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}
			if (anObject.calcKindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKCalcKindDAOGen(connection,getUserProfile()).exists(anObject.calcKindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENPlanWork2ClassificationType.calcKindRef.code%} = {%"+anObject.calcKindRef.code+"%}");
				}
				statement.setInt(24,anObject.calcKindRef.code);
			} else {
				statement.setNull(24,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENPlanWork2ClassificationTypeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPlanWork2ClassificationType anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPlanWork2ClassificationType anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENPlanWork2ClassificationType oldObject = new ENPlanWork2ClassificationType();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENPlanWork2ClassificationType.modify_time_Field+" FROM  ENPLANWORK2CLASSFCTNTP WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
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
					if(fieldNameStr.compareTo("MACHINEHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RELOCATIONKM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORTATIONLOAD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISPRINTONKMORMH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTWORKSCONTRACTOR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
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
					if(fieldNameStr.compareTo("CODEVIRTUALBRIGADE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISJOBSBYTIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISVISITCLIENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRODUCTIONEXPENSESPERCENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADMINISTRATIVEEXPENSESPERCENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICEPAYMENTKIND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLASSIFICATIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONWORKTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCKINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPLANWORK2CLASSFCTNTP SET  COUNTGEN = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MACHINEHOURS = ? , RELOCATIONKM = ? , TRANSPORTATIONLOAD = ? , ISPRINTONKMORMH = ? , COSTWORKSCONTRACTOR = ? , DATEGEN = ? , TIMESTART = ? , TIMEFINAL = ? , CODEVIRTUALBRIGADE = ? , ISJOBSBYTIME = ? , ISVISITCLIENT = ? , PRODUCTIONEXPENSSPRCNT = ? , ADMINISTRATVXPNSSPRCNT = ? , MODIFY_TIME = ? , SERVICEPAYMENTKIND = ? , PLANREFCODE = ? , CLASSIFICATIONTYPERFCD = ? , CONNECTIONWORKTYPERFCD = ? , CALCKINDREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPLANWORK2CLASSIFICATIONTYPE SET ";
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
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.countGen);
					statement.setString(2, anObject.commentGen);
					statement.setString(3, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.machineHours != null) {
						anObject.machineHours = anObject.machineHours.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.machineHours);
					if (anObject.relocationKm != null) {
						anObject.relocationKm = anObject.relocationKm.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.relocationKm);
					if (anObject.transportationLoad != null) {
						anObject.transportationLoad = anObject.transportationLoad.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.transportationLoad);
					if (anObject.isPrintOnKmOrMH != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.isPrintOnKmOrMH);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.costWorksContractor != null) {
						anObject.costWorksContractor = anObject.costWorksContractor.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.costWorksContractor);
					if (anObject.dateGen == null) {
						statement.setDate(10, null);
					} else {
						statement.setDate(10, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.timeStart == null) {
						statement.setTimestamp(11, null);
					} else {
						statement.setTimestamp(11, new java.sql.Timestamp(anObject.timeStart.getTime()));
					}
					if (anObject.timeFinal == null) {
						statement.setTimestamp(12, null);
					} else {
						statement.setTimestamp(12, new java.sql.Timestamp(anObject.timeFinal.getTime()));
					}
					if (anObject.codeVirtualBrigade != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.codeVirtualBrigade);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					if (anObject.isJobsByTime != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.isJobsByTime);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.isVisitClient != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.isVisitClient);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					if (anObject.productionExpensesPercent != null) {
						anObject.productionExpensesPercent = anObject.productionExpensesPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16, anObject.productionExpensesPercent);
					if (anObject.administrativeExpensesPercent != null) {
						anObject.administrativeExpensesPercent = anObject.administrativeExpensesPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.administrativeExpensesPercent);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(18, null);
					} else {
						statement.setBigDecimal(18, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.servicePaymentKind != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.servicePaymentKind);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(20, anObject.planRef.code);
					} else {
						statement.setNull(20, java.sql.Types.INTEGER);
					}
					if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.classificationTypeRef.code);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					if (anObject.connectionWorkTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(22, anObject.connectionWorkTypeRef.code);
					} else {
						statement.setNull(22, java.sql.Types.INTEGER);
					}
					if (anObject.calcKindRef.code != Integer.MIN_VALUE) {
						statement.setInt(23, anObject.calcKindRef.code);
					} else {
						statement.setNull(23, java.sql.Types.INTEGER);
					}
					statement.setInt(24, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGen);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
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
						if("MACHINEHOURS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.machineHours != null) {
								anObject.machineHours = anObject.machineHours.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.machineHours);
							continue;
						}
						if("RELOCATIONKM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.relocationKm != null) {
								anObject.relocationKm = anObject.relocationKm.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.relocationKm);
							continue;
						}
						if("TRANSPORTATIONLOAD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transportationLoad != null) {
								anObject.transportationLoad = anObject.transportationLoad.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.transportationLoad);
							continue;
						}
						if("ISPRINTONKMORMH".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isPrintOnKmOrMH);
							continue;
						}
						if("COSTWORKSCONTRACTOR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWorksContractor != null) {
								anObject.costWorksContractor = anObject.costWorksContractor.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costWorksContractor);
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
						if("CODEVIRTUALBRIGADE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.codeVirtualBrigade);
							continue;
						}
						if("ISJOBSBYTIME".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isJobsByTime);
							continue;
						}
						if("ISVISITCLIENT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isVisitClient);
							continue;
						}
						if("PRODUCTIONEXPENSESPERCENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.productionExpensesPercent != null) {
								anObject.productionExpensesPercent = anObject.productionExpensesPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.productionExpensesPercent);
							continue;
						}
						if("ADMINISTRATIVEEXPENSESPERCENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.administrativeExpensesPercent != null) {
								anObject.administrativeExpensesPercent = anObject.administrativeExpensesPercent.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.administrativeExpensesPercent);
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
						if("SERVICEPAYMENTKIND".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.servicePaymentKind);
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
						if("CLASSIFICATIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.classificationTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONNECTIONWORKTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.connectionWorkTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.connectionWorkTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CALCKINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcKindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.calcKindRef.code);
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

	} // end of save(ENPlanWork2ClassificationType anObject,String[] anAttributes)


	public ENPlanWork2ClassificationTypeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPlanWork2ClassificationType filterObject = new ENPlanWork2ClassificationType();
		Vector<ENPlanWork2ClassificationTypeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPlanWork2ClassificationTypeShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPlanWork2ClassificationType filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.machineHours, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.relocationKm, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.transportationLoad, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isPrintOnKmOrMH, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWorksContractor, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeStart, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeFinal, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.codeVirtualBrigade, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isJobsByTime, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isVisitClient, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.productionExpensesPercent, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.administrativeExpensesPercent, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicePaymentKind, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.classificationTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.connectionWorkTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcKindRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPlanWork2ClassificationTypeFilter filter) {
		String out = buildCondition((ENPlanWork2ClassificationType)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPlanWork2ClassificationType filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPlanWork2ClassificationType.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENPlanWork2ClassificationType.countGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENPlanWork2ClassificationType.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENPlanWork2ClassificationType.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENPlanWork2ClassificationType.dateEdit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.machineHours, ENPlanWork2ClassificationType.machineHours_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.relocationKm, ENPlanWork2ClassificationType.relocationKm_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.transportationLoad, ENPlanWork2ClassificationType.transportationLoad_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isPrintOnKmOrMH, ENPlanWork2ClassificationType.isPrintOnKmOrMH_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWorksContractor, ENPlanWork2ClassificationType.costWorksContractor_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENPlanWork2ClassificationType.dateGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeStart, ENPlanWork2ClassificationType.timeStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeFinal, ENPlanWork2ClassificationType.timeFinal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.codeVirtualBrigade, ENPlanWork2ClassificationType.codeVirtualBrigade_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isJobsByTime, ENPlanWork2ClassificationType.isJobsByTime_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isVisitClient, ENPlanWork2ClassificationType.isVisitClient_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.productionExpensesPercent, ENPlanWork2ClassificationType.productionExpensesPercent_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.administrativeExpensesPercent, ENPlanWork2ClassificationType.administrativeExpensesPercent_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENPlanWork2ClassificationType.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicePaymentKind, ENPlanWork2ClassificationType.servicePaymentKind_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENPlanWork2ClassificationType.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.classificationTypeRef.code, ENPlanWork2ClassificationType.classificationTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.connectionWorkTypeRef.code, ENPlanWork2ClassificationType.connectionWorkTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcKindRef.code, ENPlanWork2ClassificationType.calcKindRef_QFielld, out);
		}
		return out;
	}

	public ENPlanWork2ClassificationTypeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPlanWork2ClassificationTypeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPlanWork2ClassificationTypeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPlanWork2ClassificationTypeShortList getFilteredList(ENPlanWork2ClassificationType filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationType aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationType aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationTypeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationTypeFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPlanWork2ClassificationTypeShortList getScrollableFilteredList(ENPlanWork2ClassificationType aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPlanWork2ClassificationTypeShortList result = new ENPlanWork2ClassificationTypeShortList();
		ENPlanWork2ClassificationTypeShort anObject;
		result.list = new Vector<ENPlanWork2ClassificationTypeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANWORK2CLASSFCTNTP.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPLANWORK2CLASSFCTNTP.CODE"+
			",ENPLANWORK2CLASSFCTNTP.COUNTGEN"+
			",ENPLANWORK2CLASSFCTNTP.USERGEN"+
			",ENPLANWORK2CLASSFCTNTP.DATEEDIT"+
			",ENPLANWORK2CLASSFCTNTP.MACHINEHOURS"+
			",ENPLANWORK2CLASSFCTNTP.RELOCATIONKM"+
			",ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD"+
			",ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH"+
			",ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR"+
			",ENPLANWORK2CLASSFCTNTP.DATEGEN"+
			",ENPLANWORK2CLASSFCTNTP.TIMESTART"+
			",ENPLANWORK2CLASSFCTNTP.TIMEFINAL"+
			",ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE"+
			",ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME"+
			",ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT"+
			",ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT"+
			",ENPLANWORK2CLASSFCTNTP.ADMINISTRATVXPNSSPRCNT"+
			",ENPLANWORK2CLASSFCTNTP.SERVICEPAYMENTKIND"+
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
			", TKCLASSIFICATIONTYPE.CODE " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", TKCLASSIFICATIONTYPE.KOD " +
			", ENCONNECTIONWORKTYPE.CODE " +
			", ENCONNECTIONWORKTYPE.NAME " +
			", TKCALCKIND.CODE " +
		" FROM ENPLANWORK2CLASSFCTNTP " +
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENPLANWORK2CLASSFCTNTP.PLANREFCODE "+
			" LEFT JOIN TKCLASSIFICATIONTYPE on TKCLASSIFICATIONTYPE.CODE = ENPLANWORK2CLASSFCTNTP.CLASSIFICATIONTYPERFCD "+
			" LEFT JOIN ENCONNECTIONWORKTYPE on ENCONNECTIONWORKTYPE.CODE = ENPLANWORK2CLASSFCTNTP.CONNECTIONWORKTYPERFCD "+
			" LEFT JOIN TKCALCKIND on TKCALCKIND.CODE = ENPLANWORK2CLASSFCTNTP.CALCKINDREFCODE "+
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
				anObject = new ENPlanWork2ClassificationTypeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(3);
				anObject.dateEdit = set.getDate(4);
				anObject.machineHours = set.getBigDecimal(5);
				if(anObject.machineHours != null) {
					anObject.machineHours = anObject.machineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.relocationKm = set.getBigDecimal(6);
				if(anObject.relocationKm != null) {
					anObject.relocationKm = anObject.relocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportationLoad = set.getBigDecimal(7);
				if(anObject.transportationLoad != null) {
					anObject.transportationLoad = anObject.transportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isPrintOnKmOrMH = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.isPrintOnKmOrMH = Integer.MIN_VALUE;
				}
				anObject.costWorksContractor = set.getBigDecimal(9);
				if(anObject.costWorksContractor != null) {
					anObject.costWorksContractor = anObject.costWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dateGen = set.getDate(10);
				anObject.timeStart = set.getTimestamp(11);
				anObject.timeFinal = set.getTimestamp(12);
				anObject.codeVirtualBrigade = set.getInt(13);
				if ( set.wasNull() ) {
					anObject.codeVirtualBrigade = Integer.MIN_VALUE;
				}
				anObject.isJobsByTime = set.getInt(14);
				if ( set.wasNull() ) {
					anObject.isJobsByTime = Integer.MIN_VALUE;
				}
				anObject.isVisitClient = set.getInt(15);
				if ( set.wasNull() ) {
					anObject.isVisitClient = Integer.MIN_VALUE;
				}
				anObject.productionExpensesPercent = set.getBigDecimal(16);
				if(anObject.productionExpensesPercent != null) {
					anObject.productionExpensesPercent = anObject.productionExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.administrativeExpensesPercent = set.getBigDecimal(17);
				if(anObject.administrativeExpensesPercent != null) {
					anObject.administrativeExpensesPercent = anObject.administrativeExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicePaymentKind = set.getInt(18);
				if ( set.wasNull() ) {
					anObject.servicePaymentKind = Integer.MIN_VALUE;
				}

				anObject.planRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(20);
				anObject.planRefDateStart = set.getDate(21);
				anObject.planRefDateFinal = set.getDate(22);
				anObject.planRefYearGen = set.getInt(23);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(24);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(25);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(26);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(27);
				anObject.planRefDateEdit = set.getDate(28);
				anObject.planRefWorkOrderNumber = set.getString(29);
				anObject.planRefDateWorkOrder = set.getDate(30);
				anObject.planRefPriConnectionNumber = set.getString(31);
				anObject.planRefDateEndPriConnection = set.getDate(32);
				anObject.planRefInvestWorksDescription = set.getString(33);
				anObject.planRefServicesFSideFinId = set.getInt(34);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(35);
				anObject.planRefTotalTimeHours = set.getBigDecimal(36);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(37);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(38);
				anObject.classificationTypeRefCode = set.getInt(39);
				if(set.wasNull()) {
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRefName = set.getString(40);
				anObject.classificationTypeRefKod = set.getString(41);
				anObject.connectionWorkTypeRefCode = set.getInt(42);
				if(set.wasNull()) {
					anObject.connectionWorkTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.connectionWorkTypeRefName = set.getString(43);
				anObject.calcKindRefCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.calcKindRefCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENPlanWork2ClassificationTypeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPlanWork2ClassificationTypeFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPlanWork2ClassificationType aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPLANWORK2CLASSFCTNTP.CODE FROM ENPLANWORK2CLASSFCTNTP";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANWORK2CLASSFCTNTP.CODE";
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


	public ENPlanWork2ClassificationType getObject(int uid) throws PersistenceException {
		ENPlanWork2ClassificationType result = new ENPlanWork2ClassificationType();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPlanWork2ClassificationType anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPLANWORK2CLASSFCTNTP.CODE, ENPLANWORK2CLASSFCTNTP.COUNTGEN, ENPLANWORK2CLASSFCTNTP.COMMENTGEN, ENPLANWORK2CLASSFCTNTP.USERGEN, ENPLANWORK2CLASSFCTNTP.DATEEDIT, ENPLANWORK2CLASSFCTNTP.MACHINEHOURS, ENPLANWORK2CLASSFCTNTP.RELOCATIONKM, ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD, ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH, ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR, ENPLANWORK2CLASSFCTNTP.DATEGEN, ENPLANWORK2CLASSFCTNTP.TIMESTART, ENPLANWORK2CLASSFCTNTP.TIMEFINAL, ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE, ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME, ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT, ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT, ENPLANWORK2CLASSFCTNTP.ADMINISTRATVXPNSSPRCNT, ENPLANWORK2CLASSFCTNTP.MODIFY_TIME, ENPLANWORK2CLASSFCTNTP.SERVICEPAYMENTKIND, ENPLANWORK2CLASSFCTNTP.PLANREFCODE, ENPLANWORK2CLASSFCTNTP.CLASSIFICATIONTYPERFCD, ENPLANWORK2CLASSFCTNTP.CONNECTIONWORKTYPERFCD, ENPLANWORK2CLASSFCTNTP.CALCKINDREFCODE "
			+" FROM ENPLANWORK2CLASSFCTNTP WHERE ENPLANWORK2CLASSFCTNTP.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentGen = set.getString(3);
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getDate(5);
				anObject.machineHours = set.getBigDecimal(6);
				if(anObject.machineHours != null) {
					anObject.machineHours = anObject.machineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.relocationKm = set.getBigDecimal(7);
				if(anObject.relocationKm != null) {
					anObject.relocationKm = anObject.relocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportationLoad = set.getBigDecimal(8);
				if(anObject.transportationLoad != null) {
					anObject.transportationLoad = anObject.transportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isPrintOnKmOrMH = set.getInt(9);
				if (set.wasNull()) {
					anObject.isPrintOnKmOrMH = Integer.MIN_VALUE;
				}
				anObject.costWorksContractor = set.getBigDecimal(10);
				if(anObject.costWorksContractor != null) {
					anObject.costWorksContractor = anObject.costWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dateGen = set.getDate(11);
				anObject.timeStart = set.getTimestamp(12);
				anObject.timeFinal = set.getTimestamp(13);
				anObject.codeVirtualBrigade = set.getInt(14);
				if (set.wasNull()) {
					anObject.codeVirtualBrigade = Integer.MIN_VALUE;
				}
				anObject.isJobsByTime = set.getInt(15);
				if (set.wasNull()) {
					anObject.isJobsByTime = Integer.MIN_VALUE;
				}
				anObject.isVisitClient = set.getInt(16);
				if (set.wasNull()) {
					anObject.isVisitClient = Integer.MIN_VALUE;
				}
				anObject.productionExpensesPercent = set.getBigDecimal(17);
				if(anObject.productionExpensesPercent != null) {
					anObject.productionExpensesPercent = anObject.productionExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.administrativeExpensesPercent = set.getBigDecimal(18);
				if(anObject.administrativeExpensesPercent != null) {
					anObject.administrativeExpensesPercent = anObject.administrativeExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(19);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.servicePaymentKind = set.getInt(20);
				if (set.wasNull()) {
					anObject.servicePaymentKind = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.classificationTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.connectionWorkTypeRef.code = set.getInt(23);
				if (set.wasNull()) {
					anObject.connectionWorkTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.calcKindRef.code = set.getInt(24);
				if (set.wasNull()) {
					anObject.calcKindRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef ref = new com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef();
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

		selectStr = "DELETE FROM  ENPLANWORK2CLASSFCTNTP WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPlanWork2ClassificationType object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPlanWork2ClassificationType.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork2ClassificationType.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPlanWork2ClassificationType.remove%} access denied");
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
	
	public long count(ENPlanWork2ClassificationTypeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPlanWork2ClassificationTypeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPlanWork2ClassificationTypeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPLANWORK2CLASSFCTNTP", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENPLANWORK2CLASSFCTNTP WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPlanWork2ClassificationTypeFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPLANWORK2CLASSFCTNTP");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork2ClassificationType.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPlanWork2ClassificationType.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPLANWORK2CLASSFCTNTP.CODE FROM  ENPLANWORK2CLASSFCTNTP WHERE  ENPLANWORK2CLASSFCTNTP.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPLANWORK2CLASSFCTNTP.CODE");
		_checkConditionToken(condition,"countgen","ENPLANWORK2CLASSFCTNTP.COUNTGEN");
		_checkConditionToken(condition,"commentgen","ENPLANWORK2CLASSFCTNTP.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENPLANWORK2CLASSFCTNTP.USERGEN");
		_checkConditionToken(condition,"dateedit","ENPLANWORK2CLASSFCTNTP.DATEEDIT");
		_checkConditionToken(condition,"machinehours","ENPLANWORK2CLASSFCTNTP.MACHINEHOURS");
		_checkConditionToken(condition,"relocationkm","ENPLANWORK2CLASSFCTNTP.RELOCATIONKM");
		_checkConditionToken(condition,"transportationload","ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD");
		_checkConditionToken(condition,"isprintonkmormh","ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH");
		_checkConditionToken(condition,"costworkscontractor","ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR");
		_checkConditionToken(condition,"dategen","ENPLANWORK2CLASSFCTNTP.DATEGEN");
		_checkConditionToken(condition,"timestart","ENPLANWORK2CLASSFCTNTP.TIMESTART");
		_checkConditionToken(condition,"timefinal","ENPLANWORK2CLASSFCTNTP.TIMEFINAL");
		_checkConditionToken(condition,"codevirtualbrigade","ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE");
		_checkConditionToken(condition,"isjobsbytime","ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME");
		_checkConditionToken(condition,"isvisitclient","ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT");
		_checkConditionToken(condition,"productionexpensespercent","ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT");
		_checkConditionToken(condition,"administrativeexpensespercent","ENPLANWORK2CLASSFCTNTP.ADMINISTRATVXPNSSPRCNT");
		_checkConditionToken(condition,"modify_time","ENPLANWORK2CLASSFCTNTP.MODIFY_TIME");
		_checkConditionToken(condition,"servicepaymentkind","ENPLANWORK2CLASSFCTNTP.SERVICEPAYMENTKIND");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"classificationtyperef","CLASSIFICATIONTYPERFCD");
		_checkConditionToken(condition,"classificationtyperef.code","CLASSIFICATIONTYPERFCD");
		_checkConditionToken(condition,"connectionworktyperef","CONNECTIONWORKTYPERFCD");
		_checkConditionToken(condition,"connectionworktyperef.code","CONNECTIONWORKTYPERFCD");
		_checkConditionToken(condition,"calckindref","CALCKINDREFCODE");
		_checkConditionToken(condition,"calckindref.code","CALCKINDREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPlanWork2ClassificationType anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPLANWORK2CLASSFCTNTP", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPLANWORK2CLASSFCTNTP", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPLANWORK2CLASSFCTNTP", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPLANWORK2CLASSFCTNTP");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPlanWork2ClassificationTypeDAO
