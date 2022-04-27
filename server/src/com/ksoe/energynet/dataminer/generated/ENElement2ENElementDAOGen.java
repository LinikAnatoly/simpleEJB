
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
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
import com.ksoe.energynet.valueobject.ENElement2ENElement;
import com.ksoe.energynet.valueobject.filter.ENElement2ENElementFilter;
import com.ksoe.energynet.valueobject.brief.ENElement2ENElementShort;
import com.ksoe.energynet.valueobject.lists.ENElement2ENElementShortList;


/**
 * DAO Object for ENElement2ENElement;
 *
 */

public class ENElement2ENElementDAOGen extends GenericDataMiner {

	public ENElement2ENElementDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENElement2ENElementDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENElement2ENElement inObject) throws PersistenceException {
		ENElement2ENElement obj = new ENElement2ENElement();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.elementInRef.code != obj.elementInRef.code){
			return false;
		}
		if (inObject.elementOutRef.code != obj.elementOutRef.code){
			return false;
		}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENElement2ENElement anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENElement2ENElement anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENELEMENT2ENELEMENT (CODE,ELEMENTINREFCODE,ELEMENTOUTREFCODE,TYPEREFCODE) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.elementInRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementInRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENElement2ENElement.elementInRef.code%} = {%"+anObject.elementInRef.code+"%}");
				}
				statement.setInt(2,anObject.elementInRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.elementOutRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementOutRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENElement2ENElement.elementOutRef.code%} = {%"+anObject.elementOutRef.code+"%}");
				}
				statement.setInt(3,anObject.elementOutRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElement2ENElementTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENElement2ENElement.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
				}
				statement.setInt(4,anObject.typeRef.code);
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
			throw new PersistenceException("Error in method {%ENElement2ENElementDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENElement2ENElement anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENElement2ENElement anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("ELEMENTINREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTOUTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENELEMENT2ENELEMENT SET ELEMENTINREFCODE = ? , ELEMENTOUTREFCODE = ? , TYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENELEMENT2ENELEMENT SET ";
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
					if (anObject.elementInRef.code != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.elementInRef.code);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.elementOutRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.elementOutRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(3,anObject.typeRef.code);
					} else {
						statement.setNull(3,java.sql.Types.INTEGER);
					}
					statement.setInt(4,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("ELEMENTINREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementInRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.elementInRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENTOUTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementOutRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.elementOutRef.code);
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

	} // end of save(ENElement2ENElement anObject,String[] anAttributes)


	public ENElement2ENElementShort getShortObject(int anObjectCode) throws PersistenceException {
		ENElement2ENElement filterObject = new ENElement2ENElement();
		Vector<ENElement2ENElementShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENElement2ENElementShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENElement2ENElement filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementInRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementOutRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENElement2ENElementFilter filter) {
		String out = buildCondition((ENElement2ENElement)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENElement2ENElement filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENElement2ENElement.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementInRef.code, ENElement2ENElement.elementInRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementOutRef.code, ENElement2ENElement.elementOutRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENElement2ENElement.typeRef_QFielld, out);
		}
		return out;
	}

	public ENElement2ENElementShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENElement2ENElementShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENElement2ENElementShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENElement2ENElementShortList getFilteredList(ENElement2ENElement filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENElement2ENElementShortList getScrollableFilteredList(ENElement2ENElement aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENElement2ENElementShortList getScrollableFilteredList(ENElement2ENElement aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENElement2ENElementShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENElement2ENElementShortList getScrollableFilteredList(ENElement2ENElementFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENElement2ENElementShortList getScrollableFilteredList(ENElement2ENElementFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENElement2ENElementShortList getScrollableFilteredList(ENElement2ENElement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENElement2ENElementShortList result = new ENElement2ENElementShortList();
		ENElement2ENElementShort anObject;
		result.list = new Vector<ENElement2ENElementShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT2ENELEMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENELEMENT2ENELEMENT.CODE"+
			", ENELEMENT.CODE " +
			", ENELEMENT.CODE " +
			", ENELEMENT2ENELEMENTTYP.CODE " +
			", ENELEMENT2ENELEMENTTYP.NAME " +
		" FROM ENELEMENT2ENELEMENT " +
			", ENELEMENT " +
			", ENELEMENT " +
			", ENELEMENT2ENELEMENTTYP " +
		"";
		whereStr = " ENELEMENT.CODE = ENELEMENT2ENELEMENT.ELEMENTINREFCODE" ; //+
		whereStr += " AND ENELEMENT.CODE = ENELEMENT2ENELEMENT.ELEMENTOUTREFCODE" ; //+
		whereStr += " AND ENELEMENT2ENELEMENTTYP.CODE = ENELEMENT2ENELEMENT.TYPEREFCODE" ; //+

	
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
				anObject = new ENElement2ENElementShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.elementInRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.elementInRefCode = Integer.MIN_VALUE;
				}
				anObject.elementOutRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.elementOutRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(5);

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
	
	public int[] getFilteredCodeArray(ENElement2ENElementFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENElement2ENElement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENELEMENT2ENELEMENT.CODE FROM ENELEMENT2ENELEMENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT2ENELEMENT.CODE";
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

	public ENElement2ENElement getObject(int uid) throws PersistenceException {
		ENElement2ENElement result = new ENElement2ENElement();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENElement2ENElement anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENELEMENT2ENELEMENT.CODE, ENELEMENT2ENELEMENT.ELEMENTINREFCODE, ENELEMENT2ENELEMENT.ELEMENTOUTREFCODE, ENELEMENT2ENELEMENT.TYPEREFCODE "
			+" FROM ENELEMENT2ENELEMENT WHERE ENELEMENT2ENELEMENT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.elementInRef.code = set.getInt(2);
			if (set.wasNull()) {
				anObject.elementInRef.code = Integer.MIN_VALUE;
			}
			anObject.elementOutRef.code = set.getInt(3);
			if (set.wasNull()) {
				anObject.elementOutRef.code = Integer.MIN_VALUE;
			}
			anObject.typeRef.code = set.getInt(4);
			if (set.wasNull()) {
				anObject.typeRef.code = Integer.MIN_VALUE;
			}
			if(anObject.elementInRef.code != Integer.MIN_VALUE) {
				anObject.setElementInRef(
					new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementInRef.code));
			}
			if(anObject.elementOutRef.code != Integer.MIN_VALUE) {
				anObject.setElementOutRef(
					new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementOutRef.code));
			}
			if(anObject.typeRef.code != Integer.MIN_VALUE) {
				anObject.setTypeRef(
					new com.ksoe.energynet.dataminer.generated.ENElement2ENElementTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENElement2ENElementRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENElement2ENElementRef ref = new com.ksoe.energynet.valueobject.references.ENElement2ENElementRef();
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

		selectStr = "DELETE FROM  ENELEMENT2ENELEMENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENElement2ENElement object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENElement2ENElement.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENElement2ENElement.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENElement2ENElement.remove%} access denied");
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
	
	public long count(ENElement2ENElementFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENElement2ENElementFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENElement2ENElementFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENELEMENT2ENELEMENT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENElement2ENElementFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENELEMENT2ENELEMENT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement2ENElement.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENElement2ENElement.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENELEMENT2ENELEMENT.CODE FROM  ENELEMENT2ENELEMENT WHERE  ENELEMENT2ENELEMENT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENELEMENT2ENELEMENT.CODE");
		// relationship conditions
		_checkConditionToken(condition,"elementinref","ELEMENTINREFCODE");
		_checkConditionToken(condition,"elementinref.code","ELEMENTINREFCODE");
		_checkConditionToken(condition,"elementoutref","ELEMENTOUTREFCODE");
		_checkConditionToken(condition,"elementoutref.code","ELEMENTOUTREFCODE");
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENElement2ENElement anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENELEMENT2ENELEMENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENELEMENT2ENELEMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENELEMENT2ENELEMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENELEMENT2ENELEMENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENElement2ENElementDAO
