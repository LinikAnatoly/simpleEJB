
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
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2ENAct;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ENActFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2ENActShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ENActShortList;


/**
 * DAO Object for SCUsageInputItemOZ2ENAct;
 *
 */

public class SCUsageInputItemOZ2ENActDAOGen extends GenericDataMiner {

	public SCUsageInputItemOZ2ENActDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCUsageInputItemOZ2ENActDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCUsageInputItemOZ2ENAct inObject) throws PersistenceException {
		SCUsageInputItemOZ2ENAct obj = new SCUsageInputItemOZ2ENAct();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.usageInputItemOZRef.code != obj.usageInputItemOZRef.code){
			return false;
		}
		if (inObject.enActRef.code != obj.enActRef.code){
			return false;
		}
		return true;
	}

	public int add(SCUsageInputItemOZ2ENAct anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCUsageInputItemOZ2ENAct anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCUSAGEINPUTITEMOZ2NCT (CODE,MODIFY_TIME,USAGEINPUTITEMOZREFCOD,ENACTREFCODE) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(2,null);
			} else {
				statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.usageInputItemOZRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).exists(anObject.usageInputItemOZRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ2ENAct.usageInputItemOZRef.code%} = {%"+anObject.usageInputItemOZRef.code+"%}");
				}
				statement.setInt(3,anObject.usageInputItemOZRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.enActRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.enActRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ2ENAct.enActRef.code%} = {%"+anObject.enActRef.code+"%}");
				}
				statement.setInt(4,anObject.enActRef.code);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%SCUsageInputItemOZ2ENActDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCUsageInputItemOZ2ENAct anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCUsageInputItemOZ2ENAct anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCUsageInputItemOZ2ENAct oldObject = new SCUsageInputItemOZ2ENAct();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCUsageInputItemOZ2ENAct.modify_time_Field+" FROM  SCUSAGEINPUTITEMOZ2NCT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USAGEINPUTITEMOZREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCUSAGEINPUTITEMOZ2NCT SET  MODIFY_TIME = ? , USAGEINPUTITEMOZREFCOD = ? , ENACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCUSAGEINPUTITEMOZ2ENACT SET ";
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
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(1,null);
					} else {
						statement.setBigDecimal(1,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.usageInputItemOZRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					if (anObject.enActRef.code != Integer.MIN_VALUE) {
						statement.setInt(3,anObject.enActRef.code);
					} else {
						statement.setNull(3,java.sql.Types.INTEGER);
					}
					statement.setInt(4,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("USAGEINPUTITEMOZREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.usageInputItemOZRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ENACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.enActRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.enActRef.code);
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

	} // end of save(SCUsageInputItemOZ2ENAct anObject,String[] anAttributes)


	public SCUsageInputItemOZ2ENActShort getShortObject(int anObjectCode) throws PersistenceException {
		SCUsageInputItemOZ2ENAct filterObject = new SCUsageInputItemOZ2ENAct();
		Vector<SCUsageInputItemOZ2ENActShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCUsageInputItemOZ2ENActShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCUsageInputItemOZ2ENAct filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.usageInputItemOZRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.enActRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCUsageInputItemOZ2ENActFilter filter) {
		String out = buildCondition((SCUsageInputItemOZ2ENAct)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCUsageInputItemOZ2ENAct filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCUsageInputItemOZ2ENAct.code_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCUsageInputItemOZ2ENAct.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.usageInputItemOZRef.code, SCUsageInputItemOZ2ENAct.usageInputItemOZRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.enActRef.code, SCUsageInputItemOZ2ENAct.enActRef_QFielld, out);
		}
		return out;
	}

	public SCUsageInputItemOZ2ENActShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCUsageInputItemOZ2ENActShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCUsageInputItemOZ2ENActShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCUsageInputItemOZ2ENActShortList getFilteredList(SCUsageInputItemOZ2ENAct filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(SCUsageInputItemOZ2ENAct aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(SCUsageInputItemOZ2ENAct aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(SCUsageInputItemOZ2ENActFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(SCUsageInputItemOZ2ENActFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCUsageInputItemOZ2ENActShortList getScrollableFilteredList(SCUsageInputItemOZ2ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		SCUsageInputItemOZ2ENActShortList result = new SCUsageInputItemOZ2ENActShortList();
		SCUsageInputItemOZ2ENActShort anObject;
		result.list = new Vector<SCUsageInputItemOZ2ENActShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUTITEMOZ2NCT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCUSAGEINPUTITEMOZ2NCT.CODE"+
			", SCUSAGEINPUTITEMOZ.CODE " +
			", SCUSAGEINPUTITEMOZ.NUMBERDOC " +
			", SCUSAGEINPUTITEMOZ.COUNTERTYPE " +
			", SCUSAGEINPUTITEMOZ.ACCOUNT " +
			", SCUSAGEINPUTITEMOZ.COST " +
			", SCUSAGEINPUTITEMOZ.COUNTGEN " +
			", SCUSAGEINPUTITEMOZ.SCCODE " +
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
			", ENACT.MOLCODEOBJECT " +
		" FROM SCUSAGEINPUTITEMOZ2NCT " +
			", SCUSAGEINPUTITEMOZ " +
			", ENACT " +
		"";
		whereStr = " SCUSAGEINPUTITEMOZ.CODE = SCUSAGEINPUTITEMOZ2NCT.USAGEINPUTITEMOZREFCOD" ; //+
		whereStr += " AND ENACT.CODE = SCUSAGEINPUTITEMOZ2NCT.ENACTREFCODE" ; //+

	
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
				anObject = new SCUsageInputItemOZ2ENActShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.usageInputItemOZRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.usageInputItemOZRefCode = Integer.MIN_VALUE;
				}
				anObject.usageInputItemOZRefNumberDoc = set.getString(3);
				anObject.usageInputItemOZRefCounterType = set.getString(4);
				anObject.usageInputItemOZRefAccount = set.getString(5);
				anObject.usageInputItemOZRefCost = set.getBigDecimal(6);
				if(anObject.usageInputItemOZRefCost != null) {
					anObject.usageInputItemOZRefCost = anObject.usageInputItemOZRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.usageInputItemOZRefCountGen = set.getInt(7);
				if(set.wasNull()) {
					anObject.usageInputItemOZRefCountGen = Integer.MIN_VALUE;
				}
				anObject.usageInputItemOZRefScCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.usageInputItemOZRefScCode = Integer.MIN_VALUE;
				}
				anObject.enActRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.enActRefCode = Integer.MIN_VALUE;
				}
				anObject.enActRefNumberGen = set.getString(10);
				anObject.enActRefDateGen = set.getDate(11);
				anObject.enActRefFinDocCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.enActRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.enActRefFinDocMechanicCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.enActRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.enActRefFinMolName = set.getString(14);
				anObject.enActRefFinMechanicName = set.getString(15);
				anObject.enActRefInvNumber = set.getString(16);
				anObject.enActRefUserGen = set.getString(17);
				anObject.enActRefDateEdit = set.getDate(18);
				///anObject.enActRefDateAct = set.getDate(19);
				///anObject.enActRefMolCodeObject = set.getString(20);

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
	
	public int[] getFilteredCodeArray(SCUsageInputItemOZ2ENActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(SCUsageInputItemOZ2ENActFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(SCUsageInputItemOZ2ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCUSAGEINPUTITEMOZ2NCT.CODE FROM SCUSAGEINPUTITEMOZ2NCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUTITEMOZ2NCT.CODE";
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

	public SCUsageInputItemOZ2ENAct getObject(int uid) throws PersistenceException {
		SCUsageInputItemOZ2ENAct result = new SCUsageInputItemOZ2ENAct();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(SCUsageInputItemOZ2ENAct anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  SCUSAGEINPUTITEMOZ2NCT.CODE, SCUSAGEINPUTITEMOZ2NCT.MODIFY_TIME, SCUSAGEINPUTITEMOZ2NCT.USAGEINPUTITEMOZREFCOD, SCUSAGEINPUTITEMOZ2NCT.ENACTREFCODE "
			+" FROM SCUSAGEINPUTITEMOZ2NCT WHERE SCUSAGEINPUTITEMOZ2NCT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.modify_time = set.getLong(2);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.usageInputItemOZRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.usageInputItemOZRef.code = Integer.MIN_VALUE;
				}
				anObject.enActRef.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.enActRef.code = Integer.MIN_VALUE;
				}
				if(anObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
					anObject.setUsageInputItemOZRef(
						new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).getRef(anObject.usageInputItemOZRef.code));
				}
				if(anObject.enActRef.code != Integer.MIN_VALUE) {
					anObject.setEnActRef(
						new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.enActRef.code));
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


	public com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2ENActRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2ENActRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2ENActRef();
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

		selectStr = "DELETE FROM  SCUSAGEINPUTITEMOZ2NCT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCUsageInputItemOZ2ENAct object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCUsageInputItemOZ2ENAct.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ2ENAct.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInputItemOZ2ENAct.remove%} access denied");
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
	
	public long count(SCUsageInputItemOZ2ENActFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCUsageInputItemOZ2ENActFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCUsageInputItemOZ2ENActFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCUSAGEINPUTITEMOZ2NCT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, SCUsageInputItemOZ2ENActFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "SCUSAGEINPUTITEMOZ2NCT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ2ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInputItemOZ2ENAct.getObject%} access denied");
		}

		selectStr =
			"SELECT  SCUSAGEINPUTITEMOZ2NCT.CODE FROM  SCUSAGEINPUTITEMOZ2NCT WHERE  SCUSAGEINPUTITEMOZ2NCT.CODE = ?";
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
		_checkConditionToken(condition,"code","SCUSAGEINPUTITEMOZ2NCT.CODE");
		_checkConditionToken(condition,"modify_time","SCUSAGEINPUTITEMOZ2NCT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"usageinputitemozref","USAGEINPUTITEMOZREFCOD");
		_checkConditionToken(condition,"usageinputitemozref.code","USAGEINPUTITEMOZREFCOD");
		_checkConditionToken(condition,"enactref","ENACTREFCODE");
		_checkConditionToken(condition,"enactref.code","ENACTREFCODE");
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
	
	private void _collectAutoIncrementFields(SCUsageInputItemOZ2ENAct anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEMOZ2NCT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ2NCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ2NCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCUSAGEINPUTITEMOZ2NCT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputItemOZ2ENActDAO
