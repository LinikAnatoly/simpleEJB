
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
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.brief.ENTransportItemShort;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;


/**
 * DAO Object for ENTransportItem;
 *
 */

public class ENTransportItemDAOGen extends GenericDataMiner {

	public ENTransportItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTransportItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTransportItem inObject) throws PersistenceException {
		ENTransportItem obj = new ENTransportItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countWorkGen == null && obj.countWorkGen == null){}
		else
			if(inObject.countWorkGen == null || obj.countWorkGen == null) return false;
			else
				if ( ! inObject.countWorkGen.equals(obj.countWorkGen)){
					return false;
				}

		if(inObject.countWorkFact == null && obj.countWorkFact == null){}
		else
			if(inObject.countWorkFact == null || obj.countWorkFact == null) return false;
			else
				if ( ! inObject.countWorkFact.equals(obj.countWorkFact)){
					return false;
				}

		if(inObject.price == null && obj.price == null){}
		else
			if(inObject.price == null || obj.price == null) return false;
			else
				if ( ! inObject.price.equals(obj.price)){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if(inObject.numberList == null && obj.numberList == null){}
		else
			if(inObject.numberList == null || obj.numberList == null) return false;
			else
				if ( ! inObject.numberList.equals(obj.numberList)){
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

		if (inObject.isUseTrailer != obj.isUseTrailer){
					return false;
				}

		if(inObject.distanceNorm == null && obj.distanceNorm == null){}
		else
			if(inObject.distanceNorm == null || obj.distanceNorm == null) return false;
			else
				if ( ! inObject.distanceNorm.equals(obj.distanceNorm)){
					return false;
				}

		if (inObject.amountOfJourneys != obj.amountOfJourneys){
					return false;
				}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.planItemRef.code != obj.planItemRef.code){
			return false;
		}
		if (inObject.transportReal.code != obj.transportReal.code){
			return false;
		}
		if (inObject.trailerTransportReal.code != obj.trailerTransportReal.code){
			return false;
		}
		if (inObject.transport.code != obj.transport.code){
			return false;
		}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		if (inObject.tktransportType.code != obj.tktransportType.code){
			return false;
		}
		if (inObject.finWorker.code != obj.finWorker.code){
			return false;
		}
		return true;
	}

	public int add(ENTransportItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTransportItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTRANSPORTITEM (CODE,COUNTWORKGEN,COUNTWORKFACT,PRICE,COST,NUMBERLIST,COMMENTGEN,USERGEN,DATEEDIT,ISUSETRAILER,DISTANCENORM,AMOUNTOFJOURNEYS,MODIFY_TIME,PLANREFCODE,PLANITEMREFCODE,TRANSPORTREALCODE,TRAILERTRANSPORTREALCD,TRANSPORTCODE,TYPEREFCODE,TKTRANSPORTTYPECODE,FINWORKERCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.countWorkGen != null) {
				anObject.countWorkGen = anObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.countWorkGen);
			if (anObject.countWorkFact != null) {
				anObject.countWorkFact = anObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.countWorkFact);
			if (anObject.price != null) {
				anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.price);
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.cost);
			statement.setString(6,anObject.numberList);
			statement.setString(7,anObject.commentGen);
			statement.setString(8,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(9,null);
			} else {
				statement.setDate(9,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.isUseTrailer != Integer.MIN_VALUE ) {
				statement.setInt(10,anObject.isUseTrailer);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.distanceNorm != null) {
				anObject.distanceNorm = anObject.distanceNorm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11,anObject.distanceNorm);
			if (anObject.amountOfJourneys != Integer.MIN_VALUE ) {
				statement.setInt(12,anObject.amountOfJourneys);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(13,null);
			} else {
				statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(14,anObject.planRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.planItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).exists(anObject.planItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportItem.planItemRef.code%} = {%"+anObject.planItemRef.code+"%}");
				}
				statement.setInt(15,anObject.planItemRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.transportReal.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportReal.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportItem.transportReal.code%} = {%"+anObject.transportReal.code+"%}");
				}
				statement.setInt(16,anObject.transportReal.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.trailerTransportReal.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.trailerTransportReal.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportItem.trailerTransportReal.code%} = {%"+anObject.trailerTransportReal.code+"%}");
				}
				statement.setInt(17,anObject.trailerTransportReal.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.transport.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).exists(anObject.transport.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportItem.transport.code%} = {%"+anObject.transport.code+"%}");
				}
				statement.setInt(18,anObject.transport.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportItem.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
				}
				statement.setInt(19,anObject.typeRef.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}
			if (anObject.tktransportType.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTransportTypeDAOGen(connection,getUserProfile()).exists(anObject.tktransportType.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportItem.tktransportType.code%} = {%"+anObject.tktransportType.code+"%}");
				}
				statement.setInt(20,anObject.tktransportType.code);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}
			if (anObject.finWorker.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportItem.finWorker.code%} = {%"+anObject.finWorker.code+"%}");
				}
				statement.setInt(21,anObject.finWorker.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTransportItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTransportItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTransportItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTransportItem oldObject = new ENTransportItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTransportItem.modify_time_Field+" FROM  ENTRANSPORTITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COUNTWORKGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTWORKFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUMBERLIST") == 0) {
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
					if(fieldNameStr.compareTo("ISUSETRAILER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DISTANCENORM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AMOUNTOFJOURNEYS") == 0) {
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
					if(fieldNameStr.compareTo("PLANITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORTREAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAILERTRANSPORTREAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TKTRANSPORTTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINWORKER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTRANSPORTITEM SET  COUNTWORKGEN = ? , COUNTWORKFACT = ? , PRICE = ? , COST = ? , NUMBERLIST = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , ISUSETRAILER = ? , DISTANCENORM = ? , AMOUNTOFJOURNEYS = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLANITEMREFCODE = ? , TRANSPORTREALCODE = ? , TRAILERTRANSPORTREALCD = ? , TRANSPORTCODE = ? , TYPEREFCODE = ? , TKTRANSPORTTYPECODE = ? , FINWORKERCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTRANSPORTITEM SET ";
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
					if (anObject.countWorkGen != null) {
						anObject.countWorkGen = anObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.countWorkGen);
					if (anObject.countWorkFact != null) {
						anObject.countWorkFact = anObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.countWorkFact);
					if (anObject.price != null) {
						anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.price);
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.cost);
					statement.setString(5,anObject.numberList);
					statement.setString(6,anObject.commentGen);
					statement.setString(7,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(8,null);
					} else {
						statement.setDate(8,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.isUseTrailer != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.isUseTrailer);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.distanceNorm != null) {
						anObject.distanceNorm = anObject.distanceNorm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10,anObject.distanceNorm);
					if (anObject.amountOfJourneys != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.amountOfJourneys);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(12,null);
					} else {
						statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(13,anObject.planRef.code);
					} else {
						statement.setNull(13,java.sql.Types.INTEGER);
					}
					if (anObject.planItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(14,anObject.planItemRef.code);
					} else {
						statement.setNull(14,java.sql.Types.INTEGER);
					}
					if (anObject.transportReal.code != Integer.MIN_VALUE) {
						statement.setInt(15,anObject.transportReal.code);
					} else {
						statement.setNull(15,java.sql.Types.INTEGER);
					}
					if (anObject.trailerTransportReal.code != Integer.MIN_VALUE) {
						statement.setInt(16,anObject.trailerTransportReal.code);
					} else {
						statement.setNull(16,java.sql.Types.INTEGER);
					}
					if (anObject.transport.code != Integer.MIN_VALUE) {
						statement.setInt(17,anObject.transport.code);
					} else {
						statement.setNull(17,java.sql.Types.INTEGER);
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(18,anObject.typeRef.code);
					} else {
						statement.setNull(18,java.sql.Types.INTEGER);
					}
					if (anObject.tktransportType.code != Integer.MIN_VALUE) {
						statement.setInt(19,anObject.tktransportType.code);
					} else {
						statement.setNull(19,java.sql.Types.INTEGER);
					}
					if (anObject.finWorker.code != Integer.MIN_VALUE) {
						statement.setInt(20,anObject.finWorker.code);
					} else {
						statement.setNull(20,java.sql.Types.INTEGER);
					}
					statement.setInt(21,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTWORKGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countWorkGen != null) {
								anObject.countWorkGen = anObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countWorkGen);
							continue;
						}
						if("COUNTWORKFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countWorkFact != null) {
								anObject.countWorkFact = anObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countWorkFact);
							continue;
						}
						if("PRICE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.price != null) {
								anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.price);
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("NUMBERLIST".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.numberList);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("ISUSETRAILER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isUseTrailer);
							continue;
						}
						if("DISTANCENORM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.distanceNorm != null) {
								anObject.distanceNorm = anObject.distanceNorm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.distanceNorm);
							continue;
						}
						if("AMOUNTOFJOURNEYS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.amountOfJourneys);
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
						if("PLANITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRANSPORTREAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transportReal.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.transportReal.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRAILERTRANSPORTREAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.trailerTransportReal.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.trailerTransportReal.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRANSPORT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transport.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.transport.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.typeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TKTRANSPORTTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tktransportType.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.tktransportType.code);
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

	} // end of save(ENTransportItem anObject,String[] anAttributes)


	public ENTransportItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTransportItem filterObject = new ENTransportItem();
		Vector<ENTransportItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTransportItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTransportItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countWorkGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countWorkFact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.price, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberList, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isUseTrailer, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.distanceNorm, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.amountOfJourneys, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.transportReal.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.trailerTransportReal.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.transport.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tktransportType.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finWorker.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTransportItemFilter filter) {
		String out = buildCondition((ENTransportItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTransportItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTransportItem.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countWorkGen, ENTransportItem.countWorkGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countWorkFact, ENTransportItem.countWorkFact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.price, ENTransportItem.price_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, ENTransportItem.cost_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberList, ENTransportItem.numberList_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENTransportItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENTransportItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENTransportItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isUseTrailer, ENTransportItem.isUseTrailer_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.distanceNorm, ENTransportItem.distanceNorm_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.amountOfJourneys, ENTransportItem.amountOfJourneys_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTransportItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENTransportItem.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planItemRef.code, ENTransportItem.planItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.transportReal.code, ENTransportItem.transportReal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.trailerTransportReal.code, ENTransportItem.trailerTransportReal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.transport.code, ENTransportItem.transport_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENTransportItem.typeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tktransportType.code, ENTransportItem.tktransportType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finWorker.code, ENTransportItem.finWorker_QFielld, out);
		}
		return out;
	}

	public ENTransportItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTransportItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTransportItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTransportItemShortList getFilteredList(ENTransportItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTransportItemShortList getScrollableFilteredList(ENTransportItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTransportItemShortList getScrollableFilteredList(ENTransportItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTransportItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTransportItemShortList getScrollableFilteredList(ENTransportItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTransportItemShortList getScrollableFilteredList(ENTransportItemFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTransportItemShortList getScrollableFilteredList(ENTransportItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENTransportItemShortList result = new ENTransportItemShortList();
		ENTransportItemShort anObject;
		result.list = new Vector<ENTransportItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRANSPORTITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTRANSPORTITEM.CODE"+
			",ENTRANSPORTITEM.COUNTWORKGEN"+
			",ENTRANSPORTITEM.COUNTWORKFACT"+
			",ENTRANSPORTITEM.PRICE"+
			",ENTRANSPORTITEM.COST"+
			",ENTRANSPORTITEM.USERGEN"+
			",ENTRANSPORTITEM.DATEEDIT"+
			",ENTRANSPORTITEM.DISTANCENORM"+
			",ENTRANSPORTITEM.AMOUNTOFJOURNEYS"+
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
			", TKTRANSPORTREAL.CODE " +
			", TKTRANSPORTREAL.NAME " +
			", TKTRANSPORTREAL.INVNUMBER " +
			", TKTRANSPORTREAL.GOSNUMBER " +
			", TKTRANSPORTREAL.CODE " +
			", TKTRANSPORTREAL.NAME " +
			", TKTRANSPORTREAL.INVNUMBER " +
			", TKTRANSPORTREAL.GOSNUMBER " +
			", TKTRANSPORT.CODE " +
			", TKTRANSPORT.NAME " +
			", ENESTIMATEITEMTYPE.CODE " +
			", ENESTIMATEITEMTYPE.NAME " +
			", TKTRANSPORTTYPE.CODE " +
			", TKTRANSPORTTYPE.NAME " +
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
		" FROM ENTRANSPORTITEM " +
			", ENPLANWORK " +
			", ENPLANWORKITEM " +
			", TKTRANSPORTREAL " +
			", TKTRANSPORTREAL " +
			", TKTRANSPORT " +
			", ENESTIMATEITEMTYPE " +
			", TKTRANSPORTTYPE " +
			", FINWORKER " +
		"";
		whereStr = " ENPLANWORK.CODE = ENTRANSPORTITEM.PLANREFCODE" ; //+
		whereStr += " AND ENPLANWORKITEM.CODE = ENTRANSPORTITEM.PLANITEMREFCODE" ; //+
		whereStr += " AND TKTRANSPORTREAL.CODE = ENTRANSPORTITEM.TRANSPORTREALCODE" ; //+
		whereStr += " AND TKTRANSPORTREAL.CODE = ENTRANSPORTITEM.TRAILERTRANSPORTREALCD" ; //+
		whereStr += " AND TKTRANSPORT.CODE = ENTRANSPORTITEM.TRANSPORTCODE" ; //+
		whereStr += " AND ENESTIMATEITEMTYPE.CODE = ENTRANSPORTITEM.TYPEREFCODE" ; //+
		whereStr += " AND TKTRANSPORTTYPE.CODE = ENTRANSPORTITEM.TKTRANSPORTTYPECODE" ; //+
		whereStr += " AND FINWORKER.CODE = ENTRANSPORTITEM.FINWORKERCODE" ; //+

	
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
				anObject = new ENTransportItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countWorkGen = set.getBigDecimal(2);
				if(anObject.countWorkGen != null) {
					anObject.countWorkGen = anObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countWorkFact = set.getBigDecimal(3);
				if(anObject.countWorkFact != null) {
					anObject.countWorkFact = anObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(4);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost = set.getBigDecimal(5);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getDate(7);
				anObject.distanceNorm = set.getBigDecimal(8);
				if(anObject.distanceNorm != null) {
					anObject.distanceNorm = anObject.distanceNorm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.amountOfJourneys = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.amountOfJourneys = Integer.MIN_VALUE;
				}

				anObject.planRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(11);
				anObject.planRefDateStart = set.getDate(12);
				anObject.planRefDateFinal = set.getDate(13);
				anObject.planRefYearGen = set.getInt(14);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(15);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				/*anObject.planRefYearOriginal = set.getInt(16);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}*/
				anObject.planRefUserGen = set.getString(18);
				anObject.planRefDateEdit = set.getDate(19);
				anObject.planRefWorkOrderNumber = set.getString(20);
				/*anObject.planRefDateWorkOrder = set.getDate(21);
				anObject.planRefPriConnectionNumber = set.getString(22);
				anObject.planRefDateEndPriConnection = set.getDate(23);
				anObject.planRefInvestWorksDescription = set.getString(24);
				anObject.planRefServicesFSideFinId = set.getInt(25);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(26);
				anObject.planRefTotalTimeHours = set.getBigDecimal(27);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(28);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(29);
				anObject.planItemRefCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.planItemRefCode = Integer.MIN_VALUE;
				}
				anObject.planItemRefCountGen = set.getBigDecimal(31);
				if(anObject.planItemRefCountGen != null) {
					anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefTimeGen = set.getBigDecimal(32);
				if(anObject.planItemRefTimeGen != null) {
					anObject.planItemRefTimeGen = anObject.planItemRefTimeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefCostGen = set.getBigDecimal(33);
				if(anObject.planItemRefCostGen != null) {
					anObject.planItemRefCostGen = anObject.planItemRefCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}*/
				anObject.planItemRefUserGen = set.getString(34);
				anObject.planItemRefDateEdit = set.getDate(35);
				anObject.transportRealCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.transportRealCode = Integer.MIN_VALUE;
				}
				anObject.transportRealName = set.getString(37);
				anObject.transportRealInvNumber = set.getString(38);
				anObject.transportRealGosNumber = set.getString(39);
				anObject.trailerTransportRealCode = set.getInt(40);
				if(set.wasNull()) {
					anObject.trailerTransportRealCode = Integer.MIN_VALUE;
				}
				anObject.trailerTransportRealName = set.getString(41);
				anObject.trailerTransportRealInvNumber = set.getString(42);
				anObject.trailerTransportRealGosNumber = set.getString(43);
				anObject.transportCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.transportCode = Integer.MIN_VALUE;
				}
				anObject.transportName = set.getString(45);
				anObject.typeRefCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(47);
				anObject.tktransportTypeCode = set.getInt(48);
				if(set.wasNull()) {
					anObject.tktransportTypeCode = Integer.MIN_VALUE;
				}
				anObject.tktransportTypeName = set.getString(49);
				anObject.finWorkerCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.finWorkerCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerName = set.getString(51);
				anObject.finWorkerTabNumber = set.getString(52);
				anObject.finWorkerPositionName = set.getString(53);
				/*anObject.finWorkerPositionCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.finWorkerPositionCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerDepartmentName = set.getString(55);
				anObject.finWorkerDepartmentCode = set.getString(56);
				anObject.finWorkerPriceGen = set.getBigDecimal(57);
				if(anObject.finWorkerPriceGen != null) {
					anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finWorkerCategor = set.getInt(58);
				if(set.wasNull()) {
					anObject.finWorkerCategor = Integer.MIN_VALUE;
				}
				anObject.finWorkerFinCode = set.getInt(59);
				if(set.wasNull()) {
					anObject.finWorkerFinCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerIsSentAssignment = set.getInt(60);
				if(set.wasNull()) {
					anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
				}
				anObject.finWorkerChargePercent = set.getBigDecimal(61);
				if(anObject.finWorkerChargePercent != null) {
					anObject.finWorkerChargePercent = anObject.finWorkerChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finWorkerCategorId = set.getInt(62);
				if(set.wasNull()) {
					anObject.finWorkerCategorId = Integer.MIN_VALUE;
				}
				anObject.finWorkerCategorName = set.getString(63);
				anObject.finWorkerWorkTimeId = set.getString(64);
				anObject.finWorkerPositionId = set.getString(65);*/

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
	
	public int[] getFilteredCodeArray(ENTransportItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTransportItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTransportItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTRANSPORTITEM.CODE FROM ENTRANSPORTITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRANSPORTITEM.CODE";
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

	public ENTransportItem getObject(int uid) throws PersistenceException {
		ENTransportItem result = new ENTransportItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENTransportItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENTRANSPORTITEM.CODE, ENTRANSPORTITEM.COUNTWORKGEN, ENTRANSPORTITEM.COUNTWORKFACT, ENTRANSPORTITEM.PRICE, ENTRANSPORTITEM.COST, ENTRANSPORTITEM.NUMBERLIST, ENTRANSPORTITEM.COMMENTGEN, ENTRANSPORTITEM.USERGEN, ENTRANSPORTITEM.DATEEDIT, ENTRANSPORTITEM.ISUSETRAILER, ENTRANSPORTITEM.DISTANCENORM, ENTRANSPORTITEM.AMOUNTOFJOURNEYS, ENTRANSPORTITEM.MODIFY_TIME, ENTRANSPORTITEM.PLANREFCODE, ENTRANSPORTITEM.PLANITEMREFCODE, ENTRANSPORTITEM.TRANSPORTREALCODE, ENTRANSPORTITEM.TRAILERTRANSPORTREALCD, ENTRANSPORTITEM.TRANSPORTCODE, ENTRANSPORTITEM.TYPEREFCODE, ENTRANSPORTITEM.TKTRANSPORTTYPECODE, ENTRANSPORTITEM.FINWORKERCODE "
			+" FROM ENTRANSPORTITEM WHERE ENTRANSPORTITEM.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.countWorkGen = set.getBigDecimal(2);
				if(anObject.countWorkGen != null) {
					anObject.countWorkGen = anObject.countWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countWorkFact = set.getBigDecimal(3);
				if(anObject.countWorkFact != null) {
					anObject.countWorkFact = anObject.countWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(4);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost = set.getBigDecimal(5);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.numberList = set.getString(6);
				anObject.commentGen = set.getString(7);
				anObject.userGen = set.getString(8);
				anObject.dateEdit = set.getDate(9);
				anObject.isUseTrailer = set.getInt(10);
				if (set.wasNull()) {
					anObject.isUseTrailer = Integer.MIN_VALUE;
				}
				anObject.distanceNorm = set.getBigDecimal(11);
				if(anObject.distanceNorm != null) {
					anObject.distanceNorm = anObject.distanceNorm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.amountOfJourneys = set.getInt(12);
				if (set.wasNull()) {
					anObject.amountOfJourneys = Integer.MIN_VALUE;
				}
				anObject.modify_time = set.getLong(13);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.planItemRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.planItemRef.code = Integer.MIN_VALUE;
				}
				anObject.transportReal.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.transportReal.code = Integer.MIN_VALUE;
				}
				anObject.trailerTransportReal.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.trailerTransportReal.code = Integer.MIN_VALUE;
				}
				anObject.transport.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.transport.code = Integer.MIN_VALUE;
				}
				anObject.typeRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
				}
				anObject.tktransportType.code = set.getInt(20);
				if (set.wasNull()) {
					anObject.tktransportType.code = Integer.MIN_VALUE;
				}
				anObject.finWorker.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.finWorker.code = Integer.MIN_VALUE;
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.planItemRef.code != Integer.MIN_VALUE) {
					anObject.setPlanItemRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).getRef(anObject.planItemRef.code));
				}
				if(anObject.transportReal.code != Integer.MIN_VALUE) {
					anObject.setTransportReal(
						new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.transportReal.code));
				}
				if(anObject.trailerTransportReal.code != Integer.MIN_VALUE) {
					anObject.setTrailerTransportReal(
						new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.trailerTransportReal.code));
				}
				if(anObject.transport.code != Integer.MIN_VALUE) {
					anObject.setTransport(
						new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).getObject(anObject.transport.code));
				}
				if(anObject.typeRef.code != Integer.MIN_VALUE) {
					anObject.setTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
				}
				if(anObject.tktransportType.code != Integer.MIN_VALUE) {
					anObject.setTktransportType(
						new com.ksoe.techcard.dataminer.generated.TKTransportTypeDAOGen(connection,getUserProfile()).getObject(anObject.tktransportType.code));
				}
				if(anObject.finWorker.code != Integer.MIN_VALUE) {
					anObject.setFinWorker(
						new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker.code));
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


	public com.ksoe.energynet.valueobject.references.ENTransportItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTransportItemRef ref = new com.ksoe.energynet.valueobject.references.ENTransportItemRef();
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

		selectStr = "DELETE FROM  ENTRANSPORTITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTransportItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTransportItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENTransportItem.remove%} access denied");
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
	
	public long count(ENTransportItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTransportItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTransportItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTRANSPORTITEM", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTransportItemFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTRANSPORTITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTransportItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENTRANSPORTITEM.CODE FROM  ENTRANSPORTITEM WHERE  ENTRANSPORTITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTRANSPORTITEM.CODE");
		_checkConditionToken(condition,"countworkgen","ENTRANSPORTITEM.COUNTWORKGEN");
		_checkConditionToken(condition,"countworkfact","ENTRANSPORTITEM.COUNTWORKFACT");
		_checkConditionToken(condition,"price","ENTRANSPORTITEM.PRICE");
		_checkConditionToken(condition,"cost","ENTRANSPORTITEM.COST");
		_checkConditionToken(condition,"numberlist","ENTRANSPORTITEM.NUMBERLIST");
		_checkConditionToken(condition,"commentgen","ENTRANSPORTITEM.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENTRANSPORTITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENTRANSPORTITEM.DATEEDIT");
		_checkConditionToken(condition,"isusetrailer","ENTRANSPORTITEM.ISUSETRAILER");
		_checkConditionToken(condition,"distancenorm","ENTRANSPORTITEM.DISTANCENORM");
		_checkConditionToken(condition,"amountofjourneys","ENTRANSPORTITEM.AMOUNTOFJOURNEYS");
		_checkConditionToken(condition,"modify_time","ENTRANSPORTITEM.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"planitemref","PLANITEMREFCODE");
		_checkConditionToken(condition,"planitemref.code","PLANITEMREFCODE");
		_checkConditionToken(condition,"transportreal","TRANSPORTREALCODE");
		_checkConditionToken(condition,"transportreal.code","TRANSPORTREALCODE");
		_checkConditionToken(condition,"trailertransportreal","TRAILERTRANSPORTREALCD");
		_checkConditionToken(condition,"trailertransportreal.code","TRAILERTRANSPORTREALCD");
		_checkConditionToken(condition,"transport","TRANSPORTCODE");
		_checkConditionToken(condition,"transport.code","TRANSPORTCODE");
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
		_checkConditionToken(condition,"tktransporttype","TKTRANSPORTTYPECODE");
		_checkConditionToken(condition,"tktransporttype.code","TKTRANSPORTTYPECODE");
		//_checkConditionToken(condition,"finworker","FINWORKERCODE");
		//_checkConditionToken(condition,"finworker.code","FINWORKERCODE");
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
	
	private void _collectAutoIncrementFields(ENTransportItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTRANSPORTITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRANSPORTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRANSPORTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTRANSPORTITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTransportItemDAO
