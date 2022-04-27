
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
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2Prov;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ProvFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2ProvShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ProvShortList;


/**
 * DAO Object for SCUsageInputItemOZ2Prov;
 *
 */

public class SCUsageInputItemOZ2ProvDAOGen extends GenericDataMiner {

	public SCUsageInputItemOZ2ProvDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCUsageInputItemOZ2ProvDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCUsageInputItemOZ2Prov inObject) throws PersistenceException {
		SCUsageInputItemOZ2Prov obj = new SCUsageInputItemOZ2Prov();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.partId != obj.partId){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.datePosting == null && obj.datePosting == null){} else 
			if(inObject.datePosting == null || obj.datePosting == null) return false;
			else
				if (inObject.datePosting.compareTo(obj.datePosting) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.voucher == null && obj.voucher == null){}
		else
			if(inObject.voucher == null || obj.voucher == null) return false;
			else
				if ( ! inObject.voucher.equals(obj.voucher)){
					return false;
				}
		if (inObject.ozRef.code != obj.ozRef.code){
			return false;
		}
		return true;
	}

	public int add(SCUsageInputItemOZ2Prov anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCUsageInputItemOZ2Prov anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCUSAGEINPUTITEMOZ2PRV (CODE,PARTID,USERGEN,DATEPOSTING,DATEEDIT,MODIFY_TIME,VOUCHER,OZREFCODE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.partId != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.partId);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.userGen);
			if (anObject.datePosting == null) {
				statement.setDate(4,null);
			} else {
				statement.setDate(4,new java.sql.Date(anObject.datePosting.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(6,null);
			} else {
				statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(7,anObject.voucher);
			if (anObject.ozRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).exists(anObject.ozRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZ2Prov.ozRef.code%} = {%"+anObject.ozRef.code+"%}");
				}
				statement.setInt(8,anObject.ozRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%SCUsageInputItemOZ2ProvDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCUsageInputItemOZ2Prov anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCUsageInputItemOZ2Prov anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCUsageInputItemOZ2Prov oldObject = new SCUsageInputItemOZ2Prov();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCUsageInputItemOZ2Prov.modify_time_Field+" FROM  SCUSAGEINPUTITEMOZ2PRV WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("PARTID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEPOSTING") == 0) {
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
					if(fieldNameStr.compareTo("VOUCHER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OZREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCUSAGEINPUTITEMOZ2PRV SET  PARTID = ? , USERGEN = ? , DATEPOSTING = ? , DATEEDIT = ? , MODIFY_TIME = ? , VOUCHER = ? , OZREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCUSAGEINPUTITEMOZ2PROV SET ";
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
					if (anObject.partId != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.partId);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.userGen);
					if (anObject.datePosting == null) {
						statement.setDate(3,null);
					} else {
						statement.setDate(3,new java.sql.Date(anObject.datePosting.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(5,null);
					} else {
						statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(6,anObject.voucher);
					if (anObject.ozRef.code != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.ozRef.code);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					statement.setInt(8,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PARTID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.partId);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEPOSTING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datePosting == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.datePosting.getTime()));
							}
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
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("VOUCHER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.voucher);
							continue;
						}
						if("OZREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ozRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.ozRef.code);
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

	} // end of save(SCUsageInputItemOZ2Prov anObject,String[] anAttributes)


	public SCUsageInputItemOZ2ProvShort getShortObject(int anObjectCode) throws PersistenceException {
		SCUsageInputItemOZ2Prov filterObject = new SCUsageInputItemOZ2Prov();
		Vector<SCUsageInputItemOZ2ProvShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCUsageInputItemOZ2ProvShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCUsageInputItemOZ2Prov filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.partId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datePosting, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.voucher, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ozRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCUsageInputItemOZ2ProvFilter filter) {
		String out = buildCondition((SCUsageInputItemOZ2Prov)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCUsageInputItemOZ2Prov filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCUsageInputItemOZ2Prov.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.partId, SCUsageInputItemOZ2Prov.partId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, SCUsageInputItemOZ2Prov.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datePosting, SCUsageInputItemOZ2Prov.datePosting_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, SCUsageInputItemOZ2Prov.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCUsageInputItemOZ2Prov.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.voucher, SCUsageInputItemOZ2Prov.voucher_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ozRef.code, SCUsageInputItemOZ2Prov.ozRef_QFielld, out);
		}
		return out;
	}

	public SCUsageInputItemOZ2ProvShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCUsageInputItemOZ2ProvShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCUsageInputItemOZ2ProvShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCUsageInputItemOZ2ProvShortList getFilteredList(SCUsageInputItemOZ2Prov filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(SCUsageInputItemOZ2Prov aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(SCUsageInputItemOZ2Prov aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(SCUsageInputItemOZ2ProvFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(SCUsageInputItemOZ2ProvFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCUsageInputItemOZ2ProvShortList getScrollableFilteredList(SCUsageInputItemOZ2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		SCUsageInputItemOZ2ProvShortList result = new SCUsageInputItemOZ2ProvShortList();
		SCUsageInputItemOZ2ProvShort anObject;
		result.list = new Vector<SCUsageInputItemOZ2ProvShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUTITEMOZ2PRV.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCUSAGEINPUTITEMOZ2PRV.CODE"+
			",SCUSAGEINPUTITEMOZ2PRV.PARTID"+
			",SCUSAGEINPUTITEMOZ2PRV.USERGEN"+
			",SCUSAGEINPUTITEMOZ2PRV.DATEPOSTING"+
			",SCUSAGEINPUTITEMOZ2PRV.DATEEDIT"+
			",SCUSAGEINPUTITEMOZ2PRV.VOUCHER"+
			", SCUSAGEINPUTITEMOZ.CODE " +
			", SCUSAGEINPUTITEMOZ.NUMBERDOC " +
			", SCUSAGEINPUTITEMOZ.COUNTERTYPE " +
			", SCUSAGEINPUTITEMOZ.ACCOUNT " +
			", SCUSAGEINPUTITEMOZ.COST " +
			", SCUSAGEINPUTITEMOZ.COUNTGEN " +
			", SCUSAGEINPUTITEMOZ.SCCODE " +
		" FROM SCUSAGEINPUTITEMOZ2PRV " +
			", SCUSAGEINPUTITEMOZ " +
		"";
		whereStr = " SCUSAGEINPUTITEMOZ.CODE = SCUSAGEINPUTITEMOZ2PRV.OZREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
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
				anObject = new SCUsageInputItemOZ2ProvShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.partId = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(3);
				anObject.datePosting = set.getDate(4);
				anObject.dateEdit = set.getDate(5);
				anObject.voucher = set.getString(6);

				anObject.ozRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.ozRefCode = Integer.MIN_VALUE;
				}
				anObject.ozRefNumberDoc = set.getString(8);
				anObject.ozRefCounterType = set.getString(9);
				anObject.ozRefAccount = set.getString(10);
				anObject.ozRefCost = set.getBigDecimal(11);
				if(anObject.ozRefCost != null) {
					anObject.ozRefCost = anObject.ozRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ozRefCountGen = set.getInt(12);
				if(set.wasNull()) {
					anObject.ozRefCountGen = Integer.MIN_VALUE;
				}
				anObject.ozRefScCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.ozRefScCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(SCUsageInputItemOZ2ProvFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(SCUsageInputItemOZ2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCUSAGEINPUTITEMOZ2PRV.CODE FROM SCUSAGEINPUTITEMOZ2PRV";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUTITEMOZ2PRV.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(aFilterObject);

		if(condition.length() != 0) {
			if(whereStr.length() != 0) {
				whereStr = whereStr + " AND ";
			}
			whereStr = whereStr + " (" + condition + ")";
		}

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

	public SCUsageInputItemOZ2Prov getObject(int uid) throws PersistenceException {
		SCUsageInputItemOZ2Prov result = new SCUsageInputItemOZ2Prov();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(SCUsageInputItemOZ2Prov anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  SCUSAGEINPUTITEMOZ2PRV.CODE, SCUSAGEINPUTITEMOZ2PRV.PARTID, SCUSAGEINPUTITEMOZ2PRV.USERGEN, SCUSAGEINPUTITEMOZ2PRV.DATEPOSTING, SCUSAGEINPUTITEMOZ2PRV.DATEEDIT, SCUSAGEINPUTITEMOZ2PRV.MODIFY_TIME, SCUSAGEINPUTITEMOZ2PRV.VOUCHER, SCUSAGEINPUTITEMOZ2PRV.OZREFCODE "
			+" FROM SCUSAGEINPUTITEMOZ2PRV WHERE SCUSAGEINPUTITEMOZ2PRV.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.partId = set.getInt(2);
			if (set.wasNull()) {
				anObject.partId = Integer.MIN_VALUE;
			}
			anObject.userGen = set.getString(3);
			anObject.datePosting = set.getDate(4);
			anObject.dateEdit = set.getDate(5);
			anObject.modify_time = set.getLong(6);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.voucher = set.getString(7);
			anObject.ozRef.code = set.getInt(8);
			if (set.wasNull()) {
				anObject.ozRef.code = Integer.MIN_VALUE;
			}
			if(anObject.ozRef.code != Integer.MIN_VALUE) {
				anObject.setOzRef(
					new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).getRef(anObject.ozRef.code));
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


	public com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2ProvRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2ProvRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputItemOZ2ProvRef();
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

		selectStr = "DELETE FROM  SCUSAGEINPUTITEMOZ2PRV WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCUsageInputItemOZ2Prov object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCUsageInputItemOZ2Prov.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ2Prov.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInputItemOZ2Prov.remove%} access denied");
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
	
	public long count(SCUsageInputItemOZ2ProvFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCUsageInputItemOZ2ProvFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCUsageInputItemOZ2ProvFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCUSAGEINPUTITEMOZ2PRV", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZ2Prov.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInputItemOZ2Prov.getObject%} access denied");
		}

		selectStr =
			"SELECT  SCUSAGEINPUTITEMOZ2PRV.CODE FROM  SCUSAGEINPUTITEMOZ2PRV WHERE  SCUSAGEINPUTITEMOZ2PRV.CODE = ?";
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
		_checkConditionToken(condition,"code","SCUSAGEINPUTITEMOZ2PRV.CODE");
		_checkConditionToken(condition,"partid","SCUSAGEINPUTITEMOZ2PRV.PARTID");
		_checkConditionToken(condition,"usergen","SCUSAGEINPUTITEMOZ2PRV.USERGEN");
		_checkConditionToken(condition,"dateposting","SCUSAGEINPUTITEMOZ2PRV.DATEPOSTING");
		_checkConditionToken(condition,"dateedit","SCUSAGEINPUTITEMOZ2PRV.DATEEDIT");
		_checkConditionToken(condition,"modify_time","SCUSAGEINPUTITEMOZ2PRV.MODIFY_TIME");
		_checkConditionToken(condition,"voucher","SCUSAGEINPUTITEMOZ2PRV.VOUCHER");
		// relationship conditions
		_checkConditionToken(condition,"ozref","OZREFCODE");
		_checkConditionToken(condition,"ozref.code","OZREFCODE");
		return condition.toString();
	}

	public Connection getConnection() {
		try {
			if(super.getConnection() != null && !super.getConnection().isClosed())
			return super.getConnection();

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
			return dataSource.getConnection();
		}
		catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.AUTHORIZATION_DATASOURCE+"%}",e);}
		catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.AUTHORIZATION_DATASOURCE+"%}",e);}
	}

	///////////// PRIVATE SECTION ///////////////
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();
	
	private void _collectAutoIncrementFields(SCUsageInputItemOZ2Prov anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEMOZ2PRV", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ2PRV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZ2PRV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCUSAGEINPUTITEMOZ2PRV");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputItemOZ2ProvDAO
