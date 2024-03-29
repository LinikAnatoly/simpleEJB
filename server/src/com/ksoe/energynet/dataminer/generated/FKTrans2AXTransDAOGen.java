
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
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
import com.ksoe.energynet.valueobject.FKTrans2AXTrans;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransFilter;
import com.ksoe.energynet.valueobject.brief.FKTrans2AXTransShort;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransShortList;


/**
 * DAO Object for FKTrans2AXTrans;
 *
 */

public class FKTrans2AXTransDAOGen extends GenericDataMiner {

	public FKTrans2AXTransDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public FKTrans2AXTransDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(FKTrans2AXTrans inObject) throws PersistenceException {
		FKTrans2AXTrans obj = new FKTrans2AXTrans();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.monthGen != obj.monthGen){
					return false;
				}

		if (inObject.yearGen != obj.yearGen){
					return false;
				}

		if(inObject.taskOwner == null && obj.taskOwner == null){}
		else
			if(inObject.taskOwner == null || obj.taskOwner == null) return false;
			else
				if ( ! inObject.taskOwner.equals(obj.taskOwner)){
					return false;
				}
		return true;
	}

	public int add(FKTrans2AXTrans anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(FKTrans2AXTrans anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO FKTRANS2AXTRANS (CODE,MONTHGEN,YEARGEN,TASKOWNER) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.monthGen != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.monthGen);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.yearGen != Integer.MIN_VALUE ) {
				statement.setInt(3,anObject.yearGen);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			statement.setString(4,anObject.taskOwner);

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%FKTrans2AXTransDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(FKTrans2AXTrans anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(FKTrans2AXTrans anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("MONTHGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("YEARGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TASKOWNER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE FKTRANS2AXTRANS SET  MONTHGEN = ? , YEARGEN = ? , TASKOWNER = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE FKTRANS2AXTRANS SET ";
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
					if (anObject.monthGen != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.monthGen);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.yearGen != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.yearGen);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setString(3,anObject.taskOwner);
					statement.setInt(4,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MONTHGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.monthGen);
							continue;
						}
						if("YEARGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.yearGen);
							continue;
						}
						if("TASKOWNER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.taskOwner);
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

	} // end of save(FKTrans2AXTrans anObject,String[] anAttributes)


	public FKTrans2AXTransShort getShortObject(int anObjectCode) throws PersistenceException {
		FKTrans2AXTrans filterObject = new FKTrans2AXTrans();
		Vector<FKTrans2AXTransShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (FKTrans2AXTransShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(FKTrans2AXTrans filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.monthGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.yearGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.taskOwner, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(FKTrans2AXTransFilter filter) {
		String out = buildCondition((FKTrans2AXTrans)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(FKTrans2AXTrans filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, FKTrans2AXTrans.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.monthGen, FKTrans2AXTrans.monthGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.yearGen, FKTrans2AXTrans.yearGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.taskOwner, FKTrans2AXTrans.taskOwner_QFielld, out);
		}
		return out;
	}

	public FKTrans2AXTransShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public FKTrans2AXTransShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public FKTrans2AXTransShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public FKTrans2AXTransShortList getFilteredList(FKTrans2AXTrans filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public FKTrans2AXTransShortList getScrollableFilteredList(FKTrans2AXTrans aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public FKTrans2AXTransShortList getScrollableFilteredList(FKTrans2AXTrans aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public FKTrans2AXTransShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public FKTrans2AXTransShortList getScrollableFilteredList(FKTrans2AXTransFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public FKTrans2AXTransShortList getScrollableFilteredList(FKTrans2AXTransFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public FKTrans2AXTransShortList getScrollableFilteredList(FKTrans2AXTrans aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		FKTrans2AXTransShortList result = new FKTrans2AXTransShortList();
		FKTrans2AXTransShort anObject;
		result.list = new Vector<FKTrans2AXTransShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FKTRANS2AXTRANS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"FKTRANS2AXTRANS.CODE"+
			",FKTRANS2AXTRANS.MONTHGEN"+
			",FKTRANS2AXTRANS.YEARGEN"+
			",FKTRANS2AXTRANS.TASKOWNER"+
		" FROM FKTRANS2AXTRANS " +
		"";

	
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
				anObject = new FKTrans2AXTransShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.monthGen = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.monthGen = Integer.MIN_VALUE;
				}
				anObject.yearGen = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.yearGen = Integer.MIN_VALUE;
				}
				anObject.taskOwner = set.getString(4);


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
	
	public int[] getFilteredCodeArray(FKTrans2AXTransFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(FKTrans2AXTrans aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT FKTRANS2AXTRANS.CODE FROM FKTRANS2AXTRANS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FKTRANS2AXTRANS.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

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

	public FKTrans2AXTrans getObject(int uid) throws PersistenceException {
		FKTrans2AXTrans result = new FKTrans2AXTrans();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(FKTrans2AXTrans anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  FKTRANS2AXTRANS.CODE, FKTRANS2AXTRANS.MONTHGEN, FKTRANS2AXTRANS.YEARGEN, FKTRANS2AXTRANS.TASKOWNER "
			+" FROM FKTRANS2AXTRANS WHERE FKTRANS2AXTRANS.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.monthGen = set.getInt(2);
				if (set.wasNull()) {
					anObject.monthGen = Integer.MIN_VALUE;
				}
				anObject.yearGen = set.getInt(3);
				if (set.wasNull()) {
					anObject.yearGen = Integer.MIN_VALUE;
				}
				anObject.taskOwner = set.getString(4);
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


	public com.ksoe.energynet.valueobject.references.FKTrans2AXTransRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.FKTrans2AXTransRef ref = new com.ksoe.energynet.valueobject.references.FKTrans2AXTransRef();
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

		selectStr = "DELETE FROM  FKTRANS2AXTRANS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		FKTrans2AXTrans object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%FKTrans2AXTrans.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(FKTrans2AXTrans.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%FKTrans2AXTrans.remove%} access denied");
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
	
	public long count(FKTrans2AXTransFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(FKTrans2AXTransFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, FKTrans2AXTransFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM FKTRANS2AXTRANS", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, FKTrans2AXTransFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "FKTRANS2AXTRANS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FKTrans2AXTrans.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%FKTrans2AXTrans.getObject%} access denied");
		}

		selectStr =
			"SELECT  FKTRANS2AXTRANS.CODE FROM  FKTRANS2AXTRANS WHERE  FKTRANS2AXTRANS.CODE = ?";
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
		_checkConditionToken(condition,"code","FKTRANS2AXTRANS.CODE");
		_checkConditionToken(condition,"monthgen","FKTRANS2AXTRANS.MONTHGEN");
		_checkConditionToken(condition,"yeargen","FKTRANS2AXTRANS.YEARGEN");
		_checkConditionToken(condition,"taskowner","FKTRANS2AXTRANS.TASKOWNER");
		// relationship conditions
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
	
	private void _collectAutoIncrementFields(FKTrans2AXTrans anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("FKTRANS2AXTRANS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("FKTRANS2AXTRANS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("FKTRANS2AXTRANS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: FKTRANS2AXTRANS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of FKTrans2AXTransDAO
