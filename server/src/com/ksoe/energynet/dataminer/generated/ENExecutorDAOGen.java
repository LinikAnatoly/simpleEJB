
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
import com.ksoe.energynet.valueobject.ENExecutor;
import com.ksoe.energynet.valueobject.filter.ENExecutorFilter;
import com.ksoe.energynet.valueobject.brief.ENExecutorShort;
import com.ksoe.energynet.valueobject.lists.ENExecutorShortList;


/**
 * DAO Object for ENExecutor;
 *
 */

public class ENExecutorDAOGen extends GenericDataMiner {

	public ENExecutorDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENExecutorDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENExecutor inObject) throws PersistenceException {
		ENExecutor obj = new ENExecutor();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.executorFio == null && obj.executorFio == null){}
		else
			if(inObject.executorFio == null || obj.executorFio == null) return false;
			else
				if ( ! inObject.executorFio.equals(obj.executorFio)){
					return false;
				}

		if(inObject.executorPhone == null && obj.executorPhone == null){}
		else
			if(inObject.executorPhone == null || obj.executorPhone == null) return false;
			else
				if ( ! inObject.executorPhone.equals(obj.executorPhone)){
					return false;
				}

		if(inObject.executorEmail == null && obj.executorEmail == null){}
		else
			if(inObject.executorEmail == null || obj.executorEmail == null) return false;
			else
				if ( ! inObject.executorEmail.equals(obj.executorEmail)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}
		if (inObject.sheetTypeRef.code != obj.sheetTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENExecutor anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENExecutor anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENEXECUTOR (CODE,EXECUTORFIO,EXECUTORPHONE,EXECUTOREMAIL,COMMENTGEN,SHEETTYPEREFCODE) VALUES (?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.executorFio);
			statement.setString(3, anObject.executorPhone);
			statement.setString(4, anObject.executorEmail);
			statement.setString(5, anObject.commentGen);
			if (anObject.sheetTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.sheetTypeRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENExecutorDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENExecutor anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENExecutor anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("EXECUTORFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORPHONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTOREMAIL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHEETTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENEXECUTOR SET  EXECUTORFIO = ? , EXECUTORPHONE = ? , EXECUTOREMAIL = ? , COMMENTGEN = ? , SHEETTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENEXECUTOR SET ";
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
					statement.setString(1, anObject.executorFio);
					statement.setString(2, anObject.executorPhone);
					statement.setString(3, anObject.executorEmail);
					statement.setString(4, anObject.commentGen);
					if (anObject.sheetTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.sheetTypeRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					statement.setInt(6, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("EXECUTORFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorFio);
							continue;
						}
						if("EXECUTORPHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorPhone);
							continue;
						}
						if("EXECUTOREMAIL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorEmail);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("SHEETTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheetTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheetTypeRef.code);
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

	} // end of save(ENExecutor anObject,String[] anAttributes)


	public ENExecutorShort getShortObject(int anObjectCode) throws PersistenceException {
		ENExecutor filterObject = new ENExecutor();
		Vector<ENExecutorShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENExecutorShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENExecutor filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorPhone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorEmail, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheetTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENExecutorFilter filter) {
		String out = buildCondition((ENExecutor)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENExecutor filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENExecutor.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorFio, ENExecutor.executorFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorPhone, ENExecutor.executorPhone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorEmail, ENExecutor.executorEmail_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENExecutor.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheetTypeRef.code, ENExecutor.sheetTypeRef_QFielld, out);
		}
		return out;
	}

	public ENExecutorShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENExecutorShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENExecutorShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENExecutorShortList getFilteredList(ENExecutor filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENExecutorShortList getScrollableFilteredList(ENExecutor aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENExecutorShortList getScrollableFilteredList(ENExecutor aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENExecutorShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENExecutorShortList getScrollableFilteredList(ENExecutorFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENExecutorShortList getScrollableFilteredList(ENExecutorFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENExecutorShortList getScrollableFilteredList(ENExecutor aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENExecutorShortList result = new ENExecutorShortList();
		ENExecutorShort anObject;
		result.list = new Vector<ENExecutorShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENEXECUTOR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENEXECUTOR.CODE"+
			",ENEXECUTOR.EXECUTORFIO"+
			",ENEXECUTOR.EXECUTORPHONE"+
			",ENEXECUTOR.EXECUTOREMAIL"+
			",ENEXECUTOR.COMMENTGEN"+
			", ENSHEETS4SOTYPE.CODE " +
			", ENSHEETS4SOTYPE.NAME " +
			", ENSHEETS4SOTYPE.NAMEFORDFDOC " +
			", ENSHEETS4SOTYPE.DFDOCNUMMASK " +
			", ENSHEETS4SOTYPE.DFDEPARTMENTCODE " +
			", ENSHEETS4SOTYPE.EXECUTORFIO " +
			", ENSHEETS4SOTYPE.EXECUTORPHONE " +
			", ENSHEETS4SOTYPE.EXECUTOREMAIL " +
			", ENSHEETS4SOTYPE.REPORTPATH " +
			", ENSHEETS4SOTYPE.REPORTFILENAME " +
			", ENSHEETS4SOTYPE.REPORTTYPE " +
			", ENSHEETS4SOTYPE.COMMENTGEN " +
		" FROM ENEXECUTOR " +
			" LEFT JOIN ENSHEETS4SOTYPE on ENSHEETS4SOTYPE.CODE = ENEXECUTOR.SHEETTYPEREFCODE "+
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
				anObject = new ENExecutorShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.executorFio = set.getString(2);
				anObject.executorPhone = set.getString(3);
				anObject.executorEmail = set.getString(4);
				anObject.commentGen = set.getString(5);

				anObject.sheetTypeRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.sheetTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.sheetTypeRefName = set.getString(7);
				anObject.sheetTypeRefNameForDfDoc = set.getString(8);
				anObject.sheetTypeRefDfDocNumMask = set.getString(9);
				anObject.sheetTypeRefDfDepartmentCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.sheetTypeRefDfDepartmentCode = Integer.MIN_VALUE;
				}
				anObject.sheetTypeRefExecutorFio = set.getString(11);
				anObject.sheetTypeRefExecutorPhone = set.getString(12);
				anObject.sheetTypeRefExecutorEmail = set.getString(13);
				anObject.sheetTypeRefReportPath = set.getString(14);
				anObject.sheetTypeRefReportFileName = set.getString(15);
				anObject.sheetTypeRefReportType = set.getString(16);
				anObject.sheetTypeRefCommentGen = set.getString(17);

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
	
	public int[] getFilteredCodeArray(ENExecutorFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENExecutorFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENExecutor aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENEXECUTOR.CODE FROM ENEXECUTOR";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENEXECUTOR.CODE";
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


	public ENExecutor getObject(int uid) throws PersistenceException {
		ENExecutor result = new ENExecutor();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENExecutor anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENEXECUTOR.CODE, ENEXECUTOR.EXECUTORFIO, ENEXECUTOR.EXECUTORPHONE, ENEXECUTOR.EXECUTOREMAIL, ENEXECUTOR.COMMENTGEN, ENEXECUTOR.SHEETTYPEREFCODE "
			+" FROM ENEXECUTOR WHERE ENEXECUTOR.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.executorFio = set.getString(2);
				anObject.executorPhone = set.getString(3);
				anObject.executorEmail = set.getString(4);
				anObject.commentGen = set.getString(5);
				anObject.sheetTypeRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.sheetTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENExecutorRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENExecutorRef ref = new com.ksoe.energynet.valueobject.references.ENExecutorRef();
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

		selectStr = "DELETE FROM  ENEXECUTOR WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENExecutor object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENExecutor.getObject%} access denied");
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
	
	public long count(ENExecutorFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENExecutorFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENExecutorFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENEXECUTOR", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENEXECUTOR WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENExecutorFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENEXECUTOR");
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
			"SELECT  ENEXECUTOR.CODE FROM  ENEXECUTOR WHERE  ENEXECUTOR.CODE = ?";
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
		_checkConditionToken(condition,"code","ENEXECUTOR.CODE");
		_checkConditionToken(condition,"executorfio","ENEXECUTOR.EXECUTORFIO");
		_checkConditionToken(condition,"executorphone","ENEXECUTOR.EXECUTORPHONE");
		_checkConditionToken(condition,"executoremail","ENEXECUTOR.EXECUTOREMAIL");
		_checkConditionToken(condition,"commentgen","ENEXECUTOR.COMMENTGEN");
		// relationship conditions
		_checkConditionToken(condition,"sheettyperef","SHEETTYPEREFCODE");
		_checkConditionToken(condition,"sheettyperef.code","SHEETTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENExecutor anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENEXECUTOR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENEXECUTOR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENEXECUTOR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENEXECUTOR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENExecutorDAO
