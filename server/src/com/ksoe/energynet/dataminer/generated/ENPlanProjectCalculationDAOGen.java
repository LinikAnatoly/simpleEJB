
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
import com.ksoe.energynet.valueobject.ENPlanProjectCalculation;
import com.ksoe.energynet.valueobject.filter.ENPlanProjectCalculationFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectCalculationShort;
import com.ksoe.energynet.valueobject.lists.ENPlanProjectCalculationShortList;


/**
 * DAO Object for ENPlanProjectCalculation;
 *
 */

public class ENPlanProjectCalculationDAOGen extends GenericDataMiner {

	public ENPlanProjectCalculationDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPlanProjectCalculationDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPlanProjectCalculation inObject) throws PersistenceException {
		ENPlanProjectCalculation obj = new ENPlanProjectCalculation();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.tkProjWorkCalculation.code != obj.tkProjWorkCalculation.code){
			return false;
		}
		if (inObject.projectWorkRef.code != obj.projectWorkRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPlanProjectCalculation anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPlanProjectCalculation anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPLANPROJECTCALCULATN (CODE,TKPROJWORKCALCULATINCD,PROJECTWORKREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.tkProjWorkCalculation.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKProjectWorkCalculationDAOGen(connection,getUserProfile()).exists(anObject.tkProjWorkCalculation.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanProjectCalculation.tkProjWorkCalculation.code%} = {%"+anObject.tkProjWorkCalculation.code+"%}");
				}
				statement.setInt(2,anObject.tkProjWorkCalculation.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.projectWorkRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanProjectDAOGen(connection,getUserProfile()).exists(anObject.projectWorkRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanProjectCalculation.projectWorkRef.code%} = {%"+anObject.projectWorkRef.code+"%}");
				}
				statement.setInt(3,anObject.projectWorkRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENPlanProjectCalculationDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPlanProjectCalculation anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPlanProjectCalculation anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("TKPROJWORKCALCULATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PROJECTWORKREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPLANPROJECTCALCULATN SET TKPROJWORKCALCULATINCD = ? , PROJECTWORKREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPLANPROJECTCALCULATION SET ";
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
					if (anObject.tkProjWorkCalculation.code != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.tkProjWorkCalculation.code);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.projectWorkRef.code != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.projectWorkRef.code);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					statement.setInt(3, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TKPROJWORKCALCULATION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tkProjWorkCalculation.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.tkProjWorkCalculation.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PROJECTWORKREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.projectWorkRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.projectWorkRef.code);
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

	} // end of save(ENPlanProjectCalculation anObject,String[] anAttributes)


	public ENPlanProjectCalculationShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPlanProjectCalculation filterObject = new ENPlanProjectCalculation();
		Vector<ENPlanProjectCalculationShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPlanProjectCalculationShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPlanProjectCalculation filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tkProjWorkCalculation.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.projectWorkRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPlanProjectCalculationFilter filter) {
		String out = buildCondition((ENPlanProjectCalculation)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPlanProjectCalculation filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPlanProjectCalculation.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tkProjWorkCalculation.code, ENPlanProjectCalculation.tkProjWorkCalculation_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.projectWorkRef.code, ENPlanProjectCalculation.projectWorkRef_QFielld, out);
		}
		return out;
	}

	public ENPlanProjectCalculationShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPlanProjectCalculationShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPlanProjectCalculationShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPlanProjectCalculationShortList getFilteredList(ENPlanProjectCalculation filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPlanProjectCalculationShortList getScrollableFilteredList(ENPlanProjectCalculation aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPlanProjectCalculationShortList getScrollableFilteredList(ENPlanProjectCalculation aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPlanProjectCalculationShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPlanProjectCalculationShortList getScrollableFilteredList(ENPlanProjectCalculationFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPlanProjectCalculationShortList getScrollableFilteredList(ENPlanProjectCalculationFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPlanProjectCalculationShortList getScrollableFilteredList(ENPlanProjectCalculation aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPlanProjectCalculationShortList result = new ENPlanProjectCalculationShortList();
		ENPlanProjectCalculationShort anObject;
		result.list = new Vector<ENPlanProjectCalculationShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANPROJECTCALCULATN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPLANPROJECTCALCULATN.CODE"+
			", TKPROJECTWORKCALCULATN.CODE " +
			", TKPROJECTWORKCALCULATN.NAME " +
			", ENPLANPROJECT.CODE " +
			", ENPLANPROJECT.PROJECTCIPHER " +
			", ENPLANPROJECT.PROJECTNAME " +
			", ENPLANPROJECT.USERGEN " +
			", ENPLANPROJECT.DATEEDIT " +
		" FROM ENPLANPROJECTCALCULATN " +
			" LEFT JOIN TKPROJECTWORKCALCULATN on TKPROJECTWORKCALCULATN.CODE = ENPLANPROJECTCALCULATN.TKPROJWORKCALCULATINCD "+
			" LEFT JOIN ENPLANPROJECT on ENPLANPROJECT.CODE = ENPLANPROJECTCALCULATN.PROJECTWORKREFCODE "+
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
				anObject = new ENPlanProjectCalculationShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.tkProjWorkCalculationCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.tkProjWorkCalculationCode = Integer.MIN_VALUE;
				}
				anObject.tkProjWorkCalculationName = set.getString(3);
				anObject.projectWorkRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.projectWorkRefCode = Integer.MIN_VALUE;
				}
				anObject.projectWorkRefProjectCipher = set.getString(5);
				anObject.projectWorkRefProjectName = set.getString(6);
				anObject.projectWorkRefUserGen = set.getString(7);
				anObject.projectWorkRefDateEdit = set.getTimestamp(8);

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
	
	public int[] getFilteredCodeArray(ENPlanProjectCalculationFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPlanProjectCalculationFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPlanProjectCalculation aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPLANPROJECTCALCULATN.CODE FROM ENPLANPROJECTCALCULATN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANPROJECTCALCULATN.CODE";
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


	public ENPlanProjectCalculation getObject(int uid) throws PersistenceException {
		ENPlanProjectCalculation result = new ENPlanProjectCalculation();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPlanProjectCalculation anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPLANPROJECTCALCULATN.CODE, ENPLANPROJECTCALCULATN.TKPROJWORKCALCULATINCD, ENPLANPROJECTCALCULATN.PROJECTWORKREFCODE "
			+" FROM ENPLANPROJECTCALCULATN WHERE ENPLANPROJECTCALCULATN.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.tkProjWorkCalculation.code = set.getInt(2);
				if (set.wasNull()) {
					anObject.tkProjWorkCalculation.code = Integer.MIN_VALUE;
				}
				anObject.projectWorkRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.projectWorkRef.code = Integer.MIN_VALUE;
				}
				if(anObject.tkProjWorkCalculation.code != Integer.MIN_VALUE) {
					anObject.setTkProjWorkCalculation(
						new com.ksoe.techcard.dataminer.generated.TKProjectWorkCalculationDAOGen(connection,getUserProfile()).getObject(anObject.tkProjWorkCalculation.code));
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


	public com.ksoe.energynet.valueobject.references.ENPlanProjectCalculationRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPlanProjectCalculationRef ref = new com.ksoe.energynet.valueobject.references.ENPlanProjectCalculationRef();
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

		selectStr = "DELETE FROM  ENPLANPROJECTCALCULATN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPlanProjectCalculation object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPlanProjectCalculation.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanProjectCalculation.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPlanProjectCalculation.remove%} access denied");
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
	
	public long count(ENPlanProjectCalculationFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPlanProjectCalculationFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPlanProjectCalculationFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPLANPROJECTCALCULATN", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENPLANPROJECTCALCULATN WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPlanProjectCalculationFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPLANPROJECTCALCULATN");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanProjectCalculation.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPlanProjectCalculation.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPLANPROJECTCALCULATN.CODE FROM  ENPLANPROJECTCALCULATN WHERE  ENPLANPROJECTCALCULATN.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPLANPROJECTCALCULATN.CODE");
		// relationship conditions
		_checkConditionToken(condition,"tkprojworkcalculation","TKPROJWORKCALCULATINCD");
		_checkConditionToken(condition,"tkprojworkcalculation.code","TKPROJWORKCALCULATINCD");
		_checkConditionToken(condition,"projectworkref","PROJECTWORKREFCODE");
		_checkConditionToken(condition,"projectworkref.code","PROJECTWORKREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPlanProjectCalculation anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPLANPROJECTCALCULATN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPLANPROJECTCALCULATN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPLANPROJECTCALCULATN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPLANPROJECTCALCULATN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPlanProjectCalculationDAO
