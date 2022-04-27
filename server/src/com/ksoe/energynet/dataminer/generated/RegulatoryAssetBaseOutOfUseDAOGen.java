
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
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
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseOutOfUseFilter;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseOutOfUseShort;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseOutOfUseShortList;


/**
 * DAO Object for RegulatoryAssetBaseOutOfUse;
 *
 */

public class RegulatoryAssetBaseOutOfUseDAOGen extends GenericDataMiner {

	public RegulatoryAssetBaseOutOfUseDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public RegulatoryAssetBaseOutOfUseDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(RegulatoryAssetBaseOutOfUse inObject) throws PersistenceException {
		RegulatoryAssetBaseOutOfUse obj = new RegulatoryAssetBaseOutOfUse();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.dateStart == null && obj.dateStart == null){} else 
			if(inObject.dateStart == null || obj.dateStart == null) return false;
			else
				if (inObject.dateStart.compareTo(obj.dateStart) != 0){
					return false;
				}

		if(inObject.dateFinish == null && obj.dateFinish == null){} else 
			if(inObject.dateFinish == null || obj.dateFinish == null) return false;
			else
				if (inObject.dateFinish.compareTo(obj.dateFinish) != 0){
					return false;
				}
		if (inObject.assetRef.code != obj.assetRef.code){
			return false;
		}
		return true;
	}

	public int add(RegulatoryAssetBaseOutOfUse anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(RegulatoryAssetBaseOutOfUse anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO REGULATORYASSETBASETFS (CODE,DATESTART,DATEFINISH,ASSETREFCODE) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dateStart == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.dateStart.getTime()));
			}
			if (anObject.dateFinish == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateFinish.getTime()));
			}
			if (anObject.assetRef.code != Integer.MIN_VALUE){
				statement.setInt(4,anObject.assetRef.code);
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
			throw new PersistenceException("Error in method {%RegulatoryAssetBaseOutOfUseDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(RegulatoryAssetBaseOutOfUse anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(RegulatoryAssetBaseOutOfUse anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;


			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFINISH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ASSETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE REGULATORYASSETBASETFS SET  DATESTART = ? , DATEFINISH = ? , ASSETREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE REGULATORYASSETBASEOUTOFUSE SET ";
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
					if (anObject.dateStart == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinish == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateFinish.getTime()));
					}
					if (anObject.assetRef.code != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.assetRef.code);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setInt(4, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateStart.getTime()));
							}
							continue;
						}
						if("DATEFINISH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFinish == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFinish.getTime()));
							}
							continue;
						}
						if("ASSETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.assetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.assetRef.code);
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

	} // end of save(RegulatoryAssetBaseOutOfUse anObject,String[] anAttributes)


	public RegulatoryAssetBaseOutOfUseShort getShortObject(int anObjectCode) throws PersistenceException {
		RegulatoryAssetBaseOutOfUse filterObject = new RegulatoryAssetBaseOutOfUse();
		Vector<RegulatoryAssetBaseOutOfUseShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (RegulatoryAssetBaseOutOfUseShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(RegulatoryAssetBaseOutOfUse filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinish, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.assetRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(RegulatoryAssetBaseOutOfUseFilter filter) {
		String out = buildCondition((RegulatoryAssetBaseOutOfUse)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(RegulatoryAssetBaseOutOfUse filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, RegulatoryAssetBaseOutOfUse.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, RegulatoryAssetBaseOutOfUse.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinish, RegulatoryAssetBaseOutOfUse.dateFinish_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.assetRef.code, RegulatoryAssetBaseOutOfUse.assetRef_QFielld, out);
		}
		return out;
	}

	public RegulatoryAssetBaseOutOfUseShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public RegulatoryAssetBaseOutOfUseShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public RegulatoryAssetBaseOutOfUseShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public RegulatoryAssetBaseOutOfUseShortList getFilteredList(RegulatoryAssetBaseOutOfUse filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public RegulatoryAssetBaseOutOfUseShortList getScrollableFilteredList(RegulatoryAssetBaseOutOfUse aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public RegulatoryAssetBaseOutOfUseShortList getScrollableFilteredList(RegulatoryAssetBaseOutOfUse aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public RegulatoryAssetBaseOutOfUseShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public RegulatoryAssetBaseOutOfUseShortList getScrollableFilteredList(RegulatoryAssetBaseOutOfUseFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public RegulatoryAssetBaseOutOfUseShortList getScrollableFilteredList(RegulatoryAssetBaseOutOfUseFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public RegulatoryAssetBaseOutOfUseShortList getScrollableFilteredList(RegulatoryAssetBaseOutOfUse aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		RegulatoryAssetBaseOutOfUseShortList result = new RegulatoryAssetBaseOutOfUseShortList();
		RegulatoryAssetBaseOutOfUseShort anObject;
		result.list = new Vector<RegulatoryAssetBaseOutOfUseShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSETBASETFS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"REGULATORYASSETBASETFS.CODE"+
			",REGULATORYASSETBASETFS.DATESTART"+
			",REGULATORYASSETBASETFS.DATEFINISH"+
			", REGULATORYASSETBASE.CODE " +
			", REGULATORYASSETBASE.INVENTORYNUMBER " +
			", REGULATORYASSETBASE.NAME " +
			", REGULATORYASSETBASE.INCOMEDATE " +
			", REGULATORYASSETBASE.ORIGINALVALUE " +
			", REGULATORYASSETBASE.INITIAL " +
			", REGULATORYASSETBASE.WRITEOFFDATE " +
		" FROM REGULATORYASSETBASETFS " +
			" LEFT JOIN REGULATORYASSETBASE on REGULATORYASSETBASE.CODE = REGULATORYASSETBASETFS.ASSETREFCODE "+
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
				anObject = new RegulatoryAssetBaseOutOfUseShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateStart = set.getDate(2);
				anObject.dateFinish = set.getDate(3);

				anObject.assetRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.assetRefCode = Integer.MIN_VALUE;
				}
				anObject.assetRefInventoryNumber = set.getString(5);
				anObject.assetRefName = set.getString(6);
				anObject.assetRefIncomeDate = set.getDate(7);
				anObject.assetRefOriginalValue = set.getBigDecimal(8);
				if(anObject.assetRefOriginalValue != null) {
					anObject.assetRefOriginalValue = anObject.assetRefOriginalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.assetRefInitial = set.getBoolean(9);
				if(set.wasNull()) {
					anObject.assetRefInitial = null;
				}
				anObject.assetRefWriteOffDate = set.getDate(10);

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
	
	public int[] getFilteredCodeArray(RegulatoryAssetBaseOutOfUseFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(RegulatoryAssetBaseOutOfUseFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(RegulatoryAssetBaseOutOfUse aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT REGULATORYASSETBASETFS.CODE FROM REGULATORYASSETBASETFS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSETBASETFS.CODE";
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


	public RegulatoryAssetBaseOutOfUse getObject(int uid) throws PersistenceException {
		RegulatoryAssetBaseOutOfUse result = new RegulatoryAssetBaseOutOfUse();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(RegulatoryAssetBaseOutOfUse anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  REGULATORYASSETBASETFS.CODE, REGULATORYASSETBASETFS.DATESTART, REGULATORYASSETBASETFS.DATEFINISH, REGULATORYASSETBASETFS.ASSETREFCODE "
			+" FROM REGULATORYASSETBASETFS WHERE REGULATORYASSETBASETFS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dateStart = set.getDate(2);
				anObject.dateFinish = set.getDate(3);
				anObject.assetRef.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.assetRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseOutOfUseRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseOutOfUseRef ref = new com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseOutOfUseRef();
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

		selectStr = "DELETE FROM  REGULATORYASSETBASETFS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		RegulatoryAssetBaseOutOfUse object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%RegulatoryAssetBaseOutOfUse.getObject%} access denied");
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
	
	public long count(RegulatoryAssetBaseOutOfUseFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(RegulatoryAssetBaseOutOfUseFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, RegulatoryAssetBaseOutOfUseFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM REGULATORYASSETBASETFS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM REGULATORYASSETBASETFS WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBaseOutOfUseFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBaseOutOfUseFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "REGULATORYASSETBASETFS");
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
			"SELECT  REGULATORYASSETBASETFS.CODE FROM  REGULATORYASSETBASETFS WHERE  REGULATORYASSETBASETFS.CODE = ?";
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
		_checkConditionToken(condition,"code","REGULATORYASSETBASETFS.CODE");
		_checkConditionToken(condition,"datestart","REGULATORYASSETBASETFS.DATESTART");
		_checkConditionToken(condition,"datefinish","REGULATORYASSETBASETFS.DATEFINISH");
		// relationship conditions
		_checkConditionToken(condition,"assetref","ASSETREFCODE");
		_checkConditionToken(condition,"assetref.code","ASSETREFCODE");
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
	
	private void _collectAutoIncrementFields(RegulatoryAssetBaseOutOfUse anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("REGULATORYASSETBASETFS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("REGULATORYASSETBASETFS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("REGULATORYASSETBASETFS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: REGULATORYASSETBASETFS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of RegulatoryAssetBaseOutOfUseDAO
