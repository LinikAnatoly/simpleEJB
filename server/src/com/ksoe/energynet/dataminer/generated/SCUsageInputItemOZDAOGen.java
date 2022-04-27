
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
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZShortList;


/**
 * DAO Object for SCUsageInputItemOZ;
 *
 */

public class SCUsageInputItemOZDAOGen extends GenericDataMiner {

	public SCUsageInputItemOZDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCUsageInputItemOZDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCUsageInputItemOZ inObject) throws PersistenceException {
		SCUsageInputItemOZ obj = new SCUsageInputItemOZ();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberDoc == null && obj.numberDoc == null){}
		else
			if(inObject.numberDoc == null || obj.numberDoc == null) return false;
			else
				if ( ! inObject.numberDoc.equals(obj.numberDoc)){
					return false;
				}

		if (inObject.numberInt != obj.numberInt){
					return false;
				}

		if(inObject.counterType == null && obj.counterType == null){}
		else
			if(inObject.counterType == null || obj.counterType == null) return false;
			else
				if ( ! inObject.counterType.equals(obj.counterType)){
					return false;
				}

		if(inObject.account == null && obj.account == null){}
		else
			if(inObject.account == null || obj.account == null) return false;
			else
				if ( ! inObject.account.equals(obj.account)){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if (inObject.countGen != obj.countGen){
					return false;
				}

		if (inObject.scCode != obj.scCode){
					return false;
				}
		if (inObject.usageInputItemRef.code != obj.usageInputItemRef.code){
			return false;
		}
		if (inObject.budgetRef.code != obj.budgetRef.code){
			return false;
		}
		return true;
	}

	public int add(SCUsageInputItemOZ anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCUsageInputItemOZ anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCUSAGEINPUTITEMOZ (CODE,NUMBERDOC,NUMBERINT,COUNTERTYPE,ACCOUNT,COST,COUNTGEN,SCCODE,MODIFY_TIME,USAGEINPUTITEMREFCODE,BUDGETREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.numberDoc);
			if (anObject.numberInt != Integer.MIN_VALUE ) {
				statement.setInt(3,anObject.numberInt);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			statement.setString(4,anObject.counterType);
			statement.setString(5,anObject.account);
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.cost);
			if (anObject.countGen != Integer.MIN_VALUE ) {
				statement.setInt(7,anObject.countGen);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.scCode != Integer.MIN_VALUE ) {
				statement.setInt(8,anObject.scCode);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(9,null);
			} else {
				statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.usageInputItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputItemDAOGen(connection,getUserProfile()).exists(anObject.usageInputItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ.usageInputItemRef.code%} = {%"+anObject.usageInputItemRef.code+"%}");
				}
				statement.setInt(10,anObject.usageInputItemRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.budgetRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.budgetRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ.budgetRef.code%} = {%"+anObject.budgetRef.code+"%}");
				}
				statement.setInt(11,anObject.budgetRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%SCUsageInputItemOZDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCUsageInputItemOZ anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCUsageInputItemOZ anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCUsageInputItemOZ oldObject = new SCUsageInputItemOZ();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCUsageInputItemOZ.modify_time_Field+" FROM  SCUSAGEINPUTITEMOZ WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NUMBERDOC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUMBERINT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USAGEINPUTITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUDGETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCUSAGEINPUTITEMOZ SET  NUMBERDOC = ? , NUMBERINT = ? , COUNTERTYPE = ? , ACCOUNT = ? , COST = ? , COUNTGEN = ? , SCCODE = ? , MODIFY_TIME = ? , USAGEINPUTITEMREFCODE = ? , BUDGETREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCUSAGEINPUTITEMOZ SET ";
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
					statement.setString(1,anObject.numberDoc);
					if (anObject.numberInt != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.numberInt);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setString(3,anObject.counterType);
					statement.setString(4,anObject.account);
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.cost);
					if (anObject.countGen != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.countGen);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.scCode != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.scCode);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(8,null);
					} else {
						statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.usageInputItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.usageInputItemRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.budgetRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.budgetRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					statement.setInt(11,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERDOC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.numberDoc);
							continue;
						}
						if("NUMBERINT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.numberInt);
							continue;
						}
						if("COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.counterType);
							continue;
						}
						if("ACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.account);
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.countGen);
							continue;
						}
						if("SCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.scCode);
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
						if("USAGEINPUTITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.usageInputItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.usageInputItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("BUDGETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.budgetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.budgetRef.code);
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

	} // end of save(SCUsageInputItemOZ anObject,String[] anAttributes)


	public SCUsageInputItemOZShort getShortObject(int anObjectCode) throws PersistenceException {
		SCUsageInputItemOZ filterObject = new SCUsageInputItemOZ();
		Vector<SCUsageInputItemOZShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCUsageInputItemOZShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCUsageInputItemOZ filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberDoc, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.numberInt, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.account, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.scCode, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.usageInputItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.budgetRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCUsageInputItemOZFilter filter) {
		String out = buildCondition((SCUsageInputItemOZ)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCUsageInputItemOZ filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCUsageInputItemOZ.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberDoc, SCUsageInputItemOZ.numberDoc_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.numberInt, SCUsageInputItemOZ.numberInt_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, SCUsageInputItemOZ.counterType_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.account, SCUsageInputItemOZ.account_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, SCUsageInputItemOZ.cost_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.countGen, SCUsageInputItemOZ.countGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.scCode, SCUsageInputItemOZ.scCode_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCUsageInputItemOZ.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.usageInputItemRef.code, SCUsageInputItemOZ.usageInputItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.budgetRef.code, SCUsageInputItemOZ.budgetRef_QFielld, out);
		}
		return out;
	}

	public SCUsageInputItemOZShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCUsageInputItemOZShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCUsageInputItemOZShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCUsageInputItemOZShortList getFilteredList(SCUsageInputItemOZ filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZ aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZ aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCUsageInputItemOZShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCUsageInputItemOZShortList getScrollableFilteredList(SCUsageInputItemOZ aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		SCUsageInputItemOZShortList result = new SCUsageInputItemOZShortList();
		SCUsageInputItemOZShort anObject;
		result.list = new Vector<SCUsageInputItemOZShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUTITEMOZ.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCUSAGEINPUTITEMOZ.CODE"+
			",SCUSAGEINPUTITEMOZ.NUMBERDOC"+
			",SCUSAGEINPUTITEMOZ.COUNTERTYPE"+
			",SCUSAGEINPUTITEMOZ.ACCOUNT"+
			",SCUSAGEINPUTITEMOZ.COST"+
			",SCUSAGEINPUTITEMOZ.COUNTGEN"+
			",SCUSAGEINPUTITEMOZ.SCCODE"+
			", SCUSAGEINPUTITEM.CODE " +
			", SCUSAGEINPUTITEM.NUMBERDOC " +
			", SCUSAGEINPUTITEM.COUNTGEN " +
			", SCUSAGEINPUTITEM.SCCODE " +
			", SCUSAGEINPUTITEM.MOLCODE " +
			", SCUSAGEINPUTITEM.MOLNAME " +
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
		" FROM SCUSAGEINPUTITEMOZ " +
			", SCUSAGEINPUTITEM " +
			", ENDEPARTMENT " +
		"";
		whereStr = " SCUSAGEINPUTITEM.CODE = SCUSAGEINPUTITEMOZ.USAGEINPUTITEMREFCODE" ; //+
		whereStr += " AND ENDEPARTMENT.CODE = SCUSAGEINPUTITEMOZ.BUDGETREFCODE" ; //+

	
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
				anObject = new SCUsageInputItemOZShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberDoc = set.getString(2);
				anObject.counterType = set.getString(3);
				anObject.account = set.getString(4);
				anObject.cost = set.getBigDecimal(5);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGen = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.countGen = Integer.MIN_VALUE;
				}
				anObject.scCode = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.scCode = Integer.MIN_VALUE;
				}

				anObject.usageInputItemRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.usageInputItemRefCode = Integer.MIN_VALUE;
				}
				anObject.usageInputItemRefNumberDoc = set.getString(9);
				anObject.usageInputItemRefCountGen = set.getInt(10);
				if(set.wasNull()) {
					anObject.usageInputItemRefCountGen = Integer.MIN_VALUE;
				}
				anObject.usageInputItemRefScCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.usageInputItemRefScCode = Integer.MIN_VALUE;
				}
				///anObject.usageInputItemRefMolCode = set.getString(12);
				///anObject.usageInputItemRefMolName = set.getString(13);
				anObject.budgetRefCode = set.getInt(14);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShortName = set.getString(15);

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
	
	public int[] getFilteredCodeArray(SCUsageInputItemOZFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(SCUsageInputItemOZFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(SCUsageInputItemOZ aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCUSAGEINPUTITEMOZ.CODE FROM SCUSAGEINPUTITEMOZ";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUTITEMOZ.CODE";
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

	public SCUsageInputItemOZ getObject(int uid) throws PersistenceException {
		SCUsageInputItemOZ result = new SCUsageInputItemOZ();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(SCUsageInputItemOZ anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  SCUSAGEINPUTITEMOZ.CODE, SCUSAGEINPUTITEMOZ.NUMBERDOC, SCUSAGEINPUTITEMOZ.NUMBERINT, SCUSAGEINPUTITEMOZ.COUNTERTYPE, SCUSAGEINPUTITEMOZ.ACCOUNT, SCUSAGEINPUTITEMOZ.COST, SCUSAGEINPUTITEMOZ.COUNTGEN, SCUSAGEINPUTITEMOZ.SCCODE, SCUSAGEINPUTITEMOZ.MODIFY_TIME, SCUSAGEINPUTITEMOZ.USAGEINPUTITEMREFCODE, SCUSAGEINPUTITEMOZ.BUDGETREFCODE "
			+" FROM SCUSAGEINPUTITEMOZ WHERE SCUSAGEINPUTITEMOZ.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberDoc = set.getString(2);
				anObject.numberInt = set.getInt(3);
				if (set.wasNull()) {
					anObject.numberInt = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(4);
				anObject.account = set.getString(5);
				anObject.cost = set.getBigDecimal(6);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGen = set.getInt(7);
				if (set.wasNull()) {
					anObject.countGen = Integer.MIN_VALUE;
				}
				anObject.scCode = set.getInt(8);
				if (set.wasNull()) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.modify_time = set.getLong(9);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.usageInputItemRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.usageInputItemRef.code = Integer.MIN_VALUE;
				}
				anObject.budgetRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.budgetRef.code = Integer.MIN_VALUE;
				}
				if(anObject.usageInputItemRef.code != Integer.MIN_VALUE) {
					anObject.setUsageInputItemRef(
						new com.ksoe.energynet.dataminer.generated.SCUsageInputItemDAOGen(connection,getUserProfile()).getRef(anObject.usageInputItemRef.code));
				}
				if(anObject.budgetRef.code != Integer.MIN_VALUE) {
					anObject.setBudgetRef(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.budgetRef.code));
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


	public com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef();
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

		selectStr = "DELETE FROM  SCUSAGEINPUTITEMOZ WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCUsageInputItemOZ object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCUsageInputItemOZ.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInputItemOZ.remove%} access denied");
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
	
	public long count(SCUsageInputItemOZFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCUsageInputItemOZFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCUsageInputItemOZFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCUSAGEINPUTITEMOZ", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, SCUsageInputItemOZFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "SCUSAGEINPUTITEMOZ");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInputItemOZ.getObject%} access denied");
		}

		selectStr =
			"SELECT  SCUSAGEINPUTITEMOZ.CODE FROM  SCUSAGEINPUTITEMOZ WHERE  SCUSAGEINPUTITEMOZ.CODE = ?";
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
		_checkConditionToken(condition,"code","SCUSAGEINPUTITEMOZ.CODE");
		_checkConditionToken(condition,"numberdoc","SCUSAGEINPUTITEMOZ.NUMBERDOC");
		_checkConditionToken(condition,"numberint","SCUSAGEINPUTITEMOZ.NUMBERINT");
		_checkConditionToken(condition,"countertype","SCUSAGEINPUTITEMOZ.COUNTERTYPE");
		_checkConditionToken(condition,"account","SCUSAGEINPUTITEMOZ.ACCOUNT");
		_checkConditionToken(condition,"cost","SCUSAGEINPUTITEMOZ.COST");
		_checkConditionToken(condition,"countgen","SCUSAGEINPUTITEMOZ.COUNTGEN");
		_checkConditionToken(condition,"sccode","SCUSAGEINPUTITEMOZ.SCCODE");
		_checkConditionToken(condition,"modify_time","SCUSAGEINPUTITEMOZ.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"usageinputitemref","USAGEINPUTITEMREFCODE");
		_checkConditionToken(condition,"usageinputitemref.code","USAGEINPUTITEMREFCODE");
		_checkConditionToken(condition,"budgetref","BUDGETREFCODE");
		_checkConditionToken(condition,"budgetref.code","BUDGETREFCODE");
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
	
	private void _collectAutoIncrementFields(SCUsageInputItemOZ anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEMOZ", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCUSAGEINPUTITEMOZ");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputItemOZDAO
